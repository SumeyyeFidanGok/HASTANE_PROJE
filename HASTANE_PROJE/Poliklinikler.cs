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

namespace HASTANE_PROJE
{
    public partial class Poliklinikler : Form
    {
        public Poliklinikler()
        {
            InitializeComponent();
        }
        SqlConnection conn = new SqlConnection("Server = DESKTOP-BQTBB5Q\\SQLEXPRESS; Database = M02; uid=sa;pwd=1;");
        public void Getir()
        {

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PListele";

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dataGridView1.DataSource = dt;
        }
        private void button9_Click(object sender, EventArgs e)
        {
            
        }
        private void button1_Click(object sender, EventArgs e)
        {

        }

        private void button10_Click(object sender, EventArgs e)
        {
            Getir();
        }

        private void button9_Click_1(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PEkle";
            cmd.Parameters.AddWithValue("PoliklinikAd", textBox2.Text);
            cmd.Parameters.AddWithValue("PoliklinikUzmanSayisi", textBox3.Text);
            cmd.Parameters.AddWithValue("PoliklinikBaskani", textBox4.Text);
            cmd.Parameters.AddWithValue("PoliklinikBasHemsire", textBox5.Text);
            cmd.Parameters.AddWithValue("YatakSayisi", textBox6.Text);
          
            cmd.ExecuteNonQuery();
            conn.Close();
            Getir();
            
        }

        private void button4_Click(object sender, EventArgs e)
        {
          
        }

        private void button8_Click(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PYenile";
            cmd.Parameters.AddWithValue("PoliklinikNo", textBox7.Text);
            cmd.Parameters.AddWithValue("PoliklinikAd", textBox2.Text);
            cmd.Parameters.AddWithValue("PoliklinikUzmanSayisi", textBox3.Text);
            cmd.Parameters.AddWithValue("PoliklinikBaskani", textBox4.Text);
            cmd.Parameters.AddWithValue("PoliklinikBasHemsire", textBox5.Text);
            cmd.Parameters.AddWithValue("YatakSayisi", textBox6.Text);
          
            cmd.ExecuteNonQuery();
            conn.Close();
            Getir();

            
        }

        private void button7_Click(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PSil";
            cmd.Parameters.AddWithValue("PoliklinikNo", textBox8.Text);
            cmd.ExecuteNonQuery();
            conn.Close();
            Getir();

    
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int sec = dataGridView1.SelectedCells[0].RowIndex;
            textBox7.Text = dataGridView1.Rows[sec].Cells[0].Value.ToString();
            textBox2.Text = dataGridView1.Rows[sec].Cells[1].Value.ToString();
            textBox3.Text = dataGridView1.Rows[sec].Cells[2].Value.ToString();
            textBox4.Text = dataGridView1.Rows[sec].Cells[3].Value.ToString();
            textBox5.Text = dataGridView1.Rows[sec].Cells[4].Value.ToString();
            textBox6.Text = dataGridView1.Rows[sec].Cells[5].Value.ToString();
          
           
        }

        private void Poliklinikler_Load(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PoliklinikNoSec";
            //cmd.CommandText = "PoliklinikNoSec2";
            //cmd.CommandText = "PoliklinikNoSec3";

            SqlDataReader dr;

            conn.Open();
            dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                comboBox1.Items.Add(dr["PoliklinikNo"]);
                //comboBox3.Items.Add(dr["PoliklinikNo"]);
                //comboBox2.Items.Add(dr["PoliklinikNo"]);

            }

            conn.Close();


        }

        private void button5_Click(object sender, EventArgs e)
        {
            AnaSayfa git = new AnaSayfa();
            git.Show();
            this.Hide();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void button3_Click(object sender, EventArgs e)
        {


            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "AramaYapPoliklinikNoAd";
            cmd.Parameters.AddWithValue("PoliklinikNo", comboBox1.Text);
            cmd.Parameters.AddWithValue("PoliklinikAd", textBox7.Text);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dataGridView1.DataSource = dt;
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }
}
