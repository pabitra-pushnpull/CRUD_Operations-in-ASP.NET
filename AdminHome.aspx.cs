using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webApplication
{
    public partial class home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadGridData();
            }
        }


        protected void adminHomeLogoutBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("indexweb.aspx");
        }

        private void LoadGridData()
        {
            string connStr = ConfigurationManager.ConnectionStrings["WebApp1"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM registrationDetails", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();

                da.Fill(dt);

                gvUsers.DataSource = dt;
                gvUsers.DataBind();
            }
        }



        protected void gvUsers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteUser")
            {
                string email = e.CommandArgument.ToString();

                string connStr = ConfigurationManager
                                    .ConnectionStrings["WebApp1"]
                                    .ConnectionString;

                using (SqlConnection con = new SqlConnection(connStr))
                {
                    SqlCommand cmd = new SqlCommand(
                        "DELETE FROM registrationDetails WHERE Email = @Email", con);
                    cmd.Parameters.AddWithValue("@Email", email);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                LoadGridData(); // refresh grid
            }
        }

        protected void adminInsertBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registration.aspx");
        }
    }
}