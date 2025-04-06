using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class GioHang : System.Web.UI.Page
    {
      

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridView1.DataSource = DataClass.tbGioHang;
                GridView1.DataBind();
                Tinhtong();

            }
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataClass.tbGioHang.Rows[e.RowIndex].Delete();
            Tinhtong();
            GridView1.DataSource = DataClass.tbGioHang;
            GridView1.DataBind();

        }
        private void Tinhtong()
        {
            decimal tien = 0;
            foreach (DataRow row in DataClass.tbGioHang.Rows)
            {
                tien += (decimal)row["TongTien"];
            }
            TongTien.Text = "Tong cong: " + tien.ToString("### ### ###");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Webform1.aspx");
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {

        }
    }
}