<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="adminhome.aspx.cs" Inherits="karma.adminhome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">
        <div class="form-horizontal">
            <br />
            <br />
            <h2>Add Topic</h2>
            <hr />
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" CssClass="col-md-2 control-label" Text="Topic Name"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtTopicName" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label9" runat="server" CssClass="col-md-2 control-label" Text="Description"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtdescription" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label11" runat="server" CssClass="col-md-2 control-label" Text="Upload Image"></asp:Label>
                <div class="col-md-3">
                    <asp:FileUpload ID="fuImg1" CssClass="form-control" runat="server" />
                </div>
            </div>            
            <div class="form-group">
                <div class="col-md-2 "></div>
                <div class="col-md-6 ">
                    <asp:Button ID="btnAdd" CssClass="btn btn-success " runat="server" Text="ADD Topic" OnClick="btnAdd_Click" />
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <hr />
        <%--<div class="panel panel-primary">
            <div class="panel-heading">
                <h2>Topic</h2>
            </div>
            <div class="panel-body">
                <div class="col-md-12">
                    <div class="form-group">
                        <div class="table table-responsive">
                            <asp:GridView ID="GridView1" runat="server" CssClass="table" AutoGenerateColumns="false">
                                <Columns>
                                    <asp:BoundField DataField="PID" HeaderText="P.ID" />
                                    <asp:BoundField DataField="TName" HeaderText="Topic Name" />
                                    <asp:BoundField DataField="PPrice" HeaderText="Price" />
                                    <asp:BoundField DataField="PBrandID" HeaderText="Brand" />
                                    <asp:BoundField DataField="PCategoryID" HeaderText="Category" />
                                    <asp:BoundField DataField="SizeName" HeaderText="Size" />
                                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                                    <asp:TemplateField HeaderText="Photo">
                                        <ItemTemplate>
                                            <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("image")%>' Height="80px" Style="margin: 5px;" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                      <asp:CommandField ShowDeleteButton="true"  HeaderText="Delete"/>
                               </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>--%>
    </div>
</asp:Content>
