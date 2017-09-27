using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class announce : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            System.Media.SoundPlayer player = new System.Media.SoundPlayer(@"D:\samnang\QUEUE_SYSTEM\sound\alert.wav");
            player.Play();
        }
    }
}