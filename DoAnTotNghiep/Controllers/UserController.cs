 using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Reflection;
using System.Web;
using System.Web.Mvc;
using DoAnTotNghiep.Models;
namespace DoAnTotNghiep.Controllers
{
   
    public class UserController : Controller
    {
        QLBanCayCanhEntities db = new QLBanCayCanhEntities();
        // GET: User
        // ĐĂNG KÝ
        public ActionResult Register()
        {
            return View();
        }

        // ĐĂNG KÝ PHƯƠNG THỨC POST
        [HttpPost]
        public ActionResult Register(Userr user)
        {
            try
            {
                Session["userReg"] = user;

                // Thêm người dùng  mới
                db.Userrs.Add(user);
                // Lưu lại vào cơ sở dữ liệu
                db.SaveChanges();
                // Nếu dữ liệu đúng thì trả về trang đăng nhập
                if (ModelState.IsValid)
                {
                    //
                    ViewBag.RegOk = "Sign Up Success!";
                    ViewBag.isReg = true;
                    return RedirectToAction("Login");
                    //return View("Register");

                }
                else
                {
                    return View("Register");
                }

            }
            catch
            {
                return View();
            }
        }

        public ActionResult Login()
        {
            return View(new LoginModel());
        }


        [HttpPost]
        public ActionResult Login(LoginModel userlog)
        {
            string userMail = userlog.userMail;
            string password = userlog.password;
            var islogin = db.Userrs.SingleOrDefault(x => x.Email.Equals(userMail) && x.User_Password.Equals(password));

            if (islogin != null)
            {
                var idUser = islogin.ID_User;
                if (userMail == "Admin@gmail.com")
                {
                    Session["admin_use"] = islogin;
                    return RedirectToAction("Index", "Admin/Dashboard");
                }
                else
                {
                    Session["use"] = islogin;
                    return RedirectToAction("Index", "Product");
                }
              
            }
            else
            {
                ViewBag.Fail = "Account or password is incorrect.";
                return View(userlog);
            }

        }
        public ActionResult Logout()
        {
            Session["use"] = null;
            return RedirectToAction("Login", "User");

        }
        public ActionResult Profile(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Userr uSer = db.Userrs.Find(id);
            if (uSer == null)
            {
                return HttpNotFound();
            }
            return View(uSer);
        }
        public ActionResult Edit(int? id)
        {
           
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Userr nguoidung = db.Userrs.Find(id);

            if (nguoidung == null)
            {
                return HttpNotFound();
            }
            //ViewBag.ID_Role = new SelectList(db.Roles, "ID_Role", "Role_Name", nguoidung.ID_Role);
            if (ModelState.IsValid)
            {
                db.Entry(nguoidung).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Profile");
            }
            return View(nguoidung);
        }



    }
    }