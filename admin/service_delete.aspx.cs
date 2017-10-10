using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_service_delete : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataClassesDataContext db = new DataClassesDataContext();
        if (Request.QueryString["id"] != null)
        {
            var query = from f in db.tbl_services
                        where f.serv_id == Convert.ToInt32(Request.QueryString["id"].ToString())
                        select f;
            foreach (var i in query)
            {
                db.tbl_services.DeleteOnSubmit(i);
            }
            db.SubmitChanges();
            Response.Redirect("service.aspx");
        }

    }
}