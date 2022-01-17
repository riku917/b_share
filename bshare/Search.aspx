<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="Bshare001.Search" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="ja">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>検索画面</title>

    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="./jquery.rwdImageMaps.js"></script>
    <style>
        body {
            background-color:whitesmoke;
        }
        .image-pref{
            cursor:pointer
        }
        h1 {
            background: #1B73BA;
            box-sizing: border-box;
            color: #FFFFFF;
            font-size: 30px;
            /*margin-bottom: 30px;*/
            padding: 5px;
            position: relative;
            width: 100%;
        }
        .boxtitle {
            margin:auto;
            width:700px;
        }
        .box {
            text-align:center;
            margin:auto;
            width:700px;
            /*margin-left:30px;*/
            background-color:white;
        }
        .mapbox {
            /*border-bottom:solid 2px;*/
            
        }
        .box1 {
            text-align:left;
            border:  solid  3px  #1b7c26;
            padding-left:20px;
        }
        .ragio {
            width:510px;
            /*background-color:white;*/
            margin-left:20px;
            border:  solid  2px  #d3d3d3;
            
        }
        .buttonSearch {
            width:300px;
            height:30px;
        }
        .buttonSearch:hover{
            background-color:darkgray;
        }
        .buttonback:hover {
            background-color:darkgray;
        }
    </style>
    
    <link rel="stylesheet" type="text/css" href="bg.css"/>
</head>
<body>
    <div id="map-container"></div>
    <div class="boxtitle">
        
    </div>
    
    <form id="form1" runat="server">
     <div id="particles-js"></div>
    <div id="wrapper">
        <div class="box">
        
        <div class="mapbox">
            <h1>検索画面</h1>
            <map name="map">
                <area shape="rect" coords="367, 18, 579, 166" title="北海道" class="image-pref"/>

                <area shape="rect" coords="379, 166, 454, 205" title="青森県" class="image-pref"/>
                <area shape="rect" coords="422, 211, 458, 265" title="岩手県" class="image-pref"/>
                <area shape="rect" coords="407, 271, 448, 310" title="宮城県" class="image-pref"/>
                <area shape="rect" coords="387, 206, 423, 253" title="秋田県" class="image-pref"/>
                <area shape="rect" coords="371, 258, 407, 301" title="山形県" class="image-pref"/>
                <area shape="rect" coords="369, 305, 420, 337" title="福島県" class="image-pref"/>
                
                <area shape="rect" coords="385,351,428,375" title="茨城県" class="image-pref"/>
                <area shape="rect" coords="363,331,400,354" title="栃木県" class="image-pref"/>
                <area shape="rect" coords="342,331,365,360" title="群馬県" class="image-pref"/>
                <area shape="rect" coords="343,354,379,374" title="埼玉県" class="image-pref"/>
                <area shape="rect" coords="389,385,428,408" title="千葉県" class="image-pref"/>
                <area shape="rect" coords="353,373,391,393" title="東京都" class="image-pref"/>
                <area shape="rect" coords="338,390,388,410" title="神奈川県" class="image-pref"/>

                <area shape="rect" coords="319,275,368,325" title="新潟県" class="image-pref"/>
                <area shape="rect" coords="289,321,326,342" title="富山県" class="image-pref"/>
                <area shape="rect" coords="256,312,292,337" title="石川県" class="image-pref"/>
                <area shape="rect" coords="236,336,273,360" title="福井県" class="image-pref"/>
                <area shape="rect" coords="313,369,348,388" title="山梨県" class="image-pref"/>
                <area shape="rect" coords="306,346,338,370" title="長野県" class="image-pref"/>
                <area shape="rect" coords="276,350,303,388" title="岐阜県" class="image-pref"/>
                <area shape="rect" coords="303,393,338,420" title="静岡県" class="image-pref"/>
                <area shape="rect" coords="271,386,306,413" title="愛知県" class="image-pref"/>
                <area shape="rect" coords="258,410,293,435" title="三重県" class="image-pref"/>

                <area shape="rect" coords="236,378,270,398" title="滋賀県" class="image-pref"/>
                <area shape="rect" coords="213,359,248,379" title="京都府" class="image-pref"/>
                <area shape="rect" coords="219,393,260,411" title="大阪府" class="image-pref"/>
                <area shape="rect" coords="200,376,235,395" title="兵庫県" class="image-pref"/>
                <area shape="rect" coords="226,411,263,430" title="奈良県" class="image-pref"/>
                <area shape="rect" coords="205,435,255,459" title="和歌山県" class="image-pref"/>

                <area shape="rect" coords="174,346,210,370" title="鳥取県" class="image-pref"/>
                <area shape="rect" coords="128,354,169,375" title="島根県" class="image-pref"/>
                <area shape="rect" coords="170,375,200,398" title="岡山県" class="image-pref"/>
                <area shape="rect" coords="139,380,171,404" title="広島県" class="image-pref"/>
                <area shape="rect" coords="93,391,129,414" title="山口県" class="image-pref"/>
                <area shape="rect" coords="182,421,219,439" title="徳島県" class="image-pref"/>
                <area shape="rect" coords="176,399,213,422" title="香川県" class="image-pref"/>
                <area shape="rect" coords="133,404,174,428" title="愛媛県" class="image-pref"/>
                <area shape="rect" coords="138,429,185,453" title="高知県" class="image-pref"/>

                <area shape="rect" coords="56,393,95,415" title="福岡県" class="image-pref"/>
                <area shape="rect" coords="26,403,61,425" title="佐賀県" class="image-pref"/>
                <area shape="rect" coords="5,430,50,454" title="長崎県" class="image-pref"/>
                <area shape="rect" coords="50,440,85,470" title="熊本県" class="image-pref"/>
                <area shape="rect" coords="91,420,126,446" title="大分県" class="image-pref"/>
                <area shape="rect" coords="85,460,119,489" title="宮崎県" class="image-pref"/>
                <area shape="rect" coords="20,478,80,550" title="鹿児島県" class="image-pref"/>
                <area shape="rect" coords="290,490,520,570" title="沖縄県" class="image-pref"/>
          </map>
            <img src="/image/prefmap2.png" usemap="#map" border="0" class="img-fluid" style="outline: rgb(34, 116, 107) solid 1px;"/>
            
        <asp:ListBox ID="ListBox1" runat="server" DataTextField="prefecture" DataValueField="prefecture"></asp:ListBox>
            </div>
            <br />
        <div class="box1">
        【都道府県】
        <asp:DropDownList ID="DropDownList1" runat="server" DataTextField="prefecture" DataValueField="prefecture" OnSelectedIndexChanged="DdlChange">
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Enabled="false">北海道</asp:ListItem>
            
            <asp:ListItem Enabled="false">青森県</asp:ListItem>
            <asp:ListItem Enabled="false">岩手県</asp:ListItem>
            <asp:ListItem Enabled="false">宮城県</asp:ListItem>
            <asp:ListItem Enabled="false">秋田県</asp:ListItem>
            <asp:ListItem Enabled="false">山形県</asp:ListItem>
            <asp:ListItem Enabled="false">福島県</asp:ListItem>

            <asp:ListItem Enabled="false">茨城県</asp:ListItem>
            <asp:ListItem Enabled="false">栃木県</asp:ListItem>
            <asp:ListItem Enabled="false">群馬県</asp:ListItem>
            <asp:ListItem Enabled="false">埼玉県</asp:ListItem>
            <asp:ListItem Enabled="false">千葉県</asp:ListItem>
            <asp:ListItem Enabled="false">東京都</asp:ListItem>
            <asp:ListItem Enabled="false">神奈川県</asp:ListItem>
            
            <asp:ListItem Enabled="false">新潟県</asp:ListItem>
            <asp:ListItem Enabled="false">富山県</asp:ListItem>
            <asp:ListItem Enabled="false">石川県</asp:ListItem>
            <asp:ListItem Enabled="false">福井県</asp:ListItem>
            <asp:ListItem Enabled="false">山梨県</asp:ListItem>
            <asp:ListItem Enabled="false">長野県</asp:ListItem>
            <asp:ListItem Enabled="false">岐阜県</asp:ListItem>
            <asp:ListItem Enabled="false">静岡県</asp:ListItem>
            <asp:ListItem Enabled="false">愛知県</asp:ListItem>
            <asp:ListItem Enabled="false">三重県</asp:ListItem>
            
            <asp:ListItem Enabled="false">滋賀県</asp:ListItem>
            <asp:ListItem Enabled="false">京都府</asp:ListItem>
            <asp:ListItem Enabled="false">大阪府</asp:ListItem>
            <asp:ListItem Enabled="false">兵庫県</asp:ListItem>
            <asp:ListItem Enabled="false">奈良県</asp:ListItem>
            <asp:ListItem Enabled="false">和歌山県</asp:ListItem>

            <asp:ListItem Enabled="false">鳥取県</asp:ListItem>
            <asp:ListItem Enabled="false">島根県</asp:ListItem>
            <asp:ListItem Enabled="false">岡山県</asp:ListItem>
            <asp:ListItem Enabled="false">広島県</asp:ListItem>
            <asp:ListItem Enabled="false">山口県</asp:ListItem>
            <asp:ListItem Enabled="false">徳島県</asp:ListItem>
            <asp:ListItem Enabled="false">香川県</asp:ListItem>
            <asp:ListItem Enabled="false">愛媛県</asp:ListItem>
            <asp:ListItem Enabled="false">高知県</asp:ListItem>
            
            <asp:ListItem Enabled="false">福岡県</asp:ListItem>
            <asp:ListItem Enabled="false">佐賀県</asp:ListItem>
            <asp:ListItem Enabled="false">長崎県</asp:ListItem>
            <asp:ListItem Enabled="false">熊本県</asp:ListItem>
            <asp:ListItem Enabled="false">大分県</asp:ListItem>
            <asp:ListItem Enabled="false">宮崎県</asp:ListItem>
            <asp:ListItem Enabled="false">鹿児島県</asp:ListItem>
            <asp:ListItem Enabled="false">沖縄県</asp:ListItem>

        </asp:DropDownList>
        <br />
        <asp:TextBox ID="TextBox1" runat="server" Text="" OnTextChanged="TbChanged"></asp:TextBox>
        <br />
        <br />
        ●病床選択
        <br />
        <div class="ragio">
        <asp:Panel ID="Panel1" runat="server">
        <asp:RadioButton ID="RadioButton1" text="一般病床" runat="server" GroupName="Groupbed"/>　　
        <asp:RadioButton ID="RadioButton2" text="感染者病床" runat="server" BorderColor="#FF6600" GroupName="Groupbed"/>
        <asp:RadioButton ID="RadioButton3" text="精神病床" runat="server"  GroupName="Groupbed"/>
        <br />
        <asp:RadioButton ID="RadioButton4" text="コロナ病床" runat="server" BorderColor="#FF6600" GroupName="Groupbed"/>
        <asp:RadioButton ID="RadioButton5" text="重症病床" runat="server"  GroupName="Groupbed"/>
        </asp:Panel>
        </div>
        <br />
        <br />
        <%--<input type="button" name="name" value="戻る" onclick="history.back()" class="buttonback" />--%>
            <br />
        <asp:Button ID="Button1" runat="server" Text="更新" OnClick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" Text="管理" OnClick="Button2_Click" />
        </div>
            <br />
        <asp:Button ID="Search_button" runat="server" Text="検索" OnClick="Search_button_Click"  CssClass="buttonSearch" />
        </div>
        <br />
        <br />
        
        

        <br />
        
    
        </div>
    </form>
    <script src="bg2.js"></script>
    <script src="bg.js"></script>
    <script>jQuery('img[usemap]').rwdImageMaps();
        jQuery('.image-pref').on('click', function () {
            var pref = jQuery(this).attr('title');
            $('#TextBox1').val(pref);
            $('#DropDownList1').val(pref);
            return false;
        });

        jQuery('#DropDownList1').change(function () {
            $('#TextBox1').val(jQuery(this).val());
            return false;
        });
    </script>

</body>
</html>
