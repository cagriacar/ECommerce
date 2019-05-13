using ETicaret.WebUI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ETicaret.WebUI.App_Classes
{
    public class Context
    {
        private static ECommerceContext connection;

        public static ECommerceContext Connection
        {
            get {
                if (connection == null)
                    connection = new ECommerceContext();
                return connection;
            }
            set { connection = value; }
        }

    }
}