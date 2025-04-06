<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ViewSP.aspx.cs" Inherits="WebApplication1.ViewSP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style type="text/css">
     .auto-style1 {
         height: 25px;
     }
     .auto-style2 {
         height: 26px;
}
     .auto-style3 {
         width: 33px;
     }
 </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%;">
     <tr>
         <td rowspan="4" class="auto-style3">
             <asp:Image ID="Image1" runat="server" Width="32px" />
         </td>
            <td class="auto-style1" colspan="2">
        <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
    </td>
</tr>
<tr>
    <td class="auto-style1" colspan="2">
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </td>
</tr>
<tr>
    <td colspan="2">
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
    </td>
</tr>
<tr>
    <td colspan="2" class="auto-style2">
        <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
    </td>
</tr>
<tr>
    <td>Số lượng</td>
    <td>
        <asp:TextBox ID="txtSL" runat="server" >1</asp:TextBox>
    </td>
</tr>
<tr>
    <td colspan="2">      
        <asp:Button ID="Button1" runat="server" Text="Mua" OnClick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" Text="Chọn Hàng" OnClick="Button2_Click" />
        <asp:Button ID="Button3" runat="server" Text="Giỏ Hàng" OnClick="Button3_Click" />
     </td>
    </tr>
    </table>
</asp:Content>
