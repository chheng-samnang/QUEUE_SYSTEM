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
            <div class="col-lg-5 col-lg-offset-3">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h2 class="panel-title">Please choose a service</h2>
                    </div>
                    <div class="panel-body">
                        <asp:Button ID="btnSrv1"  runat="server" Text="Service #1" class ="btn btn-default btn-lg btn-block" OnClick="btnSrv1_Click"/>
                        <asp:Button ID="btnSrv2" runat="server" Text="Service #2" class="btn btn-default btn-lg btn-block"/>
                        <asp:Button ID="btnSrv3" runat="server" Text="Service #3" class="btn btn-default btn-lg btn-block"/>
                        <asp:Button ID="btnSrv4" runat="server" Text="Service #4" class="btn btn-default btn-lg btn-block"/>
                        <asp:Button ID="btnPrint" style="display:none;" runat="server" Text="Print" class="btn btn-default btn-lg btn-block" OnClick="btnPrint_Click"/>
                    </div>
                </div>
            </div>
        </div>
        <div id="print">
            <h3>Company Logo</h3>
           
            
            <h2>Ticket: <asp:Label ID="lblTicket" runat="server" Text="Label"></asp:Label></h2>
            
            
            <label>Now serving:</label> <strong>1001</strong>
            <p>Please wait.</p>
        </div>
    </div>
    <script>
        function btnClick()
        {
            $("#ContentPlaceHolder1_btnPrint").click();
        }
        $("#ContentPlaceHolder1_btnPrint").click( function(){
            var headstr = "<html><head><title></title></head><body>";
            var footstr = "</body>";
            var newstr = document.all.item("print").innerHTML;
            var oldstr = document.body.innerHTML;
            document.body.innerHTML = headstr + newstr + footstr;
            window.print();
            document.body.innerHTML = oldstr;
            return false;
            });
    </script>
</asp:Content>

