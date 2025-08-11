using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Web;

namespace ACT_DASHBOARD_WEB.Models
{
    public class WriteToLog
    {
        private static readonly object fileLock = new object();

        public void writeToLog(string message)
        {
            //string log_path = @"C:\temp\HL_System_WEB_Log.txt";
            string log_path = new Uri(Path.GetDirectoryName(Assembly.GetExecutingAssembly().CodeBase) + @"\ACT_dashboard_web.log").LocalPath;
            if (!File.Exists(log_path))
            {
                using (FileStream fs = File.Create(log_path))
                {
                }
            }

            lock (fileLock)
            {
                // Write file using StreamWriter  
                using (StreamWriter writer = new StreamWriter(log_path, true, System.Text.Encoding.UTF8))
                {
                    writer.WriteLine(DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss") + "," + message);
                }
            }

        }
        
        public string GetIp()
        {
            string ip = System.Web.HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (string.IsNullOrEmpty(ip))
            {
                ip = System.Web.HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
            }

            return ip;
        }

    }
}