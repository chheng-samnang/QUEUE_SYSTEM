<%@ Page Title="" Language="C#" MasterPageFile="~/admin_MasterPage.master" AutoEventWireup="true" CodeFile="change_counter_password.aspx.cs" Inherits="admin_change_counter_password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div id="page-wrapper">
          <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Change password</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>                 
         <div class="row">
             <div class="col-lg-12">
                 <div class="panel panel-primary">
                    <div class="panel-heading"><i class="fa fa-lock"></i> Change password</div>
                     <div class="panel-body">
                         <div class="row">
                             <asp:TextBox ID="compar_old" runat="server" style="display:none"></asp:TextBox>
                             <div class="col-lg-4">
                                 <div class="form-group">
                                     <label class="control-label">                                     
                                     Old password</label>
                                     <asp:TextBox ID="txt_old" runat="server" CssClass="form-control" placeholder="Enter Old password" TextMode="Password"></asp:TextBox>                                     
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_old" ErrorMessage="Old password is required" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <br />
                                     <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="compar_old" ControlToValidate="txt_old" ErrorMessage="Old password Incorrect!" ForeColor="Red"></asp:CompareValidator>
                                 </div>
                             </div>
                             <div class="col-lg-4">
                                 <div class="form-group">
                                     <label class="control-label">New password</label>
                                     <asp:TextBox ID="txt_new" runat="server" CssClass="form-control" placeholder="Enter New password" TextMode="Password"></asp:TextBox>                                                                          
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_new" ErrorMessage="New password is required" ForeColor="Red"></asp:RequiredFieldValidator>                                     
                                 </div>
                             </div>
                             <div class="col-lg-4">
                                 <div class="form-group">
                                     <label class="control-label">Confirm password</label>
                                     <asp:TextBox ID="txt_confirm" runat="server" CssClass="form-control" placeholder="Enter Confirm password" TextMode="Password"></asp:TextBox>                                                                          
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_confirm" ErrorMessage="Confirm password is required" ForeColor="Red"></asp:RequiredFieldValidator>
                                     <br />
                                     <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txt_new" ControlToValidate="txt_confirm" ErrorMessage="Confirm password not match" ForeColor="Red"></asp:CompareValidator>
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
                 <asp:Button ID="btn_submit" runat="server" Text="Save change" CssClass="btn btn-success" OnClick="btn_submit_Click"/>
                 <asp:HyperLink ID="HyperLink1" runat="server" CssClass="btn btn-default" style="margin-left:5px" NavigateUrl="~/admin/counter.aspx">Cancel</asp:HyperLink>                 
             </div>
             
         </div>                  
    </div>

</asp:Content>

