using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using StockMgmtMVC.Models;
using System.Data;

namespace StockMgmtMVC.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        public ActionResult AdminLogin()
        {
            return View();
        }

        public ActionResult AdminZonal()
        {
            return View();
        }


        [HttpPost]
        //this method is used to validte the user name or password of the user after verfiying the both the control will  transfer to another page 
        //Validating information is very important the below given query is validating the data entered by the user 
        // if the imformation filled in text boxes is right then it opens the admin area
        public ActionResult validate(AdminLogin log) {

            AdminLogin objConnection = new AdminLogin();
            String query = "select * from login where UserName='" + log.SName + "' and Password='" + log.SPassword + "'";
            DataTable tbl = new DataTable();
            tbl = objConnection.Srch(query);

            if (tbl.Rows.Count > 0)
            {

                return View("AdminZonal");
            }
            else
            {
                return View("WrongPassword");
            }

        }


    }

}