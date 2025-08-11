using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ACT_DASHBOARD_WEB.Models
{
    public class Tool
    {

        public Tool()
        {

        }

        public double calculateYield(List<double> values, double upperLimit, double lowerLimit)
        {
            var withinRange = values.Where(v => v >= lowerLimit && v <= upperLimit).Count();
            double yield = (double)withinRange / values.Count;

            return yield;
        }

        public double calculateFailPpm(List<double> values, double upperLimit, double lowerLimit)
        {
            var withinRange = values.Where(v => v >= lowerLimit && v <= upperLimit).Count();
            var outsideRange = values.Count - withinRange;
            double failPPM = (double)outsideRange / values.Count * 1_000_000;

            return failPPM;
        }

        public double calculateStd(List<double> values)
        {
            double mean = values.Average();
            double variance = values.Sum(v => (v - mean) * (v - mean)) / (values.Count - 1);
            double stdDev = Math.Sqrt(variance);

            return stdDev;
        }

        public int GetIndex(List<double> array, double value)
        {
            for (int i = 0; i < array.Count - 1; i++)
            {
                if (array[i] < value && value <= array[i + 1])
                {
                    return i + 1;
                }
            }

            // Handle edge cases: if the value is exactly the first or last element
            if (value == array[0]) return 0;
            if (value == array[array.Count - 1]) return array.Count - 1;

            // If value is not found in any range
            return -1;
        }


    }
}