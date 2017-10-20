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
                    <script language="C#" runat="server">

                        protected String serv_code(int service_id)
                        {
                            DataClassesDataContext db = new DataClassesDataContext();
                            String code = "";
                            var query = (from q in db.tbl_services
                                         where q.serv_id == service_id
                                         select q.serv_code).ToList();
                            if (query.Count > 0)
                            {
                                code = query.LastOrDefault();
                                code = (int.Parse(code)).ToString();
                            }
                            return code;
                        }
                        protected String ticket_code1(int service_id)
                        {
                            DataClassesDataContext db = new DataClassesDataContext();
                            String serv_code1 = serv_code(service_id);
                            String code = "";
                            var query = (from q in db.tbl_tickets
                                         where q.serv_id == service_id
                                         select q.tkt_code).ToList();
                            if (query.Count > 0)
                            {
                                code = query.LastOrDefault();
                                code = (int.Parse(code) + 1).ToString();
                            }
                            else
                            {
                                code = (int.Parse(serv_code1) + 1).ToString();
                            }
                            return code;
                        }                     
                    </script>
                                       
                    <div class="panel-body">
                        <%                                                                                                                                                                                                                                                                                                                       
                           //loop of service  
                           DataClassesDataContext db = new DataClassesDataContext();                                                                                                     
                           var query = from f in db.tbl_services
                                        where f.serv_status == 1
                                        select f;
                            foreach (var i in query){                                                                
                        %>

                        <div id="print<% Response.Write(i.serv_code);%>" style="display:none">           
                            <div style="float:left"><img src="img/logo.png" style="width:60px;"/></div>
                            <div style="float:left;text-align:center;margin-left:10px;">
                                <b style="font-size:26px">amppil technology</b><br /><small>we bring technology in you business</small>
                            </div>
                            <div style="clear:both"></div>                                                                                                                              
                            <div style="text-align:center">
                                <b style="font-size:100px;"><% Response.Write(ticket_code1(i.serv_id));%></b>
                                <p><% Response.Write(DateTime.Now.ToString()); %></p>
                                <p>please wait to be serviced</p>                                    
                            </div>                                                                                                                                                                     
                        </div>

                        <a href="Default.aspx?id=<% Response.Write(i.serv_id);%>" style="height:100px;line-height:80px;font-size:24px;font-family:Khmer OS Battambang;color:green;font-weight:bold" class="btn btn-default btn-lg btn-block" onclick="prints(<% Response.Write(i.serv_code); %>)"><% Response.Write(i.serv_name_kh + " / " + i.serv_name);%>                        
                        </a>                                                      
                     <% }%>                                                                                                                      
                    </div>                                                                                                                                 
                </div>
            </div>
<<<<<<< HEAD
        </div>                     
        
        
                        
=======
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
>>>>>>> 59f82f6f7d68523d86389e225ccc93cb7e0868ed
    </div>   

    <script>
        function prints(code) {            
            var headstr = "<html><head><title></title></head><body>";
            var footstr = "</body>";
            var newstr = document.all.item("print"+code).innerHTML;
            var oldstr = document.body.innerHTML;
            document.body.innerHTML = headstr + newstr + footstr;
            window.print();
            document.body.innerHTML = oldstr;
            return false;
        }       
    </script>
    
</asp:Content>

