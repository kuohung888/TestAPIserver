<%@ WebHandler Language="C#" Class="test_01" %>

using System;
using System.Web;

public class test_01 : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        //context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");
        
        //********************************************************************       
        //資料來源：http://www.cnblogs.com/travelcai/archive/2007/09/25/904767.html
        //获取虚拟目录的物理路径。 
        string path = context.Server.MapPath("");
        //获取图片文件的二进制数据。
        byte[] datas = System.IO.File.ReadAllBytes(path + "\\Book2.jpg");
        
        //将二进制数据写入到输出流中。
        context.Response.OutputStream.Write(datas, 0, datas.Length);        
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

    //********************************************************************
    //另外一個範例，輸出圖片。
    //資料來源：http://davidma168.wordpress.com/2011/01/25/ashx-%E8%BC%B8%E5%87%BA%E5%9C%96%E7%89%87/
    // context.Response.ContentType="image/JPEG";

    // string fullpath = content.Server.MapPath(“xxxx.JPG");
    // using(System.Drawing.Bipmap bipmap = new System.Drawing.Bipmap(fullpath))
    // {
    //    bipmap.Save(context.Responae.OutputStream, System.Drawing.Imaging.ImaeFormat.Jpeg);
    // }   
    
    //********************************************************************
    // 另外一個作法（資料來源 http://davidma168.wordpress.com/2011/01/25/ashx-output-image-2/）
    // context.Response.ContentType="image/JPEG";
    // string fullPath=context.Server.MapPath(“xxxx.JPG");
    // context.Response.WriteFile(fullPath);    
    

}