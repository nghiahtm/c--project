using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace DoAnTotNghiep.Models
{
    public class LoginModel
    {
        [Key]
        [Required(ErrorMessage = "Vui lòng nhập Email")]
        [Display(Name = "Email")]
        public string userMail { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập Mật khẩu")]
        [Display(Name = "Password")]
        public string password { get; set; }
    }
}