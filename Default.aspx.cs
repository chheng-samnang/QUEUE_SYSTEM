using System;
using System.Collections.Generic;
using System.Drawing.Printing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{  
    DataClassesDataContext dc = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {        
        if (Request.QueryString["id"] != null)
        {
            Session.Remove("number");
            int id = int.Parse(Request.QueryString["id"]);             
            String code = ticket_code(id);              
            Session["number"] = code ;
            tbl_ticket tkt = new tbl_ticket();
            tkt.serv_id = id;
            tkt.cus_id = 1;
            tkt.tkt_code = code;
            tkt.tkt_status = "pending";
            tkt.user_crea = Convert.ToString(Session["userLogin"]);
            tkt.date_crea = DateTime.Now.ToString();
            dc.tbl_tickets.InsertOnSubmit(tkt);
            dc.SubmitChanges();            
            Response.Redirect("Default.aspx");

            //var query = from f in dc.tbl_counters
            //            where f.cnt_id == Convert.ToInt32(Request.QueryString["id"].ToString())
            //            select f;
            //foreach (var i in query)
            //{
            //    dc.tbl_counters.DeleteOnSubmit(i);
            //}
            //dc.SubmitChanges();
            //Response.Redirect("counter.aspx");
        }    
    }   

    protected String serv_code(int service_id)
    {
        String code = "";
        var query = (from q in dc.tbl_services
                     where q.serv_id == service_id
                     select q.serv_code).ToList();
        if (query.Count > 0)
        {
            code = query.LastOrDefault();
            code = (int.Parse(code)).ToString();
        }        
        return code;
    }
    protected String ticket_code(int service_id)
    {
        String serv_code1 = serv_code(service_id);
        String code = "";
        var query = (from q in dc.tbl_tickets
                     where q.serv_id == service_id
                     select q.tkt_code).ToList();
        if (query.Count > 0)
        {
            code = query.LastOrDefault();
            code = (int.Parse(code) + 1).ToString();
        }
        else
        {
            code = (int.Parse(serv_code1) + 1).ToString();
        }

        return code;
    }    
    //protected String generateServiceCode(int service_id)
    //{
    //    String code = "";

    //    var query = (from q in dc.tbl_tickets
    //                where q.serv_id == service_id
    //                select q.tkt_code).ToList();
    //    if(query.Count>0)
    //    {
    //        code = query.LastOrDefault();
    //        code = (int.Parse(code)+1).ToString();       
    //    }
    //    else
    //    {
    //        code = "1001";
    //    }
        
    //    return code;
    //}
    //protected void btnSrv1_Click(object sender, EventArgs e)
    //{
    //    String code = serv_code(1);
    //    //lblTicket.Text = code;
    //    tbl_ticket tkt = new tbl_ticket();
    //    tkt.serv_id = 1;
    //    tkt.cus_id = 1;
    //    tkt.tkt_code = code;
    //    tkt.tkt_status = "pending";
    //    tkt.user_crea = "admin";
    //    tkt.date_crea = DateTime.Now.ToString();
    //    dc.tbl_tickets.InsertOnSubmit(tkt);
    //    dc.SubmitChanges();
    //}
    //protected void btnPrint_Click(object sender, EventArgs e)
    //{

    //}   
}