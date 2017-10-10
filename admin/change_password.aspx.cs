using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_change_password : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        compar_old.Text = "123";
    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {      
        var query = from f in db.tbl_users
                    where f.user_id == Convert.ToInt32(Request.QueryString["id"].ToString())
                    select f;
        foreach (var i in query)
        {
            i.user_password = txt_new.Text;           
            db.SubmitChanges();
        }
        Response.Redirect("user.aspx");
    }
}