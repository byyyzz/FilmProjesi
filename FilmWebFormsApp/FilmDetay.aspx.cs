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
    public partial class FilmDetay : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = "select * from filmler where adi like '%" + TextBox1.Text + "%'";
            TextBox1.Text = "";
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("FilmEkle.aspx");
        }

        protected void Unnamed1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Sil")
            {
                var id = (e.CommandArgument.ToString());
                string conString = ConfigurationManager.ConnectionStrings["SampleDBConnectionString"].ConnectionString;
                using (SqlConnection sqlConnection = new SqlConnection(conString))
                {
                    sqlConnection.Open();
                    SqlCommand sil = new SqlCommand("delete from filmler where id='" + id + "'", sqlConnection);
                    sil.ExecuteNonQuery();
                    Response.Redirect("FilmDetay.aspx");
                }
            }
            if (e.CommandName == "Guncelle")
            {
                var id = (e.CommandArgument);
                Response.Redirect("FilmGuncelle.aspx?film=" + id);
            }
          
        }
    }
}
