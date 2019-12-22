using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;


namespace aerHealth_v2
{
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
            timer1.Start();
            timer1.Interval = 40;
        }

        private void button1_Click(object sender, EventArgs e)
        {
           // timer1.Start();
          //  timer1.Interval = 100;
        }

        int i = 0;
        private void timer1_Tick(object sender, EventArgs e)
        {
            i++;
            progressBar1.Value = i;

            if (progressBar1.Value <= 10)
            {
                progressBar1.ForeColor = Color.FromArgb(203,51,59);
            }
            else if (progressBar1.Value <= 20)
            {
                progressBar1.ForeColor = Color.White;
            }

            else if (progressBar1.Value <= 30)
            {
                progressBar1.ForeColor = Color.FromArgb(203, 51, 59);
            }

            else if (progressBar1.Value <= 40)
            {
                progressBar1.ForeColor = Color.White;
            }
            else if (progressBar1.Value <= 50)
            {
                progressBar1.ForeColor = Color.FromArgb(203, 51, 59);
            }
            else if (progressBar1.Value <= 60)
            {
                progressBar1.ForeColor = Color.White;
            }
            else if (progressBar1.Value <= 70)
            {
                progressBar1.ForeColor = Color.FromArgb(203, 51, 59);
            }
            else if (progressBar1.Value <= 80)
            {
                progressBar1.ForeColor = Color.White;
            }
            else if (progressBar1.Value <= 90)
            {
                progressBar1.ForeColor = Color.FromArgb(203, 51, 59);
            }
            else
            {
                progressBar1.ForeColor = Color.White;
            }

            if(progressBar1.Value == 100)
            {
                timer1.Stop();
                this.Close();
            }
        }
    }
}
