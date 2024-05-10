using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Absent_MG
{
    public partial class updt_sec : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Absent"].ConnectionString); //to connect with db
        SqlCommand comm;//to execute query
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                String q = "select * from [section] where sec_id= @un";
                comm = new SqlCommand(q, conn);
                comm.Parameters.AddWithValue("@un", Request.QueryString["id"].ToString());
                conn.Open();
                SqlDataReader res = comm.ExecuteReader();
                res.Read();
                name.Text = res["sec_name"].ToString();
                stk.Text = res["st_stack"].ToString();
                cr1.SelectedValue= res["cr_id"].ToString();
                inst.SelectedValue= res["inst_id"].ToString();
                
                conn.Close();
            }

        }

        protected void update_Click(object sender, EventArgs e)
        {
            String q = "UPDATE section SET sec_name = @name, st_stack = @stk, inst_id = @inst_Id ,cr_id= @cr_id FROM section  WHERE (section.sec_Id = @un)";
            comm = new SqlCommand(q, conn);
            comm.Parameters.AddWithValue("@un", Request.QueryString["id"].ToString());
            comm.Parameters.AddWithValue("@name", name.Text);
            comm.Parameters.AddWithValue("@stk", stk.Text);
            comm.Parameters.AddWithValue("@inst_Id", inst.SelectedValue);
            comm.Parameters.AddWithValue("@cr_id", cr1.SelectedValue);
            
            conn.Open();
            Label1.Visible = true;
            int res1 = comm.ExecuteNonQuery();
            if (res1 == 1)
            {
                Label1.Text = "Section Updated Successfully";
                DataBind();

            }
            else
            {
                Label1.Text = "Error while  inserting into Excuse, try again";
            }
            conn.Close();
        }


        protected void delete_Click(object sender, EventArgs e)

        {
            String q = "DELETE FROM section WHERE (sec_Id = @un)";
            comm = new SqlCommand(q, conn);
            comm.Parameters.AddWithValue("@un", Request.QueryString["id"].ToString());
            

            conn.Open();
            Label1.Visible = true;
            int res1 = comm.ExecuteNonQuery();
            if (res1 == 1)
            {
                Label1.Text = "Section Deleted Successfully";
                DataBind();

            }
            else
            {
                Label1.Text = "Error while  inserting into Excuse, try again";
            }
            conn.Close();
        }
    }
}