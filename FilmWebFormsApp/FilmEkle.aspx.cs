using System;
using System.Activities.Expressions;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FilmWebFormsApp
{
    public partial class FilmEkle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string conString = ConfigurationManager.ConnectionStrings["SampleDBConnectionString"].ConnectionString;
            using (SqlConnection sqlConnection = new SqlConnection(conString))
            {
                SqlCommand ekle = new SqlCommand("insert into filmler (adi,yonetmen,tur,ozet,vizyontarih,sure,resim,imdb) values(@adi,@yonetmen,@tur,@ozet,@vizyontarih,@sure,@resim,@imdbpuan)", sqlConnection);
                ekle.Parameters.AddWithValue("@adi", adi.Text);
                ekle.Parameters.AddWithValue("@yonetmen", yonetmen.Text);
                ekle.Parameters.AddWithValue("@tur", tur.Text);
                ekle.Parameters.AddWithValue("@ozet", ozet.Text);
                ekle.Parameters.AddWithValue("@vizyontarih", vizyontarih.Text);
                ekle.Parameters.AddWithValue("@sure", sure.Text);
                ekle.Parameters.AddWithValue("@imdbpuan", imdb.Text);


                if (FileUpload1.HasFile)
                {
                    FileUpload1.SaveAs(Server.MapPath("~/img/") + FileUpload1.FileName);
                    string resimyolu = FileUpload1.FileName;
                    resimyolu = "img/" + resimyolu;
                    ekle.Parameters.AddWithValue("@resim", resimyolu);
                    ekle.ExecuteNonQuery();
                }

            }

            adi.Text = "";
            yonetmen.Text = "";
            tur.Text = "";
            ozet.Text = "";
            vizyontarih.Text = "";
            sure.Text = "";

        }
    }
}