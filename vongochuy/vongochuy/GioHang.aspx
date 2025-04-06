    <%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="GioHang.aspx.cs" Inherits="WebApplication1.GioHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" Height="195px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="496px" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField>
            <ItemTemplate>
                <%# Container.DataItemIndex + 1 %>
            </ItemTemplate>
            <HeaderStyle HorizontalAlign="Left" Width="25px" />
            <ItemStyle HorizontalAlign="Left" Font-Bold="true" />
        </asp:TemplateField>
                    <asp:BoundField DataField="TenSP" HeaderText="TenSP" SortExpression="IdSP" />
              
                    <asp:BoundField DataField="SoLuong" HeaderText="SoLuong" SortExpression="SoLuong" />
                    <asp:BoundField DataField="DonGia" HeaderText="DonGia" SortExpression="DonGia" />
                        
                    <asp:BoundField DataField="ThanhTien" HeaderText="ThanhTien" SortExpression="ThanhTien" />
  <asp:TemplateField>
     <ItemTemplate>
         <asp:LinkButton ID="lbXoaSanpham" Text="Xóa" runat="server"
             OnClientClick="return confirm('Bạn chắc chắn muốn xóa sản phẩm này?');" CommandName="Delete" />
     </ItemTemplate>
     <HeaderStyle HorizontalAlign="Left" />
     <ItemStyle HorizontalAlign="Center" Width="50px" />
 </asp:TemplateField>                   

  
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>     
    
    <div class="cotphai">
 <asp:Label ID="TongTien" runat="server" Text="TongTien"></asp:Label>    
    <br />
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Dat Hang" />
    <br />
    <asp:Button ID="Button2" runat="server" Text="Trang Chu" OnClick="Button2_Click" />
  </div>
</asp:Content>
