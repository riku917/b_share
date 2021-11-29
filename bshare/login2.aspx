﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="b_share_login.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>ログイン</title>
    <style>
        .body1{
            background-color: red;
        }
        .labeltitle {
            width:550px;
            height:55px;
            background-color:teal;
            margin : 0 auto;
        }
        
        .title{
            line-height: 55px;
            padding: 20px;
        }
        
        .kiso {
            padding-top: 10px;
            text-align: center;
        }
        /*ユーザID パスワードのラベルの位置*/
        .label {
             padding-left:15px;
             
        }
        /*テキストボックスの大きさと形*/
        .textbox {
            width:500px;
            height:30px;
            border-radius:10px;
        }
        /*ボタンの色と大きさ*/
        .button {
             background-color:teal;
             width:500px;
             height:40px;
        }
        /*ボタンの位置*/
        .buttondiv {
            padding-top: 50px;
            text-align: center;
        }
        /*ボタン色*/
        .button:hover {
            background-color: darkslategray;
        }
         /*背景の色と大きさ*/
        .back {
             margin : 0 auto;
             width:550px;
             height:450px;
             background-color: whitesmoke;
        }
        

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="body1">
        <div class="back">
        <div class="labeltitle">
            <asp:Label ID="Label2" runat="server" Text="Bシェア :  ログイン" Font-Size="40px" ForeColor="White" CssClass="title" ></asp:Label>
        </div>
        
        <br />
        <div class="label">
            <asp:Label ID="Label1" runat="server" Text="ユーザID"  CssClass="label" Font-Size="30px"></asp:Label>
        </div>
        <div class="kiso">
            <asp:TextBox ID="loginID" runat="server" CssClass="textbox"></asp:TextBox>
        </div>
        <br />
        <div class="label">
            <asp:Label ID="Label3" runat="server" Text="パスワード" CssClass="label" Font-Size="30px"></asp:Label>
        </div>
        <div class="kiso">
            <asp:TextBox ID="password" runat="server" TextMode="Password" CssClass="textbox"></asp:TextBox>
        </div>
        <br />
       <div class="buttondiv">
           <asp:Button ID="Button1" runat="server" Text="ログイン" OnClick="Button1_Click" CssClass="button" ForeColor="White"  />
       </div>

            <br />
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem>0</asp:ListItem>
            <asp:ListItem>1</asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
        </asp:DropDownList>
        <br />
            <asp:Button ID="Button2" runat="server" Text="Go" OnClick="Button2_Click" />


       </div>
        </div>
    </form>
</body>
</html>