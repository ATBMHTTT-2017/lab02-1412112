create or replace procedure themNhanVien
(
       maNV          varchar2(10),
       hoTen         varchar2(20),
       diaChi        varchar2(50),
       dienThoai     varchar2(11),
       email         varchar2(20),
       maPhong       varchar2(10),
       chiNhanh      varchar2(10),
       luong         varchar2(200)
)
as 
begin
       declare
             input_string      varchar2(200) := luong;
             encrypted_raw     raw(2000);
             num_key_bytes     number := 256/8;
             key_bytes_raw     raw(32);
             encryption_type   pls_integer :=
                                              dbms_crypto.encrypt_AES256
                                            + dbms_crypto.chain_CBC
                                            + dbms_crypto.pad_PKCS5;
       begin
             key_bytes_raw := dbms_crypto.randombytes (num_key_bytes);
             encrypted_raw := dbms_crypto.encrypt
             (
                           src => UTL_I18N.string_to_raw (input_string, 'AL32UTF8'),
                           typ => encryption_type,
                           key => key_bytes_raw
             );
             insert into NhanVien values(maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, encrypted_raw, key_bytes_raw);
             commit;
       end;
end themNhanVien;

create or procedure xemLuong
as
begin
       declare
             output_string     varchar2(200);
             decrypted_raw     raw(2000); 
             maNV              varchar2(10) := sys_context ('userenv', 'session_user');
             encryption_type   pls_integer :=
                                              dbms_crypto.encrypt_AES256
                                            + dbms_crypto.chain_CBC
                                            + dbms_crypto.pad_PKCS5;                                                     
       begin
             for NhanVien in (select * from NhanVien)
             loop  
                 if NhanVien.maNV = maNV then 
                    decrypted_raw := dbms_crypto.decrypt
                    (
                        src => NhanVien.luong,
                        typ =>  encryption_type,
                        key => NhanVien.keyLuong
                    );                                   
                 output_string := UTL_I18N.raw_to_char (decrypted_raw, 'AL32UTF8');
                 dbms_output.put_line ('Luong: ' || output_string);
                 end if;
             end loop;
       end;
end xemLuong;

grant execute on xemLuong to GiamDoc, TruongChiNhanh, TruongPhong, TruongDuAn, NhanVien;
