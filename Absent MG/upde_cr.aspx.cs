using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Absent_MG
{
    public partial class upde_cr : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Absent"].ConnectionString); //to connect with db
        SqlCommand comm;//to execute query
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                String q = "select * from [course_schedu] where cr_id= @un";
                comm = new SqlCommand(q, conn);
                comm.Parameters.AddWithValue("@un", Request.QueryString["id"].ToString());
                conn.Open();
                SqlDataReader res = comm.ExecuteReader();
                res.Read();
                cr1.Text = res["cr_name"].ToString();
                crid.Text = res["cr_symp"].ToString();
                crho.Text = res["credit_hr"].ToString();
                stk.Text = res["stack"].ToString();

                conn.Close();
                DataBind();
            }

        }

        protected void update_Click(object sender, EventArgs e)
        {
            String q = "UPDATE course_schedu SET cr_name = @name, credit_hr = @crh, cr_symp = @smp, stack = @stk WHERE (cr_Id = @un)";
            comm = new SqlCommand(q, conn);
            comm.Parameters.AddWithValue("@un", Request.QueryString["id"].ToString());
            comm.Parameters.AddWithValue("@name", cr1.Text);
            comm.Parameters.AddWithValue("@crh", crho.Text);
            comm.Parameters.AddWithValue("@smp", crid.Text);
            comm.Parameters.AddWithValue("@stk", stk.Text);

            conn.Open();
            Label1.Visible = true;
            int res1 = comm.ExecuteNonQuery();
            if (res1 == 1)
            {
                Label1.Text = "Course Updated Successfully";
                DataBind();

            }
            else
            {
                Label1.Text = "Error while  inserting into Excuse, try again";
            }
            conn.Close();
            DataBind();
        }


        protected void delete_Click(object sender, EventArgs e)

        {
            String q = "DELETE FROM course_schedu WHERE (cr_Id = @un)";
            comm = new SqlCommand(q, conn);
            comm.Parameters.AddWithValue("@un", Request.QueryString["id"].ToString());


            conn.Open();
            Label1.Visible = true;
            int res1 = comm.ExecuteNonQuery();
            if (res1 == 1)
            {
                Label1.Text = "Course Deleted Successfully";
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