<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="counter.aspx.cs" Inherits="counter" %>

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
            background:white;
            height:170px;
            width:200px;
            margin-top:36px;
            margin-right:30px;
            text-align:center;
            border:1px solid #808080;
            cursor:pointer;
            border-radius:3px;
            font-size:23px;
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
                    <div class="col-lg-3 col-lg-offset-1">
                        <h3>Amppil Technology</h3>
                    </div>
                    <div class="col-lg-4">
                        <h2>Queue Management System</h2>
                    </div>
                    <div class="col-lg-4">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/img/default_user.png" />
                        <h4>Chheng Samnang</h4>
                    </div>
                </div>
                <%if(lblMsg.Text!=""){ %>
                <div class="row msg">
                    <div class="col-lg-8 col-lg-offset-1">
                        <div class="alert alert-danger" role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                            </button>
                            <i class="glyphicon glyphicon-alert"></i>  <strong>Attention! </strong><asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                </div>
                <%} %>
                
                <div class="row" style="margin-top:30px;">
                    <div class="col-lg-3 col-lg-offset-1">
                        <label style="font-size:38px;margin-top:22px;">Now Serving</label>
                        <span class="bold_ticket">
                            <asp:Label ID="lblTktCode" runat="server"></asp:Label>
                            
                        </span>
                    </div>
                        <asp:Button ID="btnCall" CssClass="btn-white" runat="server" Text="Call Ticket" OnClick="btnCall_Click" />
                        <asp:Button ID="btnHold" CssClass="btn-white" runat="server" Text="Hold Ticket" OnClick="btnHold_Click" />
                        <asp:Button ID="btnComplete" CssClass="btn-white" runat="server" Text="Complete Ticket" OnClick="btnComplete_Click" />
                </div>
                
                <div class="row">
                    <div class="col-lg-3 col-lg-offset-1">
                                                
                                 <strong style="font-size:38px;">Services</strong>
                                 
                                 <ul>
                                     <li><a>Service #1</a></li>
                                     <li><a>Service #2</a></li>
                                     <li><a>Service #3</a></li>
                                     <li><a>Service #4</a></li>
                                 </ul>
                            </div>
                        
                </div>
                <div class="row">
                    <div class="col-lg-7 col-lg-offset-4">
                        <h3  style="color:#333;margin-left:20px;">0 Tickets on hold</h3>
                        <%DataClassesDataContext dc = new DataClassesDataContext();

                          var query = (from q in dc.tbl_tickets
                                      where q.tkt_status == "hold"
                                      select q).ToList();
                           %>
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>Ticket Code</th>
                                    <th>Description</th>
                                    <th>Date Hold</th>
                                    <th>Action</th>
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
                                    <td><% Response.Write(q.tkt_desc); %></td>
                                    <td><% Response.Write(q.tkt_hold_date); %></td>
                                    <td>
                                        <asp:Button ID="btnCallHold" runat="server" Text="Call Ticket" CssClass="btn btn-primary" OnClick="btnCallHold_Click" />
                                        <a href="counter.aspx?com=<%Response.Write(q.tkt_code); %>" class="btn btn-success">Complete Hold Ticket</a>
                                        <a href="counter.aspx?code=<%Response.Write(q.tkt_code); %>" class="btn btn-danger">Cancel Ticket</a>
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

