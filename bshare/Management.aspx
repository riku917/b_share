<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Management.aspx.cs"Inherits="bshare.Management" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml"lang="ja">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        body {
            /*background-color:#2c4f54;*/
        }
        h1 {
            background-color:#203744;
            padding-left:25px;
            text-align:left;
            color:white;
            width: auto;
        }
        .title {
            background-color:#203744;
            color:white;
            /*border-bottom: solid 2px orange;*/
            width: auto;
        }
        .box1 {
            /*background-color:#43676b;*/
            /*width:460px;*/
            display:inline-block;
        }
        .box2 {
            /*background-color:#43676b;*/
            /*width:635px;*/
            display:inline-block;
        }
        td {
           border-collapse: collapse;
            border: 1px solid #ccc;
            line-height: 1.5;
            /*color:white;*/
        }
        th{
            background-color:whitesmoke;
            border-bottom: solid 3px gray;
            border-left: 1px solid #ccc;
            line-height: 1.5;
            
        }
        table {
            border-collapse: collapse;
        }
        .buttondlt{
            background-color:tomato;
        }
        
    </style>


</head>
<body>
    <form id="form1" runat="server">
        <div>

        <h1>
            管理
        </h1>
        <div class="box1">
        <div class="title">
            ユーザー管理
        </div>

        
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="Id" DataSourceID="SqlDataSource2" InsertItemPosition="LastItem">
            <AlternatingItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="削除" CssClass="buttondlt"/>
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="編集" />
                    </td>
                    <td>
                        <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="passwordLabel" runat="server" Text='<%# Eval("password") %>' />
                    </td>
                    <td>
                        <asp:Label ID="typeLabel" runat="server" Text='<%# Eval("type") %>' />
                    </td>
                    <td>
                        <asp:Label ID="HospitalIDLabel" runat="server" Text='<%# Eval("HospitalID") %>' />
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
                        <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="passwordTextBox" runat="server" Text='<%# Bind("password") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="typeTextBox" runat="server" Text='<%# Bind("type") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="HospitalIDTextBox" runat="server" Text='<%# Bind("HospitalID") %>' />
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
                        <asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="passwordTextBox" runat="server" Text='<%# Bind("password") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="typeTextBox" runat="server" Text='<%# Bind("type") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="HospitalIDTextBox" runat="server" Text='<%# Bind("HospitalID") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="削除" CssClass="buttondlt" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="編集" />
                    </td>
                    <td>
                        <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="passwordLabel" runat="server" Text='<%# Eval("password") %>' />
                    </td>
                    <td>
                        <asp:Label ID="typeLabel" runat="server" Text='<%# Eval("type") %>' />
                    </td>
                    <td>
                        <asp:Label ID="HospitalIDLabel" runat="server" Text='<%# Eval("HospitalID") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                <tr runat="server" style="">
                                    <th runat="server"></th>
                                    <th runat="server">Id</th>
                                    <th runat="server">password</th>
                                    <th runat="server">type</th>
                                    <th runat="server">HospitalID</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="">
                            <asp:DataPager ID="DataPager1" runat="server">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    <asp:NumericPagerField />
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="削除" CssClass="buttondlt" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="編集" />
                    </td>
                    <td>
                        <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="passwordLabel" runat="server" Text='<%# Eval("password") %>' />
                    </td>
                    <td>
                        <asp:Label ID="typeLabel" runat="server" Text='<%# Eval("type") %>' />
                    </td>
                    <td>
                        <asp:Label ID="HospitalIDLabel" runat="server" Text='<%# Eval("HospitalID") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:bshare_dbConnectionString %>" SelectCommand="SELECT * FROM [user]" DeleteCommand="DELETE FROM [user] WHERE [Id] = @Id" InsertCommand="INSERT INTO [user] ([Id], [password]) VALUES (@Id, @password)" UpdateCommand="UPDATE [user] SET [password] = @password WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Id" Type="String" />
                <asp:Parameter Name="password" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="Id" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
            </div>

<%----------------------------------------------------------------------------------------------------------------------%>
        <br />
        <br />

        <div class="box2">
        <div class="title">
            空き病床情報
        </div>

        
        <asp:ListView ID="ListView2" runat="server" DataKeyNames="Hospitalname" DataSourceID="SqlDataSource3" InsertItemPosition="LastItem">
            <AlternatingItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="削除"  CssClass="buttondlt"/>
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="編集" />
                    </td>
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
                    <td>
                        <asp:Label ID="HospitalIDLabel" runat="server" Text='<%# Eval("HospitalID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="prefectureLabel" runat="server" Text='<%# Eval("prefecture") %>' />
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
                    <td>
                        <asp:TextBox ID="HospitalIDTextBox" runat="server" Text='<%# Bind("HospitalID") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="prefectureTextBox" runat="server" Text='<%# Bind("prefecture") %>' />
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
                    <td>
                        <asp:TextBox ID="HospitalIDTextBox" runat="server" Text='<%# Bind("HospitalID") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="prefectureTextBox" runat="server" Text='<%# Bind("prefecture") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="削除"  CssClass="buttondlt"/>
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="編集" />
                    </td>
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
                    <td>
                        <asp:Label ID="HospitalIDLabel" runat="server" Text='<%# Eval("HospitalID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="prefectureLabel" runat="server" Text='<%# Eval("prefecture") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                <tr runat="server" style="">
                                    <th runat="server"></th>
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
                                    <th runat="server">HospitalID</th>
                                    <th runat="server">prefecture</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="">
                            <asp:DataPager ID="DataPager1" runat="server">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    <asp:NumericPagerField />
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="削除"  CssClass="buttondlt"/>
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="編集" />
                    </td>
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
                    <td>
                        <asp:Label ID="HospitalIDLabel" runat="server" Text='<%# Eval("HospitalID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="prefectureLabel" runat="server" Text='<%# Eval("prefecture") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:bshare_dbConnectionString %>" SelectCommand="SELECT * FROM [Hospital]" DeleteCommand="DELETE FROM [Hospital] WHERE [Hospitalname] = @Hospitalname" InsertCommand="INSERT INTO [Hospital] ([Hospitalname], [Callnumber], [Bedcount], [log], [Address], [Bedtype], [Bedinfected], [Bedmental], [Bedcovid], [Bedsevere], [HospitalID], [prefecture]) VALUES (@Hospitalname, @Callnumber, @Bedcount, @log, @Address, @Bedtype, @Bedinfected, @Bedmental, @Bedcovid, @Bedsevere, @HospitalID, @prefecture)" UpdateCommand="UPDATE [Hospital] SET [Callnumber] = @Callnumber, [Bedcount] = @Bedcount, [log] = @log, [Address] = @Address, [Bedtype] = @Bedtype, [Bedinfected] = @Bedinfected, [Bedmental] = @Bedmental, [Bedcovid] = @Bedcovid, [Bedsevere] = @Bedsevere, [HospitalID] = @HospitalID, [prefecture] = @prefecture WHERE [Hospitalname] = @Hospitalname">
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
                <asp:Parameter Name="HospitalID" Type="Int32" />
                <asp:Parameter Name="prefecture" Type="String" />
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
                <asp:Parameter Name="HospitalID" Type="Int32" />
                <asp:Parameter Name="prefecture" Type="String" />
                <asp:Parameter Name="Hospitalname" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
            </div>
            <br />

            <asp:Button ID="Button1" runat="server" Text="戻る" OnClick="Button1_Click" />
       
    </form>
</body>
</html>
