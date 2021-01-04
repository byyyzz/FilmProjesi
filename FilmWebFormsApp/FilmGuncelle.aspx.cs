using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FilmWebFormsApp
{
    public partial class FilmGuncelle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string filmName = Request.QueryString["film"];
            SqlDataSource1.SelectCommand = "select * from filmler where adi='" + filmName + "'";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string filmName = Request.QueryString["film"];
            string conString = ConfigurationManager.ConnectionStrings["SampleDBConnectionString"].ConnectionString;
            using (SqlConnection sqlConnection = new SqlConnection(conString))
            {
                if (yonetmen.Text != "")
                {
                    SqlCommand yonekle = new SqlCommand("update filmler set yonetmen='" + yonetmen.Text + "' where adi='" + filmName + "'", sqlConnection);
                    yonekle.ExecuteNonQuery();
                }
                if (tur.Text != "")
                {
                    SqlCommand turekle = new SqlCommand("update filmler set tur='" + tur.Text + "' where adi='" + filmName + "'", sqlConnection);
                    turekle.ExecuteNonQuery();
                }
                if (ozet.Text != "")
                {

                    SqlCommand ozekle = new SqlCommand("update filmler set ozet=@ozet where adi='" + filmName + "'", sqlConnection);
                    ozekle.Parameters.AddWithValue("@ozet", ozet.Text);
                    ozekle.ExecuteNonQuery();
                }
                if (vizyontarih.Text != "")
                {
                    SqlCommand tarekle = new SqlCommand("update filmler set vizyontarih='" + vizyontarih.Text + "' where adi='" + filmName + "'", sqlConnection);
                    tarekle.ExecuteNonQuery();
                }
                if (sure.Text != "")
                {
                    SqlCommand surekle = new SqlCommand("update filmler set sure='" + sure.Text + "' where adi='" + filmName + "'", sqlConnection);
                    surekle.ExecuteNonQuery();
                }
                if (imdb.Text != "")
                {
                    SqlCommand imdbekle = new SqlCommand("update filmler set imdb='" + imdb.Text + "' where adi='" + filmName + "'", sqlConnection);
                    imdbekle.ExecuteNonQuery();
                }
                if (adi.Text != "")
                {
                    
                    SqlCommand adekle = new SqlCommand("update filmler set adi='" + adi.Text + "' where adi ='" + filmName + "'", sqlConnection);
                    adekle.ExecuteNonQuery();
                }
                
            }

            string filmAdi = adi.Text;
            Response.Redirect("FilmGuncelle.aspx?film=" + filmAdi);
        }
    }
}