using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ACT_DASHBOARD_WEB.Models
{
    public class ApiObject
    {
    }
    public class Pool_signin
    {
        public string username { get; set; }
        public string password { get; set; }
    }
    public class Signin_response
    {
        public string token { get; set; }
        public JObject user { get; set; }
    }

    public class MongoGetAll
    {
        public string collection { get; set; }
        public JArray query { get; set; }
        public JObject projection { get; set; }
    }

    public class MongoGetAllResponse
    {
        public JArray data { get; set; }
        public string error { get; set; }
    }


}