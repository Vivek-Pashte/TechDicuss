<%@ Page Title="" Language="C#" MasterPageFile="~/Usermaster.Master" AutoEventWireup="true" CodeBehind="QNA.aspx.cs" Inherits="karma.QNA" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!---image slider---->
    <div class="container">
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>
            <!-- Wrapper for slides -->
            <div class="carousel-inner">

                <div class="item active">
                    <asp:Repeater ID="rptrImage1" runat="server">
                        <ItemTemplate>
                            <img src='https://source.unsplash.com/2400x800/?<%# Eval("TName") %>' alt="imageslider" style="width: 100%; height: 500px;" />
                        </ItemTemplate>
                    </asp:Repeater>
                    <div class="carousel-caption">
                        <asp:Repeater ID="rptrdes1" runat="server">
                            <ItemTemplate>
                                <p><%#Eval("Description") %></p>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>

                <div class="item">
                    <asp:Repeater ID="rptrImage2" runat="server">
                        <ItemTemplate>
                            <img src='https://source.unsplash.com/2400x800/?<%# Eval("TName") %>' alt="imageslider" style="width: 100%; height: 500px;" />
                        </ItemTemplate>
                    </asp:Repeater>
                    <div class="carousel-caption">
                        <asp:Repeater ID="rptrdes2" runat="server">
                            <ItemTemplate>
                                <p><%#Eval("Description") %></p>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
                <div class="item">
                    <asp:Repeater ID="rptrImage3" runat="server">
                        <ItemTemplate>
                            <img src='https://source.unsplash.com/2400x800/?<%# Eval("TName") %>' alt="imageslider" style="width: 100%; height: 500px;" />
                        </ItemTemplate>
                    </asp:Repeater>
                    <div class="carousel-caption">
                        <asp:Repeater ID="rptrdes3" runat="server">
                            <ItemTemplate>
                                <p><%#Eval("Description") %></p>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span><span class="sr-only">Previous</span> </a><a class="right carousel-control"
                href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span><span class="sr-only">Next</span> </a>
        </div>
    </div>
    <!---image slider End---->

    <!--add question-->
    <div class="form-horizontal">
        <br />
        <br />
        <h2>Add Questions</h2>
        <hr />
        <div class="form-group">
            <asp:Label ID="Label1" runat="server" CssClass="col-md-3 control-label" Text="Question"></asp:Label>
            <div class="col-md-3">
                <asp:TextBox ID="txtQuestion" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="form-group">
            <asp:Label ID="Label11" runat="server" CssClass="col-md-3 control-label" Text="Upload Question Image"></asp:Label>
            <div class="col-md-3">
                <asp:FileUpload ID="fuImg1" CssClass="form-control" runat="server" />
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-3 "></div>
            <div class="col-md-6 ">
                <asp:Button ID="btnAdd" CssClass="btn btn-success " runat="server" Text="ADD Question" OnClick="btnAdd_Click" />
            </div>
        </div>
    </div>

    <!--view questions-->
    <div class="row" style="padding-top: 50px">
        <asp:TextBox ID="txtFilterGrid1Record" CssClass="form-control" runat="server" placeholder="Search Question" AutoPostBack="true" OnTextChanged="txtFilterGrid1Record_TextChanged"></asp:TextBox>
        <hr />
        <asp:Label ID="Label2" runat="server"></asp:Label>
        <br />
        <br />
        <asp:Repeater ID="rptrQuestion" runat="server" >
            <ItemTemplate>
                <div class="col-sm-12 col-md-1">
                    <a href="ANS.aspx?TID=<%# Eval("QID") %>" >
                        <div class="thumbnail">
                            <div class="proName "><%# Eval ("Question") %> </div>                            
                        </div>
                    </a>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

</asp:Content>
