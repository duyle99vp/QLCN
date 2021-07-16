using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace QuanLyCongNhan
{
    public partial class ThongTinNguoiDung : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
                string connstring = WebConfigurationManager.ConnectionStrings["QLCN"].ConnectionString;
                //Khai báo đối tượng Connection
                SqlConnection myConn = new SqlConnection(connstring);
                myConn.Open();
                //Khai báo câu lệnh truy vấn đến CSDL
                string strSQL = "select * from NguoiDung";
                //Khai báo đối  tượng Command
                SqlCommand cmd = new SqlCommand(strSQL, myConn);
                //Khai báo đối tượng DataReader
                SqlDataReader data = cmd.ExecuteReader();
                //Hiển thị dữ liệu ra màn hình
                Response.Write("THÔNG TIN NGƯỜI DÙNG");
                Response.Write("<table  class='table'>");
                Response.Write("<tr class='th'>");
                Response.Write("<th> Username </th>");
                Response.Write("<th> Password </th>");
                Response.Write("<th> Họ và Tên </th>");
                Response.Write("<th> Ngày sinh </th>");
                Response.Write("<th> Email </th>");
                Response.Write("</tr>");

                while (data.Read())
                {
                    
                    Response.Write("<tr>");
                    Response.Write("<td>" + data["Username"].ToString() + "</td>");
                    Response.Write("<td>" + data[1].ToString() + "</td>");
                    Response.Write("<td>" + data[2].ToString() + "</td>");
                    Response.Write("<td>" + data[3].ToString() + "</td>");
                    Response.Write("<td>" + data[4].ToString() + "</td>");
                    Response.Write("</tr>");

                }
                Response.Write("</table>");
                myConn.Close();
            
           
         }

        
    }

}