using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ADONETWindowsFormsDemo
{
    public static class SqlHelper
    {
        public static string constr = ConfigurationManager.ConnectionStrings
["connectionStr"].ConnectionString;// 获取连接字符串

        //执行增删改方法。第1个参数的含义一条SQL语句，第2个参数为SqlParameter[]数组，且前面加了高级参数params，表示数组元素个数为任意。第2个参数含义通俗点讲就是看SQL语句里面有多少个占位符，那么SqlParameter对象就应该有多少个
        public static int ExecuteNonQuery(string sql, params SqlParameter[] pms)
        {
            //使用using关键字定义一个范围，在范围结束时自动调用这个类实例的Dispose处理对象，也即会关闭Connection对象并释放资源
            using (SqlConnection con = new SqlConnection(constr))
            {
                //创建Command对象
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    //判断是否传递了sql参数
                    if (pms != null)
                    {
                        //将参数添加到Parameters集合中，使得cmd对象要执行的sql语句完整
                        cmd.Parameters.AddRange(pms);
                    }
                    con.Open();
                    //调用cmd对象内置的ExecuteNonQuery()
                    return cmd.ExecuteNonQuery();
                }
            }
        }
        //执行返回首行首列值，返回值类型为object。第1个参数sql通常是一条带聚合函数的查询语句。第2个参数的含义同上
        public static object ExecuteScalar(string sql, params SqlParameter[] pms)
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    if (pms != null)
                    {
                        cmd.Parameters.AddRange(pms);
                    }
                    con.Open();
                    //调用cmd对象内置的ExecuteScalar()
                    return cmd.ExecuteScalar();
                }
            }
        }
        //执行查询返回SqlDataReader对象，第1个参数sql的查询往往有多行多列，第2个参数含义同上
        public static SqlDataReader ExecuteReader(string sql, params SqlParameter[] pms)
        {
            //创建链接对象
            SqlConnection con = new SqlConnection(constr);
            //创建执行命令对象
            using (SqlCommand cmd = new SqlCommand(sql, con))
            {
                if (pms != null)
                {
                    cmd.Parameters.AddRange(pms);
                }
                try
                {
                    //打开链接
                    con.Open();
                    //指定操作
                    return cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
                    //关闭了DataReader对象时，则关联的Connection对象也关闭。
                }
                //报异常时关闭数据库销毁对象
                catch (Exception)
                {
                    con.Close();
                    con.Dispose();
                    throw;
                }
            }
        }

        //返回类型为DataTable方法
        public static DataTable ExecuteDataTable(string sql, params SqlParameter[] pms)
        {
            DataSet ds = new DataSet();
            //创建本地数据库对象
            DataTable dt = new DataTable();
            //创建适配器对象
            using (SqlDataAdapter adapter = new SqlDataAdapter(sql, constr))
            {
                if (pms != null)
                {
                    adapter.SelectCommand.Parameters.AddRange(pms);
                }
                //读取数据填充到本地数据库对象中
                adapter.Fill(ds, "t");//也可以不要第2个参数t
                dt = ds.Tables["t"];//这里Tables里的参数就可以改为0，默认取第1个表格
            }
            return dt;
        }
    }
}
