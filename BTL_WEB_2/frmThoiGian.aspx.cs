using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace BTL
{
    public partial class frmThoiGian : System.Web.UI.Page
    {
        private static string strcon = WebConfigurationManager.ConnectionStrings["QLCN"].ConnectionString;
        SqlConnection con = new SqlConnection(strcon);
        SqlCommand cmd;
        SqlDataAdapter dap;
        DataTable ds;
        DataView dvCV;
        string user = "admin"; //test tạm
        const string THOI_GIAN = "ThoiGian";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Cache.Remove(THOI_GIAN);
                BindDataCongViec();
                if (btnLuu.CommandArgument != "New")
                {
                    PanelCV.Visible = false;
                }
                else
                {
                    PanelCV.Visible = true;
                }

            }
        }
        private void BindDataCongViec()
        {
            if (Cache[THOI_GIAN] != null)
            {
                //Ép kiểu dữ liệu chứa trong Cache vào biến
                dvCV = (DataView)Cache[THOI_GIAN];
            }
            else
            {
                //Nếu không tồn tại
                dap = new SqlDataAdapter("Select * from ThoiGian", con);
                ds = new DataTable();
                dap.Fill(ds);
                dvCV = ds.DefaultView;
                //Lưu dữ liệu vào cache
                Cache[THOI_GIAN] = dvCV;
            }
            dvCV.Sort = hidID.Value;
            grvCV.DataSource = dvCV;
            grvCV.DataBind();

        }


        protected void btnLuu_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }
                string sql = "INSERT INTO ThoiGian(Ten,NgayBD,NgayKT,TrangThai,Username) " +
                    "VALUES(N'" + txtTenCV.Text.Trim() + "','" + txtNgayBD.Text.Trim() + "'," +
                    "'" + txtNgayKT.Text.Trim() + "',N'" + drlTrangThai.SelectedValue.ToString() + "',N'" + user + "')";
                cmd = new SqlCommand(sql, con);
                cmd.ExecuteNonQuery();
                Cache.Remove(THOI_GIAN);
                BindDataCongViec();
                PanelCV.Visible = false;
                reset();
                btnLuu.CommandArgument = "";
            }
        }


        protected void grvCV_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = grvCV.Rows[e.RowIndex].Cells[0].Text;
            if (con.State != ConnectionState.Open)
                con.Open();
            string sql = "Delete from ThoiGian Where id ='" + id + "'";
            cmd = new SqlCommand(sql, con);
            cmd.ExecuteNonQuery();
            Cache.Remove(THOI_GIAN);
            BindDataCongViec();
           
        }

        protected void grvCV_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grvCV.EditIndex = e.NewEditIndex;

            BindDataCongViec();
        }

        protected void Button1_Click(object sender, EventArgs e)//btn Thêm mới
        {
            btnLuu.CommandArgument = "New";
            PanelCV.Visible = true;
        }
        protected void grvCV_Sorting(object sender, GridViewSortEventArgs e)
        {
            hidID.Value = e.SortExpression;
            BindDataCongViec();
        }

        protected void grvCV_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grvCV.PageIndex = e.NewPageIndex;
            BindDataCongViec();
        }

        protected void grvCV_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = (GridViewRow)grvCV.Rows[e.RowIndex];
            Response.Write(row.Cells[0].Text);
            TextBox id = (TextBox)row.Cells[0].Controls[0];
            TextBox txtTen1 = (TextBox)row.Cells[1].Controls[0];
            TextBox txtNgayBD1 = (TextBox)row.Cells[2].Controls[0];
            TextBox txtNgayKT1 = (TextBox)row.Cells[3].Controls[0];
            TextBox txtTrangThai1 = (TextBox)row.Cells[4].Controls[0];
            grvCV.EditIndex = -1;

            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            string sql = "UPDATE ThoiGian SET " +
                "Ten = N'" + txtTen1.Text + "'," +
                "NgayBD ='" + txtNgayBD1.Text + "'," +
                "NgayKT ='" + txtNgayKT1.Text + "'," +
                "TrangThai =N'" + txtTrangThai1.Text + "' " +
                "WHERE id = '" + id.Text + "'";
            cmd = new SqlCommand(sql, con);
            cmd.ExecuteNonQuery();
            Cache.Remove(THOI_GIAN);
            BindDataCongViec();
        }

        protected void grvCV_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grvCV.EditIndex = -1;
            BindDataCongViec();
        }

        protected void btnLamLai_Click(object sender, EventArgs e)
        {
            reset();
           
        }
        private void reset()
        {
            txtTenCV.Text = "";
            txtNgayBD.Text = "";
            txtNgayKT.Text = "";
        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            reset();
            Cache.Remove(THOI_GIAN);
            BindDataCongViec();
            btnLuu.CommandArgument = "";
            PanelCV.Visible = false;
        }

        protected void btnTK_Click(object sender, EventArgs e)
        {
            string sql = "SELECT * FROM ThoiGian WHERE Ten LIKE N'%"+txtTenTK.Text.Trim()+"%'";
            dap = new SqlDataAdapter(sql, con);
            DataTable table = new DataTable();
            dap.Fill(table);
            grvCV.DataSource = table;
            grvCV.DataBind();
        }

        protected void btnHienThi_Click(object sender, EventArgs e)
        {
            BindDataCongViec();
        }
    }
}