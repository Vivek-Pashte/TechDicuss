<%@ Page Title="" Language="C#" MasterPageFile="~/Usermaster.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="karma.About" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>About us</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        .jumbotron {
            background-color: #21130d;
            color: #76b5c5;
            padding: 100px 25px;
        }
        .container-fluid {
            padding: 60px 50px;
        }
        .bg-grey {
            background-color: #f6f6f6;
        }
        .logo-small {
            color: #21130d;
            font-size: 50px;
        }
        .logo {
            color: #21130d;
            font-size: 200px;
        }
        @media screen and (max-width: 768px) {
            .col-sm-4 {
                text-align: center;
                margin: 25px 0;
            }
        }
    </style>
    <script language="javascript" type="text/javascript">
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
    <div class="jumbotron text-center">
    <h1>TechDiscuss</h1> 
    </div>
    <!-- Container (About Section) -->
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-8">
                <h2>Welcome to TechDiscuss! We are a community of tech enthusiasts who love to discuss and explore the latest 
                    trends, news, and innovations in the world of technology.</h2>           
                <p>Our platform provides a space for individuals from all walks of life to come together and engage in meaningful
                    conversations about the latest gadgets, software, and tech-related topics. Whether you're a seasoned tech 
                    professional or simply curious about the latest advancements, you're sure to find something of interest here.</p> 
                <p>At TechDiscuss, we believe that technology has the power to transform the world and improve people's lives.
                    We are committed to fostering a community that is inclusive, respectful, and open-minded, where everyone 
                    can share their ideas and insights.</p>
                <p>Our team of experienced moderators ensures that our community guidelines are followed, so that everyone feels
                    comfortable and safe participating in our discussions. We encourage constructive and respectful dialogue,
                    and we believe that everyone has something valuable to contribute.</p>
                <p>Join us today and become part of the TechDiscuss community. Together, let's explore the exciting world of 
                    technology and discover how it can change our world for the better.</p>
                <asp:Button  class="btn btn-default btn-lg" ID="Button1" runat="server" Text="Get in Touch" onclick="Button1_Click" />
            </div>
            <div class="col-sm-4">
                <span class="glyphicon glyphicon-signal logo"></span>
            </div>
        </div>
    </div>
    <div class="container-fluid bg-grey">
        <div class="row">
            <div class="col-sm-4">
                <span class="glyphicon glyphicon-globe logo"></span>
            </div>
            <div class="col-sm-8">
                <h2>Our Values</h2>
                <h4><strong>MISSION:</strong>Our mission at TechDiscuss is to create a vibrant and engaged community of tech 
                    enthusiasts who come together to learn, share, and collaborate. We strive to provide a safe and welcoming 
                    environment for everyone to participate in meaningful discussions about the latest advancements in technology, 
                    and to promote the responsible and ethical use of technology for the benefit of society.</h4>      
                <p><strong>VISION:</strong>Our vision is to be the leading platform for tech enthusiasts to connect and engage 
                    with each other, and to stay up-to-date on the latest trends and developments in the world of technology. 
                    We aim to foster a community that is diverse, inclusive, and collaborative, where everyone can feel valued 
                    and empowered to contribute their unique perspectives and ideas. Through our platform, we hope to inspire 
                    and educate the next generation of tech leaders, and to help shape a future where technology is used to 
                    create a better world for all.</p>
            </div>
        </div>
    </div>
    <br />
</asp:Content>
