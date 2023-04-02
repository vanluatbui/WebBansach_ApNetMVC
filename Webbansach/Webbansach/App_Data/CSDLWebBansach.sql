use master
Drop Database QLBansach
----------
create database QLBANSACH
GO
use QLBANSACH
GO
CREATE TABLE KHACHHANG
(
	MaKH INT IDENTITY(1,1),
	HoTen nVarchar(50) NOT NULL,
	Taikhoan Varchar(50) UNIQUE,
	Matkhau Varchar(50) NOT NULL,
	Email Varchar(100) UNIQUE,
	DiachiKH nVarchar(200),
	DienthoaiKH Varchar(50),	
	Ngaysinh DATETIME
	CONSTRAINT PK_Khachhang PRIMARY KEY(MaKH)
)
GO
Create Table CHUDE
(
	MaCD int Identity(1,1),
	TenChuDe nvarchar(50) NOT NULL,
	CONSTRAINT PK_ChuDe PRIMARY KEY(MaCD)
)
GO
Create Table NHAXUATBAN
(
	MaNXB int identity(1,1),
	TenNXB nvarchar(50) NOT NULL,
	Diachi NVARCHAR(200),
	DienThoai VARCHAR(50),
	CONSTRAINT PK_NhaXuatBan PRIMARY KEY(MaNXB)
)
GO
CREATE TABLE TACGIA
(
	MaTG INT IDENTITY(1,1),
	TenTG NVARCHAR(50) NOT NULL,
	Diachi NVARCHAR(100),
	Tieusu nVarchar(Max),
	Dienthoai VARCHAR(50),
	CONSTRAINT PK_TacGia PRIMARY KEY(MaTG)
)
Go
CREATE TABLE SACH
(
	Masach INT IDENTITY(1,1),
	Tensach NVARCHAR(100) NOT NULL,
	Giaban Decimal(18,0) CHECK (Giaban>=0),
	Mota NVarchar(Max),
	Anhbia VARCHAR(50),
	Ngaycapnhat DATETIME,
	Soluongton INT,
	MaCD INT,
	MaNXB INT,
	CONSTRAINT PK_Sach PRIMARY KEY(Masach),
	CONSTRAINT FK_Chude FOREIGN KEY(MaCD) REFERENCES CHUDE(MaCD),
	CONSTRAINT FK_Nhaxuatban FOREIGN KEY(MaNXB) REFERENCES NHAXUATBAN(MANXB)
)
GO
CREATE TABLE VIETSACH
(
	MaTG INT,
	Masach INT,
	Vaitro NVARCHAR(50),
	Vitri NVarchar(50)
	CONSTRAINT FK_TG FOREIGN KEY(MaTG) REFERENCES TACGIA(MaTG),
	CONSTRAINT FK_Sach FOREIGN KEY(Masach) REFERENCES Sach(Masach),
	CONSTRAINT PK_VietSach PRIMARY KEY(MaTG,Masach)
)
GO
CREATE TABLE DONDATHANG
(
	MaDonHang INT IDENTITY(1,1),
	Dathanhtoan bit,
	Tinhtranggiaohang  bit,
	Ngaydat Datetime,
	Ngaygiao Datetime,	
	MaKH INT,
	CONSTRAINT FK_Khachhang FOREIGN KEY(MaKH) REFERENCES Khachhang(MaKH),
	CONSTRAINT PK_DonDatHang PRIMARY KEY(MaDonHang)
)
GO
CREATE TABLE CHITIETDONTHANG
(
	MaDonHang INT,
	Masach INT,
	Soluong Int Check(Soluong>0),
	Dongia Decimal(18,0) Check(Dongia>=0),	
	CONSTRAINT PK_CTDatHang PRIMARY KEY(MaDonHang,Masach),
)
GO

/****** CHUDE******/
INSERT CHUDE(TenChuDe) VALUES (N'Ngoại ngữ')
INSERT CHUDE(TenChuDe) VALUES (N'Công nghệ thông tin')
INSERT CHUDE(TenChuDe) VALUES (N'Luật')
INSERT CHUDE(TenChuDe) VALUES (N'Văn học')
INSERT CHUDE(TenChuDe) VALUES (N'Khoa học kỹ thuật')
INSERT CHUDE(TenChuDe) VALUES (N'Nông nghiệp')
INSERT CHUDE(TenChuDe) VALUES (N'Triết học-Chính trị')
INSERT CHUDE(TenChuDe) VALUES (N'Lịch sử, địa lý')
INSERT CHUDE(TenChuDe) VALUES (N'Kinh tế')
INSERT CHUDE(TenChuDe) VALUES (N'Sách giáo khoa')
INSERT CHUDE(TenChuDe) VALUES (N'Nghệ thuật sống')

/****** KHACHHANG ******/
INSERT KHACHHANG (Hoten, DiachiKH, DienthoaiKH, Taikhoan, Matkhau, Ngaysinh, Email)
VALUES (N'Dương Thành Phết', N'12 Trần Huy Liệu', N'0918062755', N'thayphet.net', N'123456', '08/20/1976', 'phetcm@hgmail.com')
INSERT KHACHHANG (Hoten, DiachiKH, DienthoaiKH, Taikhoan, Matkhau, Ngaysinh, Email) 
VALUES (N'Nguyễn Tiến Luân', N'21 Quận 6', N'0917654310', N'thang', N'123456', '10/15/1990', N'ntluan@hcmuns.edu.vn')
INSERT KHACHHANG (Hoten, DiachiKH, DienthoaiKH, Taikhoan, Matkhau, Ngaysinh, Email) 
VALUES (N'Đặng Quốc Hòa', N'32 Sư Vạn Hạnh', N'098713245', N'dqhoa', N'hoa', '05/21/1991', N'dqhoa@hcmuns.edu.vn')
INSERT KHACHHANG (Hoten, DiachiKH, DienthoaiKH, Taikhoan, Matkhau, Ngaysinh, Email) 
VALUES (N'Ngô Ngọc Ngân', N'12 Khu chung cư', N'0918544699', N'nnngan', N'ngan', '10/12/1986', N'nnngan@hcmuns.edu.vn')

/****** TACGIA******/
INSERT TACGIA(TenTG, Diachi, Tieusu, Dienthoai) VALUES (N'Phạm Công Anh', N'197 Trần Hưng Đạo','', N'98877668')
INSERT TACGIA(TenTG, Diachi, Tieusu, Dienthoai) VALUES (N'Nguyễn Thế Giang', N'179 Chánh hưng - F.4 - Q.8 Tp.HCM','', N'19001611')
INSERT TACGIA(TenTG, Diachi, Tieusu, Dienthoai) VALUES (N'Lê Việt Nhân', N'45 Lý Thái Tổ-F2.Q.3 Tp.HCM','', N'19001570')
INSERT TACGIA(TenTG, Diachi, Tieusu, Dienthoai) VALUES (N'Hồng Phúc', NULL, NULL,NULL)
INSERT TACGIA(TenTG, Diachi, Tieusu, Dienthoai) VALUES (N'Ks.Phạm Quang Huy', NULL, NULL,NULL)
INSERT TACGIA(TenTG, Diachi, Tieusu, Dienthoai) VALUES (N'Nguyễn Bá Tiến', NULL, NULL,NULL)
INSERT TACGIA(TenTG, Diachi, Tieusu, Dienthoai) VALUES ( N'Phạm Hữu Khang',NULL, NULL,NULL)
INSERT TACGIA(TenTG, Diachi, Tieusu, Dienthoai) VALUES ( N'Nguyễn Minh Đức',NULL, NULL,NULL)
INSERT TACGIA(TenTG, Diachi, Tieusu, Dienthoai) VALUES (N'Trần Văn Lăng', NULL, NULL,NULL)
INSERT TACGIA(TenTG, Diachi, Tieusu, Dienthoai) VALUES ( N'Quách Tuấn Ngọc', NULL, NULL,NULL)
INSERT TACGIA(TenTG, Diachi, Tieusu, Dienthoai) VALUES (N'Nguyễn Xuân Huy', NULL, NULL,NULL)
INSERT TACGIA(TenTG, Diachi, Tieusu, Dienthoai) VALUES ( N'Đoàn Khắc Độ', NULL, NULL,NULL)
INSERT TACGIA(TenTG, Diachi, Tieusu, Dienthoai) VALUES ( N'Nguyễn Tấn Tín', N'179 Chánh Hưng F.4 Q.8 Tp.HCM', '',N'8504122')
INSERT TACGIA(TenTG, Diachi, Tieusu, Dienthoai) VALUES (N'Phạm Phan Trung', N'124 Bắc Hải P.6 Q.TB', '',N'0918121188')
INSERT TACGIA(TenTG, Diachi, Tieusu, Dienthoai) VALUES (N'TS. Nguyễn Phương Liên', N'','', '')
INSERT TACGIA(TenTG, Diachi, Tieusu, Dienthoai) VALUES (N'BS. Vũ Thị Uyên Thanh', N'','', '')

/****** NHAXUATBAN    ******/

INSERT NHAXUATBAN(TenNXB, Diachi, Dienthoai) VALUES (N'Nhà xuất bản Trẻ', N'124 Nguyễn Văn Cừ Q.1 Tp.HCM', N'19001560')
INSERT NHAXUATBAN(TenNXB, Diachi, Dienthoai) VALUES ( N'NXB Thống kê', N'Đồng Nai', N'19001511')
INSERT NHAXUATBAN(TenNXB, Diachi, Dienthoai) VALUES ( N'Kim đồng', N'Tp.HCM', N'19001570')
INSERT NHAXUATBAN(TenNXB, Diachi, Dienthoai) VALUES ( N'Đại học quốc gia', N'Tp.HCM', N'0908419981')
INSERT NHAXUATBAN(TenNXB, Diachi, Dienthoai) VALUES ( N'Văn hóa nghệ thuật', N'Đà Nẵng', N'0903118833')
INSERT NHAXUATBAN(TenNXB, Diachi, Dienthoai) VALUES ( N'Văn hóa', N'Bình Dương', N'0913336677')
INSERT NHAXUATBAN(TenNXB, Diachi, Dienthoai) VALUES ( N'Lao động - Xã hội', N'Tp.HCM', N'0989888888')
INSERT NHAXUATBAN(TenNXB, Diachi, Dienthoai) VALUES ( N'Khoa Học & Kỹ Thuật', N'Hà Nội', N'8351056')


/******SACH ******/


INSERT SACH(Tensach, Giaban, Mota,Anhbia, MaCD, MaNXB, Ngaycapnhat, Soluongton) 
VALUES (N'Giáo trình Tin học cơ bản', 26000, N'Nội dung của cuốn: Tin Học Cơ Bản Windows XP gồm có 7 chương:
Chương 1: Một số vấn đề cơ bản. 
Chương 2: Sử dụng nhanh thanh công cụ và thanh thực đơn trong My Computer và Windows Explorer. 
Chương 3: Các thao tác trong windows XP. 
Chương 4: Các thiết lập trong Windows XP. 
Chương 5: Bảo trì máy tính. 
Chương 6: Các phím tắt 
Chương 7: Hỏi và đáp các thắc mắc.
Xin trân trọng giới thiệu cuốn sách cùng bạn', 
'THCB.jpg', 7, 1, '10/25/2014', 120)

INSERT SACH(Tensach, Giaban, Mota,Anhbia, MaCD, MaNXB, Ngaycapnhat, Soluongton) 
VALUES (N'Giáo trình Tin học văn phòng', 12000,  
N'Cuốn sách này gồm 3 phần sau:
Phần 1: Xử lý văn bản trong Microsoft Office Word 2007. 
Phần 2: Xử lý bảng tính trong Microsoft Office Excel 2007. 
Phần 3: Quản lý cơ sở dữ liệu trong Microsoft Office Access 2007.
Xin trân trọng giới thiệu cùng các bạn.', 
'TH004.jpg', 3, 2, '10/23/2013', 25)

INSERT SACH(Tensach, Giaban, Mota,Anhbia, MaCD, MaNXB, Ngaycapnhat, Soluongton) 
VALUES ( N'Lập Trình Cơ Sở Dữ Liệu Với Visual Basic 2005 Và ADO.NET 2.0', 11500, 
 N'Lập Trình Cơ Sở Dữ Liệu Với Visual Basic 2005 Và ADO.NET 2.0" này giới thiệu các nội dung sau:
Chương 1: Căn bản về cơ sở dữ liệu.
Chương 2: Các bộ kết nối và tương tác dữ liệu.
Chương 3: Bộ chứa dữ liệu DataSet.
Chương 4: Bộ điều hợp dữ liệu DataAdapter.
Chương 5: Sử dụng các điều khiển ràng buộc dữ liệu.
Chương 6: Tạo báo cáo với Crystal Report.
Chương 7: ADO.NET và XML.
Xin trân trọng giới thiệu cùng các bạn.', 
'Gt_Thcb.jpg', 7, 3, '12/21/2014', 23)

INSERT SACH(Tensach, Giaban, Mota,Anhbia, MaCD, MaNXB, Ngaycapnhat, Soluongton) 
VALUES ( N'Visual Basic 2005 Tập 3, Quyển 2: Lập Trình Web', 20000, 
 N'"Visual Basic 2005 Tập 3, Quyển 2: Lập Trình Web Với Cơ Sở Dữ Liệu" sẽ cung cấp kỹ thuật và hướng dẫn bạn:
Tự học xây dựng ứng dụng Web quản lý CSDL toàn diện với ADO.NET 2.0 và ASP.NET. 
Khai thác các đối tượng và nguồn dữ liệu dành cho WebForm. 
Sử dụng các điều khiển dữ liệu đặc thù dành riêng cho ASP.NET và Web. 
Làm quen với những khái niệm xử lý dữ liệu hoàn toàn mới. 
Ràng buộc dữ liệu với các thành phần giao diện Web Forms. 
Thiết kế ứng dụng Web "Quản lý CD Shop" trực quan và thực tế. 
Cung cấp một kiến thức hoàn chỉnh về Web cho các bạn yêu thích ngôn ngữ Visual Basic và .NET Framework.
Sách có kèm theo CD-ROM bài tập.
Xin trân trọng giới thiệu cùng các bạn.', 
'LTWeb2005.jpg', 8, 4, '9/15/2014', 240)

INSERT SACH(Tensach, Giaban, Mota,Anhbia, MaCD, MaNXB, Ngaycapnhat, Soluongton) 
VALUES ( N'Giáo trình Tin học quản lý 1', 21000,
N'Mạng Máy Tính Và Hệ Thống Bảo Mật gồm 7 chương:
Chương I: Tổng quan về công nghệ mạng máy tính và mạng cục bộ.
Chương II: Các thiết bị mạng thông dụng và các chuẩn kết nối vật lý.
Chương III: TCP/IP và mạng Internet.
Chương IV: Hệ điều hành mạng đặc điểm của hệ điều hành mạng.
Chương V: Một số vấn đề an toàn và bảo mật thông tin trên mạng máy tính.
Chương VI: Giới thiệu hệ điều hành Windows NT.
Chương VII: Giới thiệu hệ điều hành UNIX.
Trân trọng giới thiệu.', 'TH001.jpg', 3, 1, '10/18/2015', 16)

INSERT SACH(Tensach, Giaban, Mota,Anhbia, MaCD, MaNXB, Ngaycapnhat, Soluongton) 
VALUES (N'Giáo trình Tin học quản lý 2', 21000, 
 N'Mục đích của bộ sách này giúp bạn trở nên thành thạo cơ sở dữ liệu (CSDL) Oracle9i, 
đề cập đến tất cả những kiến thức cần thiết từ mô hình dữ liệu, quản trị CSDL, sao lưu phục hồi, 
mạng và xử lý sự cố cũng như hiệu chỉnh hiệu suất thực thi..., 
với sự kết hợp lý thuyết và thực hành về điều mà Nhà quản trị CSDL Oracle9i cần biết để sử dụng CSDL Oracle9i một cách hiệu quả,
 từ chính bộ sách này.
Bộ sách được chia làm 2 tập, tập 1 đề cập các kiến thức cơ bản về CSDL, mô hình dữ liệu. 
Bạn sẽ được biết về hệ quản trị CSDL Oracle9i, tạo CSDL, kết nối và quản lý người dùng. 
Tập 2 hướng dẫn bạn cách nạp, sao lưu và phục hồi dữ liệu, quản lý hoạt động CSDL Oracle9i, 
thực hiện hiệu chỉnh hiệu suất thực thi và xử lý sự cố cho CSDL.
Xin trân trọng giới thiệu Tập 1 cùng các bạn.', 
'130499.jpg', 10, 5, '10/18/2015', 16)

INSERT SACH(Tensach, Giaban, Mota,Anhbia, MaCD, MaNXB, Ngaycapnhat, Soluongton) 
VALUES ( N'Giáo trình SQL Server', 18000, 
N'Hệ quản trị cơ sở dữ liệu SQl Server 2003 Test thu', 
'Gt_Thcb.jpg', 3, 6, '10/10/2014', 6)

INSERT SACH(Tensach, Giaban, Mota,Anhbia, MaCD, MaNXB, Ngaycapnhat, Soluongton) 
VALUES ( N'Phong Cách Quản Lý Kinh Doanh Hiện Đại ', 61000, 
 N'Cuốn sách này không đi vào chi tiết những chủ đề quản lý cổ điển đã được nhắc đến trong nhiều cuốn sách khác,
 như tổ chức cuộc họp, cung cấp số liệu, quản lý thời gian. Mục đích của cuốn sách này là mang lại cho bạn "nhiều hơn", 
 một giá trị gia tăng so với những gì bạn đã biết và đã áp dụng, và giúp bạn tối ưu hóa việc quản lý chuyên môn và quản lý nhân sự.
Nội dung sách bao gồm 9 chương:
Chương 1: Bốn cách nhìn quản lý theo sắc màu.
Chương 2: Quản lý các sắc màu của một cộng tác viên.
Chương 3: Quản lý nhóm theo màu sắc.
Chương 4: Quyết định cách thích hợp dựa vào bản thân, người khác và hoàn cảnh.
Chương 5: Phát triển hiệu quả tối ưu theo sắc màu.
Chương 6: Hiểu rõ những sai lệch trong cách quản lý của mình.
Chương 7: Nền tảng cơ sở của hệ thống Success Insights: Bốn màu với tám kiểu.
Chương 8: Nhận biết và quản lý tám kiểu cộng tác viên.
Chương 9: Cải thiện người quản lý.
Xin trân trọng giới thiệu.', 
'KT0001.jpg', 9, 8, '5/18/2015', 36)

INSERT SACH(Tensach, Giaban, Mota,Anhbia, MaCD, MaNXB, Ngaycapnhat, Soluongton) 
VALUES ( N'Cán Bộ Quản Lý Trong Sản Xuất Công Nghiệp', 25000, 
N'Cuốn sách này gồm những nội dung chính sau:
Phần 1: Quản lý sản xuất công nghiệp trong kinh tế thị trường
- Kinh doanh sản xuất công nghiệp trong kinh tế thị trường
- Sự cần thiết và các chức năng của quản lý nhà nước đối với doanh nghiệp sản xuất công nghiệp
- Nội dung và tính chất của những công việc mà cán bộ quản lý sản xuất công nghiệp phải đảm nhiệm, hoàn thành.
- Kinh nghiệm đào tạo và đánh giá cán bộ quản lý kinh doanh ở Nhật.
Phần 2: Thực trạng và một số giải pháp nhằm nâng cao chất lượng đội ngũ cán bộ quản lý sản xuất công nghiệp Việt Nam
- Thực trạng cán bộ quản lý doanh nghiệp công nghiệp của Việt Nam
- Tiêu chuẩn hóa cán bộ quản lý sản xuất công nghiệp Việt Nam
- Đổi mới căn bản nội dung và phương pháp đào tạo cán bộ quản lý sản xuất công nghiệp Việt Nam
Xin trân trọng giới thiệu. ', 
'KT0001.jpg', 5, 6, '10/28/2013', 16)

INSERT SACH(Tensach, Giaban, Mota,Anhbia, MaCD, MaNXB, Ngaycapnhat, Soluongton) 
VALUES ( N'Tư Duy Chiến Lược (Quản Lý - Tại Sao? Thế Nào?', 18000, 
N'Khả năng hoạch định dài hạn đồng thời tối ưu hóa tình hình hoạt động ngắn hạn,
 là một yêu cầu bắt buộc phải có đối với các nhà quản lý.
Tư Duy Chiến Lược sẽ giúp bạn vạch ra con đường đến thành công đồng thời giúp hình thành các kỹ năng phân tích và hoạch định theo nhóm. 
Tất cả các lĩnh vực then chốt để hình thành và thực thi một chiến lược đều được trình bày cặn kẽ trong cuốn sách này, 
từ việc nghiên cứu và thu thập thông tin nền tảng, hình thành một chiến lược mới đến việc xem xét và ứng dụng chiến lược ấy. 
Cả thảy có 101 chỉ dẫn nhằm cung cấp cho các bạn những lời khuyên thực tiễn hơn, 
đồng thời bài tập tự đánh giá sẽ giúp bạn xác định xem mình là một nhà tư duy chiến lược hiệu quả đến mức nào. 
Khi bạn có nhiều tham vọng hơn về việc hoạch định cho tương lai, cẩm nang này sẽ là quyển sách tham khảo không thể thiếu, 
giúp suy nghĩ của bạn đi đúng hướng.
Xin trân trọng giới thiệu cuốn sách cùng bạn. ',
'KT0001.jpg', 11, 3, '10/18/2015', 6)

INSERT SACH(Tensach, Giaban, Mota,Anhbia, MaCD, MaNXB, Ngaycapnhat, Soluongton) 
VALUES ( N'Quản Lý Dự Án (Quản Lý - Tại Sao? Thế Nào?) ',61000, 
 N'Để thành công trong môi trường kinh doanh cạnh tranh hiện nay, 
các giám đốc dự án phải đạt được kết quả trong phạm thời gian và ngân sách đưa ra. Biết cách áp dụng các quy trình,
 phương pháp và kỹ thuật chỉ dẫn trong cuốn Quản Lý Dự Án này, 
 bạn sẽ tăng tối đa khả năng thực hiện công việc và đảm bảo đạt kết quả tối ưu khi thực hiện dự án.
Được thiết kế phù hợp với tất cả các nhà quản lý ở đủ mọi trình độ, 
cẩm nang này sẽ trang bị cho bạn những kiến thức cần thiết trong việc quản lý mọi dự án, 
dù lớn hay nhỏ, để đạt đến thành công. Từ việc khởi xướng một dự án, thúc đẩy, 
phát triển nhóm dự án đến việc vượt qua những khó khăn, trở ngại; 
mỗi một khía cạnh của quản lý dự án chuyện nghiệp đều được trình bày một cách rõ nét. 
Cẩm nang bao gồm các hướng dẫn từng bước về hoạch định dự án và 101 mẹo vặt cung cấp cho bạn những lời khuyên thực tế.', 
'KT0001.jpg', 4, 8, '1/18/2014', 16)

INSERT SACH(Tensach, Giaban, Mota,Anhbia, MaCD, MaNXB, Ngaycapnhat, Soluongton) 
VALUES ( N'Điều Chỉnh Một Số Chính Sách Kinh Tế Ở Trung Quốc (Giai Đoạn 1992 - 2010)', 21000,
N'Cuốn sách này tập trung vào một số nội dung chính sau đây:
Tìm hiểu về những nhân tố đòi hỏi Trung Quốc phải điều chỉnh chính sách kinh tế.
Tìm hiểu về những nội dung chính trong điều chỉnh kinh tế ở Trung Quốc giai đoạn từ năm 1992 - 2010.
Tìm hiểu về tác động của việc điều chỉnh chính sách kinh tế của Trung Quốc đối với thế giới và khu vực trong đó có Việt Nam,
 sau đó rút tỉa một số kinh nghiệm của Trung Quốc trong quá trình điều chỉnh chính sách kinh tế mà Việt Nam có thể tham khảo.
Tập thể tác giả tham gia công trình này đều là những người chuyên nghiên cứu về Trung Quốc, 
hy vọng sẽ đem lại cho các bạn nhiều thông tin bổ ích.', 
'KT0001.jpg', 1, 7,'10/18/2015', 16)

INSERT SACH(Tensach, Giaban, Mota,Anhbia, MaCD, MaNXB, Ngaycapnhat, Soluongton) 
VALUES ( N'30 phút mỗi ngày để luyện kỹ năng viết câu tiếng Anh', 85000, 
N'30 phút mỗi ngày để luyện kỹ năng viết câu tiếng Anh là một cuốn sách bài tập dành cho những học sinh/sinh viên,
 nghiêm túc quan tâm đến tầm quan trọng của việc nâng cao những yếu tố kỹ thuật cho kỹ năng viết của mình. 
 Rèn luyện để viết cho tốt chẳng khác gì tự trang bị cho mình một sức mạnh cần thiết để thành công - 
 khi đi học cũng như khi ra ngoài xã hội. Trui rèn được một trình độ viết “cứng” không hề là chuyện bỗng nhiên trời cho mà có được; 
 đó phải là kết quả của một quá trình phấn đấu bền bỉ và rèn luyện chăm chỉ.
Đặc nét của sách này là sử dụng cách tiếp cận những kỹ thuật kết hợp câu cơ bản, có nghĩa là, 
sách không chỉ quan tâm đến việc tránh những sai lỗi, mà còn đặt mục tiêu tạo dựng được những câu hay, 
linh hoạt, và thể hiện một phong cách riêng. Cạnh đó, sách còn có những điểm đáng lưu ý như: 
- Bàn thảo rõ ràng về những qui tắc và kỹ thuật giúp viết tốt.
- Giải thích súc tích, hạn chế dùng những thuật ngữ ngữ pháp.
- Lương bài tập phong phú, đa dạng, từ những câu hỏi điền vào chỗ trống với mục đích xác định các từ loại cho đến những câu hỏi,
 kết hợp những câu ngắn thành những câu văn dài hơn, ý tứ “duyên” hơn.
- Đáp án cuối sách nhằm giúp học sinh/sinh viên học và nghiên cứu nhanh chậm theo trình độ và ý thích của mình, 
đồng thời kiểm tra được bài làm trong quá trình học tập.
Học sinh/sinh viên tiếp thu tốt nhất khi họ tham gia tích cực và quá trình học. 
Họ rất thích những bài tập nào rèn cho họ được những kỹ năng viết họ cần đồng thời có giá trị thông tin nào đó hoặc vui vui. 
Đó chính là lý do cuốn sách này sử dụng đủ loại chủ đề thú vị trong các bài tập. Cũng vì lý do tương tự, 
sách có phần trình bày và giảng giải rất ngắn gọn những đưa ra rất nhiều những ví dụ và minh họa mở rộng.
Sử dụng cuốn 30 phút mỗi ngày để luyện kỹ năng viết câu tiếng Anh này sẽ giúp học sinh/sinh viên viết “có nghề” và tự tin hơn".', 
'TiengAnh01.jpg', 2, 1, '10/18/2015', 16)

INSERT SACH(Tensach, Giaban, Mota,Anhbia, MaCD, MaNXB, Ngaycapnhat, Soluongton) 
VALUES ( N'Tin Học Ứng Dụng: Thành Thạo Oracle 9i - Quản Trị Cơ Sở Dữ Liệu (Tập 1) ', 21000, 
N'Mục đích của bộ sách này giúp bạn trở nên thành thạo cơ sở dữ liệu (CSDL) Oracle9i, 
đề cập đến tất cả những kiến thức cần thiết từ mô hình dữ liệu, quản trị CSDL, sao lưu phục hồi, 
mạng và xử lý sự cố cũng như hiệu chỉnh hiệu suất thực thi..., 
với sự kết hợp lý thuyết và thực hành về điều mà Nhà quản trị CSDL Oracle9i cần biết để sử dụng CSDL Oracle9i một cách hiệu quả,
 từ chính bộ sách này.
Bộ sách được chia làm 2 tập, tập 1 đề cập các kiến thức cơ bản về CSDL, mô hình dữ liệu. 
Bạn sẽ được biết về hệ quản trị CSDL Oracle9i, tạo CSDL, kết nối và quản lý người dùng. Tập 2 hướng dẫn bạn cách nạp, 
sao lưu và phục hồi dữ liệu, quản lý hoạt động CSDL Oracle9i, thực hiện hiệu chỉnh hiệu suất thực thi và xử lý sự cố cho CSDL.
Xin trân trọng giới thiệu Tập 1 cùng các bạn. ', 
'TH001.jpg', 1, 2, '10/18/2015', 16)

INSERT SACH(Tensach, Giaban, Mota,Anhbia, MaCD, MaNXB, Ngaycapnhat, Soluongton) 
VALUES ( N'Mạng Máy Tính Và Hệ Thống Bảo Mật ', 23000, 
N'Mạng Máy Tính Và Hệ Thống Bảo Mật gồm 7 chương:
Chương I: Tổng quan về công nghệ mạng máy tính và mạng cục bộ.
Chương II: Các thiết bị mạng thông dụng và các chuẩn kết nối vật lý.
Chương III: TCP/IP và mạng Internet.
Chương IV: Hệ điều hành mạng đặc điểm của hệ điều hành mạng.
Chương V: Một số vấn đề an toàn và bảo mật thông tin trên mạng máy tính.
Chương VI: Giới thiệu hệ điều hành Windows NT.
Chương VII: Giới thiệu hệ điều hành UNIX.
Trân trọng giới thiệu. ', 
'TH001.jpg',1,3, '10/18/2015', 16)

INSERT SACH(Tensach, Giaban, Mota,Anhbia, MaCD, MaNXB, Ngaycapnhat, Soluongton) 
VALUES ( N'Thủ Thuật Lập Trình Visual Basic 6 ', 18000, 
N'Mục Lục:
Chương 1: Multimedia.
Chương 2: String.
Chương 3: Form.
Chương 4:Windows Control.
Chương 5: Common Control.
Chương 6: System.
Chương 7: Disk - File.
Chương 8: Graphics.
Chương 9: Internet.
Chương 10: Microsoft Office.
Chương 11: Database.
Chương 12: Clipboard.
Chương 13: Các vấn đề khác.
Phụ lục A: Giới thiệu một số ActiveX Control.
Phụ lục B: Một số tiện ích hỗ trợ lập trình Win32 API.
Phụ lục C: Một số vấn đề về đóng gói phần mềm.
Phụ lục D: Giới thiệu một số Website về Visual Basic.
Trân trọng giới thiệu. ', 
'TH001.jpg', 6, 7, '10/18/2015', 16)

INSERT SACH(Tensach, Giaban, Mota,Anhbia, MaCD, MaNXB, Ngaycapnhat, Soluongton) 
VALUES ( N'Lập Trình Mạng Trên Windows (Ấn bản dành cho sinh viên) ', 16800, 
N'Chào mừng đến với "Lập Trình Mạng Trên Windows (Ấn bản dành cho sinh viên)". 
Quyển sách này sẽ hướng dẫn bạn sử dụng một cách hiệu quả bao gồm một số lượng lớn và đa dạng các hàm mạng sẵn có trong Windows 95, 
Windows 98, Windows NT 4, Windows CE, và Windows 2000/XP/. NET. 
Sách được chủ định viết dành cho những lập trình viên từ trung cấp đến cao cấp, 
tuy nhiên những lập trình viên mới bắt đầu tìm hiểu lập trình mạng cũng sẽ nhận thấy đây là một quyển sách không thể thiếu,
 cho các bước xây dựng ứng dụng mạng sau này.', 
 'TH001.jpg', 5, 5, '10/18/2015', 16)
 
INSERT SACH(Tensach, Giaban, Mota,Anhbia, MaCD, MaNXB, Ngaycapnhat, Soluongton) 
VALUES ( N'Căn Bản Về Photoshop CS Tinh Chỉnh Và Xử Lý Màu ', 25000, 
N'Căn Bản Về Photoshop CS Tinh Chỉnh Và Xử Lý Màu" gồm 12 chương:
Chương 1: Những điểm cơ bản.
Chương 2: Màu Photoshop.
Chương 3: Các tác vụ xử lý ảnh căn bản.
Chương 4: Các điểm cơ bản về pixel.
Chương 5: Các điểm cơ bản về lớp.
Chương 6: Làm việc với các công cụ chọn.
Chương 7: Ghép ảnh.
Chương 8: Làm việc với các palette History.
Chương 9: Các kỹ thuật điều chỉnh hình ảnh.
Chương 10: Chọn các màu.
Chương 11: Tô màu lại.
Chương 12: Làm việc với các công cụ tô vẽ.
Xin trân trọng giới thiệu. ', 
'TH002.jpg', 1, 6, '10/18/2015', 16)

INSERT SACH(Tensach, Giaban, Mota,Anhbia, MaCD, MaNXB, Ngaycapnhat, Soluongton) 
VALUES ( N' Hướng Dẫn Sử Dụng Norton AntiVirus 2004 (Hướng dẫn bằng hình)', 16800, 
 N'Hướng Dẫn Sử Dụng Norton AntiVirus 2004 (Hướng dẫn bằng hình)" bao gồm 6 phần, 23 chương:
Phần I: Bắt đầu với Norton AntiVirus 2004.
Chương 1: Bắt đầu với Norton AntiVirus 2004.
Chương 2: Cài đặt Norton System Works Professional.
Chương 3: Các điểm cơ bản về Norton AntiVirus 2004.
Chương 4: Các tùy chọn trong Norton SystemWorks.
Chương 5: Cải tiến sự trình duyệt Web và phục hồi đĩa cứng.
Chương 6: Duy trì tính bảo mật password và cập nhật với LiveUpdate.
Phần II: Làm việc với Norton AntiVirus 2004.
Chương 7: Bảo vệ đĩa, file và dữ liệu để tránh bị nhiễm Virus.
Chương 8: Những điều cần làm nếu phát hiện virus.', 
'TH002.jpg', 5, 7, '10/18/2015', 16)

INSERT SACH(Tensach, Giaban, Mota,Anhbia, MaCD, MaNXB, Ngaycapnhat, Soluongton) 
VALUES ( N'Tin Học Văn Phòng - Microsoft Word 2000 (Tái Bản Lần Thứ Nhất) ', 15600, 
N'Sách hướng dẫn sử dụng tin học văn phòng ', N'TH002.jpg', 2, 8, '10/18/2015', 16)

INSERT SACH(Tensach, Giaban, Mota,Anhbia, MaCD, MaNXB, Ngaycapnhat, Soluongton) 
VALUES ( N'Adobe Photoshop 6.0 và ImageReady 3.0 ', 21000, 
N'Cuốn sách Adobe Photoshop 6.0 và ImageReady 3.0 này sẽ giúp bạn tìm hiểu những tính năng tuyệt vời của phiên bản 6.0, 
nó cũng là con đường ngắn nhất cho những người mới sử dụng Photoshop lần đầu. Với bạn đọc đã sử dụng cuốn sách 
"Adobe Photoshop 5.5 và ImageReady 2.0" do MK.PUB biên soạn trước đây, cuốn sách này là một cách cập nhật nhanh chóng nhất.
Adobe Photoshop 6.0 và ImageReady 3.0 gồm hai phần chính, đan xen nhau: 
Adobe Photoshop 6.0: trình bày các kỹ thuật xử lý ảnh cao cấp, các tính năng mới, giúp bạn tạo được các ảnh đẹp, 
rõ nét và mang tính mỹ thuật cao, hỗ trợ đắc lực cho các chương trình dàn trang và tách màu điện tử. 
Đặc biệt trong phiên bản này, để đáp ứng cho mong mỏi từ lâu của người dùng, 
các hình thể vector bắt đầu được đưa vào sử dụng trong môi trường Photoshop.', 
'TH002.jpg', 5, 5, '10/18/2015', 16)

INSERT SACH(Tensach, Giaban, Mota,Anhbia, MaCD, MaNXB, Ngaycapnhat, Soluongton) 
VALUES ( N'Hướng Dẫn Tự Học Photoshop CS (Photoshop 8.0) ', 25000, 
N'Cuốn sách Adobe Photoshop gồm hai phần chính, đan xen nhau: 
Adobe Photoshop 6.0: trình bày các kỹ thuật xử lý ảnh cao cấp, các tính năng mới, giúp bạn tạo được các ảnh đẹp, 
rõ nét và mang tính mỹ thuật cao, hỗ trợ đắc lực cho các chương trình dàn trang và tách màu điện tử. 
Đặc biệt trong phiên bản này, để đáp ứng cho mong mỏi từ lâu của người dùng, 
các hình thể vector bắt đầu được đưa vào sử dụng trong môi trường Photoshop ', 
'TH003.jpg', 8, 4, '10/18/2015', 16)

INSERT SACH(Tensach, Giaban, Mota,Anhbia, MaCD, MaNXB, Ngaycapnhat, Soluongton) 
VALUES ( N'Tin Học Văn Phòng - Microsoft Excel 2000 (Tái Bản Lần Thứ Nhất)', 16800,
N'Cuốn sách này gồm những nội dung chính sau:
Chương 1: Giới thiệu
Chương 2: Soạn thảo văn bản
Chương 3: Trình bày Font chữ
Chương 4: Trình bày Paragraph
Chương 5: Trình bày trang in
Chương 6: Bảng biểu - Table
Chương 7: Cột chữ - Column
Chương 8: Hình vẽ
Chương 9: Microsoft Equation
Chương 10: Trình bày văn bản nhanh
Chương 11: Bài tập mẫu
Xin trân trọng giới thiệu. ', 
'TH003.jpg', 6, 5,  '10/18/2015', 16)

select * from SACH

/******		Vietsach ******/
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES (1, 1,'Biên soạn' , N'Tác giả')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES (1, 3,'Biên soạn', N'Đồng tác giả')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES (1, 4, '', N'Hiệu đính')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES (1, 10, N'Xuất BẢN',N'Chủ biên')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES(2, 3,'Biên soạn', N'Tác giả')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES (2, 14, '', N'Đồng tác giả')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES(3, 5,'Biên soạn', N'Tác giả')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES(3, 6,'',  N'Hiệu đính')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES (4, 5,'Biên soạn', N'Tác giả')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES (5, 6, 'Biên soạn',N'Tác giả')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES (5, 12,'Biên soạn', N'Chủ biên')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES (6, 14, '', N'Sưu tầm và biên soạn')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES (7, 8,'Biên soạn', N'Tác giả')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES (8, 7,'Biên soạn', N'Tác giả')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES (10, 11,'Biên soạn', N'Tác giả')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES (11, 6,'Biên soạn', N'Tác giả')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES (12, 13,'Biên soạn', N'Tác giả')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES (13, 16,'Biên soạn', N'Tác giả')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES (14, 7,'Biên soạn', N'Tác giả')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES (15, 12,'Biên soạn', N'Tác giả')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES (15, 14,'',  N'Tác giả')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES (17, 14,'Chịu trách nhiệm Xuất bản', N'Chủ biên')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES (17, 15,'Biên soạn', N'Tác giả')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES (18, 15,'Biên soạn', N'Tác giả')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES (19, 5, '', N'Tác giả')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES (20, 8,'Biên soạn', N'Tác giả')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES (21, 13,'Biên soạn', N'Tác giả')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES (22, 10,'Biên soạn', N'Tác giả')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES (23, 11,'Biên soạn', N'Tác giả')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES (22, 2, 'Biên soạn',N'Tác giả')


/****** DONDATHANG ******/

INSERT DONDATHANG (MaKH, Dathanhtoan,Ngaydat,Ngaygiao,Tinhtranggiaohang) 
VALUES ( 1,0, '10/15/2115', '10/20/2015',0)

INSERT DONDATHANG (MaKH, Dathanhtoan,Ngaydat,Ngaygiao,Tinhtranggiaohang) 
VALUES ( 3,0, '10/05/2114', '10/20/2014',0)

/******CHITIETDONHANG ******/
INSERT CHITIETDONTHANG (MaDonHang,MASACH,SOLUONG, Dongia) VALUES (1, 19, 1, 25000)
INSERT CHITIETDONTHANG (MaDonHang,MASACH,SOLUONG, Dongia) VALUES (1, 15, 3, 50000)
INSERT CHITIETDONTHANG (MaDonHang,MASACH,SOLUONG, Dongia) VALUES (1, 14, 1, 25000)
INSERT CHITIETDONTHANG (MaDonHang,MASACH,SOLUONG, Dongia) VALUES (2, 5, 3, 10000)
INSERT CHITIETDONTHANG (MaDonHang,MASACH,SOLUONG, Dongia) VALUES (2, 9, 1, 15000)
INSERT CHITIETDONTHANG (MaDonHang,MASACH,SOLUONG, Dongia) VALUES (2, 15, 3, 150000)
INSERT CHITIETDONTHANG (MaDonHang,MASACH,SOLUONG, Dongia) VALUES (3, 9, 1, 25000)
INSERT CHITIETDONTHANG (MaDonHang,MASACH,SOLUONG, Dongia) VALUES (3, 10, 3,70000)

