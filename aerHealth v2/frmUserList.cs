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
    public partial class frmUserList : Form
    {
        public frmUserList()
        {
            InitializeComponent();
        }

        private void frmUserList_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'bRMCHospitalDataSet.Users' table. You can move, or remove it, as needed.
            this.usersTableAdapter.Fill(this.bRMCHospitalDataSet.Users);

        }
    }
}
