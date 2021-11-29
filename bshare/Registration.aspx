<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="bshare.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>
                登録・更新
            </h1>
        </div>
        <asp:Label ID="Label5" runat="server" Text="デバッグラベル"></asp:Label>
        <br />
        <div>
            病院名
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            電話番号
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            空き病床数
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <br />
            log
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <br />
            住所
            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            <br />
            一般病床
            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
            <br />
            感染者病床
            <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
            <br />
            精神病床
            <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
            <br />
            コロナ病床
            <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
            <br />
            重症病床
            <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
            <br />
        </div>
        <br />
        <div>
            <asp:Button ID="Button3" runat="server" Text="登録" OnClick="Button3_Click" />
        </div>
        <br />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
        <br />
        <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
        <br />
        <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
        <div>
            <asp:Button ID="Button1" runat="server" Text="戻る" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>
