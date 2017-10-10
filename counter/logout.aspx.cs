using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class counter_logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

            Session.Remove("counterLogin");          
            Response.Redirect("~/counter/login.aspx");
        
    }
}