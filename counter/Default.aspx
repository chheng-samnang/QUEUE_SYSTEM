<%@ Page Title="" Language="C#" MasterPageFile="~/counter_MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="counter_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .block{
            background:grey;       
        }
        .ticket{
            text-align:center;
            
        }
        .btnTicket{
            cursor:pointer;
        }
        .navigation{
            background:#3f3f3f;
            height:100px;
            padding:15px;
        }
        h3,h2{
            color:white;
        }
        h4{
            color:white;
            margin-top:27px;
        }
        #ContentPlaceHolder1_Image1{
            width:40px;
            margin-top:17px;
            margin-right:10px;
            float:left;
        }
        body{
            background:#cbcbcb;
        }
        .bold_ticket{
            font-size:120px;
            font-weight:bold;
        }
        .btn-white{
            background:#01b6ad;
            height:150px;
            width:160px;                        
            text-align:center;
            border:1px solid #808080;
            cursor:pointer;
            border-radius:3px;
            font-size:30px;
        }        
        .img-style
        {
            width:150px;

        }
        .msg{
            margin-top:40px;
        }
        ul{
            list-style-type:none;
            margin-left:-39px;
        }
        li{
            font-size:20px;
        }
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12 navigation">
                <div class="row">
                     <div class="col-lg-4 col-lg-offset-1">
                        <h2>Queue Management System</h2>
                         <small style="color:white; margin-left:150px">Amppil Technology</small>
                    </div>                                      
                    <div class="col-lg-5">                        
                        <h4 style="text-align:right">Welcome to <% Response.Write(Session["counterLogin"].ToString().ToUpper()); %></h4>
                    </div>
                     <div class="col-lg-1">
                        <h4 style="text-align:right"><a href="logout.aspx" style="color:white;">Logout</a></h4>
                    </div>
                    <div class="col-lg-1"></div>
                </div>               
                
                <div class="row" style="margin-top:30px;">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-5">
                        <div class="row">                            
                            <div class="col-lg-12" style="text-align:center">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <p>COUNTER: <strong><% Response.Write(Session["counterNumber"]); %></strong></p>
                                       </div>                                    
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <span>SERVICE: <strong><% Response.Write(Session["serviceName"]); %></strong></span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12"><asp:Label ID="lblTktCode" runat="server" style="font-size:140px;"></asp:Label></div>                                    
                                 </div>                                                                                                
                            </div>                                                      
                        </div>                                              
                        <div class="row">
                            <div class="col-lg-12" style="text-align:center">                                                                                                                                                                                  
                                <asp:Button ID="btnCall" CssClass="btn-white" runat="server" Text="Call" OnClick="btnCall_Click"/>
                                <asp:Button ID="btnHold" CssClass="btn-white" runat="server" Text="Hold" OnClick="btnHold_Click" />
                                <asp:Button ID="btnComplete" CssClass="btn-white" runat="server" Text="Complete" OnClick="btnComplete_Click" />  
                            </div>
                        </div>                                                                                                                                                                     
                    </div>
                    <div class="col-lg-5">
                         <%if(lblMsg.Text!=""){ %>
                            <div class="row msg">
                                <div class="col-lg-12">
                                    <div class="alert alert-danger" role="alert">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                          <span aria-hidden="true">&times;</span>
                                        </button>
                                        <i class="glyphicon glyphicon-alert"></i>  <strong>Attention! </strong><asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                                    </div>
                                </div>
                            </div>
                            <%} %>  
                        <%--<h3  style="color:#333;margin-left:20px;">0 Tickets on hold</h3>--%>
                        <%DataClassesDataContext dc = new DataClassesDataContext();

                          var query = (from q in dc.tbl_tickets
                                      where q.tkt_status == "hold"
                                      select q).ToList();
                           %>
                            <div class="table-responsive" style="overflow: scroll; height: 500px; -webkit-overflow-scrolling: touch; overflow-x: hidden;">
                                <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>Ticket Code</th>                                    
                                    <th>Date Hold</th>
                                    <th style="text-align:center">Action</th>
                                </tr>
                                
                            </thead>
                            <tbody>
                                <%
                                    int i = 0;
                                    if(query.Count>0)
                                    {
                                        foreach (var q in query)
                                        {
                                     %>
                                <tr>
                                    <td><% Response.Write(i + 1); %></td>
                                    <td><% Response.Write(q.tkt_code); %></td>
                                    <td><% Response.Write(q.tkt_hold_date); %></td>
                                    <td style="text-align:right">
                                        <asp:Button ID="btnCallHold" runat="server" Text="Call" CssClass="btn btn-primary" OnClick="btnCallHold_Click" />
                                        <a href="Default.aspx?com=<%Response.Write(q.tkt_code); %>" class="btn btn-success">Complete Hold</a>
                                        <a href="Default.aspx?code=<%Response.Write(q.tkt_code); %>" class="btn btn-danger">Cancel</a>
                                        
                                    </td>
                                </tr>
                                <%
                                           i++;
                                        }
                                } %>
                            </tbody>
                        </table>
                            </div>
                        </div>   
                    <div class="col-lg-1"></div>                    
                </div>                      
            </div>
        </div>
        
    </div>
    <audio id="audio" src="sound/alert.wav" autostart="false" ></audio>
    
    <script>
        $("#btnCall").click(function () {
            var sound = document.getElementById("audio");
            sound.play();
        });

    </script>
</asp:Content>


