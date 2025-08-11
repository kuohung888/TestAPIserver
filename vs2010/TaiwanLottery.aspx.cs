using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;

namespace TaiwanLottery
{
    public partial class _539 : Page
    {
        private const int NumberCountPerSet = 5;
        private const int TotalSets = 5;
        private const int MaxNumber = 39;
        private readonly string[] BallColors = new string[]
        {
            "#e74c3c", // 紅
            "#3498db", // 藍
            "#f1c40f", // 黃
            "#2ecc71", // 綠
            "#9b59b6"  // 紫
        };
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGenerate_Click(object sender, EventArgs e)
        {
            // 產生五組不重複的五個號碼
            var sets = new List<List<int>>();
            var allSelected = new HashSet<string>();

            var rnd = new Random();

            while (sets.Count < TotalSets)
            {
                var nums = new HashSet<int>();
                while (nums.Count < NumberCountPerSet)
                {
                    nums.Add(rnd.Next(1, MaxNumber + 1));
                }
                var sorted = nums.OrderBy(n => n).ToList();
                string key = string.Join(",", sorted);
                if (!allSelected.Contains(key))
                {
                    allSelected.Add(key);
                    sets.Add(sorted);
                }
            }

            // 將結果存入 HiddenField，方便兌獎時比對
            hfRandomNumbers.Value = SerializeSets(sets);

            // 顯示五組號碼
            ltRandomNumbers.Text = RenderSetsHtml(sets);

            // 清空之前的開獎與結果
            ltDrawNumber.Text = "";
            ltResult.Text = "";
            result.Visible = false;
        }

        protected void btnDraw_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(hfRandomNumbers.Value))
            {
                ltResult.Text = "請先按「隨機選號」產生號碼。";
                result.Visible = true;
                return;
            }

            var sets = DeserializeSets(hfRandomNumbers.Value);

            // 產生一組開獎號碼
            var rnd = new Random();
            var drawSet = new HashSet<int>();
            while (drawSet.Count < NumberCountPerSet)
            {
                drawSet.Add(rnd.Next(1, MaxNumber + 1));
            }
            var drawList = drawSet.OrderBy(n => n).ToList();

            // 顯示開獎號碼
            ltDrawNumber.Text = "<strong>開獎號碼：</strong>" + RenderSingleSetHtml(drawList);

            // 比對每組號碼中獎情況
            string finalResult = "";
            bool anyWin = false;

            for (int i = 0; i < sets.Count; i++)
            {
                var set = sets[i];
                int hitCount = set.Intersect(drawSet).Count();

                if (hitCount >= 2)
                {
                    anyWin = true;
                    string prize = "";
                    string star = "";
                    switch (hitCount)
                    {
                        case 2:
                            star = "中二星";
                            prize = "獎金 300 元";
                            break;
                        case 3:
                            star = "中三星";
                            prize = "獎金 5,000 元";
                            break;
                        case 4:
                            star = "中四星";
                            prize = "獎金 200,000 元";
                            break;
                        case 5:
                            star = "中頭獎";
                            prize = "獎金 8,000,000 元";
                            break;
                    }

                    finalResult += $"第 {i + 1} 組：{star}，{prize}<br />";
                }
            }

            if (!anyWin)
            {
                finalResult = "很遺憾，沒有中獎。";
            }

            ltResult.Text = finalResult;
            result.Visible = true;
        }

        private string SerializeSets(List<List<int>> sets)
        {
            // 用分號分組，逗號分號內號碼，例如 "1,5,10,20,30;2,6,11,21,31;..."
            return string.Join(";", sets.Select(s => string.Join(",", s)));
        }

        private List<List<int>> DeserializeSets(string serialized)
        {
            var sets = new List<List<int>>();
            var groups = serialized.Split(';');
            foreach (var group in groups)
            {
                var nums = group.Split(',').Select(n => int.Parse(n)).ToList();
                sets.Add(nums);
            }
            return sets;
        }

        private string RenderSetsHtml(List<List<int>> sets)
        {
            string html = "<strong>隨機選號五組：</strong><br />";
            for (int i = 0; i < sets.Count; i++)
            {
                html += $"第 {i + 1} 組：{RenderSingleSetHtml(sets[i])}<br />";
            }
            return html;
        }

        private string RenderSingleSetHtml(List<int> set)
        {
            string html = "";
            for (int i = 0; i < set.Count; i++)
            {
                string color = BallColors[i % BallColors.Length];
                html += $"<span class='number' style='background-color:{color}; color:#fff;'>{set[i]}</span>";
            }
            return html;
        }

    }
}
