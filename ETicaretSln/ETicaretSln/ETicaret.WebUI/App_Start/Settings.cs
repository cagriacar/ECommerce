using System;
using System.Collections.Generic;
using System.Configuration;
using System.Drawing;
using System.Linq;
using System.Web;

namespace ETicaret.WebUI.App_Start
{
    public static class Settings
    {
        public static Size ProductMediumSize
        {
            get
            {
                Size size = new Size();
                size.Width = Convert.ToInt32(ConfigurationManager.AppSettings["ProductMediumWidth"]);
                size.Height = Convert.ToInt32(ConfigurationManager.AppSettings["ProductMediumHeight"]);
                return size;
            }
        }
        public static Size ProductLargeSize
        {
            get
            {
                Size size = new Size();
                size.Width = Convert.ToInt32(ConfigurationManager.AppSettings["ProductLargeWidth"]);
                size.Height = Convert.ToInt32(ConfigurationManager.AppSettings["ProductLargeHeight"]);
                return size;
            }
        }
        public static Size SliderSize
        {
            get
            {
                Size size = new Size();
                size.Width = Convert.ToInt32(ConfigurationManager.AppSettings["SliderWidth"]);
                size.Height = Convert.ToInt32(ConfigurationManager.AppSettings["SliderHeight"]);
                return size;
            }
        }
    }
}