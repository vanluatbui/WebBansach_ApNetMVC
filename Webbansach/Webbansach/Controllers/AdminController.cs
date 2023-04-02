using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Webbansach.Models;
using PagedList;
using PagedList.Mvc;
using System.IO;
namespace Webbansach.Controllers
{
    public class AdminController : Controller
    {
        dbQLBansachDataContext data = new dbQLBansachDataContext();
        // GET: Admin
        public ActionResult Index()
        {
            if (Session["Taikhoanadmin"] == null)
                return RedirectToAction("Login", "Admin");
            else
                return View();
        }
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(FormCollection f)
        {
        var tendn = f["txtuser"];
        var matkhau = f["txtpass"];
        if (String.IsNullOrEmpty(tendn))
            ViewData["Loi1"] = "Vui lòng nhập tên đăng nhập";
        else if (String.IsNullOrEmpty(matkhau))
            ViewData["Loi2"] = "Vui lo2nh nhập mật khẩu";
         else
            {
                var ad = data.Admins.SingleOrDefault(n => n.UserAdmin == tendn && n.PassAdmin == matkhau);
                if (ad != null)
                {
                    Session["Taikhoanadmin"] = ad;
                    return RedirectToAction("Index", "Admin");
                }
                else
                    ViewBag.Thongbao = "Tên đăng nhập hoặc mật khẩu không hợp lệ";
            }

            return View();
        }
        /////THực hiện các chức năng quản lý cho Table Sách
        //1. Hiện thị danh sách các nhà xuất bản
        public ActionResult Sach(int  ? page)
        {
            if (Session["Taikhoanadmin"] == null)
                return RedirectToAction("Login", "Admin");
            else
            {
                //kích thước trang = số mẫu tin cho 1 trang
                int pagesize = 7;
                //Số thứ tự trang: nêu page là null thì pagenum =1, ngược lại pagenum=page
                int pagenum = (page ?? 1);
                return View(data.SACHes.ToList().OrderByDescending(n => n.Masach).ToPagedList(pagenum,pagesize));
            }
        }
        //2. Xem chi tiết sách
        public ActionResult Chitietsach(int id)
        {
            if (Session["Taikhoanadmin"] == null)
                return RedirectToAction("Login", "Admin");
            else
            {
                var sach = from s in data.SACHes where s.Masach == id select s;
                return View(sach.SingleOrDefault());
            }
        }
        //3. Xóa 1 quyển sach: Hiện thị trang thông tin chi tiết sản phẩm cần xóa, sau đó xác nhận xóa.
        [HttpGet]
        public ActionResult Xoasach(int id)
        {
            if (Session["Taikhoanadmin"] == null)
                return RedirectToAction("Login", "Admin");
            else
            {
                var sach = from s in data.SACHes where s.Masach == id select s;
                return View(sach.SingleOrDefault());
            }
        }
        [HttpPost, ActionName("Xoasach")]
        public ActionResult Xacnhanxoa(int id)
        {
            if (Session["Taikhoanadmin"] == null)
                return RedirectToAction("Login", "Admin");
            else
            {
                SACH sach = data.SACHes.SingleOrDefault(n => n.Masach == id);
                data.SACHes.DeleteOnSubmit(sach);
                data.SubmitChanges();
                return RedirectToAction("Sach", "Admin");
            }
        }
        //4. Thêm mới 1 quyển Sách: Hiện thị view để thê mới, sau đó Lưu 
        [HttpGet]
        public ActionResult Themmoisach()
        {
            if (Session["Taikhoanadmin"] == null)
                return RedirectToAction("Login", "Admin");
            else
            {
                ViewBag.MaCD = new SelectList(data.CHUDEs.ToList().OrderBy(n => n.TenChuDe), "MaCD", "TenChude");
                ViewBag.MaNXB = new SelectList(data.NHAXUATBANs.ToList().OrderBy(n => n.TenNXB), "MaNXB", "TenNXB");
                return View();
            }
        }
        
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult ThemmoiSach(SACH sach, HttpPostedFileBase fileUpload)
        {
            if (Session["Taikhoanadmin"] == null)
                return RedirectToAction("Login", "Admin");
            else
            {
                //Kiem tra duong dan file
                if (fileUpload == null)
                {
                    ViewBag.Thongbao = "Vui lòng chọn ảnh bìa";
                    return View();
                }
                //Them vao CSDL
                else
                {
                    if (ModelState.IsValid)
                    {
                        //Luu ten fie, luu y bo sung thu vien using System.IO;
                        var fileName = Path.GetFileName(fileUpload.FileName);
                        //Luu duong dan cua file
                        var path = Path.Combine(Server.MapPath("~/Hinhsanpham"), fileName);
                        //Kiem tra hình anh ton tai chua?
                        if (System.IO.File.Exists(path))
                            ViewBag.Thongbao = "Hình ảnh đã tồn tại";
                        else
                        {
                            //Luu hinh anh vao duong dan
                            fileUpload.SaveAs(path);
                        }
                        sach.Anhbia = fileName;
                        //Luu vao CSDL
                        data.SACHes.InsertOnSubmit(sach);
                        data.SubmitChanges();
                    }
                    return RedirectToAction("Sach","Admin");
                }
            }
        }




        //5 Điều chỉnh thông tin Sách
        public ActionResult Suasach(int id)
        {
            if (Session["Taikhoanadmin"] == null)
                return RedirectToAction("Login", "Admin");
            else
            {
                SACH sach = data.SACHes.SingleOrDefault(n => n.Masach == id);
                //Lay du liệu tư table Chude để đổ vào Dropdownlist, kèm theo chọn MaCD tương tưng 
                ViewBag.MaCD = new SelectList(data.CHUDEs.ToList().OrderBy(n => n.TenChuDe), "MaCD", "TenChude", sach.MaCD);
                ViewBag.MaNXB = new SelectList(data.NHAXUATBANs.ToList().OrderBy(n => n.TenNXB), "MaNXB", "TenNXB", sach.MaNXB);
                return View(sach);
            }
        }
        [HttpPost, ActionName("Suasach")]
        public ActionResult Xacnhansua(int id)
        {
            if (Session["Taikhoanadmin"] == null)
                return RedirectToAction("Login", "Admin");
            else
            {                
                SACH sach = data.SACHes.SingleOrDefault(n => n.Masach == id);
                UpdateModel(sach);
                data.SubmitChanges();
                return RedirectToAction("Sach", "Admin");
            }
        }
    }
}