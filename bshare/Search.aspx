<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="Bshare001.Search" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>検索画面</title>

    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="./jquery.rwdImageMaps.js"></script>
</head>
<body>
    <strong>検索画面</strong>
    <form id="form1" runat="server">
        <br />
        <div>
            <map name="map">
                <area shape="rect" coords="367, 18, 579, 166" title="北海道" class="image-pref"/>
                <area shape="rect" coords="379, 166, 454, 205" title="青森県" class="image-pref"/>
                <area shape="rect" coords="422, 211, 458, 265" title="岩手県" class="image-pref"/>
                <area shape="rect" coords="407, 271, 448, 310" title="宮城県" class="image-pref"/>
                <area shape="rect" coords="387, 206, 423, 253" title="秋田県" class="image-pref"/>
                <area shape="rect" coords="371, 258, 407, 301" title="山形県" class="image-pref"/>
                <area shape="rect" coords="369, 305, 420, 337" title="福島県" class="image-pref"/>
          </map>
            <img src="/image/prefmap2.png" usemap="#map" border="0" class="img-fluid" style="outline: rgb(34, 116, 107) solid 1px;"/>
            
        <asp:ListBox ID="ListBox1" runat="server" DataSourceID="SqlDataSource1" DataTextField="prefecture" DataValueField="prefecture"></asp:ListBox>
            </div>
        <asp:TextBox ID="TextBox1" runat="server" Text="" OnTextChanged="TbChanged"></asp:TextBox>
            <%--<asp:Image ID="Image001" runat="server" ImageUrl="~/images/prefmap2.png" Height="200px" Width="200px" />--%>
        【都道府県】<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="prefecture" DataValueField="prefecture" OnSelectedIndexChanged="DdlChange">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [prefecture] FROM [Hospital]"></asp:SqlDataSource>
        <br />
        <br />
        ●病床選択
        <br />
        <br />
        <asp:Panel ID="Panel1" runat="server">

        <asp:RadioButton ID="RadioButton1" text="一般病床" runat="server" GroupName="Groupbed"/>　　
        <asp:RadioButton ID="RadioButton2" text="感染者病床" runat="server" BorderColor="#FF6600" GroupName="Groupbed"/>
        <asp:RadioButton ID="RadioButton3" text="精神病床" runat="server"  GroupName="Groupbed"/>
         </asp:Panel>
        <asp:Panel ID="Panel2" runat="server">

        <asp:RadioButton ID="RadioButton4" text="コロナ病床" runat="server" BorderColor="#FF6600" GroupName="Groupbed"/>
        <asp:RadioButton ID="RadioButton5" text="重症病床" runat="server"  GroupName="Groupbed"/>
         </asp:Panel>

        <br />

        <br />

        <input type="button" name="name" value="戻る" onclick="history.back()" />
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

        
        <asp:Button ID="Button1" runat="server" Text="更新" OnClick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" Text="管理" OnClick="Button2_Click" />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </form>
    <script>jQuery('img[usemap]').rwdImageMaps();
        jQuery('.image-pref').on('click', function () {
            var pref = jQuery(this).attr('title');
            $('#TextBox1').val(pref);
            return false;
        });
        jQuery('#DropDownList1').change(function () {
            $('#TextBox1').val(jQuery(this).val());
            return false;
        });
    </script>
</body>
</html>
