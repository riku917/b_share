<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="Bshare001.Search" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>検索画面</title>
</head>
<body>
    <strong>検索画面</strong>
    <form id="form1" runat="server">
        <div>
        </div>

        <br />

        
            <asp:Image ID="Image001" runat="server" ImageUrl="~/images/prefmap2.png" Height="200px" Width="200px" />
        【都道府県】<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="prefecture" DataValueField="prefecture"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [prefecture] FROM [Hospital]"></asp:SqlDataSource>
        <br />
        <br />
        ●病床選択
        <br />
        <br />
        <asp:Panel ID="Panel1" runat="server">

        <asp:RadioButton ID="RadioButton1" text="一般病床" runat="server" GroupName="Groupbed" value=""/>　　
        <asp:RadioButton ID="RadioButton2" text="感染者病床" runat="server" BorderColor="#FF6600" GroupName="Groupbed" />　　
        <asp:RadioButton ID="RadioButton3" text="精神病床" runat="server"  GroupName="Groupbed" />
         </asp:Panel>
        <asp:Panel ID="Panel2" runat="server">

        <asp:RadioButton ID="RadioButton4" text="コロナ病床" runat="server" BorderColor="#FF6600" GroupName="Groupbed" />　　
        <asp:RadioButton ID="RadioButton5" text="重症病床" runat="server"  GroupName="Groupbed" />
         </asp:Panel>

        <br />

        <br />

        <input type="button" name="name" value="戻る" onclick="history.back()" />
         <%--<input type="button" id="Search_button" name="name" value="検索"  />--%>
        <asp:Button ID="Search_button" runat="server" Text="検索" OnClick="Search_button_Click"  />
      

        <asp:DataList ID="DataList1" runat="server" DataKeyField="Hospitalname" DataSourceID="SqlDataSource2">
            <ItemTemplate>
                Hospitalname:
                <asp:Label ID="HospitalnameLabel" runat="server" Text='<%# Eval("Hospitalname") %>' />
                <br />
                Callnumber:
                <asp:Label ID="CallnumberLabel" runat="server" Text='<%# Eval("Callnumber") %>' />
                <br />
                Bedcount:
                <asp:Label ID="BedcountLabel" runat="server" Text='<%# Eval("Bedcount") %>' />
                <br />
                Address:
                <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
                <br />
                <br />
            </ItemTemplate>
        </asp:DataList>


        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Hospitalname], [Callnumber], [Bedcount], [Address] FROM [Hospital]"></asp:SqlDataSource>


        <asp:ListBox ID="ListBox1" runat="server" DataSourceID="SqlDataSource1" DataTextField="prefecture" DataValueField="prefecture"></asp:ListBox>


    </form>
</body>
</html>
