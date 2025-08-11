using ACT_DASHBOARD_WEB.Models;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using static ACT_DASHBOARD_WEB.Models.WebApiOpject;

namespace ACT_DASHBOARD_WEB.Controllers
{
    public class MongoAPIController : Controller
    {
        // GET: MongoAPI
        public ActionResult Index()
        {
            return View();
        }


        ActionResult GetBD(FilterObject filterObject)
        {
            // 初始化必要的服務和返回物件
            WebApiClient webApiClient = new WebApiClient();
            WriteToLog writeToLog = new WriteToLog();
            MongoGetAllResponse response;
            List<string> listBD = new List<string>();
            string returnJson = "";

            try
            {
                // 使用 Stopwatch 記錄執行時間
                Stopwatch stopwatch = new Stopwatch();
                stopwatch.Start();

                // 初始化空查詢陣列
                JArray query = JArray.Parse($"[]");

                #region 條件篩選
                // 日期範圍篩選
                if (filterObject.startDate != null && filterObject.endDate != null)
                {
                    DateTime outTime = DateTime.Now;
                    if (DateTime.TryParse(filterObject.startDate, out outTime) && DateTime.TryParse(filterObject.endDate, out outTime))
                    {
                        JObject inArray = new JObject { { "$gte", filterObject.startDate }, { "$lte", filterObject.endDate } };
                        query.Add(new JObject { { "lot_info.Date", inArray } });
                    }
                }

                // 測試機篩選
                if (filterObject.tester != null)
                {
                    filterObject.tester = filterObject.tester.Where(s => !string.IsNullOrEmpty(s)).ToList();
                    if (filterObject.tester.Count != 0)
                    {
                        JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.tester.Select(s => $"\"{s}\""))} ]");
                        JObject inArray = new JObject { { "$in", jArrayTmp } };
                        query.Add(new JObject { { "lot_info.Tester", inArray } });
                    }
                }

                // 批號篩選
                if (filterObject.lotId != null)
                {
                    filterObject.lotId = filterObject.lotId.Where(s => !string.IsNullOrEmpty(s)).ToList();
                    if (filterObject.lotId.Count != 0)
                    {
                        JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.lotId.Select(s => $"\"{s}\""))} ]");
                        JObject inArray = new JObject { { "$in", jArrayTmp } };
                        query.Add(new JObject { { "lot_info.Lot ID", inArray } });
                    }
                }
                #endregion

                // 根據頁面選擇合適的集合
                string collectionName = "site";
                if (filterObject.pageName == "hw_bin_list")
                {
                    collectionName = "concl";
                }

                // 建立 MongoDB 查詢
                MongoGetAll mongoGetAll = new MongoGetAll()
                {
                    collection = collectionName,
                    query = query,
                    projection = JObject.Parse($"{{\"lot_info.Test Program\": 1}}")
                };

                // 執行 API 請求
                response = webApiClient.MongoGetAllAsync(mongoGetAll).GetAwaiter().GetResult();
                if (response?.error == "Unauthorized")
                {
                    return Content(JsonConvert.SerializeObject(response.error), "application/json");
                }

                stopwatch.Stop();
                long elapsedMilliseconds = stopwatch.ElapsedMilliseconds;

                // 檢查響應數據是否為 null
                if (response?.data != null)
                {
                    // 提取唯一的 BD 值
                    foreach (var item in response.data)
                    {
                        if (item["lot_info"] != null && item["lot_info"].Count() > 0 &&
                            item["lot_info"][0]["Test Program"] != null)
                        {
                            string testProgram = item["lot_info"][0]["Test Program"].ToString();
                            if (!listBD.Contains(testProgram))
                            {
                                listBD.Add(testProgram);
                            }
                        }
                    }
                }
                else
                {
                    // 記錄響應數據為 null 的情況
                    writeToLog.writeToLog("GetBD response.data is null");
                }

                // 處理錯誤或返回結果
                if (!string.IsNullOrEmpty(response?.error))
                {
                    returnJson = response.error;
                }
                else
                {
                    returnJson = JsonConvert.SerializeObject(listBD);
                }
            }
            catch (Exception ex)
            {
                // 異常處理與記錄
                writeToLog.writeToLog("'GetBD Exception error:" + ex.ToString());
                returnJson = JsonConvert.SerializeObject(new { error = ex.Message });
            }

            return Content(returnJson, "application/json");
        }

        public ActionResult GetTester(FilterObject filterObject)
        {
            WebApiClient webApiClient = new WebApiClient();
            WriteToLog writeToLog = new WriteToLog();
            MongoGetAllResponse response;

            List<string> listTester = new List<string>();
            string returnJson = "";

            try
            {
                JArray query = JArray.Parse($"[]");//  JArray.Parse($"[{{\"lot_info.Date\":{{\"$gte\": \"{filterObject.startDate}\", \"$lte\": \"{filterObject.endDate}\"}}}}]");


                #region 條件篩選
                if (filterObject.startDate != null && filterObject.endDate != null)
                {
                    DateTime outTime = DateTime.Now;
                    if (DateTime.TryParse(filterObject.startDate, out outTime) && DateTime.TryParse(filterObject.endDate, out outTime))
                    {
                        JObject inArray = new JObject { { "$gte", filterObject.startDate }, { "$lte", filterObject.endDate } };
                        query.Add(new JObject
                        {
                            { "lot_info.Date", inArray }
                        });
                    }
                }
                if (filterObject.bd != null && filterObject.bd.Count != 0)
                {
                    filterObject.bd = filterObject.bd.Where(s => !string.IsNullOrEmpty(s)).ToList();
                    if (filterObject.bd.Count != 0)
                    {
                        JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.bd.Select(s => $"\"{s}\""))} ]");
                        JObject inArray = new JObject { { "$in", jArrayTmp } };
                        query.Add(new JObject
                        {
                            { "lot_info.Test Program", inArray }
                        });
                    }
                }
                //if (filterObject.tester != null)
                //{
                //    filterObject.tester = filterObject.tester.Where(s => !string.IsNullOrEmpty(s)).ToList();
                //    if (filterObject.tester.Count != 0)
                //    {
                //        JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.tester.Select(s => $"\"{s}\""))} ]");
                //        JObject inArray = new JObject { { "$in", jArrayTmp } };
                //        query.Add(new JObject
                //        {
                //            { "lot_info.Tester", inArray }
                //        });
                //    }

                //}
                if (filterObject.lotId != null)
                {
                    filterObject.lotId = filterObject.lotId.Where(s => !string.IsNullOrEmpty(s)).ToList();
                    if (filterObject.lotId.Count != 0)
                    {
                        JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.lotId.Select(s => $"\"{s}\""))} ]");
                        JObject inArray = new JObject { { "$in", jArrayTmp } };
                        query.Add(new JObject
                        {
                            { "lot_info.Lot ID", inArray }
                        });
                    }
                }
                #endregion

                string collectionName = "site";
                if (filterObject.pageName == "hw_bin_list")
                {
                    collectionName = "concl";
                }

                // 宣告 Web API body
                MongoGetAll mongoGetAll = new MongoGetAll()
                {
                    collection = collectionName,
                    query = query, // JArray.Parse($"[{{\"lot_info.Date\":{{\"$gte\": \"{filterObject.startDate}\", \"$lte\": \"{filterObject.endDate}\"}}}},{{\"lot_info.Test Program\":\"{filterObject.bd}\"}}]"),
                    projection = JObject.Parse($"{{\"lot_info.Tester\": 1}}")
                };

                response = webApiClient.MongoGetAllAsync(mongoGetAll).GetAwaiter().GetResult();

                for (int i = 0; i < response.data.Count; i++)
                {
                    if (response.data[i]["lot_info"][0]["Tester"] == null) continue;
                    string tester = response.data[i]["lot_info"][0]["Tester"].ToString();
                    if (!listTester.Contains(tester))
                    {
                        listTester.Add(tester);
                    }
                }

                if (!string.IsNullOrEmpty(response.error))
                {
                    //writeToLog.writeToLog("GetBD response error:" + response.error);
                    returnJson = response.error;
                }

                returnJson = JsonConvert.SerializeObject(listTester);
            }
            catch (Exception ex)
            {
                //Console.WriteLine(ex.ToString());
                writeToLog.writeToLog("'GetTester Exception error:" + ex.ToString());
            }

            return Content(returnJson, "application/json");
        }

        public ActionResult GetLotId(FilterObject filterObject)
        {
            WebApiClient webApiClient = new WebApiClient();
            WriteToLog writeToLog = new WriteToLog();
            MongoGetAllResponse response;

            List<string> listLot = new List<string>();
            string returnJson = "";

            try
            {
                JArray query = JArray.Parse($"[]");//  JArray.Parse($"[{{\"lot_info.Date\":{{\"$gte\": \"{filterObject.startDate}\", \"$lte\": \"{filterObject.endDate}\"}}}}]");


                #region 條件篩選
                if (filterObject.startDate != null && filterObject.endDate != null)
                {
                    DateTime outTime = DateTime.Now;
                    if (DateTime.TryParse(filterObject.startDate, out outTime) && DateTime.TryParse(filterObject.endDate, out outTime))
                    {
                        JObject inArray = new JObject { { "$gte", filterObject.startDate }, { "$lte", filterObject.endDate } };
                        query.Add(new JObject
                        {
                            { "lot_info.Date", inArray }
                        });
                    }
                }
                if (filterObject.bd != null && filterObject.bd.Count != 0)
                {
                    filterObject.bd = filterObject.bd.Where(s => !string.IsNullOrEmpty(s)).ToList();
                    if (filterObject.bd.Count != 0)
                    {
                        JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.bd.Select(s => $"\"{s}\""))} ]");
                        JObject inArray = new JObject { { "$in", jArrayTmp } };
                        query.Add(new JObject
                        {
                            { "lot_info.Test Program", inArray }
                        });
                    }
                }
                if (filterObject.tester != null)
                {
                    filterObject.tester = filterObject.tester.Where(s => !string.IsNullOrEmpty(s)).ToList();
                    if (filterObject.tester.Count != 0)
                    {
                        JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.tester.Select(s => $"\"{s}\""))} ]");
                        JObject inArray = new JObject { { "$in", jArrayTmp } };
                        query.Add(new JObject
                        {
                            { "lot_info.Tester", inArray }
                        });
                    }

                }
                //if (filterObject.lotId != null)
                //{
                //    filterObject.lotId = filterObject.lotId.Where(s => !string.IsNullOrEmpty(s)).ToList();
                //    if (filterObject.lotId.Count != 0)
                //    {
                //        JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.lotId.Select(s => $"\"{s}\""))} ]");
                //        JObject inArray = new JObject { { "$in", jArrayTmp } };
                //        query.Add(new JObject
                //        {
                //            { "lot_info.Lot ID", inArray }
                //        });
                //    }
                //}
                #endregion

                string collectionName = "site";
                if (filterObject.pageName == "hw_bin_list")
                {
                    collectionName = "concl";
                }

                // 宣告 Web API body
                MongoGetAll mongoGetAll = new MongoGetAll()
                {
                    collection = collectionName,
                    query = query,
                    projection = JObject.Parse($"{{\"lot_info.Lot ID\": 1}}")
                };

                response = webApiClient.MongoGetAllAsync(mongoGetAll).GetAwaiter().GetResult();

                for (int i = 0; i < response.data.Count; i++)
                {
                    if (response.data[i]["lot_info"][0]["Lot ID"] == null) continue;
                    string lot = response.data[i]["lot_info"][0]["Lot ID"].ToString();
                    if (!listLot.Contains(lot))
                    {
                        listLot.Add(lot);
                    }
                }

                if (!string.IsNullOrEmpty(response.error))
                {
                    //writeToLog.writeToLog("GetBD response error:" + response.error);
                    returnJson = response.error;
                }

                returnJson = JsonConvert.SerializeObject(listLot);
            }
            catch (Exception ex)
            {
                //Console.WriteLine(ex.ToString());
                writeToLog.writeToLog("'GetLotId Exception error:" + ex.ToString());
            }

            return Content(returnJson, "application/json");
        }

        public ActionResult GetWaferId(FilterObject filterObject)
        {
            WebApiClient webApiClient = new WebApiClient();
            WriteToLog writeToLog = new WriteToLog();
            MongoGetAllResponse response;

            List<string> listWafer = new List<string>();
            string returnJson = "";

            try
            {
                JArray query = JArray.Parse($"[]");//  JArray.Parse($"[{{\"lot_info.Date\":{{\"$gte\": \"{filterObject.startDate}\", \"$lte\": \"{filterObject.endDate}\"}}}}]");

                #region 條件篩選
                if (filterObject.startDate != null && filterObject.endDate != null)
                {
                    DateTime outTime = DateTime.Now;
                    if (DateTime.TryParse(filterObject.startDate, out outTime) && DateTime.TryParse(filterObject.endDate, out outTime))
                    {
                        JObject inArray = new JObject { { "$gte", filterObject.startDate }, { "$lte", filterObject.endDate } };
                        query.Add(new JObject
                        {
                            { "lot_info.Date", inArray }
                        });
                    }
                }
                if (filterObject.bd != null && filterObject.bd.Count != 0)
                {
                    filterObject.bd = filterObject.bd.Where(s => !string.IsNullOrEmpty(s)).ToList();
                    if (filterObject.bd.Count != 0)
                    {
                        JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.bd.Select(s => $"\"{s}\""))} ]");
                        JObject inArray = new JObject { { "$in", jArrayTmp } };
                        query.Add(new JObject
                        {
                            { "lot_info.Test Program", inArray }
                        });
                    }
                }
                if (filterObject.tester != null)
                {
                    filterObject.tester = filterObject.tester.Where(s => !string.IsNullOrEmpty(s)).ToList();
                    if (filterObject.tester.Count != 0)
                    {
                        JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.tester.Select(s => $"\"{s}\""))} ]");
                        JObject inArray = new JObject { { "$in", jArrayTmp } };
                        query.Add(new JObject
                        {
                            { "lot_info.Tester", inArray }
                        });
                    }

                }
                if (filterObject.lotId != null)
                {
                    filterObject.lotId = filterObject.lotId.Where(s => !string.IsNullOrEmpty(s)).ToList();
                    if (filterObject.lotId.Count != 0)
                    {
                        JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.lotId.Select(s => $"\"{s}\""))} ]");
                        JObject inArray = new JObject { { "$in", jArrayTmp } };
                        query.Add(new JObject
                        {
                            { "lot_info.Lot ID", inArray }
                        });
                    }
                }
                #endregion

                string collectionName = "site";
                if (filterObject.pageName == "hw_bin_list")
                {
                    collectionName = "concl";
                }

                // 宣告 Web API body
                MongoGetAll mongoGetAll = new MongoGetAll()
                {
                    collection = collectionName,
                    query = query,
                    projection = JObject.Parse($"{{\"lot_info.Wafer Lot\": 1}}")
                };

                response = webApiClient.MongoGetAllAsync(mongoGetAll).GetAwaiter().GetResult();

                for (int i = 0; i < response.data.Count; i++)
                {
                    if (response.data[i]["lot_info"][0]["Wafer Lot"] == null) continue;
                    string wafer = response.data[i]["lot_info"][0]["Wafer Lot"].ToString();
                    if (!listWafer.Contains(wafer))
                    {
                        listWafer.Add(wafer);
                    }
                }

                if (!string.IsNullOrEmpty(response.error))
                {
                    //writeToLog.writeToLog("GetBD response error:" + response.error);
                    returnJson = response.error;
                }

                returnJson = JsonConvert.SerializeObject(listWafer);
            }
            catch (Exception ex)
            {
                //Console.WriteLine(ex.ToString());
                writeToLog.writeToLog("'GetWaferId Exception error:" + ex.ToString());
            }

            return Content(returnJson, "application/json");
        }

        public ActionResult GetTestMode(FilterObject filterObject)
        {
            WebApiClient webApiClient = new WebApiClient();
            WriteToLog writeToLog = new WriteToLog();
            MongoGetAllResponse response;

            List<string> listTestMode = new List<string>();
            string returnJson = "";

            try
            {
                JArray query = JArray.Parse($"[]");//  JArray.Parse($"[{{\"lot_info.Date\":{{\"$gte\": \"{filterObject.startDate}\", \"$lte\": \"{filterObject.endDate}\"}}}}]");

                #region 條件篩選
                if (filterObject.startDate != null && filterObject.endDate != null)
                {
                    DateTime outTime = DateTime.Now;
                    if (DateTime.TryParse(filterObject.startDate, out outTime) && DateTime.TryParse(filterObject.endDate, out outTime))
                    {
                        JObject inArray = new JObject { { "$gte", filterObject.startDate }, { "$lte", filterObject.endDate } };
                        query.Add(new JObject
                        {
                            { "lot_info.Date", inArray }
                        });
                    }
                }
                if (filterObject.bd != null && filterObject.bd.Count != 0)
                {
                    filterObject.bd = filterObject.bd.Where(s => !string.IsNullOrEmpty(s)).ToList();
                    if (filterObject.bd.Count != 0)
                    {
                        JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.bd.Select(s => $"\"{s}\""))} ]");
                        JObject inArray = new JObject { { "$in", jArrayTmp } };
                        query.Add(new JObject
                        {
                            { "lot_info.Test Program", inArray }
                        });
                    }
                }
                if (filterObject.tester != null)
                {
                    filterObject.tester = filterObject.tester.Where(s => !string.IsNullOrEmpty(s)).ToList();
                    if (filterObject.tester.Count != 0)
                    {
                        JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.tester.Select(s => $"\"{s}\""))} ]");
                        JObject inArray = new JObject { { "$in", jArrayTmp } };
                        query.Add(new JObject
                        {
                            { "lot_info.Tester", inArray }
                        });
                    }

                }
                if (filterObject.lotId != null)
                {
                    filterObject.lotId = filterObject.lotId.Where(s => !string.IsNullOrEmpty(s)).ToList();
                    if (filterObject.lotId.Count != 0)
                    {
                        JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.lotId.Select(s => $"\"{s}\""))} ]");
                        JObject inArray = new JObject { { "$in", jArrayTmp } };
                        query.Add(new JObject
                        {
                            { "lot_info.Lot ID", inArray }
                        });
                    }
                }

                if (filterObject.waferId != null && filterObject.waferId.Count != 0)
                {
                    filterObject.waferId = filterObject.waferId.Where(s => !string.IsNullOrEmpty(s)).ToList();
                    if (filterObject.waferId.Count != 0)
                    {
                        JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.waferId.Select(s => $"\"{s}\""))} ]");
                        JObject inArray = new JObject { { "$in", jArrayTmp } };
                        query.Add(new JObject
                        {
                            { "lot_info.Wafer Lot", inArray }
                        });
                    }
                }
                #endregion

                string collectionName = "site";
                if (filterObject.pageName == "hw_bin_list")
                {
                    collectionName = "concl";
                }

                // 宣告 Web API body
                MongoGetAll mongoGetAll = new MongoGetAll()
                {
                    collection = collectionName,
                    query = query,
                    projection = JObject.Parse($"{{\"lot_info.Execution mode\": 1}}")
                };

                response = webApiClient.MongoGetAllAsync(mongoGetAll).GetAwaiter().GetResult();

                for (int i = 0; i < response.data.Count; i++)
                {
                    if (response.data[i]["lot_info"][0]["Execution mode"] == null) continue;
                    string testMode = response.data[i]["lot_info"][0]["Execution mode"].ToString();
                    if (!listTestMode.Contains(testMode))
                    {
                        listTestMode.Add(testMode);
                    }
                }

                if (!string.IsNullOrEmpty(response.error))
                {
                    //writeToLog.writeToLog("GetBD response error:" + response.error);
                    returnJson = response.error;
                }

                returnJson = JsonConvert.SerializeObject(listTestMode);
            }
            catch (Exception ex)
            {
                //Console.WriteLine(ex.ToString());
                writeToLog.writeToLog("'GetTestMode Exception error:" + ex.ToString());
            }

            return Content(returnJson, "application/json");
        }

        public ActionResult GetTestItem(FilterObject filterObject)
        {
            WebApiClient webApiClient = new WebApiClient();
            WriteToLog writeToLog = new WriteToLog();
            MongoGetAllResponse response;

            List<string> listTestItem = new List<string>();
            string returnJson = "";

            try
            {
                JArray query = JArray.Parse($"[]");//  JArray.Parse($"[{{\"lot_info.Date\":{{\"$gte\": \"{filterObject.startDate}\", \"$lte\": \"{filterObject.endDate}\"}}}}]");

                #region 條件篩選
                if (filterObject.startDate != null && filterObject.endDate != null)
                {
                    DateTime outTime = DateTime.Now;
                    if (DateTime.TryParse(filterObject.startDate, out outTime) && DateTime.TryParse(filterObject.endDate, out outTime))
                    {
                        JObject inArray = new JObject { { "$gte", filterObject.startDate }, { "$lte", filterObject.endDate } };
                        query.Add(new JObject
                        {
                            { "lot_info.Date", inArray }
                        });
                    }
                }
                if (filterObject.bd != null && filterObject.bd.Count != 0)
                {
                    filterObject.bd = filterObject.bd.Where(s => !string.IsNullOrEmpty(s)).ToList();
                    if (filterObject.bd.Count != 0)
                    {
                        JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.bd.Select(s => $"\"{s}\""))} ]");
                        JObject inArray = new JObject { { "$in", jArrayTmp } };
                        query.Add(new JObject
                        {
                            { "lot_info.Test Program", inArray }
                        });
                    }
                }
                if (filterObject.tester != null)
                {
                    filterObject.tester = filterObject.tester.Where(s => !string.IsNullOrEmpty(s)).ToList();
                    if (filterObject.tester.Count != 0)
                    {
                        JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.tester.Select(s => $"\"{s}\""))} ]");
                        JObject inArray = new JObject { { "$in", jArrayTmp } };
                        query.Add(new JObject
                        {
                            { "lot_info.Tester", inArray }
                        });
                    }

                }
                if (filterObject.lotId != null)
                {
                    filterObject.lotId = filterObject.lotId.Where(s => !string.IsNullOrEmpty(s)).ToList();
                    if (filterObject.lotId.Count != 0)
                    {
                        JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.lotId.Select(s => $"\"{s}\""))} ]");
                        JObject inArray = new JObject { { "$in", jArrayTmp } };
                        query.Add(new JObject
                        {
                            { "lot_info.Lot ID", inArray }
                        });
                    }
                }

                if (filterObject.waferId != null && filterObject.waferId.Count != 0)
                {
                    filterObject.waferId = filterObject.waferId.Where(s => !string.IsNullOrEmpty(s)).ToList();
                    if (filterObject.waferId.Count != 0)
                    {
                        JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.waferId.Select(s => $"\"{s}\""))} ]");
                        JObject inArray = new JObject { { "$in", jArrayTmp } };
                        query.Add(new JObject
                        {
                            { "lot_info.Wafer Lot", inArray }
                        });
                    }
                }
                if (filterObject.testMode != null && filterObject.testMode.Count != 0)
                {
                    filterObject.testMode = filterObject.testMode.Where(s => !string.IsNullOrEmpty(s)).ToList();
                    if (filterObject.testMode.Count != 0)
                    {
                        JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.testMode.Select(s => $"\"{s}\""))} ]");
                        JObject inArray = new JObject { { "$in", jArrayTmp } };
                        query.Add(new JObject
                        {
                            { "lot_info.Execution mode", inArray }
                        });
                    }
                }
                #endregion

                // 宣告 Web API body
                MongoGetAll mongoGetAll = new MongoGetAll()
                {
                    collection = "site",
                    query = query,
                    projection = JObject.Parse($"{{\"statistic.ITEM NAME\": 1}}")
                };

                response = webApiClient.MongoGetAllAsync(mongoGetAll).GetAwaiter().GetResult();

                for (int i = 0; i < response.data.Count; i++)
                {
                    if (response.data[i]["statistic"] == null) continue;
                    JArray dataItem = JArray.Parse(response.data[i]["statistic"].ToString());

                    for (int j = 0; j < dataItem.Count; j++)
                    {
                        if (dataItem[j]["ITEM NAME"] == null) continue;
                        string itemName = dataItem[j]["ITEM NAME"].ToString();
                        if (!listTestItem.Contains(itemName) && itemName!="test time" && itemName != "index time" && itemName != "real time")
                        {
                            listTestItem.Add(itemName);
                        }
                    }

                }

                if (!string.IsNullOrEmpty(response.error))
                {
                    //writeToLog.writeToLog("GetBD response error:" + response.error);
                    returnJson = response.error;
                }

                returnJson = JsonConvert.SerializeObject(listTestItem);
            }
            catch (Exception ex)
            {
                //Console.WriteLine(ex.ToString());
                writeToLog.writeToLog("'GetTestItem Exception error:" + ex.ToString());
            }

            return Content(returnJson, "application/json");
        }

        public ActionResult GetSite(FilterObject filterObject)
        {
            WebApiClient webApiClient = new WebApiClient();
            WriteToLog writeToLog = new WriteToLog();
            MongoGetAllResponse response;

            List<string> listSite = new List<string>();
            string returnJson = "";

            try
            {
                JArray query = JArray.Parse($"[]");//  JArray.Parse($"[{{\"lot_info.Date\":{{\"$gte\": \"{filterObject.startDate}\", \"$lte\": \"{filterObject.endDate}\"}}}}]");

                #region 條件篩選
                if (filterObject.startDate != null && filterObject.endDate != null)
                {
                    DateTime outTime = DateTime.Now;
                    if (DateTime.TryParse(filterObject.startDate, out outTime) && DateTime.TryParse(filterObject.endDate, out outTime))
                    {
                        JObject inArray = new JObject { { "$gte", filterObject.startDate }, { "$lte", filterObject.endDate } };
                        query.Add(new JObject
                        {
                            { "lot_info.Date", inArray }
                        });
                    }
                }
                if (filterObject.bd != null && filterObject.bd.Count != 0)
                {
                    filterObject.bd = filterObject.bd.Where(s => !string.IsNullOrEmpty(s)).ToList();
                    if (filterObject.bd.Count != 0)
                    {
                        JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.bd.Select(s => $"\"{s}\""))} ]");
                        JObject inArray = new JObject { { "$in", jArrayTmp } };
                        query.Add(new JObject
                        {
                            { "lot_info.Test Program", inArray }
                        });
                    }
                }
                if (filterObject.tester != null)
                {
                    filterObject.tester = filterObject.tester.Where(s => !string.IsNullOrEmpty(s)).ToList();
                    if (filterObject.tester.Count != 0)
                    {
                        JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.tester.Select(s => $"\"{s}\""))} ]");
                        JObject inArray = new JObject { { "$in", jArrayTmp } };
                        query.Add(new JObject
                        {
                            { "lot_info.Tester", inArray }
                        });
                    }

                }
                if (filterObject.lotId != null)
                {
                    filterObject.lotId = filterObject.lotId.Where(s => !string.IsNullOrEmpty(s)).ToList();
                    if (filterObject.lotId.Count != 0)
                    {
                        JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.lotId.Select(s => $"\"{s}\""))} ]");
                        JObject inArray = new JObject { { "$in", jArrayTmp } };
                        query.Add(new JObject
                        {
                            { "lot_info.Lot ID", inArray }
                        });
                    }
                }

                if (filterObject.waferId != null && filterObject.waferId.Count != 0)
                {
                    filterObject.waferId = filterObject.waferId.Where(s => !string.IsNullOrEmpty(s)).ToList();
                    if (filterObject.waferId.Count != 0)
                    {
                        JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.waferId.Select(s => $"\"{s}\""))} ]");
                        JObject inArray = new JObject { { "$in", jArrayTmp } };
                        query.Add(new JObject
                        {
                            { "lot_info.Wafer Lot", inArray }
                        });
                    }
                }
                #endregion

                // 宣告 Web API body
                MongoGetAll mongoGetAll = new MongoGetAll()
                {
                    collection = "site",
                    query = query,
                    projection = JObject.Parse($"{{\"lot_info.Site ID\": 1}}")
                };

                response = webApiClient.MongoGetAllAsync(mongoGetAll).GetAwaiter().GetResult();

                for (int i = 0; i < response.data.Count; i++)
                {
                    if (response.data[i]["lot_info"][0]["Site ID"] == null) continue;
                    string site = response.data[i]["lot_info"][0]["Site ID"].ToString();
                    if (!listSite.Contains(site))
                    {
                        listSite.Add(site);
                    }
                }

                if (!string.IsNullOrEmpty(response.error))
                {
                    //writeToLog.writeToLog("GetBD response error:" + response.error);
                    returnJson = response.error;
                }

                returnJson = JsonConvert.SerializeObject(listSite);
            }
            catch (Exception ex)
            {
                //Console.WriteLine(ex.ToString());
                writeToLog.writeToLog("'GetSite Exception error:" + ex.ToString());
            }

            return Content(returnJson, "application/json");
        }

        #region mongoDB site 與 test_result_value 已拆表 傳遞顆數資料
        public ActionResult GetHistogramCombineLabelAndValue(FilterObjectHistogramCombine filterObject)
        {
            WebApiClient webApiClient = new WebApiClient();
            WriteToLog writeToLog = new WriteToLog();
            Tool tool = new Tool();
            MongoGetAllResponse response;

            List<string> listSite = new List<string>();
            string returnJson = "";
            string userAccount = (Request.Cookies["userAccount"] == null) ? "" : Request.Cookies["userAccount"].Value;
            string adAccount = (userAccount.Split(',').Length > 1) ? userAccount.Split(',')[1] : "";

            try
            {
                Stopwatch stopwatch = new Stopwatch();
                stopwatch.Start();

                JArray query = JArray.Parse($"[]");//  JArray.Parse($"[{{\"lot_info.Date\":{{\"$gte\": \"{filterObject.startDate}\", \"$lte\": \"{filterObject.endDate}\"}}}}]");

                #region 條件篩選
                if (filterObject.startDate != null && filterObject.endDate != null)
                {
                    DateTime outTime = DateTime.Now;
                    if (DateTime.TryParse(filterObject.startDate, out outTime) && DateTime.TryParse(filterObject.endDate, out outTime))
                    {
                        JObject inArray = new JObject { { "$gte", filterObject.startDate }, { "$lte", filterObject.endDate } };
                        query.Add(new JObject
                        {
                            { "lot_info.Date", inArray }
                        });
                    }
                }

                if (filterObject.bd != null && filterObject.bd.Count != 0)
                {
                    filterObject.bd = filterObject.bd.Where(s => !string.IsNullOrEmpty(s)).ToList();
                    if (filterObject.bd.Count != 0)
                    {
                        JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.bd.Select(s => $"\"{s}\""))} ]");
                        JObject inArray = new JObject { { "$in", jArrayTmp } };
                        query.Add(new JObject
                        {
                            { "lot_info.Test Program", inArray }
                        });
                    }
                }
                if (filterObject.tester != null)
                {
                    filterObject.tester = filterObject.tester.Where(s => !string.IsNullOrEmpty(s)).ToList();
                    if (filterObject.tester.Count != 0)
                    {
                        JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.tester.Select(s => $"\"{s}\""))} ]");
                        JObject inArray = new JObject { { "$in", jArrayTmp } };
                        query.Add(new JObject
                        {
                            { "lot_info.Tester", inArray }
                        });
                    }

                }
                if (filterObject.lotId != null)
                {
                    filterObject.lotId = filterObject.lotId.Where(s => !string.IsNullOrEmpty(s)).ToList();
                    if (filterObject.lotId.Count != 0)
                    {
                        JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.lotId.Select(s => $"\"{s}\""))} ]");
                        JObject inArray = new JObject { { "$in", jArrayTmp } };
                        query.Add(new JObject
                        {
                            { "lot_info.Lot ID", inArray }
                        });
                    }
                }
                if (filterObject.waferId != null && filterObject.waferId.Count != 0)
                {
                    filterObject.waferId = filterObject.waferId.Where(s => !string.IsNullOrEmpty(s)).ToList();
                    if (filterObject.waferId.Count != 0)
                    {
                        JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.waferId.Select(s => $"\"{s}\""))} ]");
                        JObject inArray = new JObject { { "$in", jArrayTmp } };
                        query.Add(new JObject
                        {
                            { "lot_info.Wafer Lot", inArray }
                        });
                    }
                }
                if (filterObject.testMode != null && filterObject.testMode.Count != 0)
                {
                    filterObject.testMode = filterObject.testMode.Where(s => !string.IsNullOrEmpty(s)).ToList();
                    if (filterObject.testMode.Count != 0)
                    {
                        JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.testMode.Select(s => $"\"{s}\""))} ]");
                        JObject inArray = new JObject { { "$in", jArrayTmp } };
                        query.Add(new JObject
                        {
                            { "lot_info.Execution mode", inArray }
                        });
                    }
                }
                if (filterObject.site != null && filterObject.site.Count != 0)
                {
                    filterObject.site = filterObject.site.Where(s => !string.IsNullOrEmpty(s)).ToList();

                    if (filterObject.site.Count != 0)
                    {
                        JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.site.Select(s => $"\"{s}\""))} ]");
                        JObject inArray = new JObject { { "$in", jArrayTmp } };
                        query.Add(new JObject
                        {
                            { "lot_info.Site ID", inArray }
                        });
                    }
                }
                //if (filterObject.testItem != null && filterObject.testItem.Count != 0)
                //{
                //    JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.testItem.Select(s => $"\"{s}\""))} ]");
                //    JObject inArray = new JObject { { "$in", jArrayTmp } };
                //    query.Add(new JObject
                //    {
                //        { "statistic.ITEM NAME", inArray }
                //    });
                //}
                #endregion

                // 宣告 Web API body
                MongoGetAll mongoGetAll = new MongoGetAll()
                {
                    collection = "site",
                    query = query,
                    projection = JObject.Parse($"{{\"statistic\":1, \"test_result_value.{filterObject.testItem[0]}\":1}}")
                };

                response = webApiClient.MongoGetAllAsync(mongoGetAll).GetAwaiter().GetResult();

                filterObject.newSpecStd = "3";  // 使用者std預設為3
                double specMin = 0, specMax = 0;
                string unit = "";
                List<double> testValues = new List<double>();
                List<int> listFileId = new List<int>();

                for (int i = 0; i < response.data.Count; i++)
                {
                    if (response.data[i]["statistic"] != null)
                    {
                        JArray statisticItem = JArray.Parse(response.data[i]["statistic"].ToString());
                        listFileId.Add(int.Parse(statisticItem[i]["file_id"].ToString()));

                        for (int j = 0; j < statisticItem.Count; j++)
                        {
                            if (statisticItem[j]["ITEM NAME"] == null) continue;
                            string itemName = statisticItem[j]["ITEM NAME"].ToString();
                            if (filterObject.testItem.Contains(itemName))
                            {
                                string specMinStr = statisticItem[j]["Spec MIN"].ToString();
                                double.TryParse(specMinStr, out specMin);
                                string specMaxStr = statisticItem[j]["Spec MAX"].ToString();
                                double.TryParse(specMaxStr, out specMax);
                                unit = statisticItem[j]["unit"].ToString();
                            }
                        }
                    }
                    

                }

                // 20240912 test_result_value 改從另一張表 site_result_value 取出
                JArray queryValue = JArray.Parse($"[]");
                JArray jArrayFileIdTmp = JArray.Parse($"[ {string.Join(",", listFileId)} ]");
                JObject inArrayFileId = new JObject { { "$in", jArrayFileIdTmp } };
                queryValue.Add(new JObject
                {
                    { "file_id", inArrayFileId }
                });

                // 宣告 Web API body
                MongoGetAll mongoGetAllValue = new MongoGetAll()
                {
                    collection = "site_test_result_value",
                    query = queryValue,
                    projection = JObject.Parse($"{{\"test_result_value.{filterObject.testItem[0]}\":1}}")
                };
                MongoGetAllResponse responseValue = webApiClient.MongoGetAllAsync(mongoGetAllValue).GetAwaiter().GetResult();

                for (int i = 0; i < responseValue.data.Count; i++)
                {
                    if (responseValue.data[i]["test_result_value"] != null)
                    {
                        JArray testResultValueItem = JArray.Parse(responseValue.data[i]["test_result_value"].ToString());

                        for (int j = 0; j < testResultValueItem.Count; j++)
                        {
                            if (testResultValueItem[j][filterObject.testItem[0]] == null) continue;
                            string testValueStr = testResultValueItem[j][filterObject.testItem[0]].ToString();
                            double testValue = 0;
                            double.TryParse(testValueStr, out testValue);
                            testValues.Add(testValue);
                        }
                    }
                }

                //specMax=3;
                // test values 排序
                testValues.Sort();
                double valueMax = testValues.Max();
                double valueMin = testValues.Min();
                double valueAvg = testValues.Average();
                double yield = tool.calculateYield(testValues, specMax, specMin);
                double failPpm = tool.calculateFailPpm(testValues, specMax, specMin);
                double std = tool.calculateStd(testValues);
                double newSpecMax = 0, newSpecMin = 0, newYield = 0, newFailPpm = 0;

                if (!string.IsNullOrEmpty(filterObject.newSpecStd))
                {
                    double newStd;
                    double.TryParse(filterObject.newSpecStd, out newStd);
                    newSpecMax = valueAvg + newStd * std;
                    newSpecMin = valueAvg - newStd * std;
                    newYield = tool.calculateYield(testValues, newSpecMax, newSpecMin);
                    newFailPpm = tool.calculateFailPpm(testValues, newSpecMax, newSpecMin);
                }

                double valueAndSpecMin = Math.Min(Math.Min(valueMin, newSpecMin), specMin);
                double valueAndSpecMax = Math.Max(Math.Max(valueMax, newSpecMax), specMax);

                double binWidth = 0;
                int binCount = 20;

                List<int> valueCount = new List<int>();
                List<double> valuePercent = new List<double>();
                List<double> valueLabel = new List<double>();


                binWidth = (valueMax - valueMin) / binCount;

                // 判斷Spec min, New Spec min是否小於 Min value ，若小於需增加 valueCount,valuePercent,valueLabel 的資料
                if (valueAndSpecMin < valueMin - binWidth)
                {
                    int addCount = (int)Math.Round((valueMin - valueAndSpecMin) / binWidth);

                    if (valueAndSpecMin < valueMin - addCount * binWidth)
                    {
                        valueCount.Add(0);
                        valuePercent.Add(0);
                        valueLabel.Add(valueMin - (addCount + 1) * binWidth);
                    }
                    for (int i = addCount; i > 1; i--)
                    {
                        valueCount.Add(0);
                        valuePercent.Add(0);
                        valueLabel.Add(valueMin - i * binWidth);
                    }

                }

                for (double i = valueMin - binWidth * 2; i < valueMax + binWidth; i = i + binWidth)
                {
                    List<double> filteredNumbers = testValues.Where(n => n > i && n <= i + binWidth).ToList();
                    valueCount.Add(filteredNumbers.Count);
                    valuePercent.Add(Math.Round((double)filteredNumbers.Count / (double)testValues.Count * 100, 2));
                    valueLabel.Add(i + binWidth);
                }

                // 判斷Spec max, New Spec max是否大於 Max value ，若大於需增加 valueCount,valuePercent,valueLabel 的資料
                if (valueAndSpecMax > valueMax + binWidth)
                {
                    for (double i = valueMax + binWidth; i < valueAndSpecMax; i = i + binWidth)
                    {
                        valueCount.Add(0);
                        valuePercent.Add(0);
                        valueLabel.Add(i + binWidth);
                    }
                    if (valueAndSpecMax > valueLabel[valueLabel.Count - 2])
                    {
                        valueCount.Add(0);
                        valuePercent.Add(0);
                        valueLabel.Add(valueLabel[valueLabel.Count - 1] + binWidth);
                    }

                }


                double maxPercent = valuePercent.Max();
                binCount = valueLabel.Count;

                int newSpecMinIdx = tool.GetIndex(valueLabel, newSpecMin);
                int specMinIdx = tool.GetIndex(valueLabel, specMin);
                int specMaxIdx = tool.GetIndex(valueLabel, specMax);
                int newSpecMaxIdx = tool.GetIndex(valueLabel, newSpecMax);

                valueLabel = valueLabel.Select(x => Math.Round(x, 6)).ToList();

                HistogramCombineObject histogramCombineObject = new HistogramCombineObject()
                {
                    specMin = specMin.ToString(),
                    specMax = specMax.ToString(),
                    unit = unit,
                    value_min = valueMin.ToString(),
                    value_max = valueMax.ToString(),
                    avg = Math.Round(valueAvg, 6).ToString(),
                    std = Math.Round(std, 6).ToString(),
                    moveIn = testValues.Count.ToString(),
                    yield = Math.Round(yield * 100, 2).ToString(),
                    failPpm = ((int)Math.Round(failPpm)).ToString(),
                    xMin = valueLabel[0].ToString(),
                    xMax = valueLabel[valueLabel.Count - 1].ToString(),
                    binWidth = Math.Round(binWidth, 6).ToString(),
                    binCount = binCount.ToString(),
                    newSpecStd = filterObject.newSpecStd,
                    newSpecMax = Math.Round(newSpecMax, 6).ToString(),
                    newSpecMin = Math.Round(newSpecMin, 6).ToString(),
                    newYield = Math.Round(newYield * 100, 2).ToString(),
                    newFailPpm = ((int)Math.Round(newFailPpm)).ToString(),
                    histogramLabel = valueLabel,
                    histogramData = valuePercent,
                    histogramDataDeviceCount = valueCount,
                    histogramSpecLabel = new List<double> { newSpecMinIdx, specMinIdx, specMaxIdx, newSpecMaxIdx },
                    histogramSpecData = new List<double> { maxPercent + 2, maxPercent + 2, maxPercent + 2, maxPercent + 2 }
                };

                if (!string.IsNullOrEmpty(response.error))
                {
                    //writeToLog.writeToLog("GetHistogramCombineLabelAndValue response error:" + response.error);
                    returnJson = response.error;
                }

                returnJson = JsonConvert.SerializeObject(histogramCombineObject);

                stopwatch.Stop();
                long elapsedMilliseconds = stopwatch.ElapsedMilliseconds;
                writeToLog.writeToLog("Histogram combine - start,IP:" + writeToLog.GetIp() + ",runtime:" + elapsedMilliseconds + ",\"user:" + adAccount + "\",\"filterObject:" + JsonConvert.SerializeObject(filterObject) + "\"");
            }
            catch (Exception ex)
            {
                //Console.WriteLine(ex.ToString());
                writeToLog.writeToLog("  user:" + adAccount + " 'GetHistogramCombineLabelAndValue Exception error:" + ex.ToString());
            }

            return Content(returnJson, "application/json");
        }
        #endregion

        #region #region mongoDB site 與 test_result_value 已拆表
        //public ActionResult GetHistogramCombineLabelAndValue2(FilterObjectHistogramCombine filterObject)
        //{
        //    WebApiClient webApiClient = new WebApiClient();
        //    WriteToLog writeToLog = new WriteToLog();
        //    Tool tool = new Tool();
        //    MongoGetAllResponse response;

        //    List<string> listSite = new List<string>();
        //    string returnJson = "";
        //    string userAccount = (Request.Cookies["userAccount"] == null) ? "" : Request.Cookies["userAccount"].Value;

        //    try
        //    {
        //        Stopwatch stopwatch = new Stopwatch();
        //        stopwatch.Start();

        //        JArray query = JArray.Parse($"[]");//  JArray.Parse($"[{{\"lot_info.Date\":{{\"$gte\": \"{filterObject.startDate}\", \"$lte\": \"{filterObject.endDate}\"}}}}]");

        //        #region 條件篩選
        //        if (filterObject.startDate != null && filterObject.endDate != null)
        //        {
        //            DateTime outTime = DateTime.Now;
        //            if (DateTime.TryParse(filterObject.startDate, out outTime) && DateTime.TryParse(filterObject.endDate, out outTime))
        //            {
        //                JObject inArray = new JObject { { "$gte", filterObject.startDate }, { "$lte", filterObject.endDate } };
        //                query.Add(new JObject
        //                {
        //                    { "lot_info.Date", inArray }
        //                });
        //            }
        //        }

        //        if (filterObject.bd != null && filterObject.bd.Count != 0)
        //        {
        //            filterObject.bd = filterObject.bd.Where(s => !string.IsNullOrEmpty(s)).ToList();
        //            if (filterObject.bd.Count != 0)
        //            {
        //                JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.bd.Select(s => $"\"{s}\""))} ]");
        //                JObject inArray = new JObject { { "$in", jArrayTmp } };
        //                query.Add(new JObject
        //                {
        //                    { "lot_info.Test Program", inArray }
        //                });
        //            }
        //        }
        //        if (filterObject.tester != null)
        //        {
        //            filterObject.tester = filterObject.tester.Where(s => !string.IsNullOrEmpty(s)).ToList();
        //            if (filterObject.tester.Count != 0)
        //            {
        //                JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.tester.Select(s => $"\"{s}\""))} ]");
        //                JObject inArray = new JObject { { "$in", jArrayTmp } };
        //                query.Add(new JObject
        //                {
        //                    { "lot_info.Tester", inArray }
        //                });
        //            }

        //        }
        //        if (filterObject.lotId != null)
        //        {
        //            filterObject.lotId = filterObject.lotId.Where(s => !string.IsNullOrEmpty(s)).ToList();
        //            if (filterObject.lotId.Count != 0)
        //            {
        //                JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.lotId.Select(s => $"\"{s}\""))} ]");
        //                JObject inArray = new JObject { { "$in", jArrayTmp } };
        //                query.Add(new JObject
        //                {
        //                    { "lot_info.Lot ID", inArray }
        //                });
        //            }
        //        }
        //        if (filterObject.waferId != null && filterObject.waferId.Count != 0)
        //        {
        //            filterObject.waferId = filterObject.waferId.Where(s => !string.IsNullOrEmpty(s)).ToList();
        //            if (filterObject.waferId.Count != 0)
        //            {
        //                JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.waferId.Select(s => $"\"{s}\""))} ]");
        //                JObject inArray = new JObject { { "$in", jArrayTmp } };
        //                query.Add(new JObject
        //                {
        //                    { "lot_info.Wafer Lot", inArray }
        //                });
        //            }
        //        }
        //        if (filterObject.testMode != null && filterObject.testMode.Count != 0)
        //        {
        //            filterObject.testMode = filterObject.testMode.Where(s => !string.IsNullOrEmpty(s)).ToList();
        //            if (filterObject.testMode.Count != 0)
        //            {
        //                JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.testMode.Select(s => $"\"{s}\""))} ]");
        //                JObject inArray = new JObject { { "$in", jArrayTmp } };
        //                query.Add(new JObject
        //                {
        //                    { "lot_info.Execution mode", inArray }
        //                });
        //            }
        //        }
        //        if (filterObject.site != null && filterObject.site.Count != 0)
        //        {
        //            filterObject.site = filterObject.site.Where(s => !string.IsNullOrEmpty(s)).ToList();

        //            if (filterObject.site.Count != 0)
        //            {
        //                JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.site.Select(s => $"\"{s}\""))} ]");
        //                JObject inArray = new JObject { { "$in", jArrayTmp } };
        //                query.Add(new JObject
        //                {
        //                    { "lot_info.Site ID", inArray }
        //                });
        //            }
        //        }
        //        //if (filterObject.testItem != null && filterObject.testItem.Count != 0)
        //        //{
        //        //    JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.testItem.Select(s => $"\"{s}\""))} ]");
        //        //    JObject inArray = new JObject { { "$in", jArrayTmp } };
        //        //    query.Add(new JObject
        //        //    {
        //        //        { "statistic.ITEM NAME", inArray }
        //        //    });
        //        //}
        //        #endregion

        //        // 宣告 Web API body
        //        MongoGetAll mongoGetAll = new MongoGetAll()
        //        {
        //            collection = "site",
        //            query = query,
        //            projection = JObject.Parse($"{{\"statistic\":1, \"test_result_value.{filterObject.testItem[0]}\":1}}")
        //        };

        //        response = webApiClient.MongoGetAllAsync(mongoGetAll).GetAwaiter().GetResult();

        //        filterObject.newSpecStd = "3";  // 使用者std預設為3
        //        double specMin = 0, specMax = 0;
        //        string unit = "";
        //        List<double> testValues = new List<double>();
        //        List<int> listFileId = new List<int>();

        //        for (int i = 0; i < response.data.Count; i++)
        //        {
        //            if (response.data[i]["statistic"] != null)
        //            {
        //                JArray statisticItem = JArray.Parse(response.data[i]["statistic"].ToString());
        //                listFileId.Add(int.Parse(statisticItem[i]["file_id"].ToString()));

        //                for (int j = 0; j < statisticItem.Count; j++)
        //                {
        //                    if (statisticItem[j]["ITEM NAME"] == null) continue;
        //                    string itemName = statisticItem[j]["ITEM NAME"].ToString();
        //                    if (filterObject.testItem.Contains(itemName))
        //                    {
        //                        string specMinStr = statisticItem[j]["Spec MIN"].ToString();
        //                        double.TryParse(specMinStr, out specMin);
        //                        string specMaxStr = statisticItem[j]["Spec MAX"].ToString();
        //                        double.TryParse(specMaxStr, out specMax);
        //                        unit = statisticItem[j]["unit"].ToString();
        //                    }
        //                }
        //            }
                    

        //        }

        //        // 20240912 test_result_value 改從另一張表 site_result_value 取出
        //        JArray queryValue = JArray.Parse($"[]");
        //        JArray jArrayFileIdTmp = JArray.Parse($"[ {string.Join(",", listFileId)} ]");
        //        JObject inArrayFileId = new JObject { { "$in", jArrayFileIdTmp } };
        //        queryValue.Add(new JObject
        //                {
        //                    { "file_id", inArrayFileId }
        //                });

        //        // 宣告 Web API body
        //        MongoGetAll mongoGetAllValue = new MongoGetAll()
        //        {
        //            collection = "site_test_result_value",
        //            query = queryValue,
        //            projection = JObject.Parse($"{{\"test_result_value.{filterObject.testItem[0]}\":1}}")
        //        };
        //        MongoGetAllResponse responseValue = webApiClient.MongoGetAllAsync(mongoGetAllValue).GetAwaiter().GetResult();

        //        for (int i = 0; i < responseValue.data.Count; i++)
        //        {
        //            if (responseValue.data[i]["test_result_value"] != null)
        //            {
        //                JArray testResultValueItem = JArray.Parse(responseValue.data[i]["test_result_value"].ToString());

        //                for (int j = 0; j < testResultValueItem.Count; j++)
        //                {
        //                    if (testResultValueItem[j][filterObject.testItem[0]] == null) continue;
        //                    string testValueStr = testResultValueItem[j][filterObject.testItem[0]].ToString();
        //                    double testValue = 0;
        //                    double.TryParse(testValueStr, out testValue);
        //                    testValues.Add(testValue);
        //                }
        //            }
        //        }

        //        //specMax=3;
        //        // test values 排序
        //        testValues.Sort();
        //        double valueMax = testValues.Max();
        //        double valueMin = testValues.Min();
        //        double valueAvg = testValues.Average();
        //        double yield = tool.calculateYield(testValues, specMax, specMin);
        //        double failPpm = tool.calculateFailPpm(testValues, specMax, specMin);
        //        double std = tool.calculateStd(testValues);
        //        double newSpecMax = 0, newSpecMin = 0, newYield = 0, newFailPpm = 0;

        //        if (!string.IsNullOrEmpty(filterObject.newSpecStd))
        //        {
        //            double newStd;
        //            double.TryParse(filterObject.newSpecStd, out newStd);
        //            newSpecMax = valueAvg + newStd * std;
        //            newSpecMin = valueAvg - newStd * std;
        //            newYield = tool.calculateYield(testValues, newSpecMax, newSpecMin);
        //            newFailPpm = tool.calculateFailPpm(testValues, newSpecMax, newSpecMin);
        //        }

        //        double valueAndSpecMin = Math.Min(Math.Min(valueMin, newSpecMin), specMin);
        //        double valueAndSpecMax = Math.Max(Math.Max(valueMax, newSpecMax), specMax);

        //        double binWidth = 0;
        //        int binCount = 20;

        //        List<int> valueCount = new List<int>();
        //        List<double> valuePercent = new List<double>();
        //        List<double> valueLabel = new List<double>();


        //        binWidth = (valueMax - valueMin) / binCount;

        //        // 判斷Spec min, New Spec min是否小於 Min value ，若小於需增加 valueCount,valuePercent,valueLabel 的資料
        //        if (valueAndSpecMin < valueMin - binWidth)
        //        {
        //            int addCount = (int)Math.Round((valueMin - valueAndSpecMin) / binWidth);

        //            if (valueAndSpecMin < valueMin - addCount * binWidth)
        //            {
        //                valueCount.Add(0);
        //                valuePercent.Add(0);
        //                valueLabel.Add(valueMin - (addCount + 1) * binWidth);
        //            }
        //            for (int i = addCount; i > 1; i--)
        //            {
        //                valueCount.Add(0);
        //                valuePercent.Add(0);
        //                valueLabel.Add(valueMin - i * binWidth);
        //            }

        //        }

        //        for (double i = valueMin - binWidth * 2; i < valueMax + binWidth; i = i + binWidth)
        //        {
        //            List<double> filteredNumbers = testValues.Where(n => n > i && n <= i + binWidth).ToList();
        //            valueCount.Add(filteredNumbers.Count);
        //            valuePercent.Add(Math.Round((double)filteredNumbers.Count / (double)testValues.Count * 100, 2));
        //            valueLabel.Add(i + binWidth);
        //        }

        //        // 判斷Spec max, New Spec max是否大於 Max value ，若大於需增加 valueCount,valuePercent,valueLabel 的資料
        //        if (valueAndSpecMax > valueMax + binWidth)
        //        {
        //            for (double i = valueMax + binWidth; i < valueAndSpecMax; i = i + binWidth)
        //            {
        //                valueCount.Add(0);
        //                valuePercent.Add(0);
        //                valueLabel.Add(i + binWidth);
        //            }
        //            if (valueAndSpecMax > valueLabel[valueLabel.Count - 2])
        //            {
        //                valueCount.Add(0);
        //                valuePercent.Add(0);
        //                valueLabel.Add(valueLabel[valueLabel.Count - 1] + binWidth);
        //            }

        //        }


        //        double maxPercent = valuePercent.Max();
        //        binCount = valueLabel.Count;

        //        int newSpecMinIdx = tool.GetIndex(valueLabel, newSpecMin);
        //        int specMinIdx = tool.GetIndex(valueLabel, specMin);
        //        int specMaxIdx = tool.GetIndex(valueLabel, specMax);
        //        int newSpecMaxIdx = tool.GetIndex(valueLabel, newSpecMax);

        //        valueLabel = valueLabel.Select(x => Math.Round(x, 6)).ToList();

        //        HistogramCombineObject histogramCombineObject = new HistogramCombineObject()
        //        {
        //            specMin = specMin.ToString(),
        //            specMax = specMax.ToString(),
        //            unit = unit,
        //            value_min = valueMin.ToString(),
        //            value_max = valueMax.ToString(),
        //            avg = Math.Round(valueAvg, 6).ToString(),
        //            std = Math.Round(std, 6).ToString(),
        //            moveIn = testValues.Count.ToString(),
        //            yield = Math.Round(yield * 100, 2).ToString(),
        //            failPpm = ((int)Math.Round(failPpm)).ToString(),
        //            xMin = valueLabel[0].ToString(),
        //            xMax = valueLabel[valueLabel.Count - 1].ToString(),
        //            binWidth = Math.Round(binWidth, 6).ToString(),
        //            binCount = binCount.ToString(),
        //            newSpecStd = filterObject.newSpecStd,
        //            newSpecMax = Math.Round(newSpecMax, 6).ToString(),
        //            newSpecMin = Math.Round(newSpecMin, 6).ToString(),
        //            newYield = Math.Round(newYield * 100, 2).ToString(),
        //            newFailPpm = ((int)Math.Round(newFailPpm)).ToString(),
        //            histogramLabel = valueLabel,
        //            histogramData = valuePercent,
        //            histogramSpecLabel = new List<double> { newSpecMinIdx, specMinIdx, specMaxIdx, newSpecMaxIdx },
        //            histogramSpecData = new List<double> { maxPercent + 2, maxPercent + 2, maxPercent + 2, maxPercent + 2 }
        //        };

        //        if (!string.IsNullOrEmpty(response.error))
        //        {
        //            //writeToLog.writeToLog("GetHistogramCombineLabelAndValue response error:" + response.error);
        //            returnJson = response.error;
        //        }

        //        returnJson = JsonConvert.SerializeObject(histogramCombineObject);

        //        stopwatch.Stop();
        //        long elapsedMilliseconds = stopwatch.ElapsedMilliseconds;
        //        writeToLog.writeToLog("  Histogram combine - start  IP:" + writeToLog.GetIp() + "  runtime:" + elapsedMilliseconds + "  user:" + userAccount + "  filterObject:" + JsonConvert.SerializeObject(filterObject));
        //    }
        //    catch (Exception ex)
        //    {
        //        //Console.WriteLine(ex.ToString());
        //        writeToLog.writeToLog("  user:" + userAccount + " 'GetHistogramCombineLabelAndValue Exception error:" + ex.ToString());
        //    }

        //    return Content(returnJson, "application/json");
        //}
        #endregion 

        #region mongoDB site 與 test_result_value 未拆表
        //public ActionResult GetHistogramCombineLabelAndValue1(FilterObjectHistogramCombine filterObject)
        //{
        //    WebApiClient webApiClient = new WebApiClient();
        //    WriteToLog writeToLog = new WriteToLog();
        //    Tool tool = new Tool();
        //    MongoGetAllResponse response;

        //    List<string> listSite = new List<string>();
        //    string returnJson = "";
        //    string userAccount = (Request.Cookies["userAccount"] == null) ? "" : Request.Cookies["userAccount"].Value;

        //    try
        //    {
        //        Stopwatch stopwatch = new Stopwatch();
        //        stopwatch.Start();

        //        JArray query = JArray.Parse($"[]");//  JArray.Parse($"[{{\"lot_info.Date\":{{\"$gte\": \"{filterObject.startDate}\", \"$lte\": \"{filterObject.endDate}\"}}}}]");

        //        #region 條件篩選
        //        if (filterObject.startDate != null && filterObject.endDate != null)
        //        {
        //            DateTime outTime = DateTime.Now;
        //            if (DateTime.TryParse(filterObject.startDate, out outTime) && DateTime.TryParse(filterObject.endDate, out outTime))
        //            {
        //                JObject inArray = new JObject { { "$gte", filterObject.startDate }, { "$lte", filterObject.endDate } };
        //                query.Add(new JObject
        //                {
        //                    { "lot_info.Date", inArray }
        //                });
        //            }
        //        }

        //        if (filterObject.bd != null && filterObject.bd.Count != 0)
        //        {
        //            filterObject.bd = filterObject.bd.Where(s => !string.IsNullOrEmpty(s)).ToList();
        //            if (filterObject.bd.Count != 0)
        //            {
        //                JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.bd.Select(s => $"\"{s}\""))} ]");
        //                JObject inArray = new JObject { { "$in", jArrayTmp } };
        //                query.Add(new JObject
        //                {
        //                    { "lot_info.Test Program", inArray }
        //                });
        //            }
        //        }
        //        if (filterObject.tester != null)
        //        {
        //            filterObject.tester = filterObject.tester.Where(s => !string.IsNullOrEmpty(s)).ToList();
        //            if (filterObject.tester.Count != 0)
        //            {
        //                JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.tester.Select(s => $"\"{s}\""))} ]");
        //                JObject inArray = new JObject { { "$in", jArrayTmp } };
        //                query.Add(new JObject
        //                {
        //                    { "lot_info.Tester", inArray }
        //                });
        //            }
                    
        //        }
        //        if (filterObject.lotId != null)
        //        {
        //            filterObject.lotId = filterObject.lotId.Where(s => !string.IsNullOrEmpty(s)).ToList();
        //            if (filterObject.lotId.Count != 0)
        //            {
        //                JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.lotId.Select(s => $"\"{s}\""))} ]");
        //                JObject inArray = new JObject { { "$in", jArrayTmp } };
        //                query.Add(new JObject
        //                {
        //                    { "lot_info.Lot ID", inArray }
        //                });
        //            }
        //        }
        //        if (filterObject.waferId != null && filterObject.waferId.Count != 0)
        //        {
        //            filterObject.waferId = filterObject.waferId.Where(s => !string.IsNullOrEmpty(s)).ToList();
        //            if (filterObject.waferId.Count != 0)
        //            {
        //                JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.waferId.Select(s => $"\"{s}\""))} ]");
        //                JObject inArray = new JObject { { "$in", jArrayTmp } };
        //                query.Add(new JObject
        //                {
        //                    { "lot_info.Wafer Lot", inArray }
        //                });
        //            }
        //        }
        //        if (filterObject.testMode != null && filterObject.testMode.Count != 0)
        //        {
        //            filterObject.testMode = filterObject.testMode.Where(s => !string.IsNullOrEmpty(s)).ToList();
        //            if (filterObject.testMode.Count != 0)
        //            {
        //                JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.testMode.Select(s => $"\"{s}\""))} ]");
        //                JObject inArray = new JObject { { "$in", jArrayTmp } };
        //                query.Add(new JObject
        //                {
        //                    { "lot_info.Execution mode", inArray }
        //                });
        //            }
        //        }
        //        if (filterObject.site != null && filterObject.site.Count != 0)
        //        {
        //            filterObject.site = filterObject.site.Where(s => !string.IsNullOrEmpty(s)).ToList();

        //            if (filterObject.site.Count != 0)
        //            {
        //                JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.site.Select(s => $"\"{s}\""))} ]");
        //                JObject inArray = new JObject { { "$in", jArrayTmp } };
        //                query.Add(new JObject
        //                {
        //                    { "lot_info.Site ID", inArray }
        //                });
        //            }
        //        }
        //        //if (filterObject.testItem != null && filterObject.testItem.Count != 0)
        //        //{
        //        //    JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.testItem.Select(s => $"\"{s}\""))} ]");
        //        //    JObject inArray = new JObject { { "$in", jArrayTmp } };
        //        //    query.Add(new JObject
        //        //    {
        //        //        { "statistic.ITEM NAME", inArray }
        //        //    });
        //        //}
        //        #endregion

        //        // 宣告 Web API body
        //        MongoGetAll mongoGetAll = new MongoGetAll()
        //        {
        //            collection = "site",
        //            query = query,
        //            projection = JObject.Parse($"{{\"statistic\":1, \"test_result_value.{filterObject.testItem[0]}\":1}}")
        //        };

        //        response = webApiClient.MongoGetAllAsync(mongoGetAll).GetAwaiter().GetResult();

        //        filterObject.newSpecStd = "3";  // 使用者std預設為3
        //        double specMin = 0, specMax = 0;
        //        string unit = "";
        //        List<double> testValues = new List<double>();

        //        for (int i = 0; i < response.data.Count; i++)
        //        {
        //            if (response.data[i]["statistic"] != null)
        //            {
        //                JArray statisticItem = JArray.Parse(response.data[i]["statistic"].ToString());

        //                for (int j = 0; j < statisticItem.Count; j++)
        //                {
        //                    if (statisticItem[j]["ITEM NAME"] == null) continue;
        //                    string itemName = statisticItem[j]["ITEM NAME"].ToString();
        //                    if (filterObject.testItem.Contains(itemName))
        //                    {
        //                        string specMinStr = statisticItem[j]["Spec MIN"].ToString();
        //                        double.TryParse(specMinStr, out specMin);
        //                        string specMaxStr = statisticItem[j]["Spec MAX"].ToString();
        //                        double.TryParse(specMaxStr, out specMax);
        //                        unit = statisticItem[j]["unit"].ToString();
        //                    }
        //                }
        //            }

        //            if (response.data[i]["test_result_value"] != null)
        //            {
        //                JArray testResultValueItem = JArray.Parse(response.data[i]["test_result_value"].ToString());

        //                for (int j = 0; j < testResultValueItem.Count; j++)
        //                {
        //                    if (testResultValueItem[j][filterObject.testItem[0]] == null) continue;
        //                    string testValueStr = testResultValueItem[j][filterObject.testItem[0]].ToString();
        //                    double testValue = 0;
        //                    double.TryParse(testValueStr, out testValue);
        //                    testValues.Add(testValue);
        //                }
        //            }

        //        }

        //        //specMax=3;
        //        // test values 排序
        //        testValues.Sort();
        //        double valueMax = testValues.Max();
        //        double valueMin = testValues.Min();
        //        double valueAvg = testValues.Average();
        //        double yield = tool.calculateYield(testValues, specMax, specMin);
        //        double failPpm = tool.calculateFailPpm(testValues, specMax, specMin);
        //        double std = tool.calculateStd(testValues);
        //        double newSpecMax = 0, newSpecMin = 0, newYield = 0, newFailPpm = 0;

        //        if(!string.IsNullOrEmpty(filterObject.newSpecStd))
        //        {
        //            double newStd;
        //            double.TryParse(filterObject.newSpecStd, out newStd);
        //            newSpecMax = valueAvg + newStd * std;
        //            newSpecMin = valueAvg - newStd * std;
        //            newYield= tool.calculateYield(testValues, newSpecMax, newSpecMin);
        //            newFailPpm = tool.calculateFailPpm(testValues, newSpecMax, newSpecMin);
        //        }
                
        //        double valueAndSpecMin = Math.Min(Math.Min(valueMin, newSpecMin), specMin);
        //        double valueAndSpecMax = Math.Max(Math.Max(valueMax, newSpecMax), specMax);

        //        double binWidth = 0;
        //        int binCount = 20;

        //        List<int> valueCount = new List<int>();
        //        List<double> valuePercent = new List<double>();
        //        List<double> valueLabel = new List<double>();


        //        binWidth = (valueMax - valueMin) / binCount;

        //        // 判斷Spec min, New Spec min是否小於 Min value ，若小於需增加 valueCount,valuePercent,valueLabel 的資料
        //        if (valueAndSpecMin < valueMin - binWidth)
        //        {
        //            int addCount = (int)Math.Round((valueMin - valueAndSpecMin) / binWidth);

        //            if(valueAndSpecMin< valueMin - addCount * binWidth)
        //            {
        //                valueCount.Add(0);
        //                valuePercent.Add(0);
        //                valueLabel.Add(valueMin - (addCount+1) * binWidth);
        //            }
        //            for (int i = addCount; i > 1; i--)
        //            {
        //                valueCount.Add(0);
        //                valuePercent.Add(0);
        //                valueLabel.Add(valueMin - i * binWidth);
        //            }

        //        }

        //        for (double i = valueMin - binWidth * 2; i < valueMax + binWidth; i = i + binWidth)
        //        {
        //            List<double> filteredNumbers = testValues.Where(n => n > i && n <= i + binWidth).ToList();
        //            valueCount.Add(filteredNumbers.Count);
        //            valuePercent.Add(Math.Round((double)filteredNumbers.Count / (double)testValues.Count * 100, 2));
        //            valueLabel.Add(i + binWidth);
        //        }

        //        // 判斷Spec max, New Spec max是否大於 Max value ，若大於需增加 valueCount,valuePercent,valueLabel 的資料
        //        if (valueAndSpecMax > valueMax + binWidth)
        //        {
        //            for (double i = valueMax+ binWidth; i < valueAndSpecMax; i=i+ binWidth)
        //            {
        //                valueCount.Add(0);
        //                valuePercent.Add(0);
        //                valueLabel.Add(i + binWidth);
        //            }
        //            if(valueAndSpecMax > valueLabel[valueLabel.Count-2])
        //            {
        //                valueCount.Add(0);
        //                valuePercent.Add(0);
        //                valueLabel.Add(valueLabel[valueLabel.Count - 1] + binWidth);
        //            }

        //        }
                

        //        double maxPercent = valuePercent.Max();
        //        binCount = valueLabel.Count;

        //        int newSpecMinIdx = tool.GetIndex(valueLabel, newSpecMin);
        //        int specMinIdx = tool.GetIndex(valueLabel, specMin);
        //        int specMaxIdx = tool.GetIndex(valueLabel, specMax);
        //        int newSpecMaxIdx = tool.GetIndex(valueLabel, newSpecMax);

        //        valueLabel = valueLabel.Select(x => Math.Round(x, 6)).ToList();

        //        HistogramCombineObject histogramCombineObject = new HistogramCombineObject()
        //        {
        //            specMin = specMin.ToString(),
        //            specMax = specMax.ToString(),
        //            unit = unit,
        //            value_min = valueMin.ToString(),
        //            value_max = valueMax.ToString(),
        //            avg = Math.Round(valueAvg, 6).ToString(),
        //            std = Math.Round(std, 6).ToString(),
        //            moveIn = testValues.Count.ToString(),
        //            yield = Math.Round(yield * 100, 2).ToString(),
        //            failPpm = ((int)Math.Round(failPpm)).ToString(),
        //            xMin = valueLabel[0].ToString(),
        //            xMax = valueLabel[valueLabel.Count - 1].ToString(),
        //            binWidth = Math.Round(binWidth, 6).ToString(),
        //            binCount = binCount.ToString(),
        //            newSpecStd = filterObject.newSpecStd,
        //            newSpecMax = Math.Round(newSpecMax, 6).ToString(),
        //            newSpecMin = Math.Round(newSpecMin, 6).ToString(),
        //            newYield = Math.Round(newYield * 100, 2).ToString(),
        //            newFailPpm = ((int)Math.Round(newFailPpm)).ToString(),
        //            histogramLabel = valueLabel,
        //            histogramData = valuePercent,
        //            histogramSpecLabel = new List<double> { newSpecMinIdx, specMinIdx, specMaxIdx, newSpecMaxIdx },
        //            histogramSpecData = new List<double> { maxPercent + 2, maxPercent + 2, maxPercent + 2, maxPercent + 2 }
        //        };

        //        if (!string.IsNullOrEmpty(response.error))
        //        {
        //            //writeToLog.writeToLog("GetHistogramCombineLabelAndValue response error:" + response.error);
        //            returnJson = response.error;
        //        }

        //        returnJson = JsonConvert.SerializeObject(histogramCombineObject);

        //        stopwatch.Stop();
        //        long elapsedMilliseconds = stopwatch.ElapsedMilliseconds;
        //        writeToLog.writeToLog("  Histogram combine - start  IP:" + writeToLog.GetIp() + "  runtime:" + elapsedMilliseconds + "  user:" + userAccount + "  filterObject:" + JsonConvert.SerializeObject(filterObject));
        //    }
        //    catch (Exception ex)
        //    {
        //        //Console.WriteLine(ex.ToString());
        //        writeToLog.writeToLog("  user:" + userAccount + " 'GetHistogramCombineLabelAndValue Exception error:" + ex.ToString());
        //    }

        //    return Content(returnJson, "application/json");
        //}
        #endregion

        #region mongoDB site 與 test_result_value 已拆表，納入 bin width 、 X min 、X max  計算
        public ActionResult GetRecalculationHistogramCombineLabelAndValue(FilterObjectHistogramCombine filterObject)
        {
            WebApiClient webApiClient = new WebApiClient();
            WriteToLog writeToLog = new WriteToLog();
            Tool tool = new Tool();
            MongoGetAllResponse response;

            List<string> listSite = new List<string>();
            string returnJson = "";
            string userAccount = (Request.Cookies["userAccount"] == null) ? "" : Request.Cookies["userAccount"].Value;

            try
            {
                Stopwatch stopwatch = new Stopwatch();
                stopwatch.Start();

                JArray query = JArray.Parse($"[]");//  JArray.Parse($"[{{\"lot_info.Date\":{{\"$gte\": \"{filterObject.startDate}\", \"$lte\": \"{filterObject.endDate}\"}}}}]");

                #region 條件篩選
                if (filterObject.startDate != null && filterObject.endDate != null)
                {
                    DateTime outTime = DateTime.Now;
                    if (DateTime.TryParse(filterObject.startDate, out outTime) && DateTime.TryParse(filterObject.endDate, out outTime))
                    {
                        JObject inArray = new JObject { { "$gte", filterObject.startDate }, { "$lte", filterObject.endDate } };
                        query.Add(new JObject
                        {
                            { "lot_info.Date", inArray }
                        });
                    }
                }
                if (filterObject.bd != null && filterObject.bd.Count != 0)
                {
                    filterObject.bd = filterObject.bd.Where(s => !string.IsNullOrEmpty(s)).ToList();
                    if (filterObject.bd.Count != 0)
                    {
                        JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.bd.Select(s => $"\"{s}\""))} ]");
                        JObject inArray = new JObject { { "$in", jArrayTmp } };
                        query.Add(new JObject
                        {
                            { "lot_info.Test Program", inArray }
                        });
                    }
                }
                if (filterObject.tester != null)
                {
                    filterObject.tester = filterObject.tester.Where(s => !string.IsNullOrEmpty(s)).ToList();
                    if (filterObject.tester.Count != 0)
                    {
                        JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.tester.Select(s => $"\"{s}\""))} ]");
                        JObject inArray = new JObject { { "$in", jArrayTmp } };
                        query.Add(new JObject
                        {
                            { "lot_info.Tester", inArray }
                        });
                    }

                }
                if (filterObject.lotId != null)
                {
                    filterObject.lotId = filterObject.lotId.Where(s => !string.IsNullOrEmpty(s)).ToList();
                    if (filterObject.lotId.Count != 0)
                    {
                        JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.lotId.Select(s => $"\"{s}\""))} ]");
                        JObject inArray = new JObject { { "$in", jArrayTmp } };
                        query.Add(new JObject
                        {
                            { "lot_info.Lot ID", inArray }
                        });
                    }
                }
                if (filterObject.waferId != null && filterObject.waferId.Count != 0)
                {
                    filterObject.waferId = filterObject.waferId.Where(s => !string.IsNullOrEmpty(s)).ToList();
                    if (filterObject.waferId.Count != 0)
                    {
                        JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.waferId.Select(s => $"\"{s}\""))} ]");
                        JObject inArray = new JObject { { "$in", jArrayTmp } };
                        query.Add(new JObject
                        {
                            { "lot_info.Wafer Lot", inArray }
                        });
                    }
                }
                if (filterObject.testMode != null && filterObject.testMode.Count != 0)
                {
                    filterObject.testMode = filterObject.testMode.Where(s => !string.IsNullOrEmpty(s)).ToList();
                    if (filterObject.testMode.Count != 0)
                    {
                        JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.testMode.Select(s => $"\"{s}\""))} ]");
                        JObject inArray = new JObject { { "$in", jArrayTmp } };
                        query.Add(new JObject
                        {
                            { "lot_info.Execution mode", inArray }
                        });
                    }
                }
                if (filterObject.site != null && filterObject.site.Count != 0)
                {
                    filterObject.site = filterObject.site.Where(s => !string.IsNullOrEmpty(s)).ToList();

                    if (filterObject.site.Count != 0)
                    {
                        JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.site.Select(s => $"\"{s}\""))} ]");
                        JObject inArray = new JObject { { "$in", jArrayTmp } };
                        query.Add(new JObject
                        {
                            { "lot_info.Site ID", inArray }
                        });
                    }
                }
                #endregion

                // 宣告 Web API body
                MongoGetAll mongoGetAll = new MongoGetAll()
                {
                    collection = "site",
                    query = query,
                    projection = JObject.Parse($"{{\"statistic\":1, \"test_result_value.{filterObject.testItem[0]}\":1}}")
                };

                response = webApiClient.MongoGetAllAsync(mongoGetAll).GetAwaiter().GetResult();

                double specMin = 0, specMax = 0;
                string unit = "";
                List<double> testValues = new List<double>();
                List<int> listFileId = new List<int>();

                for (int i = 0; i < response.data.Count; i++)
                {
                    if (response.data[i]["statistic"] != null)
                    {
                        JArray statisticItem = JArray.Parse(response.data[i]["statistic"].ToString());
                        listFileId.Add(int.Parse(statisticItem[i]["file_id"].ToString()));

                        for (int j = 0; j < statisticItem.Count; j++)
                        {
                            if (statisticItem[j]["ITEM NAME"] == null) continue;
                            string itemName = statisticItem[j]["ITEM NAME"].ToString();
                            if (filterObject.testItem.Contains(itemName))
                            {
                                string specMinStr = statisticItem[j]["Spec MIN"].ToString();
                                double.TryParse(specMinStr, out specMin);
                                string specMaxStr = statisticItem[j]["Spec MAX"].ToString();
                                double.TryParse(specMaxStr, out specMax);
                                unit = statisticItem[j]["unit"].ToString();
                            }
                        }
                    }


                }

                // 20240912 test_result_value 改從另一張表 site_result_value 取出
                JArray queryValue = JArray.Parse($"[]");
                JArray jArrayFileIdTmp = JArray.Parse($"[ {string.Join(",", listFileId)} ]");
                JObject inArrayFileId = new JObject { { "$in", jArrayFileIdTmp } };
                queryValue.Add(new JObject
                {
                    { "file_id", inArrayFileId }
                });

                // 宣告 Web API body
                MongoGetAll mongoGetAllValue = new MongoGetAll()
                {
                    collection = "site_test_result_value",
                    query = queryValue,
                    projection = JObject.Parse($"{{\"test_result_value.{filterObject.testItem[0]}\":1}}")
                };
                MongoGetAllResponse responseValue = webApiClient.MongoGetAllAsync(mongoGetAllValue).GetAwaiter().GetResult();

                for (int i = 0; i < responseValue.data.Count; i++)
                {
                    if (responseValue.data[i]["test_result_value"] != null)
                    {
                        JArray testResultValueItem = JArray.Parse(responseValue.data[i]["test_result_value"].ToString());

                        for (int j = 0; j < testResultValueItem.Count; j++)
                        {
                            if (testResultValueItem[j][filterObject.testItem[0]] == null) continue;
                            string testValueStr = testResultValueItem[j][filterObject.testItem[0]].ToString();
                            double testValue = 0;
                            double.TryParse(testValueStr, out testValue);
                            testValues.Add(testValue);
                        }
                    }
                }


                // test values 排序
                testValues.Sort();
                double valueMax = testValues.Max();
                double valueMin = testValues.Min();
                double valueAvg = testValues.Average();
                double yield = tool.calculateYield(testValues, specMax, specMin);
                double failPpm = tool.calculateFailPpm(testValues, specMax, specMin);
                double std = tool.calculateStd(testValues);
                double newSpecMax = 0, newSpecMin = 0, newYield = 0, newFailPpm = 0;

                // 使用者填入 New Spec 的 STD 倍數
                if (!string.IsNullOrEmpty(filterObject.newSpecStd))
                {
                    double newStd;
                    double.TryParse(filterObject.newSpecStd, out newStd);
                    newSpecMax = valueAvg + newStd * std;
                    newSpecMin = valueAvg - newStd * std;
                    newYield = tool.calculateYield(testValues, newSpecMax, newSpecMin);
                    newFailPpm = tool.calculateFailPpm(testValues, newSpecMax, newSpecMin);
                }

                double valueAndSpecMin = Math.Min(Math.Min(valueMin, newSpecMin), specMin);
                double valueAndSpecMax = Math.Max(Math.Max(valueMax, newSpecMax), specMax);

                double binWidth = 0;
                int binCount = 20;

                List<int> valueCount = new List<int>();
                List<double> valuePercent = new List<double>();
                List<double> valueLabel = new List<double>();

                if (!string.IsNullOrEmpty(filterObject.binWidth)  && !string.IsNullOrEmpty(filterObject.xMin)  && !string.IsNullOrEmpty(filterObject.xMax) )
                    //if (!string.IsNullOrEmpty(filterObject.binWidth) && filterObject.binWidth != "0")
                {
                    // 用新的 bin_width 
                    double.TryParse(filterObject.binWidth, out binWidth);
                    if (binWidth < 0)
                    {
                        binWidth = 0;
                    }

                    //// 使用者輸入的 Xmin Xmax，重新計算 binCount
                    //binWidth = (valueMax - valueMin) / binCount;
                    double newXmin = 0, newXmax = 0;
                    double.TryParse(filterObject.xMin, out newXmin);
                    double.TryParse(filterObject.xMax, out newXmax);

                    for (double i = newXmin - binWidth; i < newXmax; i = i + binWidth)
                    {
                        List<double> filteredNumbers = testValues.Where(n => n > i && n <= i + binWidth).ToList();
                        valueCount.Add(filteredNumbers.Count);
                        valuePercent.Add(Math.Round((double)filteredNumbers.Count / (double)testValues.Count * 100, 2));
                        valueLabel.Add(i + binWidth);

                        if(i + binWidth > newXmax)
                        {
                            i = i + binWidth;
                            filteredNumbers = testValues.Where(n => n > i && n <= i + binWidth).ToList();
                            valueCount.Add(filteredNumbers.Count);
                            valuePercent.Add(Math.Round((double)filteredNumbers.Count / (double)testValues.Count * 100, 2));
                            valueLabel.Add(i + binWidth);
                        }
                    }



                }
                else
                {
                    //使用者未填入binWidth，採用 binCount = 20
                    binWidth = (valueMax - valueMin) / binCount;


                    // 判斷Spec min, New Spec min是否小於 Min value ，若小於需增加 valueCount,valuePercent,valueLabel 的資料
                    if (valueAndSpecMin < valueMin - binWidth)
                    {
                        int addCount = (int)Math.Round((valueMin - valueAndSpecMin) / binWidth);

                        if (valueAndSpecMin < valueMin - addCount * binWidth)
                        {
                            valueCount.Add(0);
                            valuePercent.Add(0);
                            valueLabel.Add(valueMin - (addCount + 1) * binWidth);
                        }
                        for (int i = addCount; i > 1; i--)
                        {
                            valueCount.Add(0);
                            valuePercent.Add(0);
                            valueLabel.Add(valueMin - i * binWidth);
                        }

                    }

                    for (double i = valueMin - binWidth * 2; i < valueMax + binWidth; i = i + binWidth)
                    {
                        List<double> filteredNumbers = testValues.Where(n => n > i && n <= i + binWidth).ToList();
                        valueCount.Add(filteredNumbers.Count);
                        valuePercent.Add(Math.Round((double)filteredNumbers.Count / (double)testValues.Count * 100, 2));
                        valueLabel.Add(i + binWidth);
                    }
                    // 判斷Spec max, New Spec max是否大於 Max value ，若大於需增加 valueCount,valuePercent,valueLabel 的資料
                    if (valueAndSpecMax > valueMax + binWidth)
                    {
                        for (double i = valueMax + binWidth; i < valueAndSpecMax; i = i + binWidth)
                        {
                            valueCount.Add(0);
                            valuePercent.Add(0);
                            valueLabel.Add(i + binWidth);
                        }
                        if (valueAndSpecMax > valueLabel[valueLabel.Count - 2])
                        {
                            valueCount.Add(0);
                            valuePercent.Add(0);
                            valueLabel.Add(valueLabel[valueLabel.Count - 1] + binWidth);
                        }

                    }

                }


             
                
                double maxPercent = valuePercent.Max();
                binCount = valueLabel.Count;

                int newSpecMinIdx = tool.GetIndex(valueLabel, newSpecMin);
                int specMinIdx = tool.GetIndex(valueLabel, specMin);
                int specMaxIdx = tool.GetIndex(valueLabel, specMax);
                int newSpecMaxIdx = tool.GetIndex(valueLabel, newSpecMax);

                valueLabel = valueLabel.Select(x => Math.Round(x, 6)).ToList();

                HistogramCombineObject histogramCombineObject = new HistogramCombineObject()
                {
                    specMin = specMin.ToString(),
                    specMax = specMax.ToString(),
                    unit = unit,
                    value_min = valueMin.ToString(),
                    value_max = valueMax.ToString(),
                    avg = Math.Round(valueAvg, 6).ToString(),
                    std = Math.Round(std, 6).ToString(),
                    moveIn = testValues.Count.ToString(),
                    yield = Math.Round(yield * 100, 2).ToString(),
                    failPpm = ((int)Math.Round(failPpm)).ToString(),
                    xMin = valueLabel[0].ToString(),
                    xMax = valueLabel[valueLabel.Count - 1].ToString(),
                    binWidth = Math.Round(binWidth, 6).ToString(),
                    binCount = binCount.ToString(),
                    newSpecStd = filterObject.newSpecStd,
                    newSpecMax = Math.Round(newSpecMax, 6).ToString(),
                    newSpecMin = Math.Round(newSpecMin, 6).ToString(),
                    newYield = Math.Round(newYield * 100, 2).ToString(),
                    newFailPpm = ((int)Math.Round(newFailPpm)).ToString(),
                    histogramLabel = valueLabel,
                    histogramData = valuePercent,
                    histogramDataDeviceCount = valueCount,
                    histogramSpecLabel = new List<double> { newSpecMinIdx, specMinIdx, specMaxIdx, newSpecMaxIdx },
                    histogramSpecData = new List<double> { maxPercent + 2, maxPercent + 2, maxPercent + 2, maxPercent + 2 }
                };

                if (!string.IsNullOrEmpty(response.error))
                {
                    //writeToLog.writeToLog("GetHistogramCombineLabelAndValue response error:" + response.error);
                    returnJson = response.error;
                }

                returnJson = JsonConvert.SerializeObject(histogramCombineObject);

                stopwatch.Stop();
                long elapsedMilliseconds = stopwatch.ElapsedMilliseconds;
                writeToLog.writeToLog("  Histogram combine - update,IP:" + writeToLog.GetIp() + ",runtime:" + elapsedMilliseconds + ",\"user:" + userAccount + "\",\"filterObject:" + JsonConvert.SerializeObject(filterObject)+"\"");
            }
            catch (Exception ex)
            {
                //Console.WriteLine(ex.ToString());
                writeToLog.writeToLog("  user:" + userAccount + " 'GetHistogramCombineLabelAndValue Exception error:" + ex.ToString());
            }

            return Content(returnJson, "application/json");
        }
        #endregion 

        #region mongoDB site 與 test_result_value 已拆表，納入 bin width 計算
        //public ActionResult GetRecalculationHistogramCombineLabelAndValue2(FilterObjectHistogramCombine filterObject)
        //{
        //    WebApiClient webApiClient = new WebApiClient();
        //    WriteToLog writeToLog = new WriteToLog();
        //    Tool tool = new Tool();
        //    MongoGetAllResponse response;

        //    List<string> listSite = new List<string>();
        //    string returnJson = "";
        //    string userAccount = (Request.Cookies["userAccount"] == null) ? "" : Request.Cookies["userAccount"].Value;

        //    try
        //    {
        //        Stopwatch stopwatch = new Stopwatch();
        //        stopwatch.Start();

        //        JArray query = JArray.Parse($"[]");//  JArray.Parse($"[{{\"lot_info.Date\":{{\"$gte\": \"{filterObject.startDate}\", \"$lte\": \"{filterObject.endDate}\"}}}}]");

        //        #region 條件篩選
        //        if (filterObject.startDate != null && filterObject.endDate != null)
        //        {
        //            DateTime outTime = DateTime.Now;
        //            if (DateTime.TryParse(filterObject.startDate, out outTime) && DateTime.TryParse(filterObject.endDate, out outTime))
        //            {
        //                JObject inArray = new JObject { { "$gte", filterObject.startDate }, { "$lte", filterObject.endDate } };
        //                query.Add(new JObject
        //                {
        //                    { "lot_info.Date", inArray }
        //                });
        //            }
        //        }
        //        if (filterObject.bd != null && filterObject.bd.Count != 0)
        //        {
        //            filterObject.bd = filterObject.bd.Where(s => !string.IsNullOrEmpty(s)).ToList();
        //            if (filterObject.bd.Count != 0)
        //            {
        //                JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.bd.Select(s => $"\"{s}\""))} ]");
        //                JObject inArray = new JObject { { "$in", jArrayTmp } };
        //                query.Add(new JObject
        //                {
        //                    { "lot_info.Test Program", inArray }
        //                });
        //            }
        //        }
        //        if (filterObject.tester != null)
        //        {
        //            filterObject.tester = filterObject.tester.Where(s => !string.IsNullOrEmpty(s)).ToList();
        //            if (filterObject.tester.Count != 0)
        //            {
        //                JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.tester.Select(s => $"\"{s}\""))} ]");
        //                JObject inArray = new JObject { { "$in", jArrayTmp } };
        //                query.Add(new JObject
        //                {
        //                    { "lot_info.Tester", inArray }
        //                });
        //            }

        //        }
        //        if (filterObject.lotId != null)
        //        {
        //            filterObject.lotId = filterObject.lotId.Where(s => !string.IsNullOrEmpty(s)).ToList();
        //            if (filterObject.lotId.Count != 0)
        //            {
        //                JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.lotId.Select(s => $"\"{s}\""))} ]");
        //                JObject inArray = new JObject { { "$in", jArrayTmp } };
        //                query.Add(new JObject
        //                {
        //                    { "lot_info.Lot ID", inArray }
        //                });
        //            }
        //        }
        //        if (filterObject.waferId != null && filterObject.waferId.Count != 0)
        //        {
        //            filterObject.waferId = filterObject.waferId.Where(s => !string.IsNullOrEmpty(s)).ToList();
        //            if (filterObject.waferId.Count != 0)
        //            {
        //                JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.waferId.Select(s => $"\"{s}\""))} ]");
        //                JObject inArray = new JObject { { "$in", jArrayTmp } };
        //                query.Add(new JObject
        //                {
        //                    { "lot_info.Wafer Lot", inArray }
        //                });
        //            }
        //        }
        //        if (filterObject.testMode != null && filterObject.testMode.Count != 0)
        //        {
        //            filterObject.testMode = filterObject.testMode.Where(s => !string.IsNullOrEmpty(s)).ToList();
        //            if (filterObject.testMode.Count != 0)
        //            {
        //                JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.testMode.Select(s => $"\"{s}\""))} ]");
        //                JObject inArray = new JObject { { "$in", jArrayTmp } };
        //                query.Add(new JObject
        //                {
        //                    { "lot_info.Execution mode", inArray }
        //                });
        //            }
        //        }
        //        if (filterObject.site != null && filterObject.site.Count != 0)
        //        {
        //            filterObject.site = filterObject.site.Where(s => !string.IsNullOrEmpty(s)).ToList();

        //            if (filterObject.site.Count != 0)
        //            {
        //                JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.site.Select(s => $"\"{s}\""))} ]");
        //                JObject inArray = new JObject { { "$in", jArrayTmp } };
        //                query.Add(new JObject
        //                {
        //                    { "lot_info.Site ID", inArray }
        //                });
        //            }
        //        }
        //        #endregion

        //        // 宣告 Web API body
        //        MongoGetAll mongoGetAll = new MongoGetAll()
        //        {
        //            collection = "site",
        //            query = query,
        //            projection = JObject.Parse($"{{\"statistic\":1, \"test_result_value.{filterObject.testItem[0]}\":1}}")
        //        };

        //        response = webApiClient.MongoGetAllAsync(mongoGetAll).GetAwaiter().GetResult();

        //        double specMin = 0, specMax = 0;
        //        string unit = "";
        //        List<double> testValues = new List<double>();
        //        List<int> listFileId = new List<int>();

        //        for (int i = 0; i < response.data.Count; i++)
        //        {
        //            if (response.data[i]["statistic"] != null)
        //            {
        //                JArray statisticItem = JArray.Parse(response.data[i]["statistic"].ToString());
        //                listFileId.Add(int.Parse(statisticItem[i]["file_id"].ToString()));

        //                for (int j = 0; j < statisticItem.Count; j++)
        //                {
        //                    if (statisticItem[j]["ITEM NAME"] == null) continue;
        //                    string itemName = statisticItem[j]["ITEM NAME"].ToString();
        //                    if (filterObject.testItem.Contains(itemName))
        //                    {
        //                        string specMinStr = statisticItem[j]["Spec MIN"].ToString();
        //                        double.TryParse(specMinStr, out specMin);
        //                        string specMaxStr = statisticItem[j]["Spec MAX"].ToString();
        //                        double.TryParse(specMaxStr, out specMax);
        //                        unit = statisticItem[j]["unit"].ToString();
        //                    }
        //                }
        //            }
                    

        //        }

        //        // 20240912 test_result_value 改從另一張表 site_result_value 取出
        //        JArray queryValue = JArray.Parse($"[]");
        //        JArray jArrayFileIdTmp = JArray.Parse($"[ {string.Join(",", listFileId)} ]");
        //        JObject inArrayFileId = new JObject { { "$in", jArrayFileIdTmp } };
        //        queryValue.Add(new JObject
        //                {
        //                    { "file_id", inArrayFileId }
        //                });

        //        // 宣告 Web API body
        //        MongoGetAll mongoGetAllValue = new MongoGetAll()
        //        {
        //            collection = "site_test_result_value",
        //            query = queryValue,
        //            projection = JObject.Parse($"{{\"test_result_value.{filterObject.testItem[0]}\":1}}")
        //        };
        //        MongoGetAllResponse responseValue = webApiClient.MongoGetAllAsync(mongoGetAllValue).GetAwaiter().GetResult();

        //        for (int i = 0; i < responseValue.data.Count; i++)
        //        {
        //            if (responseValue.data[i]["test_result_value"] != null)
        //            {
        //                JArray testResultValueItem = JArray.Parse(responseValue.data[i]["test_result_value"].ToString());

        //                for (int j = 0; j < testResultValueItem.Count; j++)
        //                {
        //                    if (testResultValueItem[j][filterObject.testItem[0]] == null) continue;
        //                    string testValueStr = testResultValueItem[j][filterObject.testItem[0]].ToString();
        //                    double testValue = 0;
        //                    double.TryParse(testValueStr, out testValue);
        //                    testValues.Add(testValue);
        //                }
        //            }
        //        }


        //        // test values 排序
        //        testValues.Sort();
        //        double valueMax = testValues.Max();
        //        double valueMin = testValues.Min();
        //        double valueAvg = testValues.Average();
        //        double yield = tool.calculateYield(testValues, specMax, specMin);
        //        double failPpm = tool.calculateFailPpm(testValues, specMax, specMin);
        //        double std = tool.calculateStd(testValues);
        //        double newSpecMax = 0, newSpecMin = 0, newYield = 0, newFailPpm = 0;

        //        // 使用者填入 New Spec 的 STD 倍數
        //        if (!string.IsNullOrEmpty(filterObject.newSpecStd))
        //        {
        //            double newStd;
        //            double.TryParse(filterObject.newSpecStd, out newStd);
        //            newSpecMax = valueAvg + newStd * std;
        //            newSpecMin = valueAvg - newStd * std;
        //            newYield = tool.calculateYield(testValues, newSpecMax, newSpecMin);
        //            newFailPpm = tool.calculateFailPpm(testValues, newSpecMax, newSpecMin);
        //        }

        //        double valueAndSpecMin = Math.Min(Math.Min(valueMin, newSpecMin), specMin);
        //        double valueAndSpecMax = Math.Max(Math.Max(valueMax, newSpecMax), specMax);

        //        double binWidth = 0;
        //        int binCount = 20;

        //        List<int> valueCount = new List<int>();
        //        List<double> valuePercent = new List<double>();
        //        List<double> valueLabel = new List<double>();

        //        //if (!string.IsNullOrEmpty(filterObject.binWidth) && filterObject.binWidth != "0" && !string.IsNullOrEmpty(filterObject.xMin) && filterObject.xMin != "0" && !string.IsNullOrEmpty(filterObject.xMax) && filterObject.xMax != "0")
        //        if (!string.IsNullOrEmpty(filterObject.binWidth) && filterObject.binWidth != "0" )
        //        {
        //            // 用新的 bin_width 
        //            double.TryParse(filterObject.binWidth, out binWidth);

        //            //// 使用者輸入的 Xmin Xmax，重新計算 binCount
        //            //binWidth = (valueMax - valueMin) / binCount;
        //            double newXmin = 0, newXmax = 0;
        //            double.TryParse(filterObject.xMin, out newXmin);
        //            double.TryParse(filterObject.xMax, out newXmax);

        //            valueAndSpecMin = Math.Min(newXmin, valueAndSpecMin);
        //            valueAndSpecMax = Math.Max(newXmax, valueAndSpecMax);

        //        }
        //        else
        //        {
        //            //使用者未填入binWidth，採用 binCount = 20
        //           binWidth = (valueMax - valueMin) / binCount;

        //        }


        //        // 判斷Spec min, New Spec min是否小於 Min value ，若小於需增加 valueCount,valuePercent,valueLabel 的資料
        //        if (valueAndSpecMin < valueMin - binWidth)
        //        {
        //            int addCount = (int)Math.Round((valueMin - valueAndSpecMin) / binWidth);

        //            if (valueAndSpecMin < valueMin - addCount * binWidth)
        //            {
        //                valueCount.Add(0);
        //                valuePercent.Add(0);
        //                valueLabel.Add(valueMin - (addCount + 1) * binWidth);
        //            }
        //            for (int i = addCount; i > 1; i--)
        //            {
        //                valueCount.Add(0);
        //                valuePercent.Add(0);
        //                valueLabel.Add(valueMin - i * binWidth);
        //            }

        //        }

        //        for (double i = valueMin - binWidth * 2; i < valueMax + binWidth; i = i + binWidth)
        //        {
        //            List<double> filteredNumbers = testValues.Where(n => n > i && n <= i + binWidth).ToList();
        //            valueCount.Add(filteredNumbers.Count);
        //            valuePercent.Add(Math.Round((double)filteredNumbers.Count / (double)testValues.Count * 100, 2));
        //            valueLabel.Add(i + binWidth);
        //        }
        //        // 判斷Spec max, New Spec max是否大於 Max value ，若大於需增加 valueCount,valuePercent,valueLabel 的資料
        //        if (valueAndSpecMax > valueMax + binWidth)
        //        {
        //            for (double i = valueMax + binWidth; i < valueAndSpecMax; i = i + binWidth)
        //            {
        //                valueCount.Add(0);
        //                valuePercent.Add(0);
        //                valueLabel.Add(i + binWidth);
        //            }
        //            if (valueAndSpecMax > valueLabel[valueLabel.Count - 2])
        //            {
        //                valueCount.Add(0);
        //                valuePercent.Add(0);
        //                valueLabel.Add(valueLabel[valueLabel.Count - 1] + binWidth);
        //            }

        //        }

        //        //if(valueLabel.Count>40)
        //        //{
        //        //    // 找出數值小於 AVG 的最大索引
        //        //    int maxIndex = valueLabel.FindLastIndex(num => num < valueAvg);
        //        //    valueCount = SkipListInt(valueCount, maxIndex, 20);
        //        //    valuePercent = SkipListDouble(valuePercent, maxIndex, 20);
        //        //    valueLabel = SkipListDouble(valueLabel, maxIndex, 20);
        //        //}


        //        double maxPercent = valuePercent.Max();
        //        binCount = valueLabel.Count;

        //        int newSpecMinIdx = tool.GetIndex(valueLabel, newSpecMin);
        //        int specMinIdx = tool.GetIndex(valueLabel, specMin);
        //        int specMaxIdx = tool.GetIndex(valueLabel, specMax);
        //        int newSpecMaxIdx = tool.GetIndex(valueLabel, newSpecMax);

        //        valueLabel = valueLabel.Select(x => Math.Round(x, 6)).ToList();

        //        HistogramCombineObject histogramCombineObject = new HistogramCombineObject()
        //        {
        //            specMin = specMin.ToString(),
        //            specMax = specMax.ToString(),
        //            unit = unit,
        //            value_min = valueMin.ToString(),
        //            value_max = valueMax.ToString(),
        //            avg = Math.Round(valueAvg, 6).ToString(),
        //            std = Math.Round(std, 6).ToString(),
        //            moveIn = testValues.Count.ToString(),
        //            yield = Math.Round(yield * 100, 2).ToString(),
        //            failPpm = ((int)Math.Round(failPpm)).ToString(),
        //            xMin = valueLabel[0].ToString(),
        //            xMax = valueLabel[valueLabel.Count - 1].ToString(),
        //            binWidth = Math.Round(binWidth, 6).ToString(),
        //            binCount = binCount.ToString(),
        //            newSpecStd = filterObject.newSpecStd,
        //            newSpecMax = Math.Round(newSpecMax, 6).ToString(),
        //            newSpecMin = Math.Round(newSpecMin, 6).ToString(),
        //            newYield = Math.Round(newYield * 100, 2).ToString(),
        //            newFailPpm = ((int)Math.Round(newFailPpm)).ToString(),
        //            histogramLabel = valueLabel,
        //            histogramData = valuePercent,
        //            histogramSpecLabel = new List<double> { newSpecMinIdx, specMinIdx, specMaxIdx, newSpecMaxIdx },
        //            histogramSpecData = new List<double> { maxPercent + 2, maxPercent + 2, maxPercent + 2, maxPercent + 2 }
        //        };

        //        if (!string.IsNullOrEmpty(response.error))
        //        {
        //            //writeToLog.writeToLog("GetHistogramCombineLabelAndValue response error:" + response.error);
        //            returnJson = response.error;
        //        }

        //        returnJson = JsonConvert.SerializeObject(histogramCombineObject);
                
        //        stopwatch.Stop();
        //        long elapsedMilliseconds = stopwatch.ElapsedMilliseconds;
        //        writeToLog.writeToLog("  Histogram combine - update  IP:" + writeToLog.GetIp() + "  runtime:" + elapsedMilliseconds + "  user:" + userAccount + "  filterObject:" + JsonConvert.SerializeObject(filterObject));
        //    }
        //    catch (Exception ex)
        //    {
        //        //Console.WriteLine(ex.ToString());
        //        writeToLog.writeToLog("  user:" + userAccount + " 'GetHistogramCombineLabelAndValue Exception error:" + ex.ToString());
        //    }

        //    return Content(returnJson, "application/json");
        //}
        #endregion 

        #region mongoDB site 與 test_result_value 未拆表
        //public ActionResult GetRecalculationHistogramCombineLabelAndValue1(FilterObjectHistogramCombine filterObject)
        //{
        //    WebApiClient webApiClient = new WebApiClient();
        //    WriteToLog writeToLog = new WriteToLog();
        //    Tool tool = new Tool();
        //    MongoGetAllResponse response;

        //    List<string> listSite = new List<string>();
        //    string returnJson = "";
        //    string userAccount = (Request.Cookies["userAccount"] == null) ? "" : Request.Cookies["userAccount"].Value;

        //    try
        //    {
        //        Stopwatch stopwatch = new Stopwatch();
        //        stopwatch.Start();

        //        JArray query = JArray.Parse($"[]");//  JArray.Parse($"[{{\"lot_info.Date\":{{\"$gte\": \"{filterObject.startDate}\", \"$lte\": \"{filterObject.endDate}\"}}}}]");

        //        #region 條件篩選
        //        if (filterObject.startDate != null && filterObject.endDate != null)
        //        {
        //            DateTime outTime = DateTime.Now;
        //            if (DateTime.TryParse(filterObject.startDate, out outTime) && DateTime.TryParse(filterObject.endDate, out outTime))
        //            {
        //                JObject inArray = new JObject { { "$gte", filterObject.startDate }, { "$lte", filterObject.endDate } };
        //                query.Add(new JObject
        //                {
        //                    { "lot_info.Date", inArray }
        //                });
        //            }
        //        }
        //        if (filterObject.bd != null && filterObject.bd.Count != 0)
        //        {
        //            filterObject.bd = filterObject.bd.Where(s => !string.IsNullOrEmpty(s)).ToList();
        //            if (filterObject.bd.Count != 0)
        //            {
        //                JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.bd.Select(s => $"\"{s}\""))} ]");
        //                JObject inArray = new JObject { { "$in", jArrayTmp } };
        //                query.Add(new JObject
        //                {
        //                    { "lot_info.Test Program", inArray }
        //                });
        //            }
        //        }
        //        if (filterObject.tester != null)
        //        {
        //            filterObject.tester = filterObject.tester.Where(s => !string.IsNullOrEmpty(s)).ToList();
        //            if (filterObject.tester.Count != 0)
        //            {
        //                JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.tester.Select(s => $"\"{s}\""))} ]");
        //                JObject inArray = new JObject { { "$in", jArrayTmp } };
        //                query.Add(new JObject
        //                {
        //                    { "lot_info.Tester", inArray }
        //                });
        //            }

        //        }
        //        if (filterObject.lotId != null)
        //        {
        //            filterObject.lotId = filterObject.lotId.Where(s => !string.IsNullOrEmpty(s)).ToList();
        //            if (filterObject.lotId.Count != 0)
        //            {
        //                JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.lotId.Select(s => $"\"{s}\""))} ]");
        //                JObject inArray = new JObject { { "$in", jArrayTmp } };
        //                query.Add(new JObject
        //                {
        //                    { "lot_info.Lot ID", inArray }
        //                });
        //            }
        //        }
        //        if (filterObject.waferId != null && filterObject.waferId.Count != 0)
        //        {
        //            filterObject.waferId = filterObject.waferId.Where(s => !string.IsNullOrEmpty(s)).ToList();
        //            if (filterObject.waferId.Count != 0)
        //            {
        //                JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.waferId.Select(s => $"\"{s}\""))} ]");
        //                JObject inArray = new JObject { { "$in", jArrayTmp } };
        //                query.Add(new JObject
        //                {
        //                    { "lot_info.Wafer Lot", inArray }
        //                });
        //            }
        //        }
        //        if (filterObject.testMode != null && filterObject.testMode.Count != 0)
        //        {
        //            filterObject.testMode = filterObject.testMode.Where(s => !string.IsNullOrEmpty(s)).ToList();
        //            if (filterObject.testMode.Count != 0)
        //            {
        //                JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.testMode.Select(s => $"\"{s}\""))} ]");
        //                JObject inArray = new JObject { { "$in", jArrayTmp } };
        //                query.Add(new JObject
        //                {
        //                    { "lot_info.Execution mode", inArray }
        //                });
        //            }
        //        }
        //        if (filterObject.site != null && filterObject.site.Count != 0)
        //        {
        //            filterObject.site = filterObject.site.Where(s => !string.IsNullOrEmpty(s)).ToList();

        //            if (filterObject.site.Count != 0)
        //            {
        //                JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.site.Select(s => $"\"{s}\""))} ]");
        //                JObject inArray = new JObject { { "$in", jArrayTmp } };
        //                query.Add(new JObject
        //                {
        //                    { "lot_info.Site ID", inArray }
        //                });
        //            }
        //        }
        //        #endregion

        //        // 宣告 Web API body
        //        MongoGetAll mongoGetAll = new MongoGetAll()
        //        {
        //            collection = "site",
        //            query = query,
        //            projection = JObject.Parse($"{{\"statistic\":1, \"test_result_value.{filterObject.testItem[0]}\":1}}")
        //        };

        //        response = webApiClient.MongoGetAllAsync(mongoGetAll).GetAwaiter().GetResult();

        //        double specMin = 0, specMax = 0;
        //        string unit = "";
        //        List<double> testValues = new List<double>();

        //        for (int i = 0; i < response.data.Count; i++)
        //        {
        //            if (response.data[i]["statistic"] != null)
        //            {
        //                JArray statisticItem = JArray.Parse(response.data[i]["statistic"].ToString());

        //                for (int j = 0; j < statisticItem.Count; j++)
        //                {
        //                    if (statisticItem[j]["ITEM NAME"] == null) continue;
        //                    string itemName = statisticItem[j]["ITEM NAME"].ToString();
        //                    if (filterObject.testItem.Contains(itemName))
        //                    {
        //                        string specMinStr = statisticItem[j]["Spec MIN"].ToString();
        //                        double.TryParse(specMinStr, out specMin);
        //                        string specMaxStr = statisticItem[j]["Spec MAX"].ToString();
        //                        double.TryParse(specMaxStr, out specMax);
        //                        unit = statisticItem[j]["unit"].ToString();
        //                    }
        //                }
        //            }

        //            if (response.data[i]["test_result_value"] != null)
        //            {
        //                JArray testResultValueItem = JArray.Parse(response.data[i]["test_result_value"].ToString());

        //                for (int j = 0; j < testResultValueItem.Count; j++)
        //                {
        //                    if (testResultValueItem[j][filterObject.testItem[0]] == null) continue;
        //                    string testValueStr = testResultValueItem[j][filterObject.testItem[0]].ToString();
        //                    double testValue = 0;
        //                    double.TryParse(testValueStr, out testValue);
        //                    testValues.Add(testValue);
        //                }
        //            }

        //        }

        //        // test values 排序
        //        testValues.Sort();
        //        double valueMax = testValues.Max();
        //        double valueMin = testValues.Min();
        //        double valueAvg = testValues.Average();
        //        double yield = tool.calculateYield(testValues, specMax, specMin);
        //        double failPpm = tool.calculateFailPpm(testValues, specMax, specMin);
        //        double std = tool.calculateStd(testValues);
        //        double newSpecMax = 0, newSpecMin = 0, newYield = 0, newFailPpm = 0;

        //        if (!string.IsNullOrEmpty(filterObject.newSpecStd))
        //        {
        //            double newStd;
        //            double.TryParse(filterObject.newSpecStd, out newStd);
        //            newSpecMax = valueAvg + newStd * std;
        //            newSpecMin = valueAvg - newStd * std;
        //            newYield = tool.calculateYield(testValues, newSpecMax, newSpecMin);
        //            newFailPpm = tool.calculateFailPpm(testValues, newSpecMax, newSpecMin);
        //        }

        //        double valueAndSpecMin = Math.Min(Math.Min(valueMin, newSpecMin), specMin);
        //        double valueAndSpecMax = Math.Max(Math.Max(valueMax, newSpecMax), specMax);

        //        double binWidth = 0;
        //        int binCount = 20;

        //        List<int> valueCount = new List<int>();
        //        List<double> valuePercent = new List<double>();
        //        List<double> valueLabel = new List<double>();

        //        //if (!string.IsNullOrEmpty(filterObject.binWidth) && filterObject.binWidth != "0" && !string.IsNullOrEmpty(filterObject.xMin) && filterObject.xMin != "0" && !string.IsNullOrEmpty(filterObject.xMax) && filterObject.xMax != "0")
        //        //{
        //        //    // 用新的 bin_width 
        //        //    double.TryParse(filterObject.binWidth, out binWidth);

        //        //    //// 使用者輸入的 Xmin Xmax，重新計算 binCount
        //        //    //binWidth = (valueMax - valueMin) / binCount;
        //        //    double newXmin = 0, newXmax = 0;
        //        //    double.TryParse(filterObject.xMin, out newXmin);
        //        //    double.TryParse(filterObject.xMax, out newXmax);

        //        //    valueAndSpecMin = Math.Min(newXmin, valueAndSpecMin);
        //        //    valueAndSpecMax = Math.Max(newXmax, valueAndSpecMax);

        //        //}
        //        //else
        //        //{
        //            // 使用者未填入binWidth，採用 binCount=20
        //           binWidth = (valueMax - valueMin) / binCount;

        //        //}


        //        // 判斷Spec min, New Spec min是否小於 Min value ，若小於需增加 valueCount,valuePercent,valueLabel 的資料
        //        if (valueAndSpecMin < valueMin - binWidth)
        //        {
        //            int addCount = (int)Math.Round((valueMin - valueAndSpecMin) / binWidth);

        //            if (valueAndSpecMin < valueMin - addCount * binWidth)
        //            {
        //                valueCount.Add(0);
        //                valuePercent.Add(0);
        //                valueLabel.Add(valueMin - (addCount + 1) * binWidth);
        //            }
        //            for (int i = addCount; i > 1; i--)
        //            {
        //                valueCount.Add(0);
        //                valuePercent.Add(0);
        //                valueLabel.Add(valueMin - i * binWidth);
        //            }

        //        }

        //        for (double i = valueMin - binWidth * 2; i < valueMax + binWidth; i = i + binWidth)
        //        {
        //            List<double> filteredNumbers = testValues.Where(n => n > i && n <= i + binWidth).ToList();
        //            valueCount.Add(filteredNumbers.Count);
        //            valuePercent.Add(Math.Round((double)filteredNumbers.Count / (double)testValues.Count * 100, 2));
        //            valueLabel.Add(i + binWidth);
        //        }
        //        // 判斷Spec max, New Spec max是否大於 Max value ，若大於需增加 valueCount,valuePercent,valueLabel 的資料
        //        if (valueAndSpecMax > valueMax + binWidth)
        //        {
        //            for (double i = valueMax + binWidth; i < valueAndSpecMax; i = i + binWidth)
        //            {
        //                valueCount.Add(0);
        //                valuePercent.Add(0);
        //                valueLabel.Add(i + binWidth);
        //            }
        //            if (valueAndSpecMax > valueLabel[valueLabel.Count - 2])
        //            {
        //                valueCount.Add(0);
        //                valuePercent.Add(0);
        //                valueLabel.Add(valueLabel[valueLabel.Count - 1] + binWidth);
        //            }

        //        }


        //        double maxPercent = valuePercent.Max();
        //        binCount = valueLabel.Count;

        //        int newSpecMinIdx = tool.GetIndex(valueLabel, newSpecMin);
        //        int specMinIdx = tool.GetIndex(valueLabel, specMin);
        //        int specMaxIdx = tool.GetIndex(valueLabel, specMax);
        //        int newSpecMaxIdx = tool.GetIndex(valueLabel, newSpecMax);

        //        valueLabel = valueLabel.Select(x => Math.Round(x, 6)).ToList();

        //        HistogramCombineObject histogramCombineObject = new HistogramCombineObject()
        //        {
        //            specMin = specMin.ToString(),
        //            specMax = specMax.ToString(),
        //            unit = unit,
        //            value_min = valueMin.ToString(),
        //            value_max = valueMax.ToString(),
        //            avg = Math.Round(valueAvg, 6).ToString(),
        //            std = Math.Round(std, 6).ToString(),
        //            moveIn = testValues.Count.ToString(),
        //            yield = Math.Round(yield * 100, 2).ToString(),
        //            failPpm = ((int)Math.Round(failPpm)).ToString(),
        //            xMin = valueLabel[0].ToString(),
        //            xMax = valueLabel[valueLabel.Count - 1].ToString(),
        //            binWidth = Math.Round(binWidth, 6).ToString(),
        //            binCount = binCount.ToString(),
        //            newSpecStd = filterObject.newSpecStd,
        //            newSpecMax = Math.Round(newSpecMax, 6).ToString(),
        //            newSpecMin = Math.Round(newSpecMin, 6).ToString(),
        //            newYield = Math.Round(newYield * 100, 2).ToString(),
        //            newFailPpm = ((int)Math.Round(newFailPpm)).ToString(),
        //            histogramLabel = valueLabel,
        //            histogramData = valuePercent,
        //            histogramSpecLabel = new List<double> { newSpecMinIdx, specMinIdx, specMaxIdx, newSpecMaxIdx },
        //            histogramSpecData = new List<double> { maxPercent + 2, maxPercent + 2, maxPercent + 2, maxPercent + 2 }
        //        };

        //        if (!string.IsNullOrEmpty(response.error))
        //        {
        //            //writeToLog.writeToLog("GetHistogramCombineLabelAndValue response error:" + response.error);
        //            returnJson = response.error;
        //        }

        //        returnJson = JsonConvert.SerializeObject(histogramCombineObject);
                
        //        stopwatch.Stop();
        //        long elapsedMilliseconds = stopwatch.ElapsedMilliseconds;
        //        writeToLog.writeToLog("  Histogram combine - update  IP:" + writeToLog.GetIp() + "  runtime:" + elapsedMilliseconds + "  user:" + userAccount + "  filterObject:" + JsonConvert.SerializeObject(filterObject));
        //    }
        //    catch (Exception ex)
        //    {
        //        //Console.WriteLine(ex.ToString());
        //        writeToLog.writeToLog("  user:" + userAccount + " 'GetHistogramCombineLabelAndValue Exception error:" + ex.ToString());
        //    }

        //    return Content(returnJson, "application/json");
        //}
        #endregion

        public ActionResult GetHwBinListTable(FilterObject filterObject)
        {
            WebApiClient webApiClient = new WebApiClient();
            WriteToLog writeToLog = new WriteToLog();
            Tool tool = new Tool();
            MongoGetAllResponse response;
            
            List<HwBinListTableItem> listHwBinListTableItems = new List<HwBinListTableItem>();
            string returnJson = "";
            string userAccount = (Request.Cookies["userAccount"] == null) ? "" : Request.Cookies["userAccount"].Value;

            try
            {
                Stopwatch stopwatch = new Stopwatch();
                stopwatch.Start();

                JArray query = JArray.Parse($"[{{\"lot_info.p_t\":\"t\"}}]");//  JArray.Parse($"[{{\"lot_info.Date\":{{\"$gte\": \"{filterObject.startDate}\", \"$lte\": \"{filterObject.endDate}\"}}}}]");

                #region 條件篩選
                if (filterObject.startDate != null && filterObject.endDate != null)
                {
                    DateTime outTime = DateTime.Now;
                    if (DateTime.TryParse(filterObject.startDate, out outTime) && DateTime.TryParse(filterObject.endDate, out outTime))
                    {
                        JObject inArray = new JObject { { "$gte", filterObject.startDate }, { "$lte", filterObject.endDate } };
                        query.Add(new JObject
                        {
                            { "lot_info.Date", inArray }
                        });
                    }
                }

                if (filterObject.bd != null && filterObject.bd.Count != 0)
                {
                    filterObject.bd = filterObject.bd.Where(s => !string.IsNullOrEmpty(s)).ToList();
                    if (filterObject.bd.Count != 0)
                    {
                        JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.bd.Select(s => $"\"{s}\""))} ]");
                        JObject inArray = new JObject { { "$in", jArrayTmp } };
                        query.Add(new JObject
                        {
                            { "lot_info.Test Program", inArray }
                        });
                    }
                }
                if (filterObject.tester != null)
                {
                    filterObject.tester = filterObject.tester.Where(s => !string.IsNullOrEmpty(s)).ToList();
                    if (filterObject.tester.Count != 0)
                    {
                        JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.tester.Select(s => $"\"{s}\""))} ]");
                        JObject inArray = new JObject { { "$in", jArrayTmp } };
                        query.Add(new JObject
                        {
                            { "lot_info.Tester", inArray }
                        });
                    }

                }
                if (filterObject.lotId != null)
                {
                    filterObject.lotId = filterObject.lotId.Where(s => !string.IsNullOrEmpty(s)).ToList();
                    if (filterObject.lotId.Count != 0)
                    {
                        JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.lotId.Select(s => $"\"{s}\""))} ]");
                        JObject inArray = new JObject { { "$in", jArrayTmp } };
                        query.Add(new JObject
                        {
                            { "lot_info.Lot ID", inArray }
                        });
                    }
                }
                if (filterObject.waferId != null && filterObject.waferId.Count != 0)
                {
                    filterObject.waferId = filterObject.waferId.Where(s => !string.IsNullOrEmpty(s)).ToList();
                    if (filterObject.waferId.Count != 0)
                    {
                        JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.waferId.Select(s => $"\"{s}\""))} ]");
                        JObject inArray = new JObject { { "$in", jArrayTmp } };
                        query.Add(new JObject
                        {
                            { "lot_info.Wafer Lot", inArray }
                        });
                    }
                }
                if (filterObject.testMode != null && filterObject.testMode.Count != 0)
                {
                    filterObject.testMode = filterObject.testMode.Where(s => !string.IsNullOrEmpty(s)).ToList();
                    if (filterObject.testMode.Count != 0)
                    {
                        JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.testMode.Select(s => $"\"{s}\""))} ]");
                        JObject inArray = new JObject { { "$in", jArrayTmp } };
                        query.Add(new JObject
                        {
                            { "lot_info.Execution mode", inArray }
                        });
                    }
                }
                if (filterObject.site != null && filterObject.site.Count != 0)
                {
                    filterObject.site = filterObject.site.Where(s => !string.IsNullOrEmpty(s)).ToList();

                    if (filterObject.site.Count != 0)
                    {
                        JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.site.Select(s => $"\"{s}\""))} ]");
                        JObject inArray = new JObject { { "$in", jArrayTmp } };
                        query.Add(new JObject
                        {
                            { "lot_info.Site ID", inArray }
                        });
                    }
                }
                #endregion

                // 宣告 Web API body
                MongoGetAll mongoGetAll = new MongoGetAll()
                {
                    collection = "concl",
                    query = query,
                    projection = JObject.Parse($"{{\"lot_info\":1, \"hw_bin_code\":1,\"statistic.Total.Total\":1,\"statistic.Total.%\":1}}")
                };

                response = webApiClient.MongoGetAllAsync(mongoGetAll).GetAwaiter().GetResult();

                

                for (int i = 0; i < response.data.Count; i++)
                {
                    HwBinListTableItem hwBinListTableItem = new HwBinListTableItem();
                    if (response.data[i]["lot_info"] != null)
                    {
                        hwBinListTableItem.bd = response.data[i]["lot_info"][0]["Test Program"].ToString();
                        hwBinListTableItem.tester = response.data[i]["lot_info"][0]["Tester"].ToString();
                        hwBinListTableItem.lotId = response.data[i]["lot_info"][0]["Lot ID"].ToString();
                        hwBinListTableItem.date = response.data[i]["lot_info"][0]["Date"].ToString();
                        hwBinListTableItem.testMode = response.data[i]["lot_info"][0]["Execution mode"].ToString();
                        hwBinListTableItem.site = "All site";
                    }

                    int moveIn = 0, passQty = 0, openQty = 0, shortQty = 0, leakQty = 0, functionQty = 0;


                    if (response.data[i]["hw_bin_code"] != null)
                    {
                        JArray hwBinCodeItem = JArray.Parse(response.data[i]["hw_bin_code"].ToString());

                        for (int j = 0; j < hwBinCodeItem.Count; j++)
                        {

                            if (hwBinCodeItem[j]["Bin Name"] == null) continue;
                            string binName = hwBinCodeItem[j]["Bin Name"].ToString();

                            if (binName.Equals("Pass", StringComparison.OrdinalIgnoreCase))
                            {
                                string allQtyStr = hwBinCodeItem[j]["All_Qty"].ToString();
                                int.TryParse(allQtyStr, out passQty);
                                hwBinListTableItem.pass = allQtyStr;
                                moveIn += passQty;
                            }
                            else if(binName.Equals("OPEN", StringComparison.OrdinalIgnoreCase))
                            {
                                string allQtyStr = hwBinCodeItem[j]["All_Qty"].ToString();
                                int.TryParse(allQtyStr, out openQty);
                                hwBinListTableItem.openFail = allQtyStr;
                                moveIn += openQty;
                            }
                            else if (binName.Equals("SHORT", StringComparison.OrdinalIgnoreCase))
                            {
                                string allQtyStr = hwBinCodeItem[j]["All_Qty"].ToString();
                                int.TryParse(allQtyStr, out shortQty);
                                hwBinListTableItem.shortFail = allQtyStr;
                                moveIn += shortQty;
                            }
                            else if (binName.Equals("LEAK", StringComparison.OrdinalIgnoreCase))
                            {
                                string allQtyStr = hwBinCodeItem[j]["All_Qty"].ToString();
                                int.TryParse(allQtyStr, out leakQty);
                                hwBinListTableItem.leakFail = allQtyStr;
                                moveIn += leakQty;
                            }
                            else if (binName.Equals("FUNCTION", StringComparison.OrdinalIgnoreCase))
                            {
                                string allQtyStr = hwBinCodeItem[j]["All_Qty"].ToString();
                                int.TryParse(allQtyStr, out functionQty);
                                hwBinListTableItem.functionFail = allQtyStr;
                                moveIn += functionQty;
                            }

                        }
                    }

                    hwBinListTableItem.yield = Math.Round((double)passQty / (double)moveIn * 100, 2).ToString();
                    hwBinListTableItem.moveIn = moveIn.ToString();
                    hwBinListTableItem.failPpm = Math.Round((double)(moveIn-passQty)/ (double)moveIn *1000000).ToString();
                    hwBinListTableItem.openPpm = Math.Round((double)openQty / (double)moveIn * 1000000).ToString();
                    hwBinListTableItem.shortPpm = Math.Round((double)shortQty / (double)moveIn * 1000000).ToString();
                    hwBinListTableItem.leakPpm = Math.Round((double)leakQty / (double)moveIn * 1000000).ToString();
                    hwBinListTableItem.functionPpm = Math.Round((double)functionQty / (double)moveIn * 1000000).ToString();

                    Dictionary<string, double> itemNameValues = new Dictionary<string, double>();
                    if (response.data[i]["statistic"]!= null)
                    {
                        JObject jObjectStatistic = JObject.Parse(response.data[i]["statistic"].ToString());
                        JArray totalItem = JArray.Parse(jObjectStatistic["Total"].ToString());

                        for (int j = 0; j < totalItem.Count; j++)
                        {
                            if (totalItem[j]["Total"] == null || totalItem[j]["%"] == null) continue;

                            double outNum = 0;
                            double.TryParse(totalItem[j]["%"].ToString(),out outNum);
                            itemNameValues.Add(totalItem[j]["Total"].ToString(), outNum);

                        }
                    }

                    var sortedByValue = itemNameValues.OrderByDescending(kvp => kvp.Value).Take(10);
                    hwBinListTableItem.top1FailPpm = (sortedByValue.ElementAtOrDefault(0).Value == 0) ? "" : $"{sortedByValue.ElementAtOrDefault(0).Key.Trim()} (Fail rate:{Math.Round(sortedByValue.ElementAtOrDefault(0).Value, 2)}%)";
                    hwBinListTableItem.top2FailPpm = (sortedByValue.ElementAtOrDefault(1).Value == 0) ? "" : $"{sortedByValue.ElementAtOrDefault(1).Key.Trim()} (Fail rate:{Math.Round(sortedByValue.ElementAtOrDefault(1).Value, 2)}%)";
                    hwBinListTableItem.top3FailPpm = (sortedByValue.ElementAtOrDefault(2).Value == 0) ? "" : $"{sortedByValue.ElementAtOrDefault(2).Key.Trim()} (Fail rate:{Math.Round(sortedByValue.ElementAtOrDefault(2).Value, 2)}%)";

                    listHwBinListTableItems.Add(hwBinListTableItem);

                }
                
                if (!string.IsNullOrEmpty(response.error))
                {
                    //writeToLog.writeToLog("GetHwBinListTable response error:" + response.error);
                    returnJson = response.error;
                }

                returnJson = JsonConvert.SerializeObject(listHwBinListTableItems);


                stopwatch.Stop();
                long elapsedMilliseconds = stopwatch.ElapsedMilliseconds;
                writeToLog.writeToLog("  GetHwBinListTable,IP:" + writeToLog.GetIp() + ",runtime:" + elapsedMilliseconds + ",\"user:" + userAccount + "\",\"filterObject:" + JsonConvert.SerializeObject(filterObject)+"\"" );

            }
            catch (Exception ex)
            {
                //Console.WriteLine(ex.ToString());
                writeToLog.writeToLog("  user:" + userAccount + " 'GetHwBinListTable Exception error:" + ex.ToString());
            }

            return Content(returnJson, "application/json");
        }

        #region mongoDB concl 舊格式
        //public ActionResult GetHwBinListTable1(FilterObject filterObject)
        //{
        //    WebApiClient webApiClient = new WebApiClient();
        //    WriteToLog writeToLog = new WriteToLog();
        //    Tool tool = new Tool();
        //    MongoGetAllResponse response;

        //    List<HwBinListTableItem> listHwBinListTableItems = new List<HwBinListTableItem>();
        //    string returnJson = "";
        //    string userAccount = (Request.Cookies["userAccount"] == null) ? "" : Request.Cookies["userAccount"].Value;

        //    try
        //    {
        //        Stopwatch stopwatch = new Stopwatch();
        //        stopwatch.Start();

        //        JArray query = JArray.Parse($"[{{\"lot_info.p_t\":\"t\"}}]");//  JArray.Parse($"[{{\"lot_info.Date\":{{\"$gte\": \"{filterObject.startDate}\", \"$lte\": \"{filterObject.endDate}\"}}}}]");

        //        #region 條件篩選
        //        if (filterObject.startDate != null && filterObject.endDate != null)
        //        {
        //            DateTime outTime = DateTime.Now;
        //            if (DateTime.TryParse(filterObject.startDate, out outTime) && DateTime.TryParse(filterObject.endDate, out outTime))
        //            {
        //                JObject inArray = new JObject { { "$gte", filterObject.startDate }, { "$lte", filterObject.endDate } };
        //                query.Add(new JObject
        //                {
        //                    { "lot_info.Date", inArray }
        //                });
        //            }
        //        }

        //        if (filterObject.bd != null && filterObject.bd.Count != 0)
        //        {
        //            filterObject.bd = filterObject.bd.Where(s => !string.IsNullOrEmpty(s)).ToList();
        //            if (filterObject.bd.Count != 0)
        //            {
        //                JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.bd.Select(s => $"\"{s}\""))} ]");
        //                JObject inArray = new JObject { { "$in", jArrayTmp } };
        //                query.Add(new JObject
        //                {
        //                    { "lot_info.Test Program", inArray }
        //                });
        //            }
        //        }
        //        if (filterObject.tester != null)
        //        {
        //            filterObject.tester = filterObject.tester.Where(s => !string.IsNullOrEmpty(s)).ToList();
        //            if (filterObject.tester.Count != 0)
        //            {
        //                JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.tester.Select(s => $"\"{s}\""))} ]");
        //                JObject inArray = new JObject { { "$in", jArrayTmp } };
        //                query.Add(new JObject
        //                {
        //                    { "lot_info.Tester", inArray }
        //                });
        //            }

        //        }
        //        if (filterObject.lotId != null)
        //        {
        //            filterObject.lotId = filterObject.lotId.Where(s => !string.IsNullOrEmpty(s)).ToList();
        //            if (filterObject.lotId.Count != 0)
        //            {
        //                JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.lotId.Select(s => $"\"{s}\""))} ]");
        //                JObject inArray = new JObject { { "$in", jArrayTmp } };
        //                query.Add(new JObject
        //                {
        //                    { "lot_info.Lot ID", inArray }
        //                });
        //            }
        //        }
        //        if (filterObject.waferId != null && filterObject.waferId.Count != 0)
        //        {
        //            filterObject.waferId = filterObject.waferId.Where(s => !string.IsNullOrEmpty(s)).ToList();
        //            if (filterObject.waferId.Count != 0)
        //            {
        //                JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.waferId.Select(s => $"\"{s}\""))} ]");
        //                JObject inArray = new JObject { { "$in", jArrayTmp } };
        //                query.Add(new JObject
        //                {
        //                    { "lot_info.Wafer Lot", inArray }
        //                });
        //            }
        //        }
        //        if (filterObject.testMode != null && filterObject.testMode.Count != 0)
        //        {
        //            filterObject.testMode = filterObject.testMode.Where(s => !string.IsNullOrEmpty(s)).ToList();
        //            if (filterObject.testMode.Count != 0)
        //            {
        //                JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.testMode.Select(s => $"\"{s}\""))} ]");
        //                JObject inArray = new JObject { { "$in", jArrayTmp } };
        //                query.Add(new JObject
        //                {
        //                    { "lot_info.Execution mode", inArray }
        //                });
        //            }
        //        }
        //        if (filterObject.site != null && filterObject.site.Count != 0)
        //        {
        //            filterObject.site = filterObject.site.Where(s => !string.IsNullOrEmpty(s)).ToList();

        //            if (filterObject.site.Count != 0)
        //            {
        //                JArray jArrayTmp = JArray.Parse($"[ {string.Join(",", filterObject.site.Select(s => $"\"{s}\""))} ]");
        //                JObject inArray = new JObject { { "$in", jArrayTmp } };
        //                query.Add(new JObject
        //                {
        //                    { "lot_info.Site ID", inArray }
        //                });
        //            }
        //        }
        //        #endregion

        //        // 宣告 Web API body
        //        MongoGetAll mongoGetAll = new MongoGetAll()
        //        {
        //            collection = "concl",
        //            query = query,
        //            projection = JObject.Parse($"{{\"lot_info\":1, \"hw_bin_code\":1,\"statistics.Total_Total\":1,\"statistics.Total_%\":1}}")
        //        };

        //        response = webApiClient.MongoGetAllAsync(mongoGetAll).GetAwaiter().GetResult();



        //        for (int i = 0; i < response.data.Count; i++)
        //        {
        //            HwBinListTableItem hwBinListTableItem = new HwBinListTableItem();
        //            if (response.data[i]["lot_info"] != null)
        //            {
        //                hwBinListTableItem.bd = response.data[i]["lot_info"][0]["Test Program"].ToString();
        //                hwBinListTableItem.tester = response.data[i]["lot_info"][0]["Tester"].ToString();
        //                hwBinListTableItem.lotId = response.data[i]["lot_info"][0]["Lot ID"].ToString();
        //                hwBinListTableItem.date = response.data[i]["lot_info"][0]["Date"].ToString();
        //                hwBinListTableItem.testMode = response.data[i]["lot_info"][0]["Execution mode"].ToString();
        //                hwBinListTableItem.site = "All site";
        //            }

        //            int moveIn = 0, passQty = 0, openQty = 0, shortQty = 0, leakQty = 0, functionQty = 0;


        //            if (response.data[i]["hw_bin_code"] != null)
        //            {
        //                JArray hwBinCodeItem = JArray.Parse(response.data[i]["hw_bin_code"].ToString());

        //                for (int j = 0; j < hwBinCodeItem.Count; j++)
        //                {

        //                    if (hwBinCodeItem[j]["Bin Name"] == null) continue;
        //                    string binName = hwBinCodeItem[j]["Bin Name"].ToString();

        //                    if (binName.Equals("Pass", StringComparison.OrdinalIgnoreCase))
        //                    {
        //                        string allQtyStr = hwBinCodeItem[j]["All_Qty"].ToString();
        //                        int.TryParse(allQtyStr, out passQty);
        //                        hwBinListTableItem.pass = allQtyStr;
        //                        moveIn += passQty;
        //                    }
        //                    else if (binName.Equals("OPEN", StringComparison.OrdinalIgnoreCase))
        //                    {
        //                        string allQtyStr = hwBinCodeItem[j]["All_Qty"].ToString();
        //                        int.TryParse(allQtyStr, out openQty);
        //                        hwBinListTableItem.openFail = allQtyStr;
        //                        moveIn += openQty;
        //                    }
        //                    else if (binName.Equals("SHORT", StringComparison.OrdinalIgnoreCase))
        //                    {
        //                        string allQtyStr = hwBinCodeItem[j]["All_Qty"].ToString();
        //                        int.TryParse(allQtyStr, out shortQty);
        //                        hwBinListTableItem.shortFail = allQtyStr;
        //                        moveIn += shortQty;
        //                    }
        //                    else if (binName.Equals("LEAK", StringComparison.OrdinalIgnoreCase))
        //                    {
        //                        string allQtyStr = hwBinCodeItem[j]["All_Qty"].ToString();
        //                        int.TryParse(allQtyStr, out leakQty);
        //                        hwBinListTableItem.leakFail = allQtyStr;
        //                        moveIn += leakQty;
        //                    }
        //                    else if (binName.Equals("FUNCTION", StringComparison.OrdinalIgnoreCase))
        //                    {
        //                        string allQtyStr = hwBinCodeItem[j]["All_Qty"].ToString();
        //                        int.TryParse(allQtyStr, out functionQty);
        //                        hwBinListTableItem.functionFail = allQtyStr;
        //                        moveIn += functionQty;
        //                    }

        //                }
        //            }

        //            hwBinListTableItem.yield = Math.Round((double)passQty / (double)moveIn * 100, 2).ToString();
        //            hwBinListTableItem.moveIn = moveIn.ToString();
        //            hwBinListTableItem.failPpm = Math.Round((double)(moveIn - passQty) / (double)moveIn * 100000).ToString();
        //            hwBinListTableItem.openPpm = Math.Round((double)openQty / (double)moveIn * 100000).ToString();
        //            hwBinListTableItem.shortPpm = Math.Round((double)shortQty / (double)moveIn * 100000).ToString();
        //            hwBinListTableItem.leakPpm = Math.Round((double)leakQty / (double)moveIn * 100000).ToString();
        //            hwBinListTableItem.functionPpm = Math.Round((double)functionQty / (double)moveIn * 100000).ToString();

        //            Dictionary<string, double> itemNameValues = new Dictionary<string, double>();
        //            if (response.data[i]["statistics"] != null)
        //            {
        //                JArray statisticsItem = JArray.Parse(response.data[i]["statistics"].ToString());

        //                for (int j = 0; j < statisticsItem.Count; j++)
        //                {
        //                    if (statisticsItem[j]["Total_Total"] == null || statisticsItem[j]["Total_%"] == null) continue;

        //                    double outNum = 0;
        //                    double.TryParse(statisticsItem[j]["Total_%"].ToString(), out outNum);
        //                    itemNameValues.Add(statisticsItem[j]["Total_Total"].ToString(), outNum);

        //                }
        //            }

        //            var sortedByValue = itemNameValues.OrderByDescending(kvp => kvp.Value).Take(10);
        //            hwBinListTableItem.top1FailPpm = sortedByValue.ElementAtOrDefault(0).Key.Trim();
        //            hwBinListTableItem.top2FailPpm = sortedByValue.ElementAtOrDefault(1).Key.Trim();
        //            hwBinListTableItem.top3FailPpm = sortedByValue.ElementAtOrDefault(2).Key.Trim();

        //            listHwBinListTableItems.Add(hwBinListTableItem);

        //        }

        //        if (!string.IsNullOrEmpty(response.error))
        //        {
        //            //writeToLog.writeToLog("GetHwBinListTable response error:" + response.error);
        //            returnJson = response.error;
        //        }

        //        returnJson = JsonConvert.SerializeObject(listHwBinListTableItems);


        //        stopwatch.Stop();
        //        long elapsedMilliseconds = stopwatch.ElapsedMilliseconds;
        //        writeToLog.writeToLog("  GetHwBinListTable  IP:" + writeToLog.GetIp() + "  runtime:" + elapsedMilliseconds + "  user:" + userAccount + "  filterObject:" + JsonConvert.SerializeObject(filterObject));

        //    }
        //    catch (Exception ex)
        //    {
        //        //Console.WriteLine(ex.ToString());
        //        writeToLog.writeToLog("  user:" + userAccount + " 'GetHwBinListTable Exception error:" + ex.ToString());
        //    }

        //    return Content(returnJson, "application/json");
        //}
        #endregion


        public List<double> SkipListDouble(List<double> numbers, int targetIndex, int range = 10)
        {
            // 計算起始和結束索引，確保不超出 List 範圍
            int startIndex = Math.Max(0, targetIndex - range);
            int endIndex = Math.Min(numbers.Count - 1, targetIndex + range);

            // 提取範圍內的數值
            List<double> result = numbers.Skip(startIndex).Take(endIndex - startIndex + 1).ToList();
            
            return result;
        }

        public List<int> SkipListInt(List<int> numbers, int targetIndex, int range = 10)
        {
            // 計算起始和結束索引，確保不超出 List 範圍
            int startIndex = Math.Max(0, targetIndex - range);
            int endIndex = Math.Min(numbers.Count - 1, targetIndex + range);

            // 提取範圍內的數值
            List<int> result = numbers.Skip(startIndex).Take(endIndex - startIndex + 1).ToList();

            return result;
        }

    }


}