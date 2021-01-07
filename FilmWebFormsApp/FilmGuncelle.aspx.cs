using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FilmWebFormsApp
{
    public partial class FilmGuncelle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string id = Request.QueryString["film"];
                SqlDataSource1.SelectCommand = "select * from filmler where id='" + id + "'";
                Label1.Text = id;
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
        }

        [WebMethod]
        public static void Item(string id, string ad, string yonetmen, string tur, string konu, string sure, string tarih, string imdb, string video, string resim)
        {

            string conString = ConfigurationManager.ConnectionStrings["SampleDBConnectionString"].ConnectionString;
            using (SqlConnection sqlConnection = new SqlConnection(conString))
            {
                sqlConnection.Open();
                if (yonetmen != "")
                {
                    SqlCommand yonekle = new SqlCommand("update filmler set yonetmen='" + yonetmen + "' where id='" + id + "'", sqlConnection);
                    yonekle.ExecuteNonQuery();
                }
                if (tur != "")
                {
                    SqlCommand turekle = new SqlCommand("update filmler set tur='" + tur + "' where id='" + id + "'", sqlConnection);
                    turekle.ExecuteNonQuery();
                }
                if (konu != "")
                {

                    SqlCommand ozekle = new SqlCommand("update filmler set ozet=@ozet where id='" + id + "'", sqlConnection);
                    ozekle.Parameters.AddWithValue("@ozet", konu);
                    ozekle.ExecuteNonQuery();
                }
                if (tarih != "")
                {
                    SqlCommand tarekle = new SqlCommand("update filmler set vizyontarih='" + tarih + "' where id='" + id + "'", sqlConnection);
                    tarekle.ExecuteNonQuery();
                }
                if (sure != "")
                {
                    SqlCommand surekle = new SqlCommand("update filmler set sure='" + sure + "' where id='" + id + "'", sqlConnection);
                    surekle.ExecuteNonQuery();
                }
                if (imdb != "")
                {
                    SqlCommand imdbekle = new SqlCommand("update filmler set imdb='" + imdb + "' where id='" + id + "'", sqlConnection);
                    imdbekle.ExecuteNonQuery();
                }
                if (video != "")
                {

                    string vLink = video.Substring(32);
                    vLink = "https://www.youtube.com/embed/" + vLink;
                    SqlCommand vekle = new SqlCommand("update filmler set video='" + vLink + "' where id='" + id + "'", sqlConnection);
                    vekle.ExecuteNonQuery();
                }
                if (ad != "")
                {

                    SqlCommand adekle = new SqlCommand("update filmler set adi='" + ad + "' where id='" + id + "'", sqlConnection);
                    adekle.ExecuteNonQuery();
                }
                if (resim != "")
                {
                    SqlCommand resekle = new SqlCommand("update filmler set resim='" + "img/" + resim + "' where id='" + id + "'", sqlConnection);
                    resekle.ExecuteNonQuery();
                }
                //if (FileUpload1.HasFile)
                //{
                //    FileUpload1.SaveAs(Server.MapPath("~/img/") + FileUpload1.FileName);
                //    string resimyolu = FileUpload1.FileName;
                //    resimyolu = "img/" + resimyolu;
                //    SqlCommand rsekle = new SqlCommand("update filmler set resim='" + resimyolu + "' where id='" + id + "'", sqlConnection);
                //    rsekle.ExecuteNonQuery();

                //}
            }


        }
    }
}