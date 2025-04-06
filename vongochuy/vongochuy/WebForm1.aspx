<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication1.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <style>
.catalogue-grid {
        width: 100%; 
        display: grid;
        grid-template-columns: repeat(2, 1fr); 
        gap: 20px; 
    }

.product-card {
    background: #fff;
    border: 1px solid #ddd;
    border-radius: 10px;
    padding: 15px;
    text-align: center;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.product-image {
    width: 100%;
    height: 150px;
    object-fit: cover;
    border-radius: 10px;
}

.product-name {
    font-size: 18px;
    margin: 10px 0;
}

.product-price {
    font-weight: bold;
    color: #e91e63;
}

.product-description {
    font-size: 14px;
    color: #555;
}
.product-link {
    text-decoration: none; 
    color: inherit; 
    display: block; 
}

    .product-link:hover {
        cursor: pointer;
    }

    </style>
    <p>

        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" 
             RepeatColumns="2" RepeatDirection="Horizontal" Width="90%" 
            BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" CellSpacing="2" GridLines="Both" DataKeyField="IdSP" Height="550px">         
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <ItemStyle BackColor="#FFF7E7" ForeColor="#8C4510" />         
            <ItemTemplate>
       
        <a href='ViewSP.aspx?ID=<%# Eval("IdSP") %>' class="product-link">
            <div class="product-card">
               <img src='<%# ResolveUrl("~/Images/")+Eval("anh") %>'  alt='<%# Eval("TenSP") %> ' class="product-image" />
                <h3 class="product-name"><%# Eval("TenSP") %></h3>
                <p class="product-price">Giá: <%# Eval("Giaban", "{0:### ### ###}") %></p>
                <p class="product-description"><%# Eval("TenSP") %></p>
            </div>
        </a>
            </ItemTemplate>
            <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            </asp:DataList>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT [IdSP], [TenSP], [Dvt], [GiaBan], [anh] FROM [SanPham]"></asp:SqlDataSource>

    </p>
    </asp:Content>
