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
    public partial class ĐăngNhập : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie ck = Request.Cookies["dangnhap"];
            //string user1 = ck["name"];
            //lblTB.Text = user1;
            if (ck != null)
            {
                string connstring = WebConfigurationManager.ConnectionStrings["QLCN"].ConnectionString;
                //Khai báo đối tượng Connection
                SqlConnection myConn = new SqlConnection(connstring);
                myConn.Open();
                string user = ck["name"].ToString();
                string pass1 = ck["pass"].ToString();
                //Khai báo câu lệnh truy vấn đến CSDL
                string strSQL = "select * from NguoiDung where Username= '" + user + "' and Password= '" + pass1 + "'";
                //Khai báo đối  tượng Command
                SqlCommand cmd = new SqlCommand(strSQL, myConn);
                //Khai báo đối tượng DataReader
                SqlDataReader data = cmd.ExecuteReader();
                if (data.Read())
                {
                    Panel1.Visible = false;
                    lblTB.Text = "Chúc mừng bạn đã đăng nhập thành công";
                }
                else
                {
                    lblTB.Text = "Sai tên đang nhập hoặc mật khẩu. Mời bạn đăng nhập lại";
                }
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connstring = WebConfigurationManager.ConnectionStrings["QLCN"].ConnectionString;
            //Khai báo đối tượng Connection
            SqlConnection myConn = new SqlConnection(connstring);
            myConn.Open();
            //Khai báo câu lệnh truy vấn đến CSDL
            string strSQL = "select * from NguoiDung where Username= '" + txtUser.Text + "' and Password= '" + txtPass.Text + "'";
            //Khai báo đối  tượng Command
            SqlCommand cmd = new SqlCommand(strSQL, myConn);
            //Khai báo đối tượng DataReader
            SqlDataReader data = cmd.ExecuteReader();
            if (data.Read())
            {
                if (CbxLuu.Checked)
                {
                    HttpCookie ck = Request.Cookies["dangnhap"];
                    if (ck == null)
                    {
                        ck = new HttpCookie("dangnhap");
                    }
                    ck["name"] = txtUser.Text;
                    ck["pass"] = txtPass.Text;
                    Response.Cookies.Add(ck);
                }
                Panel1.Visible = false;
                lblTB.Text = "Chúc mừng bạn đã đăng nhập thành công";
                Response.Write("<script>alert('Chúc mừng bạn đã đăng nhập thành công!')</script>");
                Response.Redirect("frmChiTieu.aspx");
            }
            else
            {
                lblTB.Text = "Sai tên đang nhập hoặc mật khẩu. Mời bạn đăng nhập lại";
            }

        }
    }
    
}