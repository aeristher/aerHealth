﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace aerHealth_v2
{
    public partial class UserControl3 : UserControl
    {
        string connectionString = "Data Source=YEN\\YEN;Initial Catalog=Bergenfield3;Integrated Security=True";

        public UserControl3()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("Select * from patientappointments", sqlCon);
                DataTable dtbl = new DataTable();
                sqlDa.Fill(dtbl);

                dgv1.DataSource = dtbl;
            }
        }

        private void dgv1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
