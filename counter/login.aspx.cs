using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class counter_login : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        var username = txt_username.Text;
        var password = encrypt(txt_password.Text);             
        if(username!="" && password !="")
        {

            var query = (from f in db.tbl_counters
                            join f2 in db.tbl_services on f.serv_id equals f2.serv_id
                            where f.user_name == username 
                            && f.user_password == password
                        select new { cnt_no = f.cnt_no, serv_id = f.serv_id, user_name = f.user_name,f2.serv_name,cnt_id = f.cnt_id}).Take(4).ToList();                            
            if(query.Count()>0)
            {
                foreach (var i in query)
                {
                    Session["counterNumber"] = i.cnt_no;
                    Session["counterID"] = i.cnt_id;
                    Session["serviceID"] = i.serv_id;
                    Session["serviceName"] = i.serv_name;
                    Session["counterLogin"] = i.user_name;
                    Response.Redirect("~/counter/Default.aspx");
                }                  
            }
            else
            {
                msg.Text = "Incorect Username and Passworld!";
            }

        }
        else
        {
             msg.Text = "Please Input Username and Password !";
        }        
    }
    private string encrypt(string str)
    {
        string _result = string.Empty;
        char[] temp = str.ToCharArray();
        foreach (var _singleChar in temp)
        {
            var i = (int)_singleChar;
            i = i - 2;
            _result += (char)i;
        }
        return _result;
    }
}