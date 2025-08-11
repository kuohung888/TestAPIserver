using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace ACT_DASHBOARD_WEB.Models
{
    public class WebApiClient
    {
        public HttpClient client = new HttpClient();
        private string authKey { get; set; }
        private string authValue { get; set; }
        private string tokenFile = @"C:\temp\DCT_api_token_value.log";

        public WebApiClient()
        {
            authKey = ConfigurationManager.ConnectionStrings["AuthKey"].ConnectionString;
            authValue = GetTokenFromFile();
            client.BaseAddress = new Uri(ConfigurationManager.ConnectionStrings["ApiUrl"].ConnectionString);
            client.DefaultRequestHeaders.Accept.Clear();
            client.DefaultRequestHeaders.Add(authKey, authValue);
            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
        }

        public async Task<MongoGetAllResponse> MongoGetAllAsync(MongoGetAll mongoGetAll)
        {

            try
            {
                string path = string.Format("api/mongo/document/get-all");

                // 將 data 轉為 json
                string json = JsonConvert.SerializeObject(mongoGetAll);
                // 將轉為 string 的 json 依編碼並指定 content type 存為 httpcontent
                HttpContent contentPost = new StringContent(json, Encoding.UTF8, "application/json");
                // 發出 post 並取得結果
                HttpResponseMessage response = await client.PostAsync(path, contentPost).ConfigureAwait(false);
                if (response.StatusCode == System.Net.HttpStatusCode.Unauthorized)  // 未通過驗證
                {
                    if (Newtonsoft.Json.Linq.JToken.DeepEquals(mongoGetAll.projection, Newtonsoft.Json.Linq.JObject.Parse("{\"lot_info.Test Program\": 1}")))
                    {
                        authValue = getApiKey();
                    }
                    //return new MongoGetAllResponse { error = response.StatusCode.ToString() };
                    //client.DefaultRequestHeaders.Accept.Clear();
                    //client.DefaultRequestHeaders.Add(this.authKey, this.authValue);
                    //client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                    HttpContent contentPost2 = new StringContent(json, Encoding.UTF8, "application/json");
                    response = await client.PostAsync(path, contentPost2).ConfigureAwait(false);
                }
                response.EnsureSuccessStatusCode();

                MongoGetAllResponse result;
                if (response.IsSuccessStatusCode)
                {
                    // 將回應結果內容取出並轉為 string 再透過 linqpad 輸出
                    string result_str = response.Content.ReadAsStringAsync().GetAwaiter().GetResult();

                    result = await response.Content.ReadAsAsync<MongoGetAllResponse>();

                    return result;
                }
                else
                {
                    return null;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
                //WriteToLog writeToLog = new WriteToLog();
                //writeToLog.writeToLog("MongoGetAllAsync error:    collection:" + mongoGetAll.collection + " query:" + mongoGetAll.query + "         ex:" + ex.ToString());
                return new MongoGetAllResponse { error = ex.ToString() };
            }


        }

        public string getApiKey()
        {
            try
            {
                Pool_signin poolSignin = new Pool_signin
                {
                    username = ConfigurationManager.ConnectionStrings["ApiUser"].ConnectionString,
                    password = ConfigurationManager.ConnectionStrings["ApiPassword"].ConnectionString
                };
                Signin_response signinResponse = getApiKeyValueAsync(poolSignin).GetAwaiter().GetResult();

                if (signinResponse != null)
                {
                    // 取得 token value 
                    authValue = signinResponse.token;
                    // 將 token value 寫入暫存檔
                    bool writeTokenResult = WriteTokenToFile(authValue);

                    client.DefaultRequestHeaders.Remove(authKey);
                    client.DefaultRequestHeaders.Add(authKey, authValue);
                    return authValue;
                }
                else
                {
                    return "";
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
                return "";
            }
        }


        public async Task<Signin_response> getApiKeyValueAsync(Pool_signin pool_Signin)
        {
            string path = string.Format("/signin");

            // 將 data 轉為 json
            string json = JsonConvert.SerializeObject(pool_Signin);
            // 將轉為 string 的 json 依編碼並指定 content type 存為 httpcontent
            HttpContent contentPost = new StringContent(json, Encoding.UTF8, "application/json");
            // 發出 post 並取得結果
            HttpResponseMessage response = await client.PostAsync(path, contentPost).ConfigureAwait(false);
            response.EnsureSuccessStatusCode();

            Signin_response result;
            if (response.IsSuccessStatusCode)
            {
                // 將回應結果內容取出並轉為 string 再透過 linqpad 輸出
                string result_str = response.Content.ReadAsStringAsync().GetAwaiter().GetResult();

                result = await response.Content.ReadAsAsync<Signin_response>();

                return result;
            }
            else
            {
                return null;
            }
        }


        private bool WriteTokenToFile(string token)
        {
            try
            {
                if (!File.Exists(tokenFile))
                {
                    using (StreamWriter writer = File.CreateText(tokenFile))
                    {
                        writer.WriteLine(token);
                    }
                }
                else
                {
                    using (StreamWriter writer = new StreamWriter(tokenFile, false))
                    {
                        writer.WriteLine(token);
                    }
                }

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return false;
            }


            return true;
        }

        private string GetTokenFromFile()
        {
            try
            {
                if (!File.Exists(tokenFile))
                {
                    return "no token";
                }
                else
                {
                    using (StreamReader reader = new StreamReader(tokenFile))
                    {
                        return reader.ReadLine();
                    }
                }

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return " read token error";
            }

        }


    }
}