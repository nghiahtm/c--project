using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace DoAnTotNghiep.Data
{
    public class Constant
    {
        public static string OrderStatusName(int status)
        {
            switch (status)
            {
                case (int)OrderStatus.Da_Dat_Hang:
                    return "Order Placed";
                case (int)OrderStatus.Da_Xac_Nhan:
                    return "Confirmed";
                case (int)OrderStatus.Dang_Giao:
                    return "Out for delivery";
                case (int)OrderStatus.Da_Hoan_Thanh:
                    return "Completed";
                case (int)OrderStatus.Da_Huy:
                    return "Cancelled";
                default:
                    return "";
            }
        }

        public static string OrderStatusNameEng(int status)
        {
            switch (status)
            {
                case (int)OrderStatus.Da_Dat_Hang:
                    return "Order placed";
                case (int)OrderStatus.Da_Xac_Nhan:
                    return "Confirmed";
                case (int)OrderStatus.Dang_Giao:
                    return "Out for delivery";
                case (int)OrderStatus.Da_Hoan_Thanh:
                    return "Completed";
                case (int)OrderStatus.Da_Huy:
                    return "Cancelled";
                default:
                    return "";
            }
        }

        public static string PaymentStatusName(bool status)
        {
            if (status)
            {
                return "Paid";
            }
            else
            {
                return "Not Paid";
            }
        }

        public static ResponseUpload UploadFile(string model)
        {
            ResponseUpload responseUpload = new ResponseUpload();
            if (string.IsNullOrEmpty(model))
            {
                responseUpload.Message = "Missing Attachment";
                return responseUpload;
            }
            try
            {
                DateTime now = DateTime.Now;
                string extension = Path.GetExtension(model.Split('|')[0]);
                string name = now.ToString("yyyyMMddHHmmssfff") + extension;
                string childPath = HttpContext.Current.Server.MapPath("~/Images/");

                if (!Directory.Exists(childPath))
                {
                    Directory.CreateDirectory(childPath);
                }
                string[] contents = model.Split('|')[1].Split(',');
                string _path = Path.Combine(childPath, name);
                System.IO.File.WriteAllBytes(_path, Convert.FromBase64String(contents.Length > 1 ? contents[1] : ""));
                responseUpload.Path = name;
                responseUpload.Success = true;
            }
            catch (Exception ex)
            {
                responseUpload.Message = ex.Message;
            }
            return responseUpload;
        }
    }

    public enum ContactFlagStatus
    {
        Lien_He,
        Tra_Loi
    }

    public enum ContactStatus
    {
        An,
        Cong_Khai
    }

    public enum OrderStatus
    {
        Da_Dat_Hang,
        Da_Xac_Nhan,
        Dang_Giao,
        Da_Hoan_Thanh,
        Da_Huy
    }
}