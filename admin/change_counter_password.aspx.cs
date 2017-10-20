using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;

public partial class admin_change_counter_password : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        var query = from f in db.tbl_counters
                    where f.cnt_id == Convert.ToInt32(Request.QueryString["id"].ToString())
                    select f;
        foreach (var i in query)
        {
            compar_old.Text = decrypt(i.user_password.Trim());            
        }                
    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        var query = from f in db.tbl_counters
                    where f.cnt_id == Convert.ToInt32(Request.QueryString["id"].ToString())
                    select f;
        foreach (var i in query)
        {
            i.user_password = encrypt(txt_new.Text);
            db.SubmitChanges();
        }
        Response.Redirect("counter.aspx");
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
    private string decrypt(string str)
    {
        string _result = string.Empty;
        char[] temp = str.ToCharArray();
        foreach (var _singleChar in temp)
        {
            var i = (int)_singleChar;
            i = i + 2;
            _result += (char)i;
        }
        return _result;
    }
}