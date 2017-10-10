using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_counter : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        var query = from t in db.tbl_counters
                    join s in db.tbl_services on t.serv_id equals s.serv_id
                    select new { t.cnt_desc,t.cnt_id,t.cnt_no,t.cnt_position,t.cnt_status,t.date_crea,t.date_updt,t.serv_id,t.user_crea,t.user_updt,t.user_name,s.serv_name };
        GridView1.DataSource = query;
        GridView1.DataBind();
    }
}