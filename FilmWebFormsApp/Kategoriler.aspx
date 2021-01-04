<%@ Page Title="" Language="C#" MasterPageFile="~/Sinema.Master" AutoEventWireup="true" CodeBehind="Kategoriler.aspx.cs" Inherits="FilmWebFormsApp.Kategoriler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="text-align:center">
     <br/>
    <br />
    <br />
    <br />
     <br />
        
    <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Aksiyon.aspx" Font-Bold="True" Font-Size="Medium" Font-Underline="False" ForeColor="#FF3300" BorderStyle="Outset">Aksiyon</asp:LinkButton>
    <br />
    <br />
    <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/BilimKurgu.aspx" Font-Bold="True" Font-Size="Medium" Font-Underline="False" ForeColor="#FF3300" BorderStyle="Inset">Bilim Kurgu</asp:LinkButton>
    <br />
    <br />
    <asp:LinkButton ID="LinkButton7" runat="server" PostBackUrl="~/Biyografi.aspx" Font-Bold="True" Font-Size="Medium" Font-Underline="False" ForeColor="#FF3300" BorderStyle="Outset">Biyografi</asp:LinkButton>
   <br />
    <br />
    <asp:LinkButton ID="LinkButton3" runat="server" PostBackUrl="~/Dram.aspx" Font-Bold="True" Font-Size="Medium" Font-Underline="False" ForeColor="#FF3300" BorderStyle="Inset">Dram</asp:LinkButton>
    <br />
    <br />
    <asp:LinkButton ID="LinkButton4" runat="server"  PostBackUrl="~/Gerilim.aspx" Font-Bold="True" Font-Overline="False" Font-Size="Medium" ForeColor="#FF3300" BorderStyle="Outset">Gerilim</asp:LinkButton>
    <br />
    <br />
    <asp:LinkButton ID="LinkButton5" runat="server" PostBackUrl="~/Komedi.aspx" Font-Bold="True" Font-Overline="False" Font-Size="Medium" ForeColor="#FF3300" BorderStyle="Inset">Komedi</asp:LinkButton>
    <br />
    <br />
    <asp:LinkButton ID="LinkButton6" runat="server" PostBackUrl="~/Romantik.aspx" Font-Bold="True" Font-Size="Medium" Font-Underline="False" ForeColor="#FF3300" BorderStyle="Outset">Romantik</asp:LinkButton>
    
    </div>
</asp:Content>
