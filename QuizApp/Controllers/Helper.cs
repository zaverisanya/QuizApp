using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuizApp.Controllers
{
    public class Helper
    {
        public static bool isAdmin
        {
            get
            {
                if (HttpContext.Current.Session["isAdmin"] != null)
                {
                    return Convert.ToBoolean(HttpContext.Current.Session["isAdmin"]);
                }
                else
                {
                    return false;
                }
            }
            set
            {
                HttpContext.Current.Session["isAdmin"] = value;
            }
        }
        public static string Username
        {
            get
            {
                if (HttpContext.Current.Session["Username"] != null)
                {
                    return Convert.ToString(HttpContext.Current.Session["Username"]);
                }
                else
                {
                    return string.Empty;
                }
            }
            set
            {
                HttpContext.Current.Session["Username"] = value;
            }
        }
    }
}