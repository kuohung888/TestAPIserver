using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.AccessControl;
using System.Text;
using System.Threading.Tasks;

namespace ADONETConsoleDemoSecond
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
            //stuName为小红，stuSex为女，stuAge为23
            string strsql = "insert tabStudent values('小红','女',23)";
            //2.2把要SQL语句赋值给CommandText
            mycmd.CommandText = strsql;
            //2.3设置Connection属性为前面已生成的myconn
            mycmd.Connection = myconn;
            int count=mycmd.ExecuteNonQuery();
            if(count > 0 )
            {
                Console.WriteLine("插入成功！");
            }
            Console.ReadKey();
        }
    }
}
