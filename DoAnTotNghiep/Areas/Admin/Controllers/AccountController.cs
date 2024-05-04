using DoAnTotNghiep.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DoAnTotNghiep.Areas.Admin.Controllers
{
    public class AccountController : Controller
    {
        QLBanCayCanhEntities db = new QLBanCayCanhEntities();
        // GET: Admin/Account

        [HttpGet]
        public ActionResult Login()
        {
            return View( new LoginModel());
        }

        [HttpPost]
        public ActionResult Login (LoginModel model)
        {
            if(ModelState.IsValid)
            {
                string userMail = model.userMail;
                string password = model.password;
                var islogin = db.Userrs.SingleOrDefault(x => x.Email.Equals(userMail) && x.User_Password.Equals(password));

                if (islogin != null)
                {
                    var idUser = islogin.ID_User;
                    if (userMail == "Admin@gmail.com")
                    {
                        Session["admin_use"] = islogin;
                        return RedirectToAction("Index", "Dashboard");
                    }
                    else
                    {
                        ModelState.AddModelError("userMail", "Access Denied.");
                        ViewBag.Fail = "Access Denied.";
                        return View(model);
                    }

                }
                else
                {
                    ViewBag.Fail = "Account or password is incorrect.";
                    ModelState.AddModelError("password", "Account or password is incorrect.");
                }
            }

            return View(model);
        }

        public ActionResult Logout()
        {
            if (System.Web.HttpContext.Current.Session["admin_use"] == null)
            {
                System.Web.HttpContext.Current.Response.Redirect("~/Admin/Account/Login");
            }

            Session["admin_use"] = null;
            return RedirectToAction("Login", "Account");

        }

        public ActionResult Index(Data.Filter filter)
        {
            if (System.Web.HttpContext.Current.Session["admin_use"] == null)
            {
                System.Web.HttpContext.Current.Response.Redirect("~/Admin/Account/Login");
            }

            ViewData["Filter"] = filter;
            var models = db.Userrs.ToList();

            if (!string.IsNullOrEmpty(filter.Keyword))
                models = models.Where(t => t.Email.ToUpper().Trim().Contains(filter.Keyword.ToUpper().Trim()) ||
                                            t.UserName.ToUpper().Trim().Contains(filter.Keyword.ToUpper().Trim())).ToList();

            return View(models.OrderByDescending(t => t.ID_User).ToPagedList(filter.PageIndex, filter.PageSize));
        }

        [HttpGet]
        public ActionResult Create()
        {
            if (System.Web.HttpContext.Current.Session["admin_use"] == null)
            {
                System.Web.HttpContext.Current.Response.Redirect("~/Admin/Account/Login");
            }

            return View(new Userr());
        }

        [HttpPost]
        public ActionResult Create(Userr model)
        {
            if (System.Web.HttpContext.Current.Session["admin_use"] == null)
            {
                System.Web.HttpContext.Current.Response.Redirect("~/Admin/Account/Login");
            }

            if (ModelState.IsValid)
            {
                model.Role_Group_Id = 2;

                db.Userrs.Add(model);
                db.SaveChanges();

                return RedirectToAction("Index");
            }
            return View(model);
        }

        [HttpGet]
        public ActionResult Edit(int id)
        {
            if (System.Web.HttpContext.Current.Session["admin_use"] == null)
            {
                System.Web.HttpContext.Current.Response.Redirect("~/Admin/Account/Login");
            }

            var model = db.Userrs.Find(id);

            return View(model);
        }

        [HttpPost]
        public ActionResult Edit(int id, Userr model)
        {
            if (System.Web.HttpContext.Current.Session["admin_use"] == null)
            {
                System.Web.HttpContext.Current.Response.Redirect("~/Admin/Account/Login");
            }

            var modelInit = db.Userrs.Find(id);
            if (ModelState.IsValid)
            {
                modelInit.Email = model.Email;
                modelInit.UserName = model.UserName;
                modelInit.User_Password = model.User_Password;
                modelInit.Phone = model.Phone;
                modelInit.User_Address = model.User_Address;

                db.Userrs.AddOrUpdate(modelInit);
                db.SaveChanges();

                return RedirectToAction("Index");
            }
            return View(model);
        }

        public ActionResult Delete(int id)
        {
            if (System.Web.HttpContext.Current.Session["admin_use"] == null)
            {
                System.Web.HttpContext.Current.Response.Redirect("~/Admin/Account/Login");
            }

            var model = db.Userrs.Find(id);
            if (model == null)
                return RedirectToAction("Index");

            db.Userrs.Remove(model);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}