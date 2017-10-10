using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_user_add : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {            
            ddlStatus.Items.Insert(0, new ListItem("Choose one", "-1"));
            ddlStatus.Items.Insert(1, new ListItem("Enable", "1"));
            ddlStatus.Items.Insert(2, new ListItem("Disable", "0"));           
        }
    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {       
        DateTime date = DateTime.Now;
        tbl_user user = new tbl_user();
        user.user_name = txt_username.Text;
        user.user_code = txt_user_code.Text;        
        user.user_status = Convert.ToByte(ddlStatus.SelectedValue);        
        user.user_desc = desc.Text;        
        user.user_password = txt_password.Text;
        user.user_crea = Convert.ToString(Session["userLogin"]);
        user.date_crea = date.Date;
        db.tbl_users.InsertOnSubmit(user);
        db.SubmitChanges();
        Response.Redirect("user.aspx");
    }
}