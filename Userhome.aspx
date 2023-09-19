<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Userhome.aspx.cs" Inherits="karma.Userhome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TechDiscuss</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta http-equiv="X-UA-Compatible" content="Google Chrome" />
    <link href="css/Custome.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <div class="navbar navbar-default navbar-fixed-top" role="navigation">
                <div class="container ">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle " data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
                            <span class="icon-bar"></span><span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="WebForm1.aspx">
                            <span>
                                <img src="icons/Techdiscuss.png" alt="TechDiscuss" height="30" /></span>TechDiscuss
                        </a>
                    </div>
                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li class="active"><a href="WebForm1.aspx">Home</a> </li>
                            <li><a href="About.aspx">About</a> </li>
                            <li><a href="#">Contact US</a> </li>
                            <%--<li><a href="#">Blog-</a> </li>--%>
                            <li class="drodown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Category<b class="caret"></b></a>
                                <ul class="dropdown-menu ">
                                    <li><a href="#">Category</a> </li>
                                    <li><a href="#">Category</a> </li>
                                    <li><a href="#">Category</a> </li>

                                </ul>

                            </li>
                            <li id="btnSignUP" runat="server"><a href="Singup.aspx">SignUp</a> </li>
                            <li id="btnSignIN" runat="server"><a href="SignIn.aspx">Login</a> </li>
                            <li>
                                <asp:Button ID="btnlogout" CssClass="btn btn-default navbar-btn " runat="server" Text="Sign Out" OnClick="btnlogout_Click" />
                            </li>

                        </ul>

                    </div>

                </div>

            </div>
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
            <div class="row" style="padding-top: 50px; margin: 10px">

                <asp:TextBox ID="txtFilterGrid1Record" CssClass="form-control" runat="server" placeholder="Search" AutoPostBack="true" OnTextChanged="txtFilterGrid1Record_TextChanged"></asp:TextBox>
                <hr />

                <asp:Label ID="Label1" runat="server"></asp:Label>
                <br />
                <br />
                <asp:Repeater ID="rptrProducts" runat="server">
                    <ItemTemplate>
                        <div class="col-sm-3 col-md-3">
                            <a href="ProductView.aspx?PID=<%# Eval("PID") %>" style="text-decoration: none;">
                                <div class="thumbnail">
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("Image")%>' AlternateText='<%#Eval("Image")%>' Height="200px" Style="margin: auto;" />
                                    <div class="caption">
                                        <div class="probrand"><%# Eval ("BrandName") %>  </div>
                                        <div class="proName"><%# Eval ("PName") %> </div>
                                        <div class="proPrice"><%#Eval("PPrice","{0:c}") %></div>

                                    </div>
                                </div>
                            </a>
                        </div>

                    </ItemTemplate>
                </asp:Repeater>
            </div>

        </div>

        <!--footer contents start--->
        <footer>
            <div class="container ">
                <p class="pull-right"><a href="#">Back to top</a></p>
                <p>&copy; 2022 VivekPashte.in &middot; <a href="Userhome.aspx">Home</a>&middot;<a href="#">About</a>&middot;<a href="#">Contact</a>&middot;<a href="#">Products</a></p>
            </div>
        </footer>
        <!--footer Contents end --->

    </form>
</body>
</html>
