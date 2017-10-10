<%@ Page Title="" Language="C#" MasterPageFile="~/admin_MasterPage.master" AutoEventWireup="true" CodeFile="service.aspx.cs" Inherits="admin_service" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">    
     <div id="page-wrapper">
          <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"> Service Information</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>        
         <div class="row">
             <div class="col-lg-12">
                 <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/admin/service_add.aspx" CssClass="btn btn-success" Style="margin-bottom:10px;">Add</asp:HyperLink>                 
            </div>
        </div>
         <div class="row">
                 <div class="col-lg-12">
                 <div class="panel panel-primary">
                    <div class="panel-heading"><i class="fa fa-external-link"></i> Service Information</div>
                     <div class="panel-body">                        
                         <asp:GridView ID="GridView1" runat="server" CssClass="table table-triped" AutoGenerateColumns="False">
                             <Columns>
                                 <asp:BoundField DataField="serv_name" HeaderText="Service name" />
                                 <asp:BoundField DataField="serv_name_kh" HeaderText="Service name khmer" />
                                 <asp:BoundField DataField="serv_type" HeaderText="Type" />
                                 <asp:BoundField DataField="serv_status" HeaderText="Status" SortExpression="serv_status" DataFormatString="{0:Enable;Disable;Disable}" HtmlEncode="false"/>                                 
                                 <asp:BoundField DataField="serv_desc" HeaderText="Description" />                                 
                                 <asp:BoundField DataField="user_crea" HeaderText="User create" />
                                 <asp:BoundField DataField="date_crea" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Date create" />
                                 <asp:BoundField DataField="user_updt" HeaderText="User update" />
                                 <asp:BoundField DataField="date_updt" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Date update" />
                                <asp:TemplateField HeaderText="Action">
                                     <ItemTemplate>
                                         <asp:HyperLink ID="HyperLink2" runat="server" CssClass="btn btn-primary" NavigateUrl='<%# String.Concat("~/admin/service_edit.aspx?id=", Eval("serv_id"))%>'>Edit</asp:HyperLink>                                         
                                          <asp:HyperLink ID="HyperLink3" runat="server" CssClass="btn btn-danger" NavigateUrl='<%# String.Concat("~/admin/service_delete.aspx?id=", Eval("serv_id"))%>'>Delete</asp:HyperLink>                                                                                                                            
                                         <%--<button onclick="text_alert(<%# Eval("serv_id")%>)" class="btn btn-danger">Delete</button>--%>
                                     </ItemTemplate>
                                 </asp:TemplateField>                                 
                             </Columns>
                         </asp:GridView>                         
                     </div>
                 </div>
             </div>
         </div>
         <script>                                     
                 function text_alert(id) {
                     var x = confirm("Are you sure you want to delete it?");
                     if (x == true) { window.location.href = "http://wwww.facebook.com", true; }
                     else { return false; }
                 }             
         </script>                  
    </div>     
</asp:Content>


