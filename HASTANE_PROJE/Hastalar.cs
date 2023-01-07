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
    public partial class Hastalar : Form
    {
        public Hastalar()
        {
            InitializeComponent();
        }

        SqlConnection conn = new SqlConnection("Server = DESKTOP-BQTBB5Q\\SQLEXPRESS; Database = M02; uid=sa;pwd=1;");

        public void Getir()
        {

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "HListele";

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dataGridView1.DataSource = dt;
        }
        private void button10_Click(object sender, EventArgs e)
        {
            Getir();
        }

        private void button9_Click(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "HEkle";
            cmd.Parameters.AddWithValue("HastaAdiSoyadi", textBox2.Text);
            cmd.Parameters.AddWithValue("HastaTcNo", maskedTextBox1.Text);
            cmd.Parameters.AddWithValue("DogumTarihi", dateTimePicker1.Value);
            cmd.Parameters.AddWithValue("Boy", textBox4.Text);
            cmd.Parameters.AddWithValue("Yas", textBox5.Text);
            cmd.Parameters.AddWithValue("Reçete", textBox6.Text);
            cmd.Parameters.AddWithValue("RaporDurumu", textBox7.Text);
            cmd.Parameters.AddWithValue("RandevuTarihi", dateTimePicker2.Value);
            cmd.Parameters.AddWithValue("DoktorNo", textBox3
                .Text);
            cmd.ExecuteNonQuery();
            conn.Close();
            Getir();

            
        }

        private void button8_Click(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "HYenile";
            cmd.Parameters.AddWithValue("HastaNo", textBox1.Text);
            cmd.Parameters.AddWithValue("HastaAdiSoyadi", textBox2.Text);
            cmd.Parameters.AddWithValue("HastaTcNo", maskedTextBox1.Text);
            cmd.Parameters.AddWithValue("DogumTarihi", dateTimePicker1.Value);
            cmd.Parameters.AddWithValue("Boy", textBox4.Text);
            cmd.Parameters.AddWithValue("Yas", textBox5.Text);
            cmd.Parameters.AddWithValue("Reçete", textBox6.Text);
            cmd.Parameters.AddWithValue("RaporDurumu", textBox7.Text);
            cmd.Parameters.AddWithValue("RandevuTarihi", dateTimePicker2.Value);
            cmd.Parameters.AddWithValue("DoktorNo", textBox3.Text);
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
            cmd.CommandText = "HSil";
            cmd.Parameters.AddWithValue("HastaNo", comboBox2.Text);
            cmd.ExecuteNonQuery();
            conn.Close();
            Getir();

            
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int sec = dataGridView1.SelectedCells[0].RowIndex;
            textBox1.Text = dataGridView1.Rows[sec].Cells[0].Value.ToString();
            textBox2.Text = dataGridView1.Rows[sec].Cells[1].Value.ToString();
            maskedTextBox1.Text = dataGridView1.Rows[sec].Cells[2].Value.ToString(); 
            dateTimePicker1.Text = dataGridView1.Rows[sec].Cells[3].Value.ToString();
            textBox4.Text = dataGridView1.Rows[sec].Cells[4].Value.ToString();
            textBox5.Text = dataGridView1.Rows[sec].Cells[5].Value.ToString();
            textBox6.Text = dataGridView1.Rows[sec].Cells[6].Value.ToString();
            textBox7.Text = dataGridView1.Rows[sec].Cells[7].Value.ToString();
            dateTimePicker2.Text = dataGridView1.Rows[sec].Cells[8].Value.ToString();
            textBox3.Text = dataGridView1.Rows[sec].Cells[9].Value.ToString();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            AnaSayfa git = new AnaSayfa();
            git.Show();
            this.Hide();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void button5_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "AramaYapHasta";
            cmd.Parameters.AddWithValue("HastaNo", textBox9.Text);
            cmd.Parameters.AddWithValue("HastaAdiSoyadi", textBox10.Text);
            cmd.Parameters.AddWithValue("HastaTcNo", maskedTextBox2.Text);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dataGridView1.DataSource = dt;
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void Hastalar_Load(object sender, EventArgs e)
        {
           

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "HastaNoSec";

            SqlDataReader dr;

            conn.Open();
            dr = cmd.ExecuteReader();

            while(dr.Read())
            {
                comboBox2.Items.Add(dr["HastaNo"]);
            }
            
            conn.Close();
            
        }
    }
}
