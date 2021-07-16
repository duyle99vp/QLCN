using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;
using System.Configuration;

namespace BTL_WEB_2.QLChiTieu
{
    public partial class frmThemSua : System.Web.UI.Page
    {
        private  SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["QLCN"].ConnectionString);
       

        private DataTable getDatatoTable(string sql)
        {
            SqlDataAdapter dap = new SqlDataAdapter(sql, con);
            DataTable table = new DataTable();
            dap.Fill(table);
            return table;
        }
        private void LoadData(string sql) {

            
            grvChiTieu.DataSource = getDatatoTable(sql);
            grvChiTieu.DataBind();
            
        }
       

        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            if (!IsPostBack)
            {
                LoadData("Select * from ChiTieu");
                SqlDataAdapter dap = new SqlDataAdapter("SELECT DISTINCT  Month(Ngay) AS Thang FROM ChiTieu", con);
                DataTable table = new DataTable();
                dap.Fill(table);
                drlSapXep.DataSource = table;
                drlSapXep.DataValueField = "Thang";
                drlSapXep.DataTextField = "Thang";
                drlSapXep.DataBind();
                drlSapXep.SelectedIndex = -1;
                
            }

        }

        protected void grvChiTieu_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void grvChiTieu_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = grvChiTieu.Rows[e.RowIndex].Cells[0].Text;
            if (con.State != ConnectionState.Open)
                con.Open();
            string sql = "Delete from ChiTieu Where id ='" + id + "'";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.ExecuteNonQuery();
            LoadData("Select * from ChiTieu");
            cmd.Dispose();
           
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            panelThem.Visible = true;

        }

        protected void btnLuu_Click(object sender, EventArgs e)
        {
            
            string tt;
            
            if (rbnChi.Checked) tt = "Khoản chi";
            else tt = "Khoản thu";
            string sql = "Insert into ChiTieu(Ten,Ngay,Tien,TrangThai,Username) values(N'"+txtTen.Text+ "','" + txtNgay.Text + "','" + txtTien.Text +"',N'" + tt+"','admin')";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.ExecuteNonQuery();
            LoadData("Select * from ChiTieu");
        }

        protected void grvChiTieu_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grvChiTieu.EditIndex = e.NewEditIndex;
            //Nạp lại dữ liệu của trang hiện tại trên lưới
            LoadData("Select * from ChiTieu");
        }

        protected void grvChiTieu_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = (GridViewRow)grvChiTieu.Rows[e.RowIndex];
            Response.Write(row.Cells[0].Text);
            string id = grvChiTieu.Rows[e.RowIndex].Cells[0].Text;
            TextBox txtTen1 = (TextBox)row.Cells[1].Controls[0];
            TextBox txtNgay = (TextBox)row.Cells[2].Controls[0];
            TextBox txtTien = (TextBox)row.Cells[3].Controls[0];
            TextBox txtTrangThai1 = (TextBox)row.Cells[4].Controls[0];
            grvChiTieu.EditIndex = -1;

            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            string sql = "UPDATE ChiTieu SET " +
                "Ten = N'" + txtTen1.Text + "'," +
                "Ngay ='" + txtNgay.Text + "'," +
                "Tien ='" + txtTien.Text + "'," +
                "TrangThai =N'" + txtTrangThai1.Text + "' " +
                "WHERE id = '" + id + "'";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.ExecuteNonQuery();
            LoadData("Select * from ChiTieu");
        }

        protected void drlSapXep_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            
            string sql = "SELECT * FROM ChiTieu where Month(Ngay)='" + drlSapXep.SelectedItem.Value + "'";
            LoadData(sql);
            /*dap = new SqlDataAdapter("SELECT * FROM ChiTieu where Month(Ngay)='"+drlSapXep.SelectedItem.Value+"'", con);
            table = new DataTable();
            dap.Fill(table);
            grvChiTieu.DataSource = table;
            grvChiTieu.DataBind();*/
        }

        protected void btnHuyBo_Click(object sender, EventArgs e)
        {
            txtTen.Text = "";
            txtNgay.Text = "";
            txtTien.Text = "";
        }

        protected void grvChiTieu_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grvChiTieu.EditIndex = -1;

        }

        protected void btnTimKiem_Click(object sender, EventArgs e)
        {
            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            string sql = "SELECT * FROM ChiTieu WHERE Ten LIKE N'%" + txtTimKiem.Text.Trim() + "%'";
            LoadData(sql);
        }
    }
}