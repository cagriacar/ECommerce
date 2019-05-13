using ETicaret.WebUI.App_Classes;
using ETicaret.WebUI.App_Start;
using ETicaret.WebUI.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ETicaret.WebUI.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Products()
        {
            return View(Context.Connection.Products.ToList());
        }

        public ActionResult AddProduct()
        {
            ViewBag.Categories = Context.Connection.Categories.ToList();
            ViewBag.Marks = Context.Connection.Marks.ToList();
            return View();
        }

        [HttpPost]
        public ActionResult AddProduct(Product product)
        {
            product.EklenmeTarihi = DateTime.Now;
            Context.Connection.Products.Add(product);
            Context.Connection.SaveChanges();
            return RedirectToAction("Products");
        }

        public ActionResult Marks()
        {
            return View(Context.Connection.Marks.ToList());
        }

        public ActionResult AddMark()
        {
            return View();
        }

        [HttpPost]
        public ActionResult AddMark(Mark mark, HttpPostedFileBase fileUpload)
        {
            int photoId = -1;
            if (fileUpload != null )
            {
                Image img = Image.FromStream(fileUpload.InputStream);

                int width = Convert.ToInt32(ConfigurationManager.AppSettings["MarkWidth"].ToString());

                int height = Convert.ToInt32(ConfigurationManager.AppSettings["MarkHeight"].ToString());

                string name = "/Content/MarkPhotos/" + Guid.NewGuid() + Path.GetExtension(fileUpload.FileName);

                Bitmap bm = new Bitmap(img, width, height);
                bm.Save(Server.MapPath(name));

                Photo photo = new Photo();
                photo.OrtaYol = name;
                Context.Connection.Photos.Add(photo);
                Context.Connection.SaveChanges();
                photoId = photo.Id;

                if (photoId != -1)
                {
                    mark.PhotoId = photoId;
                    Context.Connection.Marks.Add(mark);
                    Context.Connection.SaveChanges();
                }
            }
            return RedirectToAction("Marks");
        }

        public ActionResult Categories()
        {
            return View(Context.Connection.Categories.ToList());
        }

        public ActionResult AddCategory()
        {
            return View();
        }

        [HttpPost]
        public ActionResult AddCategory(Category category)
        {
            Context.Connection.Categories.Add(category);
            Context.Connection.SaveChanges();
            return RedirectToAction("Categories");
        }

        public ActionResult UpdateCategory(int id)
        {
            Category category = Context.Connection.Categories.FirstOrDefault(c => c.Id == id);
            return View(category);
        }
        [HttpPost]
        public ActionResult UpdateCategory(Category ctg)
        {
            Category category = Context.Connection.Categories.FirstOrDefault(c => c.Id == ctg.Id);
            category.Adi = ctg.Adi;
            category.Aciklama = ctg.Aciklama;
            Context.Connection.SaveChanges();
            return RedirectToAction("Categories");
        }
        [HttpPost]
        public string RemoveCategory(int id)
        {
            Category category = Context.Connection.Categories.FirstOrDefault(c => c.Id == id);
            Context.Connection.Categories.Remove(category);
            try
            {
                Context.Connection.SaveChanges();
                return "success";
            }
            catch (Exception)
            {
                return "error";
            }
        }

        public ActionResult FeatureTypes()
        {
            return View(Context.Connection.FeatureTypes.ToList());
        }

        public ActionResult AddFeatureType()
        {
            return View(Context.Connection.Categories.ToList());
        }

        [HttpPost]
        public ActionResult AddFeatureType(FeatureType featureType)
        {
            Context.Connection.FeatureTypes.Add(featureType);
            Context.Connection.SaveChanges();
            return RedirectToAction("FeatureTypes");
        }

        public ActionResult FeatureValues()
        {
            return View(Context.Connection.FeatureValues.ToList());
        }

        public ActionResult AddFeatureValue()
        {
            return View(Context.Connection.FeatureTypes.ToList());
        }

        [HttpPost]
        public ActionResult AddFeatureValue(FeatureValue featureValue)
        {
            Context.Connection.FeatureValues.Add(featureValue);
            Context.Connection.SaveChanges();
            return RedirectToAction("FeatureValues");
        }

        public ActionResult ProductFeatures()
        {
            return View(Context.Connection.ProductFeatures.ToList());
        }
        [HttpPost]
        public ActionResult RemoveProductFeature(int productId, int typeId, int valueId)
        {
            ProductFeature pf = Context.Connection.ProductFeatures.FirstOrDefault(x => x.ProductId == productId && x.FeatureTypeId == typeId && x.FeatureValueId == valueId);
            Context.Connection.ProductFeatures.Remove(pf);
            Context.Connection.SaveChanges();
            return RedirectToAction("ProductFeatures");
        }

        public ActionResult AddProductFeature()
        {
            return View(Context.Connection.Products.ToList());
        }

        public PartialViewResult ProductFeatureTypeWidget(int? catId)
        {
            if (catId != null)
            {
                var data = Context.Connection.FeatureTypes.Where(x => x.CategoryId == catId).ToList();
                return PartialView(data);
            }
            else
            {
                var data = Context.Connection.FeatureTypes.ToList();
                return PartialView(data);
            }
        }

        public PartialViewResult ProductFeatureValueWidget(int? typeId)
        {
            if (typeId != null)
            {
                var data = Context.Connection.FeatureValues.Where(x => x.FeatureTypeId == typeId).ToList();
                return PartialView(data);
            }
            else
            {
                var data = Context.Connection.FeatureValues.ToList();
                return PartialView(data);
            }
        }
        [HttpPost]
        public ActionResult AddProductFeature(ProductFeature pf)
        {
            Context.Connection.ProductFeatures.Add(pf);
            Context.Connection.SaveChanges();
            return RedirectToAction("ProductFeatures");
        }

        public ActionResult AddProductPhoto(int id)
        {
            return View(id);
        }

        [HttpPost]
        public ActionResult AddProductPhoto(int pId, HttpPostedFileBase fileUpload)
        {
            if (fileUpload != null)
            {
                Image img = Image.FromStream(fileUpload.InputStream);

                Bitmap mediumPhoto = new Bitmap(img, Settings.ProductMediumSize);

                Bitmap largePhoto = new Bitmap(img, Settings.ProductLargeSize);

                string ortaYol = "/Content/ProductPhotos/Medium/" + Guid.NewGuid() + Path.GetExtension(fileUpload.FileName);

                string buyukYol = "/Content/ProductPhotos/Large/" + Guid.NewGuid() + Path.GetExtension(fileUpload.FileName);

                mediumPhoto.Save(Server.MapPath(ortaYol));

                largePhoto.Save(Server.MapPath(buyukYol));

                Photo photo = new Photo();
                photo.BuyukYol = buyukYol;
                photo.OrtaYol = ortaYol;
                photo.ProductId = pId;

                if (Context.Connection.Photos.FirstOrDefault(x => x.ProductId == pId && x.Varsayilan == true) == null)
                {
                    photo.Varsayilan = true;
                }
                else
                {
                    photo.Varsayilan = false;
                }
                Context.Connection.Photos.Add(photo);
                Context.Connection.SaveChanges();
                return View(pId);
            }
            return View(pId);
        }

        public ActionResult AddSliderPhoto()
        {
            return View();
        }

        [HttpPost]
        public ActionResult AddSliderPhoto(HttpPostedFileBase fileUpload)
        {
            if (fileUpload != null)
            {
                Image img = Image.FromStream(fileUpload.InputStream);

                Bitmap sliderPhoto = new Bitmap(img, Settings.SliderSize);

                string buyukYol = "/Content/SliderPhotos/" + Guid.NewGuid() + Path.GetExtension(fileUpload.FileName);

                sliderPhoto.Save(Server.MapPath(buyukYol));

                Photo photo = new Photo();
                photo.BuyukYol = buyukYol;

                Context.Connection.Photos.Add(photo);
                Context.Connection.SaveChanges();
                return View();
            }
            return View();
        }
    }
}