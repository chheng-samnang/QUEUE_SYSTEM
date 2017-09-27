using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Media;

public partial class counter : System.Web.UI.Page
{
    DataClassesDataContext dc = new DataClassesDataContext();
    string msg = "";
    int cnt_id = 1;
    protected void Page_Load(object sender, EventArgs e)
    {
            
            string code = Request["code"]!=null?Request["code"]:"";
            string com = Request["com"]!=null?Request["com"]:"";
            if(!IsPostBack)
            {
                if(code==""&&com=="")        
                {
                    var query = loadData();
                    if (query != null)
                    {

                        if (IsPostBack)
                        {
                            btnCall_Click(sender, e);
                        }
                        else
                        {
                            lblTktCode.Text = query.tkt_code;
                            occupyTicket(cnt_id);

                        }
                    }
                    else
                    {
                        lblTktCode.Text = "0000";

                    }
                }
                else if(com!=null&&code==null)
                {
                    var query5 = (from q in dc.tbl_tickets
                                 where q.tkt_code == com
                                 select q).ToList();
                    if(query5.Count>0)
                    {
                        query5[0].tkt_status = "complete hold";
                        dc.SubmitChanges();
                        var query6 = (from q in dc.tbl_tickets
                                     where q.tkt_status == "occupied"
                                     select q).ToList();
                        if(query6.Count>0)
                        {
                            lblTktCode.Text = query6[0].tkt_code;
                            btnCall_Click(sender, e);
                        }
                    }
                }
                else //when counter cancel hold ticket
                {
                    var query2 = (from q in dc.tbl_tickets
                                 where q.tkt_code == code
                                 select q).ToList();
                    if(query2.Count>0)
                    {
                        query2[0].tkt_status = "cancel hold";
                        dc.SubmitChanges();
                        var query3 = (from q in dc.tbl_tickets
                                 where q.tkt_status == "occupied"
                                 select q).ToList();
                        if(query3.Count>0)
                        {
                            lblTktCode.Text = query3[0].tkt_code;
                        }
                    }
                }
                
            }
            else
            {
                //Response.Write("is postback");
            }
                
            
    }
    protected Boolean check_cnt_id(int cnt_id,string tkt_code)
    {
        return false;
    }
    protected void occupyTicket(int cnt_id)
    {
        
        var query = loadData();
        if(query!=null)
        {
            query.cnt_id = cnt_id;
            query.tkt_status = "occupied";
            dc.SubmitChanges();
        }else
        {
            msg = "There is no more ticket to call.";
            lblMsg.Text = msg;
        }
        
    }
    protected dynamic loadData(string id="")
    {
        if(id=="")
        {
            var query = (from q in dc.tbl_tickets
                         where q.tkt_status == "pending" && q.cnt_id == null
                         select q).FirstOrDefault();
            return query;
        }
        else
        {
            var query = (from q in dc.tbl_tickets
                         where q.tkt_status == "hold"
                         select q).FirstOrDefault();
            return query;
        }
        
        
    }
    protected void btnCall_Click(object sender, EventArgs e)
    {
        System.Media.SoundPlayer player = new System.Media.SoundPlayer(@"D:\samnang\QUEUE_SYSTEM\sound\alert.wav");
        player.Play();
    }
    protected void btnComplete_Click(object sender, EventArgs e)
    {
        var query = (from q in dc.tbl_tickets
                    where q.tkt_code == lblTktCode.Text
                    select q).ToList();
        if (query != null)
        {
            query[0].tkt_status = "complete";
            query[0].cnt_id = 1;
            dc.SubmitChanges();
            var query2 = loadData();
            lblTktCode.Text = query2.tkt_code;
            occupyTicket(cnt_id);
            btnCall_Click(sender, e);
        }
        else
        {
            msg = "There is no more ticket to call.";
            lblMsg.Text = msg;
        }
    }
    protected void btnHold_Click(object sender, EventArgs e)
    {
        string tktCode = lblTktCode.Text;
        var query = (from q in dc.tbl_tickets
                     where q.tkt_code == tktCode
                     select q).ToList();
        foreach (var q in query)
        {
            q.tkt_status = "hold";
            q.tkt_hold_date = DateTime.Now;
        }
        dc.SubmitChanges();
        var query2 = loadData();
        if(query2!=null)
        {
            lblTktCode.Text = query2.tkt_code;
            occupyTicket(cnt_id);
            btnCall_Click(sender, e);
        }
        else
        {
            msg = "There is no more ticket to call.";
            lblMsg.Text = msg;
        }
        
    }
    protected void btnCallHold_Click(object sender, EventArgs e)
    {
        btnCall_Click(sender,e);
    }
    
}