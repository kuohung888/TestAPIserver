using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.DirectoryServices;
using System.IO;
using System.Reflection;

namespace ACT_DASHBOARD_WEB.Controllers
{
    public class DoLoginIn
    {
        public string UserID { get; set; }
        public string UserPwd { get; set; }
    }

    /// <summary>
    /// 登入回傳
    /// </summary>
    public class DoLoginOut
    {
        public string ErrMsg { get; set; }
        public string ResultMsg { get; set; }
    }

    public class LoginController : Controller
    {
        private string userName = "";
        private string engName = "";

        // GET: Login
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(DoLoginIn inModel)
        {
            DoLoginOut outModel = new DoLoginOut();
            string userID = inModel.UserID;
            string userPwd = inModel.UserPwd;
            bool checkResult = get_ASE_Info(userID, userPwd);

            if (checkResult)
            {
                // 有查詢到資料，表示帳號密碼正確
                // 將登入帳號記錄在 Session 內
                Session["UserId"] = inModel.UserID;

                // 將登入帳號記錄在 Cookies 內
                HttpCookie hc = new HttpCookie("userAccount", userName + "," + userID+","+ engName);
                hc.Expires = System.DateTime.Now.AddHours(12);//設定在瀏覽器的有效期限
                Response.Cookies.Add(hc);

                outModel.ResultMsg = "登入成功";
            }
            else
            {
                // 查無資料，帳號或密碼錯誤
                outModel.ErrMsg = "帳號或密碼錯誤";
            }


            return Json(outModel);
        }

        public bool get_ASE_Info(string userId, string password)
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
                            userName = result.Properties[Properties[0]][0].ToString();
                            //Console.WriteLine(string.Format("{0}={1}", Properties[0], result.Properties[Properties[0]][0]));
                            //HttpCookie hc = new HttpCookie("userName", result.Properties[Properties[0]][0].ToString());
                            //hc.Expires = System.DateTime.Now.AddHours(6);//設定在瀏覽器的有效期限
                            //Response.Cookies.Add(hc);
                        }

                        if (result.Properties[Properties[1]].Count > 0)
                        {
                            engName = result.Properties[Properties[1]][0].ToString();
                        }

                        //if (result.Properties[Properties[1]].Count > 0)
                        //    Console.WriteLine(string.Format("{0}={1}", Properties[1], result.Properties[Properties[1]][0]));

                        //if (result.Properties[Properties[2]].Count > 0)
                        //    Console.WriteLine(string.Format("{0}={1}", Properties[2], result.Properties[Properties[2]][0]));

                        //if (result.Properties[Properties[3]].Count > 0)
                        //    Console.WriteLine(string.Format("{0}={1}", Properties[3], result.Properties[Properties[3]][0]));

                        //if (result.Properties[Properties[4]].Count > 0)
                        //    Console.WriteLine(string.Format("{0}={1}", Properties[4], result.Properties[Properties[4]][0]));

                        //if (result.Properties[Properties[5]].Count > 0)
                        //    Console.WriteLine(string.Format("{0}={1}", Properties[5], result.Properties[Properties[5]][0]));
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