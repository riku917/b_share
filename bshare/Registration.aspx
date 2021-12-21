<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="bshare.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="ja">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script type="module" src="index.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>
                更新
            </h1>
        </div>
        <div>
            病院名
            <asp:Label ID="Label1" runat="server" Text="病院名"></asp:Label>
            <br />
            <asp:Label ID="Label3" runat="server" Text="空き病床"></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server" TextMode="Number"></asp:TextBox>
            <asp:Button ID="Button3" runat="server" Text="更新" OnClick="Button3_Click"/>
            <br />
            <asp:Label ID="Label6" runat="server" Text="一般病床"></asp:Label>
            <asp:TextBox ID="TextBox6" runat="server" TextMode="Number"></asp:TextBox>
            <asp:Button ID="Button6" runat="server" Text="更新" OnClick="Button6_Click"/>
            <br />
            <asp:Label ID="Label7" runat="server" Text="感染者病床"></asp:Label>
            <asp:TextBox ID="TextBox7" runat="server" TextMode="Number"></asp:TextBox>
            <asp:Button ID="Button7" runat="server" Text="更新" OnClick="Button7_Click"/>
            <br />
            <asp:Label ID="Label8" runat="server" Text="精神病床"></asp:Label>
            <asp:TextBox ID="TextBox8" runat="server" TextMode="Number"></asp:TextBox>
            <asp:Button ID="Button8" runat="server" Text="更新" OnClick="Button8_Click"/>
            <br />
            <asp:Label ID="Label9" runat="server" Text="コロナ病床"></asp:Label>
            <asp:TextBox ID="TextBox9" runat="server" TextMode="Number"></asp:TextBox>
            <asp:Button ID="Button9" runat="server" Text="更新" OnClick="Button9_Click"/>
            <br />
            <asp:Label ID="Label10" runat="server" Text="重症病床"></asp:Label>
            <asp:TextBox ID="TextBox10" runat="server" TextMode="Number"></asp:TextBox>
            <asp:Button ID="Button10" runat="server" Text="更新" OnClick="Button10_Click"/>
        </div>
        <br />
        <div>
            <asp:Button ID="Button0" runat="server" Text="戻る" OnClick="Button0_Click" />
        </div>
    </form>
</body>
</html>
