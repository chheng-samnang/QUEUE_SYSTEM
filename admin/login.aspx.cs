using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_login : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {

        var username = txt_username.Text;
        var password = txt_password.Text;
        Response.Write(encrypt(password));
        if (username != "" && password != "")
        {
            
            var query = from f in db.tbl_users
                        where f.user_name == username
                        && f.user_password == encrypt(password)
                        select f;
            if (query.Count() > 0)
            {
                Session["userLogin"] = username;
                Response.Redirect("~/admin/Default.aspx");
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
