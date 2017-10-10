using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_service_add : System.Web.UI.Page
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
        tbl_service serv = new tbl_service();
        serv.serv_name = txt_service_name.Text;
        serv.serv_name_kh = txt_service_name_kh.Text;
        serv.serv_type = txt_service_type.Text;
        serv.serv_status = Convert.ToByte(ddlStatus.SelectedValue);
        serv.serv_code = service_code();
        serv.serv_desc = desc.Text;
        serv.user_crea = Convert.ToString(Session["userLogin"]);
        serv.date_crea = date.Date;
        db.tbl_services.InsertOnSubmit(serv);
        db.SubmitChanges();
        Response.Redirect("service.aspx");
    }
    protected String service_code()
    {
        String code = "";

        var query = (from q in db.tbl_services
                     where q.serv_status == 1
                     select q.serv_code).ToList();
        if (query.Count > 0)
        {
            code = query.LastOrDefault();
            code = (int.Parse(code) + 2000).ToString();
        }
        else
        {
            code = "1000";
        }
        return code;
    }
}