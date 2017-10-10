using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_counter_edit : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddlStatus.Items.Insert(0, new ListItem("Choose one", "-1"));
            ddlStatus.Items.Insert(1, new ListItem("Enable", "1"));
            ddlStatus.Items.Insert(2, new ListItem("Disable", "0"));
            //service laod
            var query = from f in db.tbl_services
                        where f.serv_status == 1
                        select f;
            ddl_service.Items.Insert(0, new ListItem("Choose one", "-1"));
            foreach (var i in query)
            {
                int x = 1;
                ddl_service.Items.Insert(x, new ListItem(i.serv_name, Convert.ToString(i.serv_id)));
                x += x;
            }   
            //select to update
            if (Request.QueryString["id"] != null)
            {
                var query1 = from f in db.tbl_counters
                            where f.cnt_id == Convert.ToInt32(Request.QueryString["id"].ToString())
                            select f;
                foreach (var i in query1)
                {
                    txt_counter_number.Text = i.cnt_no;
                    txt_username.Text = i.user_name;
                    ddl_service.SelectedValue = i.serv_id.ToString();
                    txt_position.Text = i.cnt_position;
                    ddlStatus.SelectedValue = i.cnt_status.ToString();
                    desc.Text = i.cnt_desc;
                }
            }
        }
    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        DateTime date = DateTime.Now;
        var query = from f in db.tbl_counters
                    where f.cnt_id == Convert.ToInt32(Request.QueryString["id"].ToString())
                    select f;
        foreach (var i in query)
        {
            i.cnt_no = txt_counter_number.Text;
            i.serv_id = Convert.ToInt16(ddl_service.SelectedValue);
            i.cnt_position = txt_position.Text;
            i.user_name = txt_username.Text;
            i.cnt_status = Convert.ToByte(ddlStatus.SelectedValue);
            i.cnt_desc = desc.Text;
            i.user_updt = Convert.ToString(Session["userLogin"]);
            i.date_updt = date.Date;
            db.SubmitChanges();
        }
        Response.Redirect("counter.aspx");
    }
}