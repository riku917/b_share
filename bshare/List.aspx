<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="bshare.List" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            空き病床リスト
        </div>
        <p>検索機能、inの副問い合わせで病床と
        </p>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <div>
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="Hospitalname" DataSourceID="SqlDataSource1">
                <AlternatingItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label ID="HospitalnameLabel" runat="server" Text='<%# Eval("Hospitalname") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CallnumberLabel" runat="server" Text='<%# Eval("Callnumber") %>' />
                        </td>
                        <td>
                            <asp:Label ID="BedcountLabel" runat="server" Text='<%# Eval("Bedcount") %>' />
                        </td>
                        <td>
                            <asp:Label ID="logLabel" runat="server" Text='<%# Eval("log") %>' />
                        </td>
                        <td>
                            <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
                        </td>
                        <td>
                            <asp:Label ID="BedtypeLabel" runat="server" Text='<%# Eval("Bedtype") %>' />
                        </td>
                        <td>
                            <asp:Label ID="BedinfectedLabel" runat="server" Text='<%# Eval("Bedinfected") %>' />
                        </td>
                        <td>
                            <asp:Label ID="BedmentalLabel" runat="server" Text='<%# Eval("Bedmental") %>' />
                        </td>
                        <td>
                            <asp:Label ID="BedcovidLabel" runat="server" Text='<%# Eval("Bedcovid") %>' />
                        </td>
                        <td>
                            <asp:Label ID="BedsevereLabel" runat="server" Text='<%# Eval("Bedsevere") %>' />
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="更新" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="キャンセル" />
                        </td>
                        <td>
                            <asp:Label ID="HospitalnameLabel1" runat="server" Text='<%# Eval("Hospitalname") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="CallnumberTextBox" runat="server" Text='<%# Bind("Callnumber") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="BedcountTextBox" runat="server" Text='<%# Bind("Bedcount") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="logTextBox" runat="server" Text='<%# Bind("log") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="BedtypeTextBox" runat="server" Text='<%# Bind("Bedtype") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="BedinfectedTextBox" runat="server" Text='<%# Bind("Bedinfected") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="BedmentalTextBox" runat="server" Text='<%# Bind("Bedmental") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="BedcovidTextBox" runat="server" Text='<%# Bind("Bedcovid") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="BedsevereTextBox" runat="server" Text='<%# Bind("Bedsevere") %>' />
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>データは返されませんでした。</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="挿入" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="クリア" />
                        </td>
                        <td>
                            <asp:TextBox ID="HospitalnameTextBox" runat="server" Text='<%# Bind("Hospitalname") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="CallnumberTextBox" runat="server" Text='<%# Bind("Callnumber") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="BedcountTextBox" runat="server" Text='<%# Bind("Bedcount") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="logTextBox" runat="server" Text='<%# Bind("log") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="BedtypeTextBox" runat="server" Text='<%# Bind("Bedtype") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="BedinfectedTextBox" runat="server" Text='<%# Bind("Bedinfected") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="BedmentalTextBox" runat="server" Text='<%# Bind("Bedmental") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="BedcovidTextBox" runat="server" Text='<%# Bind("Bedcovid") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="BedsevereTextBox" runat="server" Text='<%# Bind("Bedsevere") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label ID="HospitalnameLabel" runat="server" Text='<%# Eval("Hospitalname") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CallnumberLabel" runat="server" Text='<%# Eval("Callnumber") %>' />
                        </td>
                        <td>
                            <asp:Label ID="BedcountLabel" runat="server" Text='<%# Eval("Bedcount") %>' />
                        </td>
                        <td>
                            <asp:Label ID="logLabel" runat="server" Text='<%# Eval("log") %>' />
                        </td>
                        <td>
                            <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
                        </td>
                        <td>
                            <asp:Label ID="BedtypeLabel" runat="server" Text='<%# Eval("Bedtype") %>' />
                        </td>
                        <td>
                            <asp:Label ID="BedinfectedLabel" runat="server" Text='<%# Eval("Bedinfected") %>' />
                        </td>
                        <td>
                            <asp:Label ID="BedmentalLabel" runat="server" Text='<%# Eval("Bedmental") %>' />
                        </td>
                        <td>
                            <asp:Label ID="BedcovidLabel" runat="server" Text='<%# Eval("Bedcovid") %>' />
                        </td>
                        <td>
                            <asp:Label ID="BedsevereLabel" runat="server" Text='<%# Eval("Bedsevere") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                    <tr runat="server" style="">
                                        <th runat="server">Hospitalname</th>
                                        <th runat="server">Callnumber</th>
                                        <th runat="server">Bedcount</th>
                                        <th runat="server">log</th>
                                        <th runat="server">Address</th>
                                        <th runat="server">Bedtype</th>
                                        <th runat="server">Bedinfected</th>
                                        <th runat="server">Bedmental</th>
                                        <th runat="server">Bedcovid</th>
                                        <th runat="server">Bedsevere</th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style=""></td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label ID="HospitalnameLabel" runat="server" Text='<%# Eval("Hospitalname") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CallnumberLabel" runat="server" Text='<%# Eval("Callnumber") %>' />
                        </td>
                        <td>
                            <asp:Label ID="BedcountLabel" runat="server" Text='<%# Eval("Bedcount") %>' />
                        </td>
                        <td>
                            <asp:Label ID="logLabel" runat="server" Text='<%# Eval("log") %>' />
                        </td>
                        <td>
                            <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
                        </td>
                        <td>
                            <asp:Label ID="BedtypeLabel" runat="server" Text='<%# Eval("Bedtype") %>' />
                        </td>
                        <td>
                            <asp:Label ID="BedinfectedLabel" runat="server" Text='<%# Eval("Bedinfected") %>' />
                        </td>
                        <td>
                            <asp:Label ID="BedmentalLabel" runat="server" Text='<%# Eval("Bedmental") %>' />
                        </td>
                        <td>
                            <asp:Label ID="BedcovidLabel" runat="server" Text='<%# Eval("Bedcovid") %>' />
                        </td>
                        <td>
                            <asp:Label ID="BedsevereLabel" runat="server" Text='<%# Eval("Bedsevere") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Hospital]" DeleteCommand="DELETE FROM [Hospital] WHERE [Hospitalname] = @Hospitalname" InsertCommand="INSERT INTO [Hospital] ([Hospitalname], [Callnumber], [Bedcount], [log], [Address], [Bedtype], [Bedinfected], [Bedmental], [Bedcovid], [Bedsevere]) VALUES (@Hospitalname, @Callnumber, @Bedcount, @log, @Address, @Bedtype, @Bedinfected, @Bedmental, @Bedcovid, @Bedsevere)" UpdateCommand="UPDATE [Hospital] SET [Callnumber] = @Callnumber, [Bedcount] = @Bedcount, [log] = @log, [Address] = @Address, [Bedtype] = @Bedtype, [Bedinfected] = @Bedinfected, [Bedmental] = @Bedmental, [Bedcovid] = @Bedcovid, [Bedsevere] = @Bedsevere WHERE [Hospitalname] = @Hospitalname">
                <DeleteParameters>
                    <asp:Parameter Name="Hospitalname" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Hospitalname" Type="String" />
                    <asp:Parameter Name="Callnumber" Type="Int32" />
                    <asp:Parameter Name="Bedcount" Type="Int32" />
                    <asp:Parameter Name="log" Type="DateTime" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="Bedtype" Type="Int32" />
                    <asp:Parameter Name="Bedinfected" Type="Int32" />
                    <asp:Parameter Name="Bedmental" Type="Int32" />
                    <asp:Parameter Name="Bedcovid" Type="Int32" />
                    <asp:Parameter Name="Bedsevere" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Callnumber" Type="Int32" />
                    <asp:Parameter Name="Bedcount" Type="Int32" />
                    <asp:Parameter Name="log" Type="DateTime" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="Bedtype" Type="Int32" />
                    <asp:Parameter Name="Bedinfected" Type="Int32" />
                    <asp:Parameter Name="Bedmental" Type="Int32" />
                    <asp:Parameter Name="Bedcovid" Type="Int32" />
                    <asp:Parameter Name="Bedsevere" Type="Int32" />
                    <asp:Parameter Name="Hospitalname" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <asp:Button ID="Button1" runat="server" Text="更新" OnClick="Button1_Click" />
        <div>
        <asp:Button ID="Button2" runat="server" Text="管理" OnClick="Button2_Click" />
        </div>
    </form>
</body>
</html>
