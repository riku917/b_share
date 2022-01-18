<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="bshare.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml"lang="ja">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script type="module" src="index.js"></script>
    <style>
        body{
            background-color:white;
        }
        .box1{
            background-color:white;
            width:700px;
            margin:auto;
        }
        h1 {
            text-align:center;
            background: #1B73BA;

            box-sizing: border-box;
            color: white;
            font-size: 30px;
            /*margin-bottom: 20px;*/
            padding: 5px;
            position: relative;
            width: 100%;
        }
        .box2{
            padding-left:20px;
        }
        td {
           
            color:whitesmoke;
        }
        th{
            
            /*border-bottom: solid 3px gray;*/
            border-left: 1px solid #ccc;
            line-height: 2.5;
            
        }
        table {
            border-collapse:  collapse;
            border:  solid  3px  #1b7c26;
        }
        .boxbtn{
            text-align:center;
            padding-right:20px;
            background-color:white;
        }
        .backbtn {
            width:100px;
        }
        .backbtn:hover{
            background-color:darkgray;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="bg.css"/>
</head>
<body>
    <div id="particles-js"></div>
    <div id="wrapper">
    <form id="form1" runat="server">

        <div class="box1">
                <h1>
                更新
            </h1>
        
        <div class="box2">
            病院名
            <asp:Label ID="Label1" runat="server" Text="病院名"></asp:Label>
            <br />
            <table>
                <tr>
                    <th>
                        <asp:Label ID="Label3" runat="server" Text="空き病床"></asp:Label>
                    </th>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server" TextMode="Number"></asp:TextBox>
            <asp:Button ID="Button3" runat="server" Text="更新" OnClick="Button3_Click"/>
                    </td>
                </tr>
                
                <tr>
                    <th>
                         <asp:Label ID="Label6" runat="server" Text="一般病床"></asp:Label>
                    </th>
                    <td>
                        <asp:TextBox ID="TextBox6" runat="server" TextMode="Number"></asp:TextBox>
                        <asp:Button ID="Button6" runat="server" Text="更新" OnClick="Button6_Click"/>
                    </td>
                </tr>
                <tr>
                    <th>
                        <asp:Label ID="Label7" runat="server" Text="感染者病床"></asp:Label>
                    </th>
                    <td>
                        <asp:TextBox ID="TextBox7" runat="server" TextMode="Number"></asp:TextBox>
                        <asp:Button ID="Button7" runat="server" Text="更新" OnClick="Button7_Click"/>
                    </td>
                </tr>
                <tr>
                    <th>
                        <asp:Label ID="Label8" runat="server" Text="精神病床"></asp:Label>
                    </th>
                    <td>
                        <asp:TextBox ID="TextBox8" runat="server" TextMode="Number"></asp:TextBox>
                        <asp:Button ID="Button8" runat="server" Text="更新" OnClick="Button8_Click"/>
                    </td>
                </tr>
                <tr>
                    <th>
                        <asp:Label ID="Label9" runat="server" Text="コロナ病床"></asp:Label>
                    </th>
                    <td>
                        <asp:TextBox ID="TextBox9" runat="server" TextMode="Number"></asp:TextBox>
                        <asp:Button ID="Button9" runat="server" Text="更新" OnClick="Button9_Click"/>
                    </td>
                </tr>
                <tr>
                    <th>
                        <asp:Label ID="Label10" runat="server" Text="重症病床"></asp:Label>
                    </th>
                    <td>
                        <asp:TextBox ID="TextBox10" runat="server" TextMode="Number"></asp:TextBox>
                        <asp:Button ID="Button10" runat="server" Text="更新" OnClick="Button10_Click"/>
                    </td>
                </tr>
            </table>
                   </div>
        <br />
        <div class="boxbtn">
            <asp:Button ID="Button0" runat="server" Text="戻る" OnClick="Button0_Click" CssClass="backbtn"/>
        </div>
        </div>
    </form>
    </div>
    <script src="bg2.js"></script>
    <script src="bg.js"></script>
</body>
</html>
