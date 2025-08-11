using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ACT_DASHBOARD_WEB.Models
{
    public class WebApiOpject
    {
        public class FilterObject
        {
            public string pageName { get; set; }
            public string startDate { get; set; }
            public string endDate { get; set; }
            public List<string> bd { get; set; }
            public List<string> tester { get; set; }
            public List<string> lotId { get; set; }
            public List<string> waferId { get; set; }
            public List<string> testMode { get; set; }
            public List<string> testItem { get; set; }
            public List<string> site { get; set; }
        }

        public class FilterObjectHistogramCombine
        {
            public string startDate { get; set; }
            public string endDate { get; set; }
            public List<string> bd { get; set; }
            public List<string> tester { get; set; }
            public List<string> lotId { get; set; }
            public List<string> waferId { get; set; }
            public List<string> testMode { get; set; }
            public List<string> testItem { get; set; }
            public List<string> site { get; set; }
            public string xMin { get; set; }
            public string xMax { get; set; }
            public string binWidth { get; set; }
            public string newSpecStd { get; set; }
        }


        public class HistogramCombineObject
        {
            public string specMin { get; set; }
            public string specMax { get; set; }
            public string unit { get; set; }
            public string value_min { get; set; }
            public string value_max { get; set; }
            public string avg { get; set; }
            public string std { get; set; }
            public string moveIn { get; set; }
            public string yield { get; set; }
            public string failPpm { get; set; }
            public string xMin { get; set; }
            public string xMax { get; set; }
            public string binWidth { get; set; }
            public string binCount { get; set; }
            public string newSpecStd { get; set; }
            public string newSpecMax { get; set; }
            public string newSpecMin { get; set; }
            public string newYield { get; set; }
            public string newFailPpm { get; set; }
            public List<double> histogramLabel { get; set; }
            public List<double> histogramData { get; set; }
            public List<int> histogramDataDeviceCount { get; set; }

            public List<double> histogramSpecLabel { get; set; }
            public List<double> histogramSpecData { get; set; }

        }

        public class HwBinListTableItem
        {
            public string bd { get; set; }
            public string tester { get; set; }
            public string lotId { get; set; }
            public string date { get; set; }
            public string testMode { get; set; }
            public string site { get; set; }
            public string yield { get; set; }
            public string moveIn { get; set; }
            public string pass { get; set; }
            public string openFail { get; set; }
            public string shortFail { get; set; }
            public string leakFail { get; set; }
            public string functionFail { get; set; }
            public string failPpm { get; set; }
            public string openPpm { get; set; }
            public string shortPpm { get; set; }
            public string leakPpm { get; set; }
            public string functionPpm { get; set; }
            public string top1FailPpm { get; set; }
            public string top2FailPpm { get; set; }
            public string top3FailPpm { get; set; }
            

        }
    }
}