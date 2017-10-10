<%@ Page Title="" Language="C#" MasterPageFile="~/admin_MasterPage.master" AutoEventWireup="true" CodeFile="user.aspx.cs" Inherits="admin_user" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">    
     <div id="page-wrapper">
          <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"> User Information</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>        
         <div class="row">
             <div class="col-lg-12">
                 <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/admin/user_add.aspx" CssClass="btn btn-success" Style="margin-bottom:10px;">Add</asp:HyperLink>                 
            </div>
        </div>
         <div class="row">
                 <div class="col-lg-12">
                 <div class="panel panel-primary">
                    <div class="panel-heading"><i class="fa fa-user"></i> User Information</div>
                     <div class="panel-body">                        
                         <asp:GridView ID="GridView1" runat="server" CssClass="table table-triped" AutoGenerateColumns="False">
                             <Columns>
                                 <asp:BoundField DataField="user_code" HeaderText="Code" />
                                 <asp:BoundField DataField="user_name" HeaderText="User name" />                                 
                                 <asp:BoundField DataField="user_status" HeaderText="Status" SortExpression="user_status" DataFormatString="{0:Enable;Disable;Disable}" HtmlEncode="false"/>
                                 <asp:BoundField DataField="user_desc" HeaderText="Description" />                                 
                                 <asp:BoundField DataField="user_crea" HeaderText="User create" />
                                 <asp:BoundField DataField="date_crea" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Date create" />
                                 <asp:BoundField DataField="user_updt" HeaderText="User update" />
                                 <asp:BoundField DataField="date_updt" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Date update" />
                                <asp:TemplateField HeaderText="Action">
                                     <ItemTemplate>
                                         <asp:HyperLink ID="HyperLink3" runat="server" CssClass="btn btn-warning" NavigateUrl='<%# String.Concat("~/admin/change_password.aspx?id=", Eval("user_id"))%>'>Change password</asp:HyperLink>                                         
                                         <asp:HyperLink ID="HyperLink2" runat="server" CssClass="btn btn-primary" NavigateUrl='<%# String.Concat("~/admin/user_edit.aspx?id=", Eval("user_id"))%>'>Edit</asp:HyperLink>                                                                                   
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


