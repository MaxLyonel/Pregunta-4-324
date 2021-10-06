using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    public string conString = "Data Source=DESKTOP-U1FMLGK\\SQLEXPRESS;Initial Catalog=examen324;Integrated Security=True";
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();
        SqlDataAdapter ada = new SqlDataAdapter();
        DataSet ds = new DataSet();
        con.ConnectionString = conString;
        
        con.Open();
        if (con.State == System.Data.ConnectionState.Open)
        {
            ada.SelectCommand = new SqlCommand();
            ada.SelectCommand.Connection = con;
            ada.SelectCommand.CommandText = @"select avg(n.notafinal) as promedio, case departamento 
                                                            when '01' then 'CHUQUISACA'
                                                            when '02' then 'LA PAZ'
                                                            when '03' then 'CBBA'
                                                            when '04' then 'ORURO'
                                                            when '05' then 'POTOSI' 
                                                            when '06' then 'TARIJA'
							                                when '07' then 'SANTA CRUZ'
							                                when '08' then 'BENI'
							                                when '09' then 'PANDO'
							                                else 'OTRO' end as descripcion_depto
                                                from persona p, estudiante e, nota n
                                                where p.ci = e.ci
                                                and n.ci_estudiante = e.ci
                                                group by departamento";
            ada.Fill(ds);

            //string q = "select * from estudiante";
            //SqlCommand cmd = new SqlCommand(q, con);
            //cmd.CommandType = CommandType.StoredProcedure;
            //SqlDataAdapter da = new SqlDataAdapter(cmd);
            
            //cmd.ExecuteNonQuery();
            //SqlDataReader registros = cmd.ExecuteReader();
            //da.Fill(ds);
            //ada.Fill(ds);
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
        }

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}