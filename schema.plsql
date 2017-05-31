/* connect as SYSDBA */

/* Script tao bang */
-- Chi Nhanh
create table ChiNhanh
(
       maCN varchar2(10) not null,
       tenCN varchar(20) not null,
       truongChiNhanh varchar2(10),
       constraint PK_ChiNhanh primary key (maCN)
);
-- Chi Tieu
create table ChiTieu
(
       maChiTieu varchar2(10) not null,
       tenChiTieu varchar2(20) not null,
       soTien number(10) not null,
       duAn varchar2(10),
       constraint PK_ChiTieu primary key (maChiTieu)
);
-- Nhan Vien
create table NhanVien
(
       maNV varchar2(10) not null,
       hoTen varchar(20) not null,
       diaChi varchar2(50) not null,
       dienThoai varchar2(11) not null,
       email varchar2(20) not null,
       maPhong varchar2(10),
       chiNhanh varchar2(10),
       luong number(10) not null,
       constraint PK_NhanVien primary key (maNV)
);
-- Phan Cong
create table PhanCong
(
       maNV varchar2(10) not null,
       duAn varchar2(10) not null,
       vaiTro varchar(20) not null,
       phuCap number(10) not null,
       constraint PK_PhanCong primary key (maNV, duAn)
);
-- Phong Ban
create table PhongBan
(
       maPhong varchar2(10) not null,
       tenPhong varchar2(20) not null,
       truongPhong varchar2(10),
       ngayNhanChuc date,
       soNhanVien int,
       chiNhanh varchar2(10),
       constraint PK_PhongBan primary key (maPhong)
);
-- Du An
create table DuAn
(
       maDA varchar2(10) not null,
       tenDA varchar2(20) not null,
       kinhPhi number(10) not null,
       phongChuTri varchar(10),
       truongDA varchar(10),
       constraint PK_DuAn primary key (maDA)
);
alter table ChiNhanh add constraint FK_ChiNhanh_NhanVien foreign key (truongChiNhanh) references NhanVien(maNV);
alter table ChiTieu add constraint FK_ChiTieu_DuAn foreign key (duAn) references DuAn(maDA);
alter table NhanVien add constraint FK_NhanVien_ChiNhanh foreign key (chiNhanh) references ChiNhanh(maCN);
alter table NhanVien add constraint FK_NhanVien_PhongBan foreign key (maPhong) references PhongBan(maPhong);
alter table PhanCong add constraint FK_PhanCong_NhanVien foreign key (maNV) references NhanVien(maNV);
alter table PhanCong add constraint FK_PhanCong_DuAn foreign key (duAn) references DuAn(maDA);
alter table PhongBan add constraint FK_PhongBan_ChiNhanh foreign key (chiNhanh) references ChiNhanh(maCN);
alter table DuAn add constraint FK_DuAn_PhongBan foreign key (phongChuTri) references PhongBan(maPhong);
alter table DuAn add constraint FK_DuAn_NhanVien foreign key (truongDA) references NhanVien(maNV);

/* Script them du lieu */

insert into ChiNhanh values ('CN-HCM', 'CN Ho Chi Minh', null);
insert into ChiNhanh values ('CN-HN', 'CN Ha Noi', null);
insert into ChiNhanh values ('CN-DN', 'CN Da Nang', null);
insert into ChiNhanh values ('CN-VT', 'CN Vung Tau', null);
insert into ChiNhanh values ('CN-CT', 'CN Can Tho', null);

insert into PhongBan values ('PB-HCM-NS', 'Phong Nhan Su', null, null, null, 'CN-HCM');
insert into PhongBan values ('PB-HCM-KT', 'Phong Ke Toan', null, null, null, 'CN-HCM');
insert into PhongBan values ('PB-HCM-KH', 'Phong Ke Hoach', null, null, null, 'CN-HCM');
insert into PhongBan values ('PB-HN-NS', 'Phong Nhan Su', null, null, null, 'CN-HN');
insert into PhongBan values ('PB-HN-KT', 'Phong Ke Toan', null, null, null, 'CN-HN');
insert into PhongBan values ('PB-HN-KH', 'Phong Ke Hoach', null, null, null, 'CN-HN');
insert into PhongBan values ('PB-DN-NS', 'Phong Nhan Su', null, null, null, 'CN-DN');
insert into PhongBan values ('PB-DN-KT', 'Phong Ke Toan', null, null, null, 'CN-DN');
insert into PhongBan values ('PB-DN-KH', 'Phong Ke Hoach', null, null, null, 'CN-DN');
insert into PhongBan values ('PB-VT-NS', 'Phong Nhan Su', null, null, null, 'CN-VT');
insert into PhongBan values ('PB-VT-KT', 'Phong Ke Toan', null, null, null, 'CN-VT');
insert into PhongBan values ('PB-VT-KH', 'Phong Ke Hoach', null, null, null, 'CN-VT');
insert into PhongBan values ('PB-CT-NS', 'Phong Nhan Su', null, null, null, 'CN-CT');
insert into PhongBan values ('PB-CT-KT', 'Phong Ke Toan', null, null, null, 'CN-CT');
insert into PhongBan values ('PB-CT-KH', 'Phong Ke Hoach', null, null, null, 'CN-CT');

insert into NhanVien values ('NV000', 'Tran Van Doc', '123 Ly Thai To', '084088888', 'giamdoc@gmail.com', 'PB-HCM-NS', 'CN-HCM', 15000000);
insert into NhanVien values ('NV101', 'Tran Van 101', '256 Huynh Thuc Khang', '0901236732', 'nv101@gmail.com', 'PB-HCM-NS', 'CN-HCM', 8000000);
insert into NhanVien values ('NV102', 'Nguyen Van 102', '223 Luong Dinh Cua', '0902534731', 'nv102@gmail.com', 'PB-HCM-NS', 'CN-HCM', 8000000);
insert into NhanVien values ('NV103', 'Nguyen Van 103', '22 Hoang Hoa Tham', '0902523731', 'nv103@gmail.com', 'PB-HCM-NS', 'CN-HCM', 8000000);
insert into NhanVien values ('NV104', 'Hoang Thi 104', '44 Ly Thai To', '0942347613', 'nv104@gmail.com', 'PB-HCM-KT', 'CN-HCM', 7000000);
insert into NhanVien values ('NV105', 'Ly Thi 105', '325 Nguyen Van Cu', '01672345344', 'nv105@gmail.com', 'PB-HCM-KT', 'CN-HCM', 7000000);
insert into NhanVien values ('NV106', 'Tra Van 106', '33 Ly Thuong Kiet', '0945692415', 'nv106@gmail.com', 'PB-HCM-KH', 'CN-HCM', 9000000);
insert into NhanVien values ('NV107', 'Hua Thi 107', 'F34 Mac Dinh Chi', '01681231412', 'nv107@gmail.com', 'PB-HCM-KH', 'CN-HCM', 9000000);
insert into NhanVien values ('NV108', 'Hua Thi 108', '32 Truong Quoc', '01681211112', 'nv108@gmail.com', 'PB-HCM-KH', 'CN-HCM', 9000000);
insert into NhanVien values ('NV201', 'Tran Van 201', '33 Hang Vong', '0914567539', 'nv201@gmail.com', 'PB-HN-NS', 'CN-HN', 8000000);
insert into NhanVien values ('NV202', 'Nguyen Van 202', 'E21 Hang Com', '01647891456', 'nv202@gmail.com', 'PB-HN-NS', 'CN-HN', 8000000);
insert into NhanVien values ('NV203', 'Nguyen Van 203', '22 Hang Vong', '01284891456', 'nv203@gmail.com', 'PB-HN-NS', 'CN-HN', 8000000);
insert into NhanVien values ('NV204', 'Hoang Thi 204', '44 Hang Ma', '01671112456', 'nv204@gmail.com', 'PB-HN-KT', 'CN-HN', 7000000);
insert into NhanVien values ('NV205', 'Ly Thi 205', 'F67 Hang La', '0914256325', 'nv205@gmail.com', 'PB-HN-KT', 'CN-HN', 7000000);
insert into NhanVien values ('NV206', 'Tra Van 206', 'S19 Pho Lang Thon', '0904444456', 'nv206@gmail.com', 'PB-HN-KH', 'CN-HN', 9000000);
insert into NhanVien values ('NV207', 'Hua Thi 207', '672 Hang Xanh', '01688881414', 'nv207@gmail.com', 'PB-HN-KH', 'CN-HN', 9000000);
insert into NhanVien values ('NV208', 'Hua Thi 208', '44 Pho Co', '01678781414', 'nv208@gmail.com', 'PB-HN-KH', 'CN-HN', 9000000);
insert into NhanVien values ('NV301', 'Tran Van 301', '272 Tu Quynh', '0901564789', 'nv301@gmail.com', 'PB-DN-NS', 'CN-DN', 8000000);
insert into NhanVien values ('NV302', 'Nguyen Van 302', '14 Xa Thi Man', '01643589191', 'nv302@gmail.com', 'PB-DN-NS', 'CN-DN', 8000000);
insert into NhanVien values ('NV303', 'Nguyen Van 303', '22 Ly Lien Kiet', '01678949191', 'nv303@gmail.com', 'PB-DN-NS', 'CN-DN', 8000000);
insert into NhanVien values ('NV304', 'Hoang Thi 304', '345 Cau The Huc', '01649789562', 'nv304@gmail.com', 'PB-DN-KT', 'CN-DN', 7000000);
insert into NhanVien values ('NV305', 'Ly Thi 305', '167 Hue Mong Mo', '084088888', 'nv305@gmail.com', 'PB-DN-KT', 'CN-DN', 7000000);
insert into NhanVien values ('NV306', 'Tra Van 306', '1F1 Cinema Galaxy', '0902311212', 'nv306@gmail.com', 'PB-DN-KH', 'CN-DN', 9000000);
insert into NhanVien values ('NV307', 'Hua Thi 307', '22 Ga Gion KFC', '01657898520', 'nv307@gmail.com', 'PB-DN-KH', 'CN-DN', 9000000);
insert into NhanVien values ('NV308', 'Hua Thi 308', '99 Starbucks', '01614258520', 'nv308@gmail.com', 'PB-DN-KH', 'CN-DN', 9000000);
insert into NhanVien values ('NV401', 'Tran Van 401', '272 Hoang Dieu', '01021234587', 'nv401@gmail.com', 'PB-VT-NS', 'CN-VT', 8000000);
insert into NhanVien values ('NV402', 'Nguyen Van 402', '14 Hai Ba Trung', '01641241191', 'nv402@gmail.com', 'PB-VT-NS', 'CN-VT', 8000000);
insert into NhanVien values ('NV403', 'Nguyen Van 403', '14 Ba Trieu', '01640012191', 'nv403@gmail.com', 'PB-VT-NS', 'CN-VT', 8000000);
insert into NhanVien values ('NV404', 'Hoang Thi 404', '345 Phuoc Lam', '0911111111', 'nv404@gmail.com', 'PB-VT-KT', 'CN-VT', 7000000);
insert into NhanVien values ('NV405', 'Ly Thi 405', '167 Phuoc Tinh', '9022222222', 'nv405@gmail.com', 'PB-VT-KT', 'CN-VT', 7000000);
insert into NhanVien values ('NV406', 'Tra Van 406', '1F1 Ngo Quyen', '0933333333', 'nv406@gmail.com', 'PB-VT-KH', 'CN-VT', 9000000);
insert into NhanVien values ('NV407', 'Hua Thi 407', '22 Ly Thai Dan', '0944444444', 'nv407@gmail.com', 'PB-VT-KH', 'CN-VT', 9000000);
insert into NhanVien values ('NV408', 'Hua Thi 408', '22 Truong Vo Ky', '0955555555', 'nv408@gmail.com', 'PB-VT-KH', 'CN-VT', 9000000);
insert into NhanVien values ('NV501', 'Tran Van 501', '272 Can Gio', '01211111111', 'nv501@gmail.com', 'PB-CT-NS', 'CN-CT', 8000000);
insert into NhanVien values ('NV502', 'Nguyen Van 502', '14 Can Giuoc', '01222222222', 'nv502@gmail.com', 'PB-CT-NS', 'CN-CT', 8000000);
insert into NhanVien values ('NV503', 'Nguyen Van 503', '14 Can Duoc', '01233333333', 'nv503@gmail.com', 'PB-CT-NS', 'CN-CT', 8000000);
insert into NhanVien values ('NV504', 'Hoang Thi 504', '345 Can Tien', '01644444444', 'nv504@gmail.com', 'PB-CT-KT', 'CN-CT', 7000000);
insert into NhanVien values ('NV505', 'Ly Thi 505', '167 Can Tinh', '01255555555', 'nv505@gmail.com', 'PB-CT-KT', 'CN-CT', 7000000);
insert into NhanVien values ('NV506', 'Tra Van 506', '1F1 Can Nhieu', '01246546546', 'nv506@gmail.com', 'PB-CT-KH', 'CN-CT', 9000000);
insert into NhanVien values ('NV507', 'Hua Thi 507', '22 Can Gi', '0977777777', 'nv507@gmail.com', 'PB-CT-KH', 'CN-CT', 9000000);
insert into NhanVien values ('NV508', 'Hua Thi 508', '22 Can Tinh Duong', '0988888888', 'nv508@gmail.com', 'PB-CT-KH', 'CN-CT', 9000000);

update ChiNhanh set truongChiNhanh = 'NV101' where maCN = 'CN-HCM';
update ChiNhanh set truongChiNhanh = 'NV201' where maCN = 'CN-HN';
update ChiNhanh set truongChiNhanh = 'NV301' where maCN = 'CN-DN';
update ChiNhanh set truongChiNhanh = 'NV401' where maCN = 'CN-VT';
update ChiNhanh set truongChiNhanh = 'NV501' where maCN = 'CN-CT';

update PhongBan set truongPhong = 'NV102', ngayNhanChuc = to_date('01-01-2015', 'dd-mm-yyyy'), soNhanVien = 4 where maPhong = 'PB-HCM-NS';
update PhongBan set truongPhong = 'NV104', ngayNhanChuc = to_date('01-01-2015', 'dd-mm-yyyy'), soNhanVien = 2 where maPhong = 'PB-HCM-KT';
update PhongBan set truongPhong = 'NV106', ngayNhanChuc = to_date('01-01-2015', 'dd-mm-yyyy'), soNhanVien = 3 where maPhong = 'PB-HCM-KH';
update PhongBan set truongPhong = 'NV202', ngayNhanChuc = to_date('01-01-2015', 'dd-mm-yyyy'), soNhanVien = 3 where maPhong = 'PB-HN-NS';
update PhongBan set truongPhong = 'NV204', ngayNhanChuc = to_date('01-01-2015', 'dd-mm-yyyy'), soNhanVien = 2 where maPhong = 'PB-HN-KT';
update PhongBan set truongPhong = 'NV206', ngayNhanChuc = to_date('01-01-2015', 'dd-mm-yyyy'), soNhanVien = 3 where maPhong = 'PB-HN-KH';
update PhongBan set truongPhong = 'NV302', ngayNhanChuc = to_date('01-01-2015', 'dd-mm-yyyy'), soNhanVien = 3 where maPhong = 'PB-DN-NS';
update PhongBan set truongPhong = 'NV304', ngayNhanChuc = to_date('01-01-2015', 'dd-mm-yyyy'), soNhanVien = 2 where maPhong = 'PB-DN-KT';
update PhongBan set truongPhong = 'NV306', ngayNhanChuc = to_date('01-01-2015', 'dd-mm-yyyy'), soNhanVien = 3 where maPhong = 'PB-DN-KH';
update PhongBan set truongPhong = 'NV402', ngayNhanChuc = to_date('01-01-2015', 'dd-mm-yyyy'), soNhanVien = 3 where maPhong = 'PB-VT-NS';
update PhongBan set truongPhong = 'NV404', ngayNhanChuc = to_date('01-01-2015', 'dd-mm-yyyy'), soNhanVien = 2 where maPhong = 'PB-VT-KT';
update PhongBan set truongPhong = 'NV406', ngayNhanChuc = to_date('01-01-2015', 'dd-mm-yyyy'), soNhanVien = 3 where maPhong = 'PB-VT-KH';
update PhongBan set truongPhong = 'NV502', ngayNhanChuc = to_date('01-01-2015', 'dd-mm-yyyy'), soNhanVien = 3 where maPhong = 'PB-CT-NS';
update PhongBan set truongPhong = 'NV504', ngayNhanChuc = to_date('01-01-2015', 'dd-mm-yyyy'), soNhanVien = 2 where maPhong = 'PB-CT-KT';
update PhongBan set truongPhong = 'NV506', ngayNhanChuc = to_date('01-01-2015', 'dd-mm-yyyy'), soNhanVien = 3 where maPhong = 'PB-CT-KH';

insert into DuAn values ('DA001', 'Mo Rong Hieu', 10000000, 'PB-HCM-KH', 'NV107');
insert into DuAn values ('DA002', 'Nhan Dien Mat', 15000000, 'PB-HN-KH', 'NV207');
insert into DuAn values ('DA003', 'Tao Xu The', 20000000, 'PB-DN-KH', 'NV307');
insert into DuAn values ('DA004', 'Gianh Moi', 20000000, 'PB-VT-KH', 'NV407');
insert into DuAn values ('DA005', 'Don Dai', 20000000, 'PB-CT-KH', 'NV507');

insert into ChiTieu values ('CT0101', 'Loi Keo', 5000000, 'DA001');
insert into ChiTieu values ('CT0102', 'Tao Dung', 5000000, 'DA001');
insert into ChiTieu values ('CT0201', 'Ghi Nhan', 7500000, 'DA002');
insert into ChiTieu values ('CT0202', 'Xac Dinh', 7500000, 'DA002');
insert into ChiTieu values ('CT0301', 'Tham Do', 10000000, 'DA003');
insert into ChiTieu values ('CT0302', 'Sang Tao', 10000000, 'DA003');
insert into ChiTieu values ('CT0401', 'Tim Hieu', 10000000, 'DA004');
insert into ChiTieu values ('CT0402', 'Thi Hanh', 10000000, 'DA004');
insert into ChiTieu values ('CT0501', 'Dieu Tra', 10000000, 'DA005');
insert into ChiTieu values ('CT0502', 'Tung Tin', 10000000, 'DA005');

insert into PhanCong values ('NV107', 'DA001', 'Giam Sat', 2000000);
insert into PhanCong values ('NV108', 'DA001', 'Thi Hanh', 1500000);
insert into PhanCong values ('NV207', 'DA002', 'Giam Sat', 2000000);
insert into PhanCong values ('NV208', 'DA002', 'Thi Hanh', 1500000);
insert into PhanCong values ('NV307', 'DA003', 'Giam Sat', 2000000);
insert into PhanCong values ('NV308', 'DA003', 'Thi Hanh', 1500000);
insert into PhanCong values ('NV407', 'DA004', 'Giam Sat', 2000000);
insert into PhanCong values ('NV408', 'DA004', 'Thi Hanh', 1500000);
insert into PhanCong values ('NV507', 'DA005', 'Giam Sat', 2000000);
insert into PhanCong values ('NV508', 'DA005', 'Thi Hanh', 1500000);
