using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Media;

public partial class counter_Default : System.Web.UI.Page
{
    DataClassesDataContext dc = new DataClassesDataContext();
    string msg = "";
    
    protected void Page_Load(object sender, EventArgs e)
    {        
        string code = Request["code"] != null ? Request["code"] : "";
        string com = Request["com"] != null ? Request["com"] : "";
        Boolean isLogin = Session["counterID"] != null ? true : false;
        if(isLogin)
        {
            int cnt_id = int.Parse(Session["counterID"].ToString());
        }
        
        if (!IsPostBack&&isLogin)
        {
            
            if (code == "" && com == "")
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
                        occupyTicket(int.Parse(Session["counterID"].ToString()));

                    }
                }
                else
                {
                    lblTktCode.Text = "0000";

                }
            }
            else if (com != null && code == null)
            {
                var query5 = (from q in dc.tbl_tickets
                              where q.tkt_code == com
                              select q).ToList();
                if (query5.Count > 0)
                {
                    query5[0].tkt_status = "complete hold";
                    dc.SubmitChanges();
                    var query6 = (from q in dc.tbl_tickets
                                  where q.tkt_status == "occupied"
                                  select q).ToList();
                    if (query6.Count > 0)
                    {
                        lblTktCode.Text = query6[0].tkt_code;
                        btnCall_Click(sender, e);
                    }
                }
            }
            else //when counter cancel hold ticket
            {
                int srv_id = int.Parse(Session["serviceID"].ToString());
                var query2 = (from q in dc.tbl_tickets
                              where q.tkt_code == code && q.serv_id==srv_id
                              select q).ToList();
                if (query2.Count > 0)
                {
                    query2[0].tkt_status = "cancel hold";
                    dc.SubmitChanges();
                    var query3 = (from q in dc.tbl_tickets
                                  where q.tkt_status == "occupied" && q.serv_id==srv_id
                                  select q).ToList();
                    if (query3.Count > 0)
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
    protected Boolean check_cnt_id(int cnt_id, string tkt_code)
    {
        return false;
    }
    protected void occupyTicket(int cnt_id)
    {

        var query = loadData();
        if (query != null)
        {
            query.cnt_id = cnt_id;
            query.tkt_status = "occupied";
            query.time_crea = TimeSpan.Parse(DateTime.Now.ToString("h:mm:ss"));
            dc.SubmitChanges();
        }
        else
        {
            msg = "There is no more ticket to call.";
            lblMsg.Text = msg;
        }

    }
    protected dynamic loadData(string id = "")
    {
        int srv_id = int.Parse(Session["serviceID"].ToString());
        if (id == "")
        {
            var query = (from q in dc.tbl_tickets
                         where q.tkt_status == "pending" && q.cnt_id == null && q.serv_id==srv_id
                         select q).FirstOrDefault();
            return query;
        }
        else
        {
            var query = (from q in dc.tbl_tickets
                         where q.tkt_status == "hold" && q.serv_id==srv_id
                         select q).FirstOrDefault();
            return query;
        }


    }
    protected void btnCall_Click(object sender, EventArgs e)
    {
        call(lblTktCode.Text);        
    }
    protected void btnComplete_Click(object sender, EventArgs e)
    {
        int srv_id = int.Parse(Session["serviceID"].ToString());
        if(lblTktCode.Text=="0000")
        {
            msg = "There is no more ticket to call.";
            lblMsg.Text = msg;
        }
        else
        {
            Boolean isLogin = Session["counterID"] != null ? true : false;
            var query = (from q in dc.tbl_tickets
                         where q.tkt_code == lblTktCode.Text && q.serv_id==srv_id
                         select q).ToList();
            if (query != null&&isLogin)
            {
                query[0].tkt_status = "complete";
                query[0].cnt_id = int.Parse(Session["counterID"].ToString());
                dc.SubmitChanges();
                var query2 = loadData();
                if(query2!=null)
                {
                    lblTktCode.Text = query2.tkt_code;
                    occupyTicket(int.Parse(Session["counterID"].ToString()));
                    btnCall_Click(sender, e);
                }
                else
                {
                    msg = "There is no more ticket to call.";
                    lblMsg.Text = msg;
                }
                
            }
            else
            {
                msg = "There is no more ticket to call.";
                lblMsg.Text = msg;
            }
        }        
    }
    protected void btnHold_Click(object sender, EventArgs e)
    {
        int srv_id = int.Parse(Session["serviceID"].ToString());
        string tktCode = lblTktCode.Text;
        var query = (from q in dc.tbl_tickets
                     where q.tkt_code == tktCode && q.serv_id==srv_id
                     select q).ToList();
        foreach (var q in query)
        {
            q.tkt_status = "hold";
            q.tkt_hold_date = DateTime.Now;
        }
        dc.SubmitChanges();
        var query2 = loadData();
        if (query2 != null)
        {
            lblTktCode.Text = query2.tkt_code;
            occupyTicket(int.Parse(Session["counterID"].ToString()));
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
        call(lblTktCode.Text);
    }
    protected void call(String no="")
    {
        if (no == "" || no=="0000")
        {
            lblMsg.Text = "There is no more ticket to call.";  
        }
        else
        {
            string[] numberArray = new string[no.Length];
            int counter = 0;
            System.Media.SoundPlayer player = new System.Media.SoundPlayer(@"D:\QUEUE_SYSTEM\counter\sound\call.wav");
            player.Play();
            System.Threading.Thread.Sleep(4500);
            for (int i = 0; i < no.Length; i++)
            {
                numberArray[i] = no.Substring(counter, 1); // 1 is split length
                System.Media.SoundPlayer player1 = new System.Media.SoundPlayer(@"D:\QUEUE_SYSTEM\counter\sound\" + numberArray[i] + ".wav");
                player1.Play();
                System.Threading.Thread.Sleep(2000);
                counter++;
            }
            System.Media.SoundPlayer player2 = new System.Media.SoundPlayer(@"D:\QUEUE_SYSTEM\counter\sound\come.wav");
            player2.Play();
            System.Threading.Thread.Sleep(4500);
            string ct = Session["counterNumber"].ToString();
            string[] numberArray1 = new string[ct.Length];
            int counter1 = 0;
            for (int i = 0; i < ct.Length; i++)
            {
                numberArray1[i] = ct.Substring(counter1, 1); // 1 is split length
                System.Media.SoundPlayer player3 = new System.Media.SoundPlayer(@"D:\QUEUE_SYSTEM\counter\sound\" + numberArray1[i] + ".wav");
                player3.Play();
                System.Threading.Thread.Sleep(2000);
                counter1++;
            }  
        }
    }
}