using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    DataClassesDataContext dc = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {

        }
    }
    protected String generateServiceCode(int service_id)
    {
        String code = "";

        var query = (from q in dc.tbl_tickets
                    where q.serv_id == service_id
                    select q.tkt_code).ToList();
        if(query.Count>0)
        {
            code = query.LastOrDefault();
            code = (int.Parse(code)+1).ToString();       
        }
        else
        {
            code = "1001";
        }
        
        return code;
    }
    protected void btnSrv1_Click(object sender, EventArgs e)
    {
        String code = generateServiceCode(1);
        lblTicket.Text = code;
        tbl_ticket tkt = new tbl_ticket();
        tkt.serv_id = 1;
        tkt.cus_id = 1;
        tkt.tkt_code = code;
        tkt.tkt_status = "pending";
        tkt.user_crea = "admin";
        tkt.date_crea = DateTime.Now.ToString();
        dc.tbl_tickets.InsertOnSubmit(tkt);
        dc.SubmitChanges();
    }
    protected void btnPrint_Click(object sender, EventArgs e)
    {

    }
}