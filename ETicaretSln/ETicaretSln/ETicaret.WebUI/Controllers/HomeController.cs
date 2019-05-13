using ETicaret.WebUI.App_Classes;
using ETicaret.WebUI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ETicaret.WebUI.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            return View();
        }

        public PartialViewResult CartWidget()
        {
            if (HttpContext.Session["ActiveCart"] != null)
            {
                return PartialView((Cart)HttpContext.Session["ActiveCart"]);
            }
            else
                return PartialView();
        }

        public PartialViewResult SliderWidget()
        {
            var data = Context.Connection.Photos.Where(x => x.BuyukYol.Contains("SliderPhotos")).ToList();
            return PartialView(data);
        }

        public PartialViewResult NewProductWidget()
        {
            var data = Context.Connection.Products.ToList();
            return PartialView(data);
        }

        public PartialViewResult ServiceWidget()
        {
            return PartialView();
        }

        public PartialViewResult MarkWidget()
        {
            var data = Context.Connection.Marks.ToList();
            return PartialView(data);
        }

        public void AddtoCart(int id)
        {
            CartItem cartItem = new CartItem();
            Product product = Context.Connection.Products.FirstOrDefault(x => x.Id == id);
            cartItem.Product = product;
            cartItem.Adet = 1;
            cartItem.Indirim = 0;
            Cart cart = new Cart();
            cart.AddtoCart(cartItem);
        }

        public void RemovefromCart(int id)
        {
            if (HttpContext.Session["ActiveCart"] != null)
            {
                Cart cart = (Cart)HttpContext.Session["ActiveCart"];
                if (cart.CartProducts.FirstOrDefault(x => x.Product.Id == id).Adet > 1)
                {
                    cart.CartProducts.FirstOrDefault(x => x.Product.Id == id).Adet--;
                }
                else
                {
                    CartItem cartItem = cart.CartProducts.FirstOrDefault(x => x.Product.Id == id);
                    cart.CartProducts.Remove(cartItem);
                }
            }
        }

        public ActionResult ProductDetail(int id)
        {
            var features = Context.Connection.ProductFeatures.Where(x => x.ProductId == id).ToList();
            ViewBag.Features = features;
            var data = Context.Connection.Products.FirstOrDefault(x => x.Id == id);
            return View(data);
        }

        public ActionResult Shops()
        {            
            ViewBag.Categories = Context.Connection.Categories.ToList();
            ViewBag.Marks = Context.Connection.Marks.ToList();
            return View();
        }

        public PartialViewResult ShopProductWidget(int? catId)
        {
            List<Product> products = new List<Product>();
            if (catId != null)
                products = Context.Connection.Products.Where(x => x.CategoryId == catId).ToList();
            else
                products = Context.Connection.Products.ToList();
            return PartialView(products);
        }
    }
}