using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.DirectoryServices;

namespace purchase_order_web.Controllers
{
    public class DoLoginIn
    {
        public string userID { get; set; }
        public string userPwd { get; set; }
    }

    /// <summary>
    /// 登入回傳
    /// </summary>
    public class DoLoginOut
    {
        public string errMsg { get; set; }
        public string resultMsg { get; set; }
    }

    public class LoginController : Controller
    {
        // GET: Login
        public ActionResult Login()
        {
            ViewBag.page = "Purchase";
            return View();
        }

        [HttpPost]
        public ActionResult Login(DoLoginIn inModel)
        {
            DoLoginOut outModel = new DoLoginOut();
            string userID = inModel.userID;
            string userPwd = inModel.userPwd;

            //bool checkResult = CheckADPasswordNew(userID, userPwd);
            bool checkResult = GetAseInfo(userID, userPwd);

            if (checkResult)
            {
                // 有查詢到資料，表示帳號密碼正確
                // 將登入帳號記錄在 Session 內
                Session["UserId"] = inModel.userID;
                outModel.resultMsg = "登入成功";
            }
            else
            {
                // 查無資料，帳號或密碼錯誤
                outModel.errMsg = "帳號或密碼錯誤";
            }

            // 檢查設定權限
            try
            {
                string json_path = System.Web.Hosting.HostingEnvironment.MapPath("~/setting_auth.json");
                using (StreamReader file = System.IO.File.OpenText(json_path))
                {
                    using (Newtonsoft.Json.JsonTextReader reader = new Newtonsoft.Json.JsonTextReader(file))
                    {
                        Newtonsoft.Json.Linq.JObject jObject = (Newtonsoft.Json.Linq.JObject)Newtonsoft.Json.Linq.JToken.ReadFrom(reader);
                        var name_list = jObject["setting_auth_name_list"];
                        foreach (string name in name_list)
                        {
                            if (userID == name)
                            {
                                outModel.resultMsg = "登入成功";
                                return Json(outModel);
                            }
                        }
                        outModel.resultMsg = userID + " 無設定權限";
                    }
                }
            }
            catch (Exception ex)
            {
                outModel.errMsg = "查詢權限錯誤";
                return Json(outModel);
            }


            return Json(outModel);
        }

        public bool GetAseInfo(string userId, string password)
        {
            bool CheckResult = false;

            string ldap_server = "LDAP://kh.asegroup.com";
            string filters = "(&(objectClass=user)(sAMAccountName=" + userId + "))";

            DirectoryEntry root = new DirectoryEntry(ldap_server, userId, password);
            DirectorySearcher search = new DirectorySearcher(root, filters);

            try
            {
                SearchResultCollection results = search.FindAll();

                if (results != null)
                {
                    foreach (SearchResult result in results)
                    {

                        ResultPropertyCollection rpc = result.Properties;

                        string[] Properties = { "displayName", "othermobile", "mail", "department", "title", "telephonenumber" };

                        if (result.Properties[Properties[0]].Count > 0)
                        {
                            Session["UserName"] = result.Properties[Properties[0]][0];
                        }
                    }
                    CheckResult = true;
                }
                else
                {
                    CheckResult = false;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.StackTrace + "," + ex.Message);
            }
            return CheckResult;
        }

    }
}