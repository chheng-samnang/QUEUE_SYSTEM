    <%@ Page Title="" Language="C#" MasterPageFile="~/admin_MasterPage.master" AutoEventWireup="true" CodeFile="user_add.aspx.cs" Inherits="admin_user_add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div id="page-wrapper">
          <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Add User</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>                 
         <div class="row">
             <div class="col-lg-12">
                 <div class="panel panel-primary">
                    <div class="panel-heading"><i class="fa fa-user"></i> Add User</div>
                     <div class="panel-body">
                         <div class="row">
                             <div class="col-lg-4">
                                 <div class="form-group">
                                     <label class="control-label">Username</label>
                                     <asp:TextBox ID="txt_username" runat="server" CssClass="form-control" placeholder="Enter Username"></asp:TextBox>                                     
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_username" ErrorMessage="User is required" ForeColor="Red"></asp:RequiredFieldValidator>
                                 </div>
                             </div>
                             <div class="col-lg-4">
                                 <div class="form-group">
                                     <label class="control-label">User Code</label>
                                     <asp:TextBox ID="txt_user_code" runat="server" CssClass="form-control" placeholder="Enter user code"></asp:TextBox>                                     
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="User code is required" ForeColor="Red" ControlToValidate="txt_user_code"></asp:RequiredFieldValidator>
                                     <br />
                                 </div>
                             </div>
                             <div class="col-lg-4">
                                 <div class="form-group">
                                     <label class="control-label">Password</label>
                                     <asp:TextBox ID="txt_password" runat="server" CssClass="form-control" placeholder="Enter Password" TextMode="Password"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txt_password" ErrorMessage="Password is required" ForeColor="Red"></asp:RequiredFieldValidator>                                     
                                 </div>
                             </div>
                              <div class="col-lg-4">
                                 <div class="form-group">
                                     <label class="control-label">Confirm Password</label>
                                     <asp:TextBox ID="txt_confirm_password" runat="server" CssClass="form-control" placeholder="Enter Confirm Password" TextMode="Password"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txt_confirm_password" ErrorMessage="Conform is required" ForeColor="Red"></asp:RequiredFieldValidator>
                                     <br />
                                     <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txt_password" ControlToValidate="txt_confirm_password" ErrorMessage="Password not match" ForeColor="Red"></asp:CompareValidator>
                                 </div>
                             </div>                              
                                                                                      
                              <div class="col-lg-4">
                                 <div class="form-group">
                                     <label class="control-label">Status</label>
                                     <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control">                                                                                 
                                     </asp:DropDownList>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlStatus" ErrorMessage="Status is required" ForeColor="Red" InitialValue="-1"></asp:RequiredFieldValidator>
                                 </div>
                             </div>                             
                             <div class="col-lg-12">
                                 <div class="form-group">
                                     <label class="control-label">Descripton</label>
                                     <asp:TextBox ID="desc" runat="server" CssClass="form-control" placeholder="Enter Description" TextMode="MultiLine" Rows="10"></asp:TextBox>
                                 </div>                                 
                             </div>
                         </div>
                     </div>
                 </div>
             </div>
         </div>
         <hr />
         <div class="row">
             <div class="col-lg-12">                 
                 <asp:Button ID="btn_submit" runat="server" Text="Save" CssClass="btn btn-success" OnClick="btn_submit_Click"/>
                 <asp:HyperLink ID="HyperLink1" runat="server" CssClass="btn btn-default" style="margin-left:5px" NavigateUrl="~/admin/user.aspx">Cancel</asp:HyperLink>                 
             </div>
             
         </div>                  
    </div>

</asp:Content>

