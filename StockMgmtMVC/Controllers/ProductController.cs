using StockMgmtMVC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace StockMgmtMVC.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        dbStockEntities1 conn = new dbStockEntities1();

        public ActionResult Product()
        {
            return View(conn.products.ToList());
        }

        // GET: Product/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Product/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Product/Create
        [HttpPost]
        public ActionResult Create([Bind(Exclude = "id")] product purchase)
        {
            if (!ModelState.IsValid)
                return View();
            conn.products.Add(purchase);
            conn.SaveChanges();
            return RedirectToAction("Product");

        }

        // GET: Product/Edit/5
        public ActionResult Edit(int id)
        {
            var productId = (from m in conn.products where m.id == id select m).First();
            return View(productId);
        }

        // POST: Product/Edit/5
        [HttpPost]
        public ActionResult Edit(product productId)
        {
            var orignalRecord = (from m in conn.products where m.id == productId.id select m).First();

            if (!ModelState.IsValid)
                return View(orignalRecord);
            conn.Entry(orignalRecord).CurrentValues.SetValues(productId);

            conn.SaveChanges();
            return RedirectToAction("Product");




        }

        // GET: Product/Delete/5
        public ActionResult Delete(product productId)
        {
            //delete the record of the particular id after clicking on the id or delete button
            var d =conn.products.Where(x => x.id == productId.id).FirstOrDefault();
            conn.products.Remove(d);
            conn.SaveChanges();
            return RedirectToAction("Product");
        }

        // POST: Product/Delete/5
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
