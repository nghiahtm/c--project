using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace DoAnTotNghiep.Data
{
    public enum RoleDef
    {
        [Display(Name = "Thêm mới quyền",Description = "Nhóm quyền", Order = 1)]
        AddRoleDef,
        [Display(Name = "Chỉnh sửa quyền", Description = "Nhóm quyền", Order = 1)]
        EditRoleDef,
        [Display(Name = "Xoá quyền", Description = "Nhóm quyền", Order = 1)]
        DeleteRoleDef,
        [Display(Name = "Xem quyền", Description = "Nhóm quyền", Order = 1)]
        ViewRoleDef,
        [Display(Name = "Thêm mới sản phẩm", Description = "Sản phẩm", Order = 1)]
        AddProduct,
        [Display(Name = "Chỉnh sửa sản phẩm", Description = "Sản phẩm", Order = 1)]
        EditProduct,
        [Display(Name = "Xoá sản phẩm", Description = "Sản phẩm", Order = 1)]
        DeleteProduct,
        [Display(Name = "Xem sản phẩm", Description = "Sản phẩm", Order = 1)]
        ViewProduct,
        [Display(Name = "Thêm mới đơn hàng", Description = "Đơn hàng", Order = 1)]
        AddOrder,
        [Display(Name = "Chỉnh sửa đơn hàng", Description = "Đơn hàng", Order = 1)]
        EditOrder,
        [Display(Name = "Xoá đơn hàng", Description = "Đơn hàng", Order = 1)]
        DeleteOrder,
        [Display(Name = "Xem đơn hàng", Description = "Nhóm quyền", Order = 1)]
        ViewOrder,
        [Display(Name = "Thêm mới người dùng", Description = "Người dùng", Order = 1)]
        AddUser,
        [Display(Name = "Chỉnh sửa người dùng", Description = "Người dùng", Order = 1)]
        EditUser,
        [Display(Name = "Xoá người dùng", Description = "Người dùng", Order = 1)]
        DeleteUser,
        [Display(Name = "Xem người dùng", Description = "Người dùng", Order = 1)]
        ViewUser,
    }
}