using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;



namespace WebApplication1
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["GioHang"] != null)
                {
                    DataClass.tbGioHang = Session["GioHang"] as DataTable;
                }
                else
                {
                    DataClass.tbGioHang.Rows.Clear();
                    DataClass.tbGioHang.Columns.Clear();
                    DataClass.tbGioHang.Columns.Add("idSP", typeof(int));
                    DataClass.tbGioHang.Columns.Add("TenSP", typeof(string));
                    DataClass.tbGioHang.Columns.Add("Gia", typeof(decimal));
                    DataClass.tbGioHang.Columns.Add("SoLuong", typeof(int));
                    DataClass.tbGioHang.Columns.Add("TongTien", typeof(decimal), "SoLuong * Gia");
                }
            }
        }   

        protected void BtnDangNhap_Click(object sender, EventArgs e)
        {   
            string sql = "Select MatKhau from NguoiDung where TaiKhoan='" + TextBox1.Text + "'";
            SqlDataReader myDr = DataClass.GetRecord(sql);
            if (myDr.HasRows)
            {   
                myDr.Read();
                string pass = myDr.GetValue(0).ToString();
                if (pass == TextBox2.Text)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                        "alertMessage", "alert('Dang nhap thanh cong')", true);

                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                        "alertMessage", "alert('Sai tai khoan hoac mat khau')", true);
                }
            }
        }

        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            ListBox list = sender as ListBox;
            if (list != null)
            {
                string nhom = list.SelectedValue;
                Response.Redirect("WebForm1.aspx?id=" +nhom);
            }
        }
    }
}