using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ADONETConsoleDemoFirst
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //1.实例化出一个连接对象myconn
            SqlConnection myconn = new SqlConnection();
            //1.1通过属性设置如何连接数据库
            myconn.ConnectionString = "Server=.;DataBase=ASPNETDemoDataBase;Uid=sa;Pwd= 123456";
            //1.2打开与数据库的连接
            myconn.Open();
           
            //2.实例化出一个命令对象mycmd，用于操纵数据库
            SqlCommand mycmd = new SqlCommand();
            //2.1指明要对数据库进行的操作，即SQL语句
            string strsql = "select * from tabStudent";
            //2.2把要SQL语句赋值给CommandText
            mycmd.CommandText = strsql;
            //2.3设置Connection属性为前面已生成的myconn
            mycmd.Connection = myconn;
            //SqlCommand mycmd = new SqlCommand(strsql, myconn);//上面几条语句可合并为一条，实质是调用SqlCommand类的另外一个构造方法
            //2.4调用ExecuteReader方法执行SQL语句，返回一个DataReader对象
            SqlDataReader dr = mycmd.ExecuteReader();
            //至此，dr对象指向查询结果的最上面
            while (dr.Read())
            {
                int intid = dr.GetInt32(0);
                string strname=dr.GetString(1);
                string strsex=dr.GetString(2).ToString(); 
                int intage=dr.GetInt32(3);
                Console.WriteLine("id:" + intid + ",name:" + strname + ",sex:" + strsex + ",age：" + intage);
            }
            dr.Close();
            myconn.Close();
            Console.ReadKey();
        }
    }
}
