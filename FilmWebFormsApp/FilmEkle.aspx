<%@ Page Title="" Language="C#" MasterPageFile="~/Sinema.Master" AutoEventWireup="true" CodeBehind="FilmEkle.aspx.cs" Inherits="FilmWebFormsApp.FilmEkle" UnobtrusiveValidationMode="None" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            text-align: justify;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {

            $("#btnEkle").click(function () {

                var fileUpload = $("#ContentPlaceHolder1_FileUpload1").get(0);
                var files = fileUpload.files;

                var ad = $("#ContentPlaceHolder1_adi").val();
                var yon = $("#ContentPlaceHolder1_yonetmen").val();
                var tur = $("#ContentPlaceHolder1_tur").val();
                var konu = $("#ContentPlaceHolder1_ozet").val();
                var tarih = $("#ContentPlaceHolder1_vizyontarih").val();
                var sure = $("#ContentPlaceHolder1_sure").val();
                var imdb = $("#ContentPlaceHolder1_imdb").val();
                var video = $("#ContentPlaceHolder1_Video").val();
                console.log(ad, yon, tur, konu, sure, imdb, video, files[0].name);
                Sorgu(ad, yon, tur, konu, sure, tarih, imdb, video, files[0].name);
            });
            function Sorgu(ad, yon, tur, konu, sure, tarih, imdb, video, file) {
                $.ajax({
                    type: 'POST',
                    url: 'FilmEkle.aspx/Item',
                    data: "{ad: '" + ad + "', yonetmen: '" + yon + "',tur: '" + tur + "',tarih: '" + tarih + "',konu: '" + konu + "',sure: '" + sure + "',imdb: '" + imdb + "',video: '" + video + "',resim: '" + file + "' }",
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (result) {
                        $('#result').html(result.d);
                        alert('Film başarıyla eklendi.');
                    },
                    error: function () {
                        alert('Bağlantı sırasında bir sorun oluştu. Yeniden deneyin');
                    }
                });
            }

        });

    </script>

    <p class="auto-style1" style="font-size: large">
        &nbsp;&nbsp; &nbsp;<strong> Film Eklemek İçin Aşağıdaki Alanları Doldurun.</strong><br />
        <br />

        <p class="auto-style1">
            <br />
            <br />

            <p class="auto-style1">
                Film Adı:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="adi" runat="server" CssClass="TextBox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Film Adı Boş Geçilemez." ControlToValidate="adi"></asp:RequiredFieldValidator>

            </p>
    <p class="auto-style1">
        Yönetmen:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="yonetmen" runat="server" CssClass="TextBox"></asp:TextBox>
    </p>

    <p class="auto-style1">
        Türü:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="tur" runat="server" CssClass="TextBox"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Film Türü Boş Geçilemez." ControlToValidate="tur"></asp:RequiredFieldValidator>

    </p>

    <p class="auto-style1">
        Konu:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="ozet" runat="server" CssClass="TextBox"></asp:TextBox>
    </p>

    <p class="auto-style1">
        Yıl:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="vizyontarih" runat="server" CssClass="TextBox"></asp:TextBox>
    </p>

    <p class="auto-style1">
        Süre:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="sure" runat="server" CssClass="TextBox"></asp:TextBox>

    </p>

    <p class="auto-style1">
        Imdb Puanı:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="imdb" runat="server" CssClass="TextBox"></asp:TextBox>

    </p>

    <p class="auto-style1">
        Fragman:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="Video" runat="server" CssClass="TextBox"></asp:TextBox>
    </p>


    <p class="auto-style1">
        Film Afişi:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:FileUpload ID="FileUpload1" runat="server" CssClass="TextBox" />




    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input id="btnEkle" type="button" value="Ekle" class="btn3" />

        &nbsp;
    </p>
    <p>
        &nbsp;
    </p>



</asp:Content>
