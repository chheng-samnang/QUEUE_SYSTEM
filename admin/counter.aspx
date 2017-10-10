<%@ Page Title="" Language="C#" MasterPageFile="~/admin_MasterPage.master" AutoEventWireup="true" CodeFile="counter.aspx.cs" Inherits="admin_counter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">    
     <div id="page-wrapper">
          <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"> Counter Information</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>        
         <div class="row">
             <div class="col-lg-12">
                 <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/admin/counter_add.aspx" CssClass="btn btn-success" Style="margin-bottom:10px;">Add</asp:HyperLink>                 
            </div>
        </div>
         <div class="row">
                 <div class="col-lg-12">
                 <div class="panel panel-primary">
                    <div class="panel-heading"><i class="fa fa-user"></i> Counter Information</div>
                     <div class="panel-body">                        
                         <asp:GridView ID="GridView1" runat="server" CssClass="table table-triped" AutoGenerateColumns="False">
                             <Columns>
                                 <asp:BoundField DataField="cnt_no" HeaderText="Counter number" />
                                 <asp:BoundField DataField="user_name" HeaderText="Username" />
                                 <asp:BoundField DataField="serv_name" HeaderText="Service name" />
                                 <asp:BoundField DataField="cnt_position" HeaderText="Position" />
                                 <asp:BoundField DataField="cnt_status" HeaderText="Status" SortExpression="serv_status" DataFormatString="{0:Enable;Disable;Disable}" HtmlEncode="false" />                                 
                                 <asp:BoundField DataField="cnt_desc" HeaderText="Description" />
                                 <asp:BoundField DataField="user_crea" HeaderText="User create" />
                                 <asp:BoundField DataField="date_crea" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Date create" />
                                 <asp:BoundField DataField="user_updt" HeaderText="User update" />
                                 <asp:BoundField DataField="date_updt" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Date update" />
                                <asp:TemplateField HeaderText="Action">
                                     <ItemTemplate>
                                         <asp:HyperLink ID="HyperLink4" runat="server" CssClass="btn btn-warning" NavigateUrl='<%# String.Concat("~/admin/change_counter_password.aspx?id=", Eval("cnt_id"))%>'>Change password</asp:HyperLink>                                       
                                         <asp:HyperLink ID="HyperLink2" runat="server" CssClass="btn btn-primary" NavigateUrl='<%# String.Concat("~/admin/counter_edit.aspx?id=", Eval("cnt_id"))%>'>Edit</asp:HyperLink>                                           
                                          <%--<asp:HyperLink ID="HyperLink3" runat="server" CssClass="btn btn-danger" NavigateUrl='<%# String.Concat("~/admin/counter_delete.aspx?id=", Eval("cnt_id"))%>'>Delete</asp:HyperLink>--%>                                         
                                     </ItemTemplate>
                                 </asp:TemplateField>
                             </Columns>
                         </asp:GridView>                         
                     </div>
                 </div>
             </div>
         </div>                  
    </div>     
</asp:Content>


