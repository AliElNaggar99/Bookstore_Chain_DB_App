﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Bookstore_Application
{
    public partial class Settingsform : Form
    {
        string Email;
        PubController ControlObj;
        public Settingsform(string Mail)
        {
            InitializeComponent();
            Email = Mail;
            ControlObj = new PubController();
        }

        private void ChangePWButton_Click(object sender, EventArgs e)
        {

        }

        private void ChangePWButton_Click_1(object sender, EventArgs e)
        {
            string OldPW_Input = OldPW_Txtbox.Text;
            string NewPW_Input = NewPW_Txtbox.Text;
            string Confirm_Input = ConfirmPW_Txtbox.Text;


            string OldPW_Real = ControlObj.GetPWFromMail(Email);

            if (OldPW_Input != OldPW_Real)
            {
                MessageBox.Show("Old Password is Incorrect");
                return;
            }
            if (NewPW_Input != Confirm_Input)
            {
                MessageBox.Show("New and Confirmed Passwords must be the same");
                return;
            }
            if (NewPW_Input.Length < 8)
            {

                MessageBox.Show("New password must be longer than or equal 8 characters");
                return;
            }

            ControlObj.UpdatePassword(Email, NewPW_Input);
            MessageBox.Show("Password Changed Succesfully");
        }
    }
}