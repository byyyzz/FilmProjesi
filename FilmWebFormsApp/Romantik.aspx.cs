﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FilmWebFormsApp
{
    public partial class Romantik : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            var filmAdi = (e.CommandArgument.ToString());
            Response.Redirect("DahaFazlaGor.aspx?film=" + filmAdi);
        }
    }
}