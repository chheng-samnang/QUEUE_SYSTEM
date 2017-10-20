<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="displayTicket.aspx.cs" Inherits="displayTicket" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        body{
            background:#0094ff;
        }
        .ticket{
        height:220px;
        border:1px solid grey;
        border-radius:5px;
        margin:20px;
        text-align:center;
        padding-top:10px;
        background:white;
        }
        .center{
            height:739px;
            border:1px solid grey;
            border-radius:5px;
            margin:20px;
            text-align:center;
            padding-top:90px;
            background:white;
        }
        .side-ticket{
            font-size:100px;
            font-weight:bold;
            color:#036cc6;
        }
        .center-ticket{
            font-size:320px;
            font-weight:bold;
            color:red;
        }
        .ticket h3{
            margin-top:-20px;
        }
        .arrow{
            width:50px;
            margin-right:200px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid">
        <div class="row" style="margin-top:60px;">
            <div class="col-lg-4">
                <div class="row">
                    <div class="col-lg-12">
                         <div class="ticket">
                             <asp:Label ID="lblTktCode1" runat="server" Text="" CssClass="side-ticket"></asp:Label><br />
                             <h3>
                                 <asp:Label ID="lblCounter1" runat="server" Text=""></asp:Label></h3>
                             <asp:Image ID="Image1" CssClass="arrow" runat="server" ImageUrl="" />
                         </div>
                    </div>
                    <div class="col-lg-12">
                         <div class="ticket">
                             <asp:Label ID="lblTktCode2" runat="server" Text="" CssClass="side-ticket"></asp:Label>
                             <h3>
                                 <asp:Label ID="lblCounter2" runat="server" Text=""></asp:Label></h3>
                             <asp:Image ID="Image2" CssClass="arrow" runat="server" ImageUrl="" />
                         </div>
                    </div>
                    <div class="col-lg-12">
                         <div class="ticket">
                             <asp:Label ID="lblTktCode3" runat="server" Text="" CssClass="side-ticket"></asp:Label>
                             <h3><asp:Label ID="lblCounter3" runat="server" Text="" ></asp:Label></h3>
                             <asp:Image ID="Image3" CssClass="arrow" runat="server" ImageUrl="" />
                         </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-8">
                <div class="row">
                    <div class="col-lg-12">
                         <div class="center">
                             <div style="font-size:100px;margin-bottom:-75px;margin-top:-35px;">Now Serving</div>
                             <div class="center-ticket" style="margin-bottom:-93px;">
                                 <asp:Label ID="lblTktCode" runat="server" Text=""></asp:Label>
                             </div>
                             <asp:Label ID="lblCounter" runat="server" Text="" Font-Size="80px"></asp:Label><br />
                             <asp:Image ID="Image4" style="width:100px;margin-right:450px;" CssClass="arrow" runat="server" ImageUrl="" />
                         </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        setTimeout(function () {
            window.location.reload(1);
        }, 3000);
        var x = 0;
        $(document).ready(function () {
            var f = document.getElementById('ContentPlaceHolder1_lblTktCode');
            setIntervalX(function () {
                f.style.color = (f.style.color == 'red' ? 'white' : 'red');
            }, 500, 5);
        });

        function setIntervalX(callback, delay, repetitions) {
            var x = 0;
            var intervalID = window.setInterval(function () {

                callback();

                if (++x === repetitions) {
                    window.clearInterval(intervalID);
                }
            }, delay);
        }
    </script>
</asp:Content>

