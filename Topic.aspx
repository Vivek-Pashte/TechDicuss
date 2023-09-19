<%@ Page Title="" Language="C#" MasterPageFile="~/Usermaster.Master" AutoEventWireup="true" CodeBehind="Topic.aspx.cs" Inherits="karma.Topic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                    <img src="imageslider/img1.jpg" alt="imageslider" style="width: 100%; height: 500px;" />
                    <div class="carousel-caption">
                        <p>The Future of Technology: An In-Depth Conversation</p>
                    </div>
                </div>
                <div class="item">
                    <img src="imageslider/img2.jpg" alt="imageslider" style="width: 100%; height: 500px;" />
                    <div class="carousel-caption">
                        <p>Unpacking Cutting-Edge Technology: A Roundtable Discussion</p>
                    </div>
                </div>
                <div class="item">
                    <img src="imageslider/img4.jpg" alt="imageslider" style="width: 100%; height: 500px;" />
                    <div class="carousel-caption">
                        <p>Transforming the World with Technology: An Interactive Discussion</p>
                    </div>
                </div>
            </div>
            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span><span class="sr-only">Previous</span> </a><a class="right carousel-control"
                href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span><span class="sr-only">Next</span> </a>
        </div>
    </div>
    <!---image slider End---->

    <div class="row" style="padding-top: 50px">
        <asp:TextBox ID="txtFilterGrid1Record" CssClass="form-control" runat="server" placeholder="Search Topic" AutoPostBack="true" OnTextChanged="txtFilterGrid1Record_TextChanged"></asp:TextBox>
        <hr />
        <asp:Label ID="Label1" runat="server"></asp:Label>
        <br />
        <br />
        <asp:Repeater ID="rptrTopic" runat="server">
            <ItemTemplate>
                <div class="col-sm-3 col-md-3">
                    <a href="QNA.aspx?TID=<%# Eval("TID") %>" style="text-decoration: none;">
                        <div class="thumbnail">
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("Image")%>' AlternateText='<%#Eval("Image")%>' Height="200px" Style="margin: auto;" />
                            <div class="caption">

                                <div class="proName center"><%# Eval ("TName") %> </div>

                            </div>
                        </div>
                    </a>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
