using System;
using System.Linq;
using System.Text;
using System.Web.UI;
using System.Collections.Generic;
using System.Runtime.Serialization.Formatters.Binary;
using System.IO;

public partial class ArrayExamples : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            int exampleId = Convert.ToInt32(ddlExamples.SelectedValue);
            switch (exampleId)
            {
                case 1: Example1_ArrayBasic(); break;
                case 2: Example2_MultiDimension(); break;
                case 3: Example3_BubbleSort(); break;
                case 4: Example4_LINQ(); break;
                case 5: Example5_FilterTransform(); break;
                case 6: Example6_Statistics(); break;
                case 7: Example7_JaggedArray(); break;
                case 8: Example8_Buffer(); break;
                case 9: Example9_SafeCopy(); break;
                case 10: Example10_Serialization(); break;
            }
        }
    }

    // 範例1：陣列初始化與基本操作
    private void Example1_ArrayBasic()
    {
        int[] numbers = { 5, 3, 9, 1, 7 };
        var output = new StringBuilder()
            .AppendLine("原始陣列: " + string.Join(", ", numbers))
            .AppendLine("陣列長度: " + numbers.Length)
            .AppendLine("反轉後: " + string.Join(", ", numbers.Reverse()))
            .AppendLine("索引3的值: " + numbers[3]);

        ltOutput.Text = output.ToString();
    }

    // 範例2：多維陣列轉換
    private void Example2_MultiDimension()
    {
        int[,] matrix = { { 1, 2 }, { 3, 4 }, { 5, 6 } };
        int[] flattened = matrix.Cast<int>().ToArray();

        ltOutput.Text = $"二維陣列{{ {{ 1, 2 }}, {{ 3, 4 }}, {{ 5, 6 }} }}: {matrix.GetLength(0)}x{matrix.GetLength(1)}<br/>"
                      + $"扁平化結果: {string.Join(", ", flattened)}";
    }

    // 範例3：自訂排序(氣泡排序法)
    private void Example3_BubbleSort()
    {
        int[] arr = { 5, 3, 8, 1, 2 };
        for (int i = 0; i < arr.Length - 1; i++)
        {
            for (int j = 0; j < arr.Length - i - 1; j++)
            {
                if (arr[j] > arr[j + 1])
                {
                    int temp = arr[j];
                    arr[j] = arr[j + 1];
                    arr[j + 1] = temp;
                }
            }
        }
        ltOutput.Text = "{ 5, 3, 8, 1, 2 }，氣泡排序法排序結果: " + string.Join(", ", arr);
    }

    // 範例4：LINQ查詢應用
    private void Example4_LINQ()
    {
        int[] nums = { 10, 20, 30, 40, 50 };
        var query = from n in nums
                    where n > 25
                    select n * 2;

        ltOutput.Text = "{ 10, 20, 30, 40, 50 }，LINQ結果: " + string.Join(", ", query);
    }

    // 範例5：陣列過濾與轉換
    private void Example5_FilterTransform()
    {
        string[] names = { "Alice", "Bob", "Charlie", "David" };
        var result = names.Where(n => n.Length > 4)
                          .Select(n => n.ToUpper())
                          .ToArray();

        ltOutput.Text = " { \"Alice\", \"Bob\", \"Charlie\", \"David\" }過濾轉換結果: " + string.Join(", ", result);
    }

    // 範例6：陣列統計分析
    private void Example6_Statistics()
    {
        double[] data = { 12.5, 18.3, 15.7, 20.0, 16.2 };
        var stats = new
        {
            Avg = data.Average(),
            Max = data.Max(),
            Min = data.Min(),
            Sum = data.Sum()
        };

        ltOutput.Text ="{ 12.5, 18.3, 15.7, 20.0, 16.2 }<br/>";
        ltOutput.Text +=$"平均: {stats.Avg:N2}<br/>最高: {stats.Max}<br/>最低: {stats.Min}<br/>總和: {stats.Sum}";
    }

    // 範例7：不規則陣列操作
    private void Example7_JaggedArray()
    {
        int[][] jagged = new int[3][];
        jagged[0] = new int[] { 1, 2, 3 };
        jagged[1] = new int[] { 4, 5 };
        jagged[2] = new int[] { 6 };

        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < jagged.Length; i++)
        {
            sb.AppendLine($"第{i}層: {string.Join(", ", jagged[i])}<br/>");
        }
        ltOutput.Text = sb.ToString();
    }

    // 範例8：陣列緩衝區操作
    private void Example8_Buffer()
    {
        byte[] buffer = new byte[10];
        new Random().NextBytes(buffer);

        ltOutput.Text = "隨機位元組陣列:<br/>"
                      + BitConverter.ToString(buffer);
    }

    // 範例9：安全陣列複製
    private void Example9_SafeCopy()
    {
        int[] source = { 1, 2, 3, 4, 5 };
        int[] dest = new int[3];
        Array.ConstrainedCopy(source, 1, dest, 0, 3);

        ltOutput.Text = "{ 1, 2, 3, 4, 5 }，複製結果: " + string.Join(", ", dest);
    }

    // 範例10：陣列序列化
    private void Example10_Serialization()
    {
        string[] data = { "A", "B", "C" };
        BinaryFormatter formatter = new BinaryFormatter();
        using (MemoryStream ms = new MemoryStream())
        {
            formatter.Serialize(ms, data);
            byte[] bytes = ms.ToArray();
            ltOutput.Text = $" {{ \"A\", \"B\", \"C\" }}，序列化長度: {bytes.Length} bytes";
        }
    }
}