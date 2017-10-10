using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ng_get_service_number : System.Web.UI.Page
{
    DataClassesDataContext dc = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        String serv_id = Request.QueryString["serv_id"];
        String serv_no = Request.QueryString["serv_no"];
        String code = "";
        var query = (from q in dc.tbl_tickets
                     where q.serv_id == int.Parse(serv_id)
                     select q.tkt_code).ToList();
        if (query.Count > 0)
        {
            code = query.LastOrDefault();
            code = (int.Parse(code) + 1).ToString();
        }
        else
        {
            code = (int.Parse(serv_no) + 1).ToString();
        }        
        Response.Write(code);                
    }   
}