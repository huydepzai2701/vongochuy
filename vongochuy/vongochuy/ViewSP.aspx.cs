using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class ViewSP : System.Web.UI.Page
    {
        int SP_ID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Label4.Text = "";
                Label1.Text = "";
                Label2.Text = "";
                Label3.Text = "";
                txtSL.Text = "1";

                string ma = Request.QueryString["ID"].ToString();
                SP_ID = Convert.ToInt32(ma);
                if (SP_ID > 0)
                {
                    Label4.Text = ma;
                    string sql = "select IdSP, TenSP, Dvt, Giaban, anh " +
                    "from Sanpham where IdSP=" + SP_ID;
                    SqlDataReader myDr = DataClass.GetRecord(sql);
                    if (myDr.HasRows)
                    {
                        myDr.Read();
                        Label1.Text = myDr.GetValue(1).ToString();
                        Label2.Text = myDr.GetValue(2).ToString();
                        decimal gia = Convert.ToDecimal(myDr.GetValue(3));
                        Label3.Text = string.Format("{0:### ### ###}", gia);
                        Image1.ImageUrl = "~/Images/" + myDr.GetValue(4).ToString();

                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string user = (string)Session["username"];
            if (string.IsNullOrEmpty(user))
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                    "alertMessage", "alert('Can phai dang nhap')", true);

            }
            else
            {
                Response.Redirect("Giohang.aspx");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SP_ID = Convert.ToInt32(Label4.Text);

            int SL = Convert.ToInt32(txtSL.Text);
            string strTenSP = Label1.Text;
            string dongia = Label3.Text.Replace(" ", "");
            decimal Gia = decimal.Parse(dongia);

            if (SL == 0) SL = 1;
            if (Session["GioHang"] != null)
            {
                DataClass.tbGioHang = Session["GioHang"] as DataTable;
            }
            bool Daco = false;
            foreach (DataRow row in DataClass.tbGioHang.Rows)
            {//Kiem tr neu mat hang da co roi thi tang so luong len 1
                if ((int)row["idSP"] == SP_ID)
                {
                    row["SoLuong"] = (int)row["SoLuong"] + SL;
                    Daco = true;
                    break;
                }
            }
            if (!Daco)
                DataClass.tbGioHang.Rows.Add(SP_ID, strTenSP, Gia, SL);
            Session["GioHang"] = DataClass.tbGioHang;

        }

        protected void Button3_Click(object sender, EventArgs e)
        {

        }
    }
}
   