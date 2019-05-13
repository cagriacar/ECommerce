using ETicaret.WebUI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ETicaret.WebUI.App_Classes
{
    public class Cart
    {
        public static Cart ActiveCart
        {
            get
            {
                HttpContext ctx = HttpContext.Current;
                if (ctx.Session["ActiveCart"] == null)
                {
                    ctx.Session["ActiveCart"] = new Cart();
                }
                return (Cart)ctx.Session["ActiveCart"];
            }
        }

        private List<CartItem> cartProducts = new List<CartItem>();

        public List<CartItem> CartProducts
        {
            get { return cartProducts; }
            set { cartProducts = value; }
        }

        public void AddtoCart(CartItem cartItem)
        {
            if (HttpContext.Current.Session["ActiveCart"] != null)
            {
                Cart cart = (Cart)HttpContext.Current.Session["ActiveCart"];
                if (cart.CartProducts.Any(x => x.Product.Id == cartItem.Product.Id))
                {
                    cart.CartProducts.FirstOrDefault(x => x.Product.Id == cartItem.Product.Id).Adet++;
                }
                else
                {
                    cart.CartProducts.Add(cartItem);
                }
            }
            else
            {
                Cart cart = new Cart();
                try
                {
                    cart.CartProducts.Add(cartItem);
                }
                catch (Exception e)
                {
                    
                }
                HttpContext.Current.Session["ActiveCart"] = cart;
            }
        }

        public decimal ToplamTutar
        {
            get
            {
                return CartProducts.Sum(x => x.Tutar);
            }
        }

    }

    public class CartItem
    {
        public Product Product { get; set; }
        public int Adet { get; set; }
        public double Indirim { get; set; }
        public decimal Tutar
        {
            get
            {
                return Product.SatisFiyati * Adet * (decimal)(1 - Indirim);
            }
        }
    }
}