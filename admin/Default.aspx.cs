using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Default : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
    
        var query = from t in db.tbl_tickets
                    join s in db.tbl_services on t.serv_id equals s.serv_id into s1
                    from s2 in s1.DefaultIfEmpty()
                    join c in db.tbl_counters on t.cnt_id equals c.cnt_id into c1
                    from c2 in c1.DefaultIfEmpty()
                    select new {
                        t.tkt_code,t.tkt_status,t.user_crea,t.date_crea,t.time_crea,
                        s2.serv_name,
                        c2.cnt_no };                   
        GridView1.DataSource = query;
        GridView1.DataBind();
    }
}