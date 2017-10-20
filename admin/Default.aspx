<%@ Page Title="" Language="C#" MasterPageFile="~/admin_MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="admin_Default" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Dashboard</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
         
             <div class="row">
                     <div class="col-lg-12">
                     <div class="panel panel-primary">                        
                         <div class="panel-body">                                                     
                             <asp:GridView ID="GridView1" runat="server" CssClass="table table-triped" AutoGenerateColumns="False">
                                 <Columns>                                 
                                     <asp:BoundField DataField="serv_name" HeaderText="Service" />                                 
                                     <asp:BoundField DataField="cnt_no" HeaderText="Counter"/>
                                     <asp:BoundField DataField="tkt_code" HeaderText="Ticket"/>
                                     <asp:BoundField DataField="tkt_status" HeaderText="Status"/>                                                                      
                                     <asp:BoundField DataField="user_crea" HeaderText="User create" />
                                     <asp:BoundField DataField="time_crea" DataFormatString="{0:HH:mm tt}" HeaderText="Time" />
                                     <asp:BoundField DataField="date_crea" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Date" />                                                                       
                                 </Columns>
                             </asp:GridView>                         
                         </div>
                     </div>
                 </div>
             </div>                   
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->
</asp:Content>

