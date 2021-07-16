using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

using System.Data;

namespace QuanLyCongNhan
{
    public partial class ĐăngKý : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnDangky_Click(object sender, EventArgs e)
        {
            string strconn = WebConfigurationManager.ConnectionStrings["QLCN"].ConnectionString;
            SqlConnection myconn = new SqlConnection(strconn);
            myconn.Open();

            string strSQL = "insert into NguoiDung values('" + txtUser.Text + "',N'" + txtPass.Text + "','" + txtTen.Text + "',N'" + txtNgaySinh.Text + "',N'" + txtEmail.Text + "')";

            SqlCommand cmd = new SqlCommand(strSQL, myconn);
            cmd.ExecuteNonQuery();

            lblTB.Text = "Chúc mừng bạn đã đăng ký thành công";
            Response.Write("<script>alert('Chúc mừng bạn đã đăng ký thành công!')</script>");

            Response.Redirect("ĐăngNhập.aspx");

        }
    }
}