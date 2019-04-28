using StockMgmtMVC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace StockMgmtMVC.Controllers
{
    public class SaleController : Controller
    {
        // GET: Sale
        dbStockEntities2 conn = new dbStockEntities2();

        public ActionResult Sale()
        {
            return View(conn.sales.ToList());
        }

        // GET: Sale/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Sale/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Sale/Create
        [HttpPost]
        public ActionResult Create([Bind(Exclude = "id")] sale saleID)
        {
            if (!ModelState.IsValid)
                return View();0
            conn.sales.Add(saleID);
            conn.SaveChanges();
            return RedirectToAction("Sale");

        }

        // GET: Sale/Edit/5
        public ActionResult Edit(int id)
        {
            var saleId = (from m in conn.sales where m.id == id select m).First();
            return View(saleId);
        }

        // POST: Sale/Edit/5
        [HttpPost]
        public ActionResult Edit(sale saleID)
        {
            var orignalRecord = (from m in conn.sales where m.id == saleID.id select m).First();

            if (!ModelState.IsValid)
                return View(orignalRecord);
            conn.Entry(orignalRecord).CurrentValues.SetValues(saleID);

            conn.SaveChanges();
            return RedirectToAction("sale");

            


        }

        // GET: Sale/Delete/5
        public ActionResult Delete(sale saleId)
        {
            //delete the record of the particular id after clicking on the id or delete button
            var d = conn.sales.Where(x => x.id == saleId.id).FirstOrDefault();
            conn.sales.Remove(d);
            conn.SaveChanges();
            return RedirectToAction("sale");
        


    }

        // POST: Sale/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
