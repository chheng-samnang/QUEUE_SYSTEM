using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_user_edit : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {            
            ddlStatus.Items.Insert(0, new ListItem("Choose one", "-1"));
            ddlStatus.Items.Insert(1, new ListItem("Enable", "1"));
            ddlStatus.Items.Insert(2, new ListItem("Disable", "0"));            
            if (Request.QueryString["id"] != null)
            {
                var query = from f in db.tbl_users
                            where f.user_id == Convert.ToInt32(Request.QueryString["id"].ToString())
                            select f;
                foreach (var i in query)
                {
                    txt_username.Text = i.user_name;
                    txt_user_code.Text = i.user_code;
                    ddlStatus.SelectedValue = i.user_status.ToString();                    
                    desc.Text = i.user_desc;
                }
            }
        }
    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        DateTime date = DateTime.Now;
        var query = from f in db.tbl_users
                    where f.user_id == Convert.ToInt32(Request.QueryString["id"].ToString())
                    select f;
        foreach (var i in query)
        {
            i.user_name = txt_username.Text;
            i.user_code = txt_user_code.Text;
            i.user_status = Convert.ToByte(ddlStatus.SelectedValue);
            i.user_desc = desc.Text;
            i.user_updt = Convert.ToString(Session["userLogin"]);
            i.date_updt = date.Date;
            db.SubmitChanges();
        }
        Response.Redirect("user.aspx");
    }
}