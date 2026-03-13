using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webApplication
{
    public partial class EditUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["email"] == null)
                    Response.Redirect("~/indexweb.aspx");

                LoadUser();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            lblMsg.Text = "";
            lblMsgMob.Text = "";
            string db_password = null;
            bool db_isAdmin = false;
            string mobile = txtMobile.Text;

            // PASSWORD VALIDATION
            if (!string.IsNullOrEmpty(txtPassword.Text))
            {
                if (txtPassword.Text != txtConfirmPassword.Text)
                {
                    lblMsg.Text = "Passwords do not match.";
                    return;
                }
            }

            if (mobile.Length != 10 || !mobile.All(char.IsDigit))
            {
                lblMsgMob.Text = "Mobile number must be of 10 digits !";
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["WebApp1"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query =
                    "UPDATE registrationDetails SET " +
                    "FullName=@FullName, mobile=@mobile, gender=@gender, admin=@admin";

                if (!string.IsNullOrEmpty(txtPassword.Text))
                    query += ", password=@password";

                query += " WHERE Email=@Email";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@FullName", txtFullName.Text);
                cmd.Parameters.AddWithValue("@mobile", txtMobile.Text);
                cmd.Parameters.AddWithValue("@gender", ddlGender.Text);
                cmd.Parameters.AddWithValue("@admin", rblAdmin.SelectedValue);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);

                if (!string.IsNullOrEmpty(txtPassword.Text))
                {
                    cmd.Parameters.AddWithValue("@password", txtPassword.Text);
                }

                con.Open();
                cmd.ExecuteNonQuery();
            }

            using (SqlConnection conn1 = new SqlConnection(connStr))
            {
                String query = @"SELECT[password], [admin] FROM registrationDetails WHERE Email = @email";
                conn1.Open();
                SqlCommand cmd = new SqlCommand(query, conn1);
                cmd.Parameters.AddWithValue("@email", txtEmail.Text);

                using (SqlDataReader reader = cmd.ExecuteReader())

                    if (reader.Read())
                    {
                        db_password = reader["password"].ToString();
                        db_isAdmin = Convert.ToBoolean(reader["admin"]);

                        if (db_isAdmin)
                        {
                            Response.Redirect("AdminHome.aspx");
                        }
                        else
                        {
                            Response.Redirect("UserHome.aspx");
                        }

                    }

            }
        }






        private void LoadUser()
        {
            string email = Request.QueryString["email"];
            string connStr = ConfigurationManager.ConnectionStrings["WebApp1"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand(
                    "SELECT FullName, Email, mobile, gender, admin FROM registrationDetails WHERE Email=@Email", con);
                cmd.Parameters.AddWithValue("@Email", email);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    txtEmail.Text = dr["Email"].ToString();
                    txtFullName.Text = dr["FullName"].ToString();
                    txtMobile.Text = dr["mobile"].ToString();
                    ddlGender.Text = dr["gender"].ToString();
                    rblAdmin.SelectedValue = Convert.ToBoolean(dr["admin"]) ? "1" : "0";
                }
            }
        }


    }
}