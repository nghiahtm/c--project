using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Drawing.Printing;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using DoAnTotNghiep.Data;
using DoAnTotNghiep.Models;
using DoAnTotNghiep.Models.DTO;
using Microsoft.Ajax.Utilities;
using Newtonsoft.Json;
using PagedList;
namespace DoAnTotNghiep.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        QLBanCayCanhEntities db = new QLBanCayCanhEntities();
        private int idUs;
        public ActionResult Index(int? page)
        {
            var user = (Userr)Session["use"];
            if (user != null)
            {
                var lstProCart = db.Carts.Where(x => x.ID_User == user.ID_User).ToList();
                var lstProFavor = db.Favorites.Where(x => x.ID_User == user.ID_User).ToList();
                var lstOrder = db.Orders.Where(x => x.ID_User == user.ID_User).ToList();
                if (page == null) page = 1;
                int pageSize = 12;
                int pageNumber = (page ?? 1);
                List<Product> lstProducts = db.Products.ToList();
                ViewBag.CartQty = lstProCart.Count();
                ViewBag.FavorQty = lstProFavor.Count();
                ViewBag.OrderQty = lstOrder.Count();
                return PartialView(lstProducts.ToPagedList(pageNumber, pageSize));
            }
            else
            {
                return RedirectToAction("Login", "User");
            }


        }

        public ActionResult Order()
        {
            var userEmail = (Userr)Session["use"];
            var lstOrder = new List<OrderDTO>();
            if (userEmail != null)
            {
                var id_User = db.Userrs.FirstOrDefault(x => x.Email == userEmail.Email).ID_User;

                lstOrder = db.Orders.Where(s=> s.ID_User == id_User).Select(x=> new OrderDTO
                {
                    ID_User = id_User,
                    Date_Order = x.Date_Order,
                    Date_Payment = x.Date_Payment,
                    ID_Order = x.ID_Order,
                    Order_Status = x.Order_Status.Value,
                    payment_method = x.payment_method,
                    Payment_Status = x.Payment_Status.Value,
                    Shipping_fee = x.Shipping_fee,
                    Total_money = x.Total_money,
                }).ToList();
                if (lstOrder == null)
                {
                    Response.StatusCode = 404;
                    return View(new List<OrderDTO>());
                }
                return View(lstOrder);
            }
            else
            {
                return RedirectToAction("Login", "User");
            }

        }

        public ActionResult UpdateStatus(int id, int status)
        {
            var model = db.Orders.Find(id);
            if (model == null)
                return RedirectToAction("Order", "Product");

            if (status == (int)OrderStatus.Da_Hoan_Thanh)
                model.Payment_Status = true;

            model.Order_Status = status;

            db.Orders.AddOrUpdate(model);
            db.SaveChanges();

            return RedirectToAction("Order", "Product");
        }

        public PartialViewResult CategoryPartial()
        {
            return PartialView(db.Categories.ToList());
        }
        public ActionResult ProductByCategory(int ID_Category, int page = 1)
        {
            var user = (Userr)Session["use"];
            var lstProCart = db.Carts.Where(x => x.ID_User == user.ID_User).ToList();
            var lstProFavor = db.Favorites.Where(x => x.ID_User == user.ID_User).ToList();
            ViewBag.CartQty = lstProCart.Count();
            ViewBag.FavorQty = lstProFavor.Count();
            int itemsPerPage = 9;
            var totalItems = db.Products.Where(n => n.ID_Category == ID_Category).Count();
            var totalPages = (int)Math.Ceiling((double)totalItems / itemsPerPage);
            ViewBag.TotalPages = totalPages;
            List<Product> lstProducts = db.Products.Where(n => n.ID_Category == ID_Category)
                .OrderBy(p => p.ID_Product)
                .Skip((page - 1) * itemsPerPage)
                .Take(itemsPerPage)
                .ToList();
            if (lstProducts.Count == 0)
            {
                ViewBag.Products = "This product is not available!";
                ViewBag.lstProducts = db.Products.ToList();
            }
            return PartialView(lstProducts);
        }
        [HttpPost]
        public ActionResult SearchResults(FormCollection f, int? page)
        {
            var user = (Userr)Session["use"];
            if (user != null)
            {
                var lstProCart = db.Carts.Where(x => x.ID_User == user.ID_User).ToList();
                var lstProFavor = db.Favorites.Where(x => x.ID_User == user.ID_User).ToList();

                ViewBag.CartQty = lstProCart.Count();
                ViewBag.FavorQty = lstProFavor.Count();
            }


            if (page == null) page = 1;
            int pageSize = 9;
            int pageNumber = (page ?? 1);
            string searchkey = f["txtsearch"].ToString();
            List<Product> lstSearchResults = db.Products.Where
                (n => n.Product_Name.Contains(searchkey)).ToList();
            ViewBag.keyword = searchkey;
            if (lstSearchResults.Count == 0)
            {
                ViewBag.ThongBao = " This product is not available!";
                return View(db.Products.ToList());
            }
            ViewBag.ThongBao = " Find" + lstSearchResults.Count + "product";
            //return View(lstSearchResults.OrderBy(n => n.Product_Name).ToList());
            return PartialView(lstSearchResults.OrderBy(n => n.Product_Name).ToPagedList(pageNumber, pageSize));
        }
        [HttpGet]
        public ActionResult SearchResults(string searchkey, int? page)
        {
            var user = (Userr)Session["use"];
            if (user != null)
            {
                var lstProCart = db.Carts.Where(x => x.ID_User == user.ID_User).ToList();
                var lstProFavor = db.Favorites.Where(x => x.ID_User == user.ID_User).ToList();

                ViewBag.CartQty = lstProCart.Count();
                ViewBag.FavorQty = lstProFavor.Count();
            }
                if (page == null) page = 1;
                int pageSize = 9;
                int pageNumber = (page ?? 1);
                ViewBag.keyword = searchkey;
                List<Product> lstSearchResults = db.Products.Where
                    (n => n.Product_Name.Contains(searchkey)).ToList();
                ViewBag.keyword = searchkey;
                if (lstSearchResults.Count == 0)
                {
                    ViewBag.ThongBao = " This product is not available!";
                    return View(db.Products.ToList());
                }
                ViewBag.ThongBao = "Find" + lstSearchResults.Count + "product";
                return PartialView(lstSearchResults.OrderBy(n => n.Product_Name).ToPagedList(pageNumber, pageSize));

            }
           
        
        public ActionResult ProductDetail(int ID_Product)
        {
            var user = (Userr)Session["use"];
            if (user != null)
            {
                var lstProCart = db.Carts.Where(x => x.ID_User == user.ID_User).ToList();
                var lstProFavor = db.Favorites.Where(x => x.ID_User == user.ID_User).ToList();
                ViewBag.CartQty = lstProCart.Count();
                ViewBag.FavorQty = lstProFavor.Count();
                Product product = db.Products.SingleOrDefault(n => n.ID_Product == ID_Product);
                var lstLastestPro = db.Lastests.AsQueryable().OrderBy(x => x.Date_Create).ToList();
                if (lstLastestPro.Count() == 6)
                {
                    var lastest = lstLastestPro.FirstOrDefault();
                    db.Lastests.Remove(lastest);
                }
                var proLast = db.Lastests.FirstOrDefault(x => x.ID_Product == ID_Product);
                if (proLast == null)
                {
                    var lastestPro = new Lastest();
                    lastestPro.ID_Product = ID_Product;
                    lastestPro.ID_User = user.ID_User;
                    lastestPro.Date_Create = DateTime.Now;
                    db.Lastests.Add(lastestPro);
                    db.SaveChanges();
                }
                if (product == null)
                {
                    Response.StatusCode = 404;
                    return null;
                }
                var related_products = db.Products.Where(p => p.ID_Product != product.ID_Product && p.ID_Category == product.ID_Category).Take(4).ToList();
                ViewBag.related_products = related_products;
                return View(product);
            }
            else
            {
                return RedirectToAction("Login", "User");
            }

        }
        public ActionResult Shop(string email)
        {
            if (!String.IsNullOrEmpty(email))
            {
                var id_User = db.Userrs.FirstOrDefault(x => x.Email == email).ID_User;
                var lstProductInCart = db.Carts.Where(x => x.ID_User == id_User).ToList();
                var qtyFavor = db.Favorites.Where(x => x.ID_User == id_User).ToList();
                var res = new
                {
                    success = true,
                    message = "Oke",
                    qtyCart = lstProductInCart.Count,
                    qtyFavor = qtyFavor.Count,
                    id_User = id_User,
                };
                return Json(res);
            }
            else
            {
                return Json(new { success = false, message = "Yêu cầu đăng nhập" });
            }
        }
        public ActionResult ViewShop(int page, double minPrice, double maxPrice)
        {
            var user = (Userr)Session["use"];
            if (user != null)
            {
                if (page == 0)
                {
                    page = 1;
                }

                var lstProCart = db.Carts.Where(x => x.ID_User == user.ID_User).ToList();
                var lstProFavor = db.Favorites.Where(x => x.ID_User == user.ID_User).ToList();
                int itemsPerPage = 9;
                var totalItems = db.Products.Count();
                var totalPages = (int)Math.Ceiling((double)totalItems / itemsPerPage);
                ViewBag.TotalPages = totalPages;
                var products = db.Products.AsQueryable();
                if (minPrice != 0)
                {
                    products = products.Where(p => p.Price >= minPrice);
                }
                if (maxPrice != 0)
                {
                    products = products.Where(p => p.Price <= maxPrice);
                }
                var newproducts = products.OrderBy(p => p.ID_Product).Skip((page - 1) * itemsPerPage)
                                          .Take(itemsPerPage)
                                          .ToList();
                var lstLastest = db.Lastests.Select(x => x.ID_Product).ToList();
                var proPerPage = 3;
                var totalPro = lstLastest.Count();
                var totalPagesLast = (int)Math.Ceiling((double)totalPro / proPerPage);
                var proLast = db.Products.Where(p => lstLastest.Contains(p.ID_Product))
                                          .OrderBy(p => p.ID_Product)
                                          .Skip((page - 1) * proPerPage)
                                          .Take(proPerPage)
                                          .ToList();
                var modifiedProducts = new List<Product>();
                foreach (var product in proLast)
                {
                    product.Product_Img = product.Product_Img.Trim();
                    modifiedProducts.Add(product);
                }
                ViewBag.TotalPagesLast = totalPagesLast;
                ViewBag.CartQty = lstProCart.Count();
                ViewBag.FavorQty = lstProFavor.Count();
                ViewBag.Lastest = modifiedProducts;
                return PartialView(newproducts);
            }
            else
            {
                return RedirectToAction("Login", "User");
            }

        }
        [HttpPost]
        public JsonResult AddShop(int id)
        {
            try
            {
                var checkRole = IsInRole(RoleDef.AddProduct);
                if (checkRole == true)
                {
                    var cart = new Cart();
                    var userEmail = (Userr)Session["use"];
                    if (userEmail == null)
                    {
                        return Json(new { success = false, message = "Yêu cầu đăng nhập" });
                    }
                    else
                    {
                        var id_User = db.Userrs.FirstOrDefault(x => x.Email == userEmail.Email).ID_User;
                        cart.ID_User = id_User;
                        cart.ID_Product = id;
                        var cartByIdProduct = db.Carts.FirstOrDefault(x => x.ID_Product == cart.ID_Product);
                        if (cartByIdProduct != null)
                        {
                            cartByIdProduct.Quantity += 1;
                            db.SaveChanges();
                        }
                        else
                        {
                            cart.Quantity = 1;
                            db.Carts.Add(cart);
                            db.SaveChanges();
                        }
                        var totalQuantity = db.Carts.Where(x => x.ID_User == id_User).ToList();
                        var qty = totalQuantity.Count();
                        return Json(new { success = true, message = "Product added to cart successfully.", qty = qty });
                    }
                }
                else
                {
                    return Json(new { success = false, message = "Bạn không có quyền truy cập chức năng này." });
                }

            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = "Đã xảy ra lỗi khi thêm sản phẩm vào giỏ hàng: " + ex.Message }); // Trả về kết quả JSON nếu có lỗi
            }
        }
        [HttpPost]
        public JsonResult AddFavorite(int id)
        {
            try
            {
                var favorite = new Favorite();
                var userEmail = (Userr)Session["use"];
                if (userEmail == null)
                {
                    return Json(new { success = false, message = "Yêu cầu đăng nhập" });
                }
                else
                {
                    var id_User = db.Userrs.FirstOrDefault(x => x.Email == userEmail.Email).ID_User;
                    favorite.ID_User = id_User;
                    favorite.ID_Product = id;
                    var favoriteById = db.Favorites.FirstOrDefault(x => x.ID_Product == favorite.ID_Product);
                    if (favoriteById != null)
                    {
                        return Json(new { success = false, message = "This product has been added to favorites!" });
                    }
                    else
                    {
                        db.Favorites.Add(favorite);
                        db.SaveChanges();
                    }
                    var lstFavo = db.Favorites.Where(x => x.ID_User == id_User).ToList();
                    var qtyFavor = lstFavo.Count();
                    return Json(new { success = true, message = "Product added to favorites successfully.", qtyFavor = qtyFavor });
                }
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = "Đã xảy ra lỗi khi thêm sản phẩm vào mục yêu thích: " + ex.Message }); // Trả về kết quả JSON nếu có lỗi
            }
        }
        public ActionResult Cart()
        {
            var userEmail = (Userr)Session["use"];
            var lstProduct = new List<ProductDTO>();
            if (userEmail != null)
            {
                var id_User = db.Userrs.FirstOrDefault(x => x.Email == userEmail.Email).ID_User;
                var lstProductByUser = db.Carts.Where(x => x.ID_User == id_User).ToList();
                var lstFavor = db.Favorites.Where(x => x.ID_User == id_User).ToList();
                var totalPrice = 0.0;
                foreach (var item in lstProductByUser)
                {
                    var product = db.Products.FirstOrDefault(x => x.ID_Product == item.ID_Product);
                    var productDto = new ProductDTO();
                    productDto.ID_Product = product.ID_Product;
                    productDto.Product_Name = product.Product_Name;
                    productDto.Product_Img = product.Product_Img;
                    productDto.Price = product.Price ?? 0;
                    productDto.Quantity = item.Quantity ?? 0;
                    lstProduct.Add(productDto);
                    totalPrice += productDto.Price * productDto.Quantity;
                }
                ViewBag.TotalPrice = totalPrice;
                ViewBag.FavorQty = lstFavor.Count();
                ViewBag.CartQty = lstProductByUser.Count();

                if (lstProduct == null)
                {
                    Response.StatusCode = 404;
                    return null;
                }
                return View(lstProduct);
            }
            else
            {
                return RedirectToAction("Login", "User");
            }

        }
        public ActionResult UpdateCart(dynamic lstProduct)
        {
            var userEmail = (Userr)Session["use"];
            if (userEmail == null)
            {
                return Json(new { success = false, message = "Yêu cầu đăng nhập" });
            }
            else
            {
                var id_User = db.Userrs.FirstOrDefault(x => x.Email == userEmail.Email).ID_User;
                if (String.IsNullOrEmpty(lstProduct))
                {
                    return Json(new { success = true, message = "Shopping cart updated successfully!" });
                }
                else
                {
                    var lstProductDto = JsonConvert.DeserializeObject<List<ProductDTO>>(lstProduct);
                    var allItem = db.Carts;
                    db.Carts.RemoveRange(allItem);
                    var lstCart = new List<Cart>();
                    foreach (var item in lstProductDto)
                    {
                        var cart = new Cart();
                        cart.ID_User = id_User;
                        cart.ID_Product = item.ID_Product;
                        cart.Quantity = item.Quantity;
                        lstCart.Add(cart);
                    }
                    db.Carts.AddRange(lstCart);
                    db.SaveChanges();
                    return Json(new { success = true, message = "Shopping cart updated successfully!" });
                }

            }
        }

        public ViewResult Pay()
        {
            var userEmail = (Userr)Session["use"];
            if (userEmail == null)
            {
                return View("Login", "User", new { area = "" });
            }
            else
            {
                var lstProCart = db.Carts.Where(x => x.ID_User == userEmail.ID_User).ToList();
                var lstProFavor = db.Favorites.Where(x => x.ID_User == userEmail.ID_User).ToList();
                ViewBag.CartQty = lstProCart.Count();
                ViewBag.FavorQty = lstProFavor.Count();

                var user = db.Userrs.FirstOrDefault(x => x.Email == userEmail.Email);
                var lstProduct = db.Carts.Where(x => x.ID_User == user.ID_User).ToList();
                var lstProductDto = new List<ProductDTO>();
                var totalPrice = 0.0;
                foreach (var item in lstProduct)
                {
                    var productDto = new ProductDTO();
                    var product = db.Products.FirstOrDefault(x => x.ID_Product == item.ID_Product);
                    productDto.ID_Product = item.ID_Product;
                    productDto.Product_Name = product.Product_Name;
                    productDto.Quantity = item.Quantity ?? 0;
                    productDto.Price = product.Price ?? 0;
                    productDto.Product_Img = product.Product_Img;
                    lstProductDto.Add(productDto);
                    totalPrice += productDto.Price * productDto.Quantity;
                }
                ViewBag.ProductDto = lstProductDto;
                ViewBag.TotalPrice = totalPrice;
                return View(user);
            }

        }
        [HttpPost]
        public JsonResult OrderSuccess(string paymentMethod)
        {
            var userEmail = (Userr)Session["use"];
            var orderSuccess = new Order();
            if (userEmail == null)
            {
                return Json(new { success = false, message = "Yêu cầu đăng nhập" });
            }
            else
            {

                var user = db.Userrs.FirstOrDefault(x => x.Email == userEmail.Email);
                var lstProduct = db.Carts.Where(x => x.ID_User == user.ID_User).ToList();
                var totalPrice = 0.0;
                foreach (var item in lstProduct)
                {
                    var productDto = new ProductDTO();
                    var product = db.Products.FirstOrDefault(x => x.ID_Product == item.ID_Product);
                    productDto.Quantity = item.Quantity ?? 0;
                    productDto.Price = product.Price ?? 0;
                    totalPrice += productDto.Price * productDto.Quantity;
                }
                orderSuccess.Total_money = totalPrice;
                orderSuccess.ID_User = user.ID_User;
                orderSuccess.payment_method = (paymentMethod == "1" ? "Cash" : "ATM banking");
                orderSuccess.Order_Status = (int)OrderStatus.Da_Dat_Hang;
                orderSuccess.Payment_Status = false;
                orderSuccess.Shipping_fee = totalPrice;
                orderSuccess.Date_Payment = null;
                orderSuccess.Date_Order = DateTime.Now;
                var data = JsonConvert.SerializeObject(orderSuccess);
                db.Orders.Add(orderSuccess);
                var lstCart = db.Carts.Where(x => x.ID_User == user.ID_User);
                db.Carts.RemoveRange(lstCart);
                db.SaveChanges();
                var orderData = db.Orders.FirstOrDefault(x => x.Date_Order == orderSuccess.Date_Order);
                var idOrder = orderData.ID_Order;
                var res = new
                {
                    success = true,
                    message = "Đặt hàng thành công",
                    data = data,
                    idOrder = idOrder,
                };
                return Json(res);
            }

        }
        public ViewResult ViewOrderSuccess(int id)
        {
            var order = db.Orders.FirstOrDefault(x => x.ID_Order == id);
            return View(order);
        }
        public Boolean IsInRole(RoleDef role)
        {
            var userEmail = (Userr)Session["use"];
            if (userEmail != null)
            {
                var id_RoleGroup = db.Userrs.FirstOrDefault(x => x.Email == userEmail.Email).Role_Group_Id;
                var lstRole = db.Role_Def.Where(x => x.ID_RoleGroup == id_RoleGroup).ToList();
                var checkRole = true;
                foreach (var item in lstRole)
                {
                    if (item.Role_Name == role.ToString())
                    {
                        checkRole = true;
                        break;
                    }
                    else
                    {
                        checkRole = false;
                    }
                }
                return checkRole;

            }
            else
            {
                return false;
            }
        }
        public ActionResult RemoveOnCart(int id)
        {
            var user = (Userr)Session["use"];
            if (user != null)
            {
                if (id != 0)
                {
                    var product = db.Carts.FirstOrDefault(x => x.ID_Product == id);
                    db.Carts.Remove(product);
                    db.SaveChanges();
                }
                return Json(new { success = true, message = "Product deleted successfully." });
            }
            else
            {
                return Json(new { success = false, message = "Yêu cầu đăng nhập" });
            }

        }
        public ActionResult RemoveOnFavorite(int id)
        {
            var user = (Userr)Session["use"];
            if (user != null)
            {
                if (id != 0)
                {
                    var p = db.Favorites.FirstOrDefault(x => x.ID_Product == id);
                    db.Favorites.Remove(p);
                    db.SaveChanges();
                }
                return Json(new { success = true, message = "Product deleted successfully." });
            }
            else
            {
                return Json(new { success = false, message = "Request Login" });
            }

        }
        public ActionResult Blog(int? page)
        {
            var user = (Userr)Session["use"];
            if (user != null)
            {
                var lstProCart = db.Carts.Where(x => x.ID_User == user.ID_User).ToList();
                var lstProFavor = db.Favorites.Where(x => x.ID_User == user.ID_User).ToList();
                ViewBag.CartQty = lstProCart.Count();
                ViewBag.FavorQty = lstProFavor.Count();
            }
            if (page == null) page = 1;
            int pageSize = 4;
            int pageNumber = (page ?? 1);
            List<Post> lstPost = db.Posts.ToList();
            return PartialView(lstPost.ToPagedList(pageNumber, pageSize));
        }

        public PartialViewResult CategoryPostPartial()
        {
            return PartialView(db.CategoryPosts.ToList());
        }
        public ViewResult PostByCategory(int ID_CategoryP)
        {
            var user = (Userr)Session["use"];
            if (user != null)
            {
                var lstProCart = db.Carts.Where(x => x.ID_User == user.ID_User).ToList();
                var lstProFavor = db.Favorites.Where(x => x.ID_User == user.ID_User).ToList();
                ViewBag.CartQty = lstProCart.Count();
                ViewBag.FavorQty = lstProFavor.Count();
            }
            List<Post> lstPost = db.Posts.Where(n => n.ID_CategoryP == ID_CategoryP).OrderBy(n => n.ID_CategoryP).ToList();
            if (lstPost.Count == 0)
            {
                ViewBag.lstPost = db.Posts.ToList();
            }

            //var related_post = db.Posts.Where(n => n.ID_CategoryP == ID_CategoryP).OrderByDescending(x => x.Date_post).Take(3).ToList();
            //ViewBag.related_post = related_post;
            return View(lstPost);
        }
        public ViewResult BlogDetail(int ID_CategoryP)
        {
            var user = (Userr)Session["use"];
            if (user != null)
            {
                var lstProCart = db.Carts.Where(x => x.ID_User == user.ID_User).ToList();
                var lstProFavor = db.Favorites.Where(x => x.ID_User == user.ID_User).ToList();
                ViewBag.CartQty = lstProCart.Count();
                ViewBag.FavorQty = lstProFavor.Count();
            }
            Post post = db.Posts.SingleOrDefault(n => n.ID_CategoryP == ID_CategoryP);
            if (post == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            var related_post = db.Posts.Where(p => p.ID_CategoryP != post.ID_Post && p.ID_Post == post.ID_CategoryP).OrderByDescending(x => x.Date_post).Take(3).ToList();
            ViewBag.related_post = related_post;
            return View(post);
        }
        public ActionResult Favorite()
        {
            var user = (Userr)Session["use"];
            if (user != null)
            {
                var lstProCart = db.Carts.Where(x => x.ID_User == user.ID_User).ToList();
                var lstProFavor = db.Favorites.Where(x => x.ID_User == user.ID_User).ToList();
                ViewBag.CartQty = lstProCart.Count();
                ViewBag.FavorQty = lstProFavor.Count();
                List<Favorite> fa = db.Favorites.ToList();
                var id_User = db.Userrs.FirstOrDefault(x => x.Email == user.Email).ID_User;
                var favorite = db.Favorites.Where(p => p.ID_User == id_User).Take(4).ToList();
                ViewBag.favorite = favorite;
                //var favorite = db.Favorites.Where(x => x.ID_User == id_User);
                return View(favorite);
            }
            return View();

        }
        public ActionResult Contact()
        {
            var user = (Userr)Session["use"];
            if (user != null)
            {
                var lstProCart = db.Carts.Where(x => x.ID_User == user.ID_User).ToList();
                var lstProFavor = db.Favorites.Where(x => x.ID_User == user.ID_User).ToList();
                ViewBag.CartQty = lstProCart.Count();
                ViewBag.FavorQty = lstProFavor.Count();
            }
            return View();

        }
        public ActionResult SubmitContact(Contact mContact)
        {
            var user = (Userr)Session["use"];
            if (user != null)
            {
                var lstProCart = db.Carts.Where(x => x.ID_User == user.ID_User).ToList();
                var lstProFavor = db.Favorites.Where(x => x.ID_User == user.ID_User).ToList();
                ViewBag.CartQty = lstProCart.Count();
                ViewBag.FavorQty = lstProFavor.Count();
            }
            mContact.Fullname = Request.Form["Fullname"];
            mContact.Email = Request.Form["Email"];
            mContact.Messagee = Request.Form["Message"];
            mContact.Status = 1;
            mContact.Created_at = DateTime.Now;
            mContact.Updated_at = DateTime.Now;
            mContact.Updated_by = 1;

            db.Contacts.Add(mContact);
            db.SaveChanges();
            return RedirectToAction("Contact", "Product");

        }


    }
}