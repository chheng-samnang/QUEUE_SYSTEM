<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .container{
            margin-top:50px;
        }
       #print{
           display:none;
       }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-lg-offset-3">
                <div class="panel">
                    <div class="panel-heading">
                        <h1 class="panel-title" style="text-align:center; font-size:28px"><strong>សេវាកម្ម / Services</strong></h1>
                    </div>
                    <div class="panel-body">
                        <%                            
                            DataClassesDataContext db = new DataClassesDataContext();
                            var query = from f in db.tbl_services
                                        where f.serv_status == 1
                                        select f;
                            foreach (var i in query){%>
                        <a href="Default.aspx?id=<% Response.Write(i.serv_id);%>" style="height:100px;line-height:80px;font-size:24px;font-family:Khmer OS Battambang;color:green;font-weight:bold" class="btn btn-default btn-lg btn-block" onclick="prints()"><% Response.Write(i.serv_name_kh + " / " + i.serv_name);%>                        
                        </a>                                                      
                        <% }%>                       
                        <%--<asp:Button ID="btnPrint" style="display:none;" runat="server" Text="Print" class="btn btn-default btn-lg btn-block" OnClick="btnPrint_Click"/>--%>                        
                    </div>
                </div>
            </div>
        </div>
        <div id="print" style="display:none">           
            <div style="float:left"><img src="counter/img/logo.png" style="width:60px;"/></div>
            <div style="float:left;text-align:center;margin-left:10px;">
                <b style="font-size:26px">Amppil Technology</b><br /><small>We Bring Technology in You Business</small>
            </div>
            <div style="clear:both"></div>                                                                                                                              
            <div style="text-align:center">
                <b style="font-size:100px;"><% Response.Write(Session["number"]);%></b>
                <p><% Response.Write(DateTime.Now.ToString()); %></p>
                <p>Please wait to be serviced</p>                                    
            </div>                                                                                                                                                                     
        </div>
        <%--<asp:Label ID="lblTicket" runat="server"></asp:Label>--%>
    </div>   

    <script>
        function prints() {            
            var headstr = "<html><head><title></title></head><body>";
            var footstr = "</body>";
            var newstr = document.all.item("print").innerHTML;
            var oldstr = document.body.innerHTML;
            document.body.innerHTML = headstr + newstr + footstr;
            window.print();
            document.body.innerHTML = oldstr;
            return false;
        }       
    </script>
</asp:Content>

