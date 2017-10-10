using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_counter_add : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddlStatus.Items.Insert(0, new ListItem("Choose one", "-1"));
            ddlStatus.Items.Insert(1, new ListItem("Enable", "1"));
            ddlStatus.Items.Insert(2, new ListItem("Disable", "0"));
            //
            var query = from f in db.tbl_services
                        where f.serv_status == 1
                        select f;
            ddl_service.Items.Insert(0, new ListItem("Choose one", "-1"));
            foreach (var i in query)
            {                
                int x = 1;
                ddl_service.Items.Insert(x, new ListItem(i.serv_name,Convert.ToString(i.serv_id)));
                x += x;
            }            
        }
    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        DateTime date = DateTime.Now;
        tbl_counter cnt = new tbl_counter();
        cnt.cnt_no = txt_counter_number.Text;
        cnt.user_name = txt_username.Text;
        cnt.user_password = txt_password.Text;
        cnt.serv_id = Convert.ToInt16(ddl_service.SelectedValue);
        cnt.cnt_position = txt_position.Text;
        cnt.cnt_status = Convert.ToByte(ddlStatus.SelectedValue);
        cnt.cnt_desc = desc.Text;
        cnt.user_crea = Convert.ToString(Session["userLogin"]);
        cnt.date_crea = date.Date;
        db.tbl_counters.InsertOnSubmit(cnt);
        db.SubmitChanges();
        Response.Redirect("counter.aspx");
    }
}