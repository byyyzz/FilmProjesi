<%@ Page Title="" Language="C#" MasterPageFile="~/Sinema.Master" CodeBehind="Biyografi.aspx.cs" AutoEventWireup="true" Inherits="FilmWebFormsApp.Biyografi" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SampleDBConnectionString %>" SelectCommand="SELECT * FROM [filmler] WHERE [tur]='Biyografi'"></asp:SqlDataSource>
    <h2>&nbsp;&nbsp; Biyografi Filmleri </h2>
    <br />
    <asp:Repeater runat="server" DataSourceID="SqlDataSource1" OnItemCommand="Unnamed1_ItemCommand">
        <ItemTemplate>
            <ul id="gallery">

                <li>
                    <img src="<%# Eval("resim") %>" />
                    <span>
                        <h2><%#Eval("adi")%></h2>
                        <h3><%# Eval("sure") %> dk</h3>
                        <asp:Button ID="Button1" runat="server" Text="daha fazlası için tıklayın" CommandName="Detay" CommandArgument='<%#  Eval("id") %>' />
                    </span>
                </li>
            </ul>


        </ItemTemplate>
    </asp:Repeater>


</asp:Content>
