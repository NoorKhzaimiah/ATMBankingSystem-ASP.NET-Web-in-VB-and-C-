﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="deposit.aspx.cs" Inherits="ATMSYSTEM.deposit" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title></title>
 
   
    <style type="text/css">
        .auto-style1 {
            width: 60px;
            height: 50px;
        }
        .auto-style2 {
            width: 149px;
            height: 50px;
            text-align: right;
            font-size: large;
            color: #800000;
        }
        .auto-style3 {
            width: 900px;
            height: 50px;
        }
        .newStyle1 {
            font-family: "Tempus Sans ITC";
        }
        .newStyle2 {
            font-family: "Tempus Sans ITC";
        }
        .auto-style4 {
            font-family: sans-serif;
            font-size: xx-large;
            letter-spacing: normal;
            height: 20px;
            text-align: center;
            color: #800000;
        }
        .newStyle3 {
            font-family: "Ink Free";
        }
        .newStyle4 {
            font-family: "Tw Cen MT";
        }
        .auto-style5 {
            text-align: center;
        }
        .newStyle5 {
            background-color: #800000;
        }
        .auto-style6 {
            height: 302px;
            width: 1249px;
        }
        .auto-style7 {
            background-color: #E8D7AC;
        }
        .auto-style8 {
            font-weight: bold;
            font-size: large;
            color: #800000;
            background-color: #F5F2E3;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <table style="widows:1100px;margin:0 auto">
            <tr style="width:1100px;">
                <td class="auto-style1">
                    <img src="Images/ATMlogo.jpg" style="height: 60px; width: 60px" />
                </td>
                <td class="auto-style2"><strong class="auto-style3">ATM SYSTEM</strong></td>
                <td style="text-align:right" class="auto-style3">
                    <asp:ImageButton ID="ImageButton1" runat="server" Height="44px" ImageUrl="~/Images/g-logo.png" Width="40px" /> &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" Height="41px" ImageUrl="~/Images/twitterlogo_1x.png" Width="42px" /> &nbsp;<asp:ImageButton ID="ImageButton3" runat="server" Height="43px" ImageUrl="~/Images/facebooklogo.png" Width="40px" />
                </td>
           
            </tr>
            <tr style =" width:1100px;height:40px;background-color:maroon">
                <td colspan="3">
                      <asp:Menu ID="Menu1" runat="server" OnMenuItemClick="Menu1_MenuItemClick" Orientation="Horizontal">
                        <Items>
                            <asp:MenuItem Text="Home" Value="Home" NavigateUrl="~/Project.aspx" ></asp:MenuItem>
                            <asp:MenuItem Text="Services" Value="Services" NavigateUrl="~/Services.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="Setting" Value="Setting" NavigateUrl="~/Setting.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="About us" Value="About us" NavigateUrl="~/AboutUs.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="Logout" Value="Logout" NavigateUrl="~/Logout.aspx"></asp:MenuItem>
                        </Items>
                        <StaticHoverStyle BackColor="#FFCC99" />
                        <StaticMenuItemStyle ForeColor="White" HorizontalPadding="75px" Font-Size="Large" />
                    </asp:Menu>

                   </td>
            </tr>
            <tr style="width:1100px;height:300px">
                <td colspan="3"><img src="Images/banner-deposit-eng.jpg" class="auto-style6" />
                </td>
            </tr>
            <tr style =" width:1100px">
                <td colspan="3" class="auto-style4">
                     <div class="auto-style5">
                     <strong class="newStyle4">
                         <br />
                         Enter you Branch:&nbsp;<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="BranchID" DataValueField="BranchID" Width="78px">
                         </asp:DropDownList>
                         &nbsp;&nbsp;<br />
                     Enter Value To Deposit:<br />
                     <asp:TextBox ID="TextBox1" runat="server" CssClass="auto-style7" Height="50px" Width="240px"></asp:TextBox>
                     <br />
                     <asp:Button ID="Button1" runat="server" CssClass="auto-style8" Height="39px" OnClick="Button1_Click" Text="Deposit" Width="112px" />
                         <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                     <br />
                     </div>
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Account] WHERE [CardNo] = @CardNo" InsertCommand="INSERT INTO [Account] ([CardNo], [BankID], [BranchID], [Name], [Address], [Balance], [Password]) VALUES (@CardNo, @BankID, @BranchID, @Name, @Address, @Balance, @Password)" SelectCommand="SELECT * FROM [Account] WHERE ([CardNo] = @CardNo)" UpdateCommand="UPDATE [Account] SET [Balance] = Balance + @deposit WHERE [CardNo] = @CardNo" OnSelecting="SqlDataSource1_Selecting">
                         <DeleteParameters>
                             <asp:Parameter Name="CardNo" Type="Int32" />
                         </DeleteParameters>
                         <InsertParameters>
                             <asp:Parameter Name="CardNo" Type="Int32" />
                             <asp:Parameter Name="BankID" Type="Int32" />
                             <asp:Parameter Name="BranchID" Type="Int32" />
                             <asp:Parameter Name="Name" Type="String" />
                             <asp:Parameter Name="Address" Type="String" />
                             <asp:Parameter Name="Balance" Type="String" />
                             <asp:Parameter Name="Password" Type="String" />
                         </InsertParameters>
                         <SelectParameters>
                             <asp:SessionParameter Name="CardNo" SessionField="CardNo" Type="Int32" />
                         </SelectParameters>
                         <UpdateParameters>
                           
                             <asp:Parameter Name="deposit" Type="Int32" />
                             <asp:Parameter Name="CardNo" Type="Int32" />
                         </UpdateParameters>
                     </asp:SqlDataSource>
                     <br />
                     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [status] WHERE [withdrow] = @withdrow AND [deposit] = @deposit" InsertCommand="INSERT INTO [status] ([withdrow], [deposit], [Ammount], [date], [CardNo], [BranchID]) VALUES (@withdrow, @deposit, @Ammount, @date, @CardNo, @BranchID)" SelectCommand="SELECT * FROM [status] WHERE ([CardNo] = @CardNo)" UpdateCommand="UPDATE [status] SET [Ammount] = @Ammount, [date] = @date, [CardNo] = @CardNo, [BranchID] = @BranchID WHERE [withdrow] = @withdrow AND [deposit] = @deposit">
                         <DeleteParameters>
                             <asp:Parameter Name="withdrow" Type="String" />
                             <asp:Parameter Name="deposit" Type="String" />
                         </DeleteParameters>
                         <InsertParameters>
                             <asp:Parameter Name="withdrow" Type="String" />
                             <asp:Parameter Name="deposit" Type="String" />
                             <asp:Parameter Name="Ammount" Type="String" />
                             <asp:Parameter Name="date" Type="String" />
                             <asp:Parameter Name="CardNo" Type="String" />
                             <asp:Parameter Name="BranchID" Type="String" />
                         </InsertParameters>
                         <SelectParameters>
                             <asp:SessionParameter Name="CardNo" SessionField="CardNo" Type="String" />
                         </SelectParameters>
                         <UpdateParameters>
                             <asp:Parameter Name="Ammount" Type="String" />
                             <asp:Parameter Name="date" Type="String" />
                             <asp:Parameter Name="CardNo" Type="String" />
                             <asp:Parameter Name="BranchID" Type="String" />
                             <asp:Parameter Name="withdrow" Type="String" />
                             <asp:Parameter Name="deposit" Type="String" />
                         </UpdateParameters>
                     </asp:SqlDataSource>
                     <br />
                     </strong>
                     <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Branch]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr style="width:1100px;height:20px">
                <td colspan="3" class="auto-style5">
                    &nbsp;</td>
            </tr>
        </table>
           
        
    </form>
</body>
</html>
