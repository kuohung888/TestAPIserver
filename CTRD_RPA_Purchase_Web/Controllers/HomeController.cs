using purchase_order_web.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace purchase_order_web.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult Purchase()
        {
            DB_Access dB_Access = new DB_Access();
            string userName = (Session["UserName"] == null) ? "" : Session["UserName"].ToString();
            DataTable dt;

            //if(Session["UserId"]!=null && Session["UserId"].ToString() == "K09865")
            //{
            //    dt = dB_Access.GetPRList("", "", "");
            //}else
            //{
            //    dt = dB_Access.GetPRList("", "", userName);
            //}
            dt = dB_Access.GetPRList("", "", userName);

            return View(dt);
        }

        [HttpPost]
        public ActionResult Purchase(FormCollection post)
        {
            string ePrNum = post["input_e_pr_num"];
            string userName = (Session["UserName"] == null) ? "" : Session["UserName"].ToString();
            DB_Access dB_Access = new DB_Access();
            ViewBag.EPrNum = ePrNum;

            DataTable dt;
            //if (Session["UserId"] != null && Session["UserId"].ToString() == "K09865")
            //{
            //    dt = dB_Access.GetPRList(ePrNum, "", "");
            //}
            //else
            //{
            //    dt = dB_Access.GetPRList(ePrNum, "", userName);
            //}
            dt = dB_Access.GetPRList(ePrNum, "", userName);

            return View(dt);
        }
    }
}