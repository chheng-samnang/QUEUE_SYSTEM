using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class displayTicket : System.Web.UI.Page
{
    DataClassesDataContext dc = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            var query = (from q in dc.tbl_tickets
                         join q2 in dc.tbl_counters on q.cnt_id equals q2.cnt_id
                         where q.cnt_id != null
                         orderby q.tkt_code descending
                         select new {tkt_code = q.tkt_code,cnt_id=q.cnt_id,cnt_pos=q2.cnt_position }).Take(4).ToList();
            if(query.Count==1)
            {
                lblTktCode.Text = query[0].tkt_code;
                lblCounter.Text = "Counter "+query[0].cnt_id.ToString();
                if (query[0].cnt_pos == "left")
                {
                    Image4.ImageUrl = "~/img/left.png";
                }
                else
                {
                    Image4.ImageUrl = "~/img/right.png";
                }
            }
            else if (query.Count > 1)
            {
                int i = 0;
                foreach (var q in query)
                {
                    if(i==0)
                    {
                        lblTktCode.Text = q.tkt_code;
                        lblCounter.Text = "Counter " + q.cnt_id;
                    }
                    else
                    {
                        ContentPlaceHolder cph = (ContentPlaceHolder)this.Master.FindControl("ContentPlaceHolder1");
                        Label lblTktCode = ((Label)cph.FindControl("lblTktCode"+i));
                        Label lblCounter = ((Label)cph.FindControl("lblCounter" + i));
                        Image Image = ((Image)cph.FindControl("Image" + i));
                        lblTktCode.Text = q.tkt_code.ToString();
                        lblCounter.Text = "Counter "+q.cnt_id.ToString();
                        if (q.cnt_pos == "left")
                        {
                            Image.ImageUrl = "~/img/left.png";
                        }
                        else
                        {
                            Image.ImageUrl = "~/img/right.png";
                        }
                        
                    }
                    i++;
                }
            }

        }
    }
}