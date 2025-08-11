using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//== 自己寫的（宣告）==========
using System.IO;
using System.Data;    //-- DataTable會用到
//=======================

//===============================
using NPOI.XSSF.UserModel;   //-- XSSF 用來產生Excel 2007檔案（.xlsx）
using NPOI.SS.UserModel;    //-- v.1.2.4新增的。
//-- CellType需要搭配「NPOI.SS.UserModel命名空間」
//===============================


public partial class Book_Sample_Ch11_NPOI_04_FileUpload_3_Formula : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //== 本範例的資料來源：http://msdn.microsoft.com/zh-tw/ee818993.aspx 
        //== 先把上傳的 Excel資料檔案，讀取到 DataTable裡面。

        //-- 註解：先設定好檔案上傳的實體路徑，這是Web Server電腦上的目錄。
        String savePath = "D:\\temp\\uploads\\";

        if (FileUpload1.HasFile)
        {
            String fileName = FileUpload1.FileName;

            savePath = savePath + fileName;
            FileUpload1.SaveAs(savePath);

            Label1.Text = "上傳成功，檔名---- " + fileName;
            //--------------------------------------------------
            //---- （以上是）上傳 FileUpload的部分，成功運作！
            //--------------------------------------------------

            DataTable D_table = new DataTable();



            XSSFWorkbook workbook = new XSSFWorkbook(FileUpload1.FileContent);  //==只能讀取 System.IO.Stream

            //-- FileContent 屬性會取得指向要上載之檔案的 Stream 物件。這個屬性可以用於存取檔案的內容 (做為位元組)。
            //   例如，您可以使用 FileContent 屬性傳回的 Stream 物件，將檔案的內容做為位元組進行讀取並將其以位元組陣列儲存。
            //-- FileContent 屬性，型別：System.IO.Stream
            //-- http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.fileupload.filecontent.aspx

            XSSFSheet u_sheet = (XSSFSheet)workbook.GetSheetAt(0);  //-- 0表示：第一個 worksheet工作表
            XSSFRow headerRow = (XSSFRow)u_sheet.GetRow(0);  //-- Excel 表頭列

            for (int k = headerRow.FirstCellNum; k < headerRow.LastCellNum; k++)  //-- 表頭列，共有幾個 "欄位"?（取得最後一欄的數字）
            {   //-- 把上傳的 Excel「表頭列」，每一欄位都寫入 DataTable裡面
                if (headerRow.GetCell(k) != null)
                {
                    DataColumn D_column = new DataColumn(headerRow.GetCell(k).StringCellValue);
                    D_table.Columns.Add(D_column);
                }
            }


            //-- for迴圈的「啟始值」要加一，表示不包含 Excel表頭列
            for (int i = (u_sheet.FirstRowNum + 1); i <= u_sheet.LastRowNum; i++)   //-- 每一列做迴圈
            {
                //--不包含 Excel表頭列的 "其他資料列"
                IRow row = (IRow)u_sheet.GetRow(i);             //-- v.1.2.4版修改
                DataRow D_dataRow = D_table.NewRow();

                for (int j = row.FirstCellNum; j < row.LastCellNum; j++)   //-- 每一個欄位做迴圈
                {   //***************************************************************************(start)
                    //-- 如果格子裡面有「計算公式」的話，只取出運算後的「值」。
                    //-- http://www.javadocexamples.com/org/apache/poi/hssf/usermodel/org.apache.poi.hssf.usermodel.HSSFCell.html

                    //-- CellType需要搭配「NPOI.SS.UserModel命名空間」
                    //-- 檢查這一格，是否包含公式（Formula）？
                    if ((row.GetCell(j) != null) && (row.GetCell(j).CellType == CellType.Formula))  //== v.1.2.4版修改。2.x版只是修正英文大小寫。
                    {
                        D_dataRow[j] = row.GetCell(j).NumericCellValue.ToString();
                        //-- 表示格子裡面，公式運算後的「值」，是數字（Numeric）。
                    }
                    else   {
                        D_dataRow[j] = row.GetCell(j).ToString();  //--每一個欄位，都加入同一列 DataRow
                    }  //***************************************************************************(end)
                }
                D_table.Rows.Add(D_dataRow);
            }


            //-- 釋放 NPOI的資源
            workbook = null;
            u_sheet = null;

            DataView D_View = new DataView(D_table);

            GridView1.DataSource = D_View;
            GridView1.DataBind();

            //--------------------------------------------------
            //---- （以下是）上傳 FileUpload的部分！
            //--------------------------------------------------
        }
        else
        {
            Label1.Text = "????  ...... 請先挑選檔案之後，再來上傳";
        }   // FileUpload使用的第一個 if判別式
    }    

}