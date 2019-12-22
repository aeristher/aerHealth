using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace aerHealth_v2
{
    public partial class Form5 : Form
    {
       
        string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Bergenfield3;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
        public Form5()
        {
            InitializeComponent();
            timer1.Enabled = true;
            SidePanel.Height = button1.Height;
            patient1.BringToFront();
        }

        private void Form5_Load(object sender, EventArgs e)
        {

        }

        private void button7_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void button7_ClientSizeChanged(object sender, EventArgs e)
        {

        }

        private void button8_Click(object sender, EventArgs e)
        {
            DialogResult result;
            result = MessageBox.Show("Do you want to log off?", "Log Off", MessageBoxButtons.YesNo);
            switch (result)
            {
                case DialogResult.Yes:
                    break;

                case DialogResult.No: return;
            }
            this.Close();
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            string strTime;
            string strDate;

            strTime = DateTime.Now.ToLongDateString();
            strDate = DateTime.Now.ToLongTimeString();

            lblTimer.Text = strTime + "   " + strDate;

        }

        private void lblTimer_Click(object sender, EventArgs e)
        {
            lblTimer.ForeColor = Color.FromArgb(34, 36, 49);
        }

        private void button7_Click_1(object sender, EventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("Select * from patient", sqlCon);
                DataTable dtbl = new DataTable();
                sqlDa.Fill(dtbl);

              
            }
        }

        private void dgv1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            SidePanel.Height = button1.Height;
            SidePanel.Top = button1.Top;
            patient1.BringToFront();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            SidePanel.Height = button2.Height;
            SidePanel.Top = button2.Top;
            userControl21.BringToFront();
           
                 }

        
        private void button3_Click(object sender, EventArgs e)
        {
           
        }

        private void button4_Click(object sender, EventArgs e)
        {
            SidePanel.Height = button4.Height;
            SidePanel.Top = button4.Top;
            userControl41.BringToFront();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            SidePanel.Height = button5.Height;
            SidePanel.Top = button5.Top;
            userControl11.BringToFront();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            SidePanel.Height = button6.Height;
            SidePanel.Top = button6.Top;
            about_Us1.BringToFront();
        }

        private void button3_Click_1(object sender, EventArgs e)
        {
            SidePanel.Height = button3.Height;
            SidePanel.Top = button3.Top;
            userControl31.BringToFront();
        }

        private void userControl21_Load(object sender, EventArgs e)
        {

        }
    }
}
