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
        DateTime date = DateTime.Now;
        if (Request.QueryString["id"] != null)
        {            
            int id = int.Parse(Request.QueryString["id"]);             
            String code = ticket_code(id);              
            Session["number"] = code ;
            tbl_ticket tkt = new tbl_ticket();
            tkt.serv_id = id;
            //tkt.cus_id = 1;
            tkt.tkt_code = code;
            tkt.tkt_status = "pending";
<<<<<<< HEAD
            //tkt.user_crea = Convert.ToString(Session["userLogin"]);
            tkt.date_crea = date.Date;
            //tkt.time_crea = TimeSpan.Parse(DateTime.Now.ToShortTimeString());
=======
            tkt.user_crea = Convert.ToString(Session["userLogin"]);
            tkt.date_crea = DateTime.Now;
>>>>>>> 59f82f6f7d68523d86389e225ccc93cb7e0868ed
            dc.tbl_tickets.InsertOnSubmit(tkt);
            dc.SubmitChanges();
            Response.Redirect("Default.aspx");           
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
     
}