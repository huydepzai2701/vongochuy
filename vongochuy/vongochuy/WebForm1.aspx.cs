using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
	public partial class WebForm1 : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (Request.QueryString.Count > 0)
			{
				string manhom = Request.QueryString["id"].ToString();
				SqlDataSource1.SelectCommand= "select IdSP, TenSP, Dvt, GiaBan, anh " +
					"from SanPham where NhomID=" + manhom;
				SqlDataSource1.DataBind();
			}
		}
	}
}