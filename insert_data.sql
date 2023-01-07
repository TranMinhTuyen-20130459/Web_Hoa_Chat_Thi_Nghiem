-- STATUS_ACC
insert into status_acc values (1,"Bình thường");
insert into status_acc values (2,"Tạm khóa");
insert into status_acc values (3,"Khóa vĩnh viễn");

-- ----------------------------
-- CITY
-- ----------------------------
ALTER TABLE city AUTO_INCREMENT = 0;

INSERT INTO city (name_city, transport) VALUES ('Hồ Chí Minh', 10000);
INSERT INTO city (name_city, transport) VALUES ('Hà Nội', 30000);
INSERT INTO city (name_city, transport) VALUES ('Đà Nẵng', 20000);

-- ACCOUNT_CUSTOMER
INSERT INTO account_customer(username, pass, id_status_acc, id_city, fullname, sex, email_customer, phone_customer, address)
VALUES("nguyenphutai840@gmail.com", "123", 1, 1, "Nguyễn Phú Tài", "Nam", "nguyenphutai840@gmail.com", "0353677271",
"Di Linh, Lâm Đồng");
INSERT INTO account_customer(username, pass, id_status_acc, id_city, fullname, sex, email_customer, phone_customer, address)
VALUES("tranminhtuyen0908@gmail.com", "123", 1, 1, "Trần Minh Tuyên", "Nam", "tranminhtuyen0908@gmail.com", "0353677272",
"Nam Định");
INSERT INTO account_customer(username, pass, id_status_acc, id_city, fullname, sex, email_customer, phone_customer, address)
VALUES("nguyentandat@gmail.com", "123", 1, 1, "Nguyễn Tấn Đạt", "Nam", "nguyentandat@gmail.com", "0353677273",
"Bến Tre");

-- ROLE_ADMIN
insert into role_admin values (1,"super-root");
insert into role_admin values (2,"member");
insert into role_admin values (3,"root");
-- ACCOUNT_ADMIN
insert into account_admin (username,id_role_admin,id_status_acc,passwordAD) values ("tuyenkun",1,1,"123456");
insert into account_admin (username,id_role_admin,id_status_acc,passwordAD) values ("nguyenphutai",2,1,"123456");
insert into account_admin (username,id_role_admin,id_status_acc,passwordAD) values ("nguyentandat",2,1,"123456");
insert into account_admin (username,id_role_admin,id_status_acc,passwordAD) values ("tranminhtuyen",3,1,"123456");

-- UPDATE TABLE ACCOUNT_ADMIN
UPDATE account_admin
SET fullname = "Trần Minh Tuyên"
where username ="tranminhtuyen";


UPDATE account_admin
SET fullname = "Nguyễn Phú Tài"
where username ="nguyenphutai";

UPDATE account_admin
SET fullname = "Nguyễn Tấn Đạt"
where username ="nguyentandat";

-- ----------------------------
-- STATUS PRODUCT
-- ----------------------------
INSERT INTO status_product VALUES (1, 'Mới');
INSERT INTO status_product VALUES (2, 'Hot');
INSERT INTO status_product VALUES (3, 'Cấm bán');

-- ----------------------------
-- TYPE PRODUCT
-- ----------------------------
INSERT INTO type_product VALUES (1,'Hóa Chất');
INSERT INTO type_product VALUES (2, 'Dụng Cụ');
INSERT INTO type_product VALUES (3, 'Thiết Bị');

-- ----------------------------
-- SUBTYPE PRODUCT
-- ----------------------------
INSERT INTO subtype_product(id_subtype,name_subtype,id_type_product) VALUES (1,'Acid', 1);
INSERT INTO subtype_product(id_subtype,name_subtype,id_type_product) VALUES (2, 'Bazo', 1);
INSERT INTO subtype_product(id_subtype,name_subtype,id_type_product) VALUES (3, 'Muối', 1);
INSERT INTO subtype_product(id_subtype,name_subtype,id_type_product) VALUES (4, 'Kim Loại', 1);
INSERT INTO subtype_product(id_subtype,name_subtype,id_type_product) VALUES (5, 'Chất Chỉ Thị', 1);
INSERT INTO subtype_product(id_subtype,name_subtype,id_type_product) VALUES (6, 'Dung Môi', 1);
INSERT INTO subtype_product(id_subtype,name_subtype,id_type_product) VALUES (7, 'Thuốc Thử', 1);
INSERT INTO subtype_product(id_subtype,name_subtype,id_type_product) VALUES (8, 'Hợp Chất Hữu Cơ', 1);
INSERT INTO subtype_product(id_subtype,name_subtype,id_type_product) VALUES (9, 'Oxit', 1);
INSERT INTO subtype_product(id_subtype,name_subtype,id_type_product) VALUES (10, 'Giá Đỡ Ống Nghiệm', 2);
INSERT INTO subtype_product(id_subtype,name_subtype,id_type_product) VALUES (11, 'Kẹp Gỗ', 2);
INSERT INTO subtype_product(id_subtype,name_subtype,id_type_product) VALUES (12, 'Dụng Cụ Thủy Tinh', 2);
INSERT INTO subtype_product(id_subtype,name_subtype,id_type_product) VALUES (13, 'Ống Hút Nhỏ Giọt', 2);
INSERT INTO subtype_product(id_subtype,name_subtype,id_type_product) VALUES (14, 'Cân Điện Tử', 3);
INSERT INTO subtype_product(id_subtype,name_subtype,id_type_product) VALUES (15, 'Máy Khuấy', 3);
INSERT INTO subtype_product(id_subtype,name_subtype,id_type_product) VALUES (16, 'Máy Nghiền Mẫu', 3);
INSERT INTO subtype_product(id_subtype,name_subtype,id_type_product) VALUES (17, 'Các Loại Tủ', 3);

-- ----------------------------
-- SUPPLIERS
-- ----------------------------
INSERT INTO suppliers VALUES (1, 'Merck - Đức');
INSERT INTO suppliers VALUES (2, 'Acros Organics - Mỹ');
INSERT INTO suppliers VALUES (3, 'Fisher - Mỹ');
INSERT INTO suppliers VALUES (4, 'BOSF - Trung Quốc');
INSERT INTO suppliers VALUES (5, 'Duchefa - Hà Lan');
INSERT INTO suppliers VALUES (6, 'Wako - Nhật Bản');

-- ----------------------------
-- PRODUCTS
-- ----------------------------
ALTER TABLE products AUTO_INCREMENT = 0;

INSERT INTO products VALUES (0, 1, 1, 6, 'Axit Acetic - CH3COOH', NULL, '/images/products/hoa_chat/axit/axit_acetic.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 1, 1, 4, 'Axit Carbonic - H2CO3', NULL, '/images/products/hoa_chat/axit/axit_carbonic.png', 1000, NOW(), 4, NULL, 0);
INSERT INTO products VALUES (0, 1, 1, 2, 'Axit Citric - HOC(CH2CO2H)2', NULL, '/images/products/hoa_chat/axit/axit_citric.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 1, 1, 4, 'Axit Clohydric - HCl', NULL, '/images/products/hoa_chat/axit/axit_clohydric.jpg', 1000, NOW(), 4, NULL, 0);
INSERT INTO products VALUES (0, 1, 1, 5, 'Axit Fluoroantimonic - HF', NULL, '/images/products/hoa_chat/axit/axit_hexafluoroantimonic.png', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 1, 1, 6, 'Axit Hydrofluoric - CH3COOH', NULL, '/images/products/hoa_chat/axit/axit_hydrofluoric.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 1, 1, 2, 'Axit Lactic - CH3CHCOOH', NULL, '/images/products/hoa_chat/axit/axit_lactic.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 1, 1, 4, 'Axit Nitric - HNO3', NULL, '/images/products/hoa_chat/axit/axit_nitric.jpg', 1000, NOW(), 4, NULL, 0);
INSERT INTO products VALUES (0, 1, 1, 2, 'Axit Perchloric - HClO4', NULL, '/images/products/hoa_chat/axit/axit_perchloric.png', 1000, NOW(), 4, NULL, 0);
INSERT INTO products VALUES (0, 1, 1, 5, 'Axit Permanganic - HMnO4', NULL, '/images/products/hoa_chat/axit/axit_permanganic.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 1, 1, 6, 'Axit Phosphoric - H3PO4', NULL, '/images/products/hoa_chat/axit/axit_phosphoric.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 1, 1, 4, 'Axit Selenic - H2SeO4', NULL, '/images/products/hoa_chat/axit/axit_selenic.png', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 1, 1, 1, 'Axit Sunfuric - H2SO4', NULL, '/images/products/hoa_chat/axit/axit_sunfuric.jpg', 1000, NOW(), 4, NULL, 0);
INSERT INTO products VALUES (0, 1, 1, 5, 'Axit Sunfuro - H2SO3', NULL, '/images/products/hoa_chat/axit/axit_sunfuro.jpg', 1000, NOW(), 5, NULL, 0);

INSERT INTO products VALUES (0, 2, 1, 1, 'Aluminium Hydroxide - Al(OH)3', NULL, '/images/products/hoa_chat/bazo/aluminum_hydroxide.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 2, 1, 4, 'Barium Hydroxide - Ba(OH)2', NULL, '/images/products/hoa_chat/bazo/barium_hydroxide.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 2, 1, 6, 'Calcium Hydroxide - Ca(OH)2', NULL, '/images/products/hoa_chat/bazo/calcium_hydroxit.jpg', 1000, NOW(), 4, NULL, 0);
INSERT INTO products VALUES (0, 2, 1, 2, 'Cesium Hydroxide - CsOH', NULL, '/images/products/hoa_chat/bazo/cesium_hydroxide.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 2, 1, 1, 'Copper(II) Hydroxide - Cu(OH)2', NULL, '/images/products/hoa_chat/bazo/copper2_hydroxide.jpg', 1000, NOW(), 4, NULL, 0);
INSERT INTO products VALUES (0, 2, 1, 4, 'Magnesium Hydroxide - Mg(OH)2', NULL, '/images/products/hoa_chat/bazo/magnesium_hydroxide.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 2, 1, 6, 'Postassium Hydroxide - KOH', NULL, '/images/products/hoa_chat/bazo/potassium_hydroxide.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 2, 1, 3, 'Sodium Hydroxide - NaOH', NULL, '/images/products/hoa_chat/bazo/sodium_hydroxide.jpg', 1000, NOW(), 5, NULL, 0);

INSERT INTO products VALUES (0, 3, 1, 5, 'Barium Sunfate - BaSO4', NULL, '/images/products/hoa_chat/muoi/barium_sulfate.jpg', 1000, NOW(), 4, NULL, 0);
INSERT INTO products VALUES (0, 3, 1, 1, 'Calcium Carbonate - CaCO3', NULL, '/images/products/hoa_chat/muoi/calcium_carbonate.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 3, 1, 6, 'Copper(II) Sunfate - CuSO4', NULL, '/images/products/hoa_chat/muoi/copper2_sulfate.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 3, 1, 1, 'Iron(II) Sunfate - FeSO4', NULL, '/images/products/hoa_chat/muoi/iron2_sunfate.jpg', 1000, NOW(), 4, NULL, 0);
INSERT INTO products VALUES (0, 3, 1, 5, 'Kali Permanganat - KMnO4', NULL, '/images/products/hoa_chat/muoi/kali_penmanganate.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 3, 1, 1, 'Silver Nitrate - AgNO3', NULL, '/images/products/hoa_chat/muoi/silver_nitrate.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 3, 1, 2, 'Sodium Carbonate - Na2CO3', NULL, '/images/products/hoa_chat/muoi/sodium_carbonate.jpg', 1000, NOW(), 4, NULL, 0);
INSERT INTO products VALUES (0, 3, 1, 6, 'Sodium Hydrogen Carbonate - NaHCO3', NULL, '/images/products/hoa_chat/muoi/sodium_hydrogen_carbonate.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 3, 1, 6, 'Sodium Hypochlorite - NaOCl', NULL, '/images/products/hoa_chat/muoi/sodium_hypochlorite.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 3, 1, 5, 'Sodium Silicate Nonahydrate - H18Na2O12Si', NULL, '/images/products/hoa_chat/muoi/sodium_silicate_nonahydrate.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 3, 1, 3, 'Trisodium Phosphate - Na3PO4', NULL, '/images/products/hoa_chat/muoi/trisodium_photphate.jpg', 1000, NOW(), 5, NULL, 0);

INSERT INTO products VALUES (0, 4, 1, 1, 'Copper Powder - Cu', NULL, '/images/products/hoa_chat/kim_loai/copper_powder.png', 1000, NOW(), 4, NULL, 0);
INSERT INTO products VALUES (0, 4, 1, 2, 'Copper Turnings - Cu', NULL, '/images/products/hoa_chat/kim_loai/copper_turnings.jpg', 1000, NOW(), 4, NULL, 0);
INSERT INTO products VALUES (0, 4, 1, 4, 'Aluminum Granules - Al', NULL, '/images/products/hoa_chat/kim_loai/hat_nhom.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 4, 1, 6, 'Iron Powder - Fe', NULL, '/images/products/hoa_chat/kim_loai/iron_powder.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 4, 1, 3, 'Lead Powder - Pb', NULL, '/images/products/hoa_chat/kim_loai/lead_powder.jpg', 1000, NOW(), 4, NULL, 0);
INSERT INTO products VALUES (0, 4, 1, 4, 'Nickel Powder - Ni', NULL, '/images/products/hoa_chat/kim_loai/nickel_powder.png', 1000, NOW(), 4, NULL, 0);
INSERT INTO products VALUES (0, 4, 1, 6, 'Phosphorus - P', NULL, '/images/products/hoa_chat/kim_loai/phosphorus.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 4, 1, 2, 'Postassium - K', NULL, '/images/products/hoa_chat/kim_loai/postassium.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 4, 1, 6, 'Silver - Ag', NULL, '/images/products/hoa_chat/kim_loai/silver.jpg', 1000, NOW(), 4, NULL, 0);
INSERT INTO products VALUES (0, 4, 1, 1, 'Sodium - Na', NULL, '/images/products/hoa_chat/kim_loai/sodium.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 4, 1, 3, 'Zinc Powder - Zn', NULL, '/images/products/hoa_chat/kim_loai/zinc_powder.jpg', 1000, NOW(), 5, NULL, 0);

INSERT INTO products VALUES (0, 5, 1, 5, 'Bromocresol Purple - C21H16Br2O5S', NULL, '/images/products/hoa_chat/chi_thi/bromocresol_purple.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 5, 1, 2, 'Bromocresol Blue - C19H10Br4O5S', NULL, '/images/products/hoa_chat/chi_thi/bromophenol_blue.jpg', 1000, NOW(), 4, NULL, 0);
INSERT INTO products VALUES (0, 5, 1, 5, 'Methyl Orange - C14H14N3NaO3S', NULL, '/images/products/hoa_chat/chi_thi/methyl_orange.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 5, 1, 1, 'Murexide - C8H8N6O6', NULL, '/images/products/hoa_chat/chi_thi/murexide.jpg', 1000, NOW(), 4, NULL, 0);
INSERT INTO products VALUES (0, 5, 1, 6, 'Phenolphtalein - C20H14O4', NULL, '/images/products/hoa_chat/chi_thi/phenolphtalein.jpg', 1000, NOW(), 5, NULL, 0);

INSERT INTO products VALUES (0, 6, 1, 3, 'Cyclopentane - C5H10', NULL, '/images/products/hoa_chat/dung_moi/cyclopentane.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 6, 1, 5, 'Dichloromethane - CH2Cl2', NULL, '/images/products/hoa_chat/dung_moi/dichloromethane.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 6, 1, 3, 'Ethyl Acetate - C4H8O2', NULL, '/images/products/hoa_chat/dung_moi/ethyl_acetate.jpg', 1000, NOW(), 4, NULL, 0);
INSERT INTO products VALUES (0, 6, 1, 5, 'Hexane - C6H14', NULL, '/images/products/hoa_chat/dung_moi/hexane.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 6, 1, 4, 'Nước cất - H20', NULL, '/images/products/hoa_chat/dung_moi/nuoc_cat.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 6, 1, 1, 'Tetrahydrofuran - C4H8O', NULL, '/images/products/hoa_chat/dung_moi/tetrahydrofuran.jpg', 1000, NOW(), 4, NULL, 0);
INSERT INTO products VALUES (0, 6, 1, 1, 'Toluene - C7H8', NULL, '/images/products/hoa_chat/dung_moi/toluene.jpg', 1000, NOW(), 5, NULL, 0);

INSERT INTO products VALUES (0, 7, 1, 1, 'Barfoed - RCHO + Cu + H2O', NULL, '/images/products/hoa_chat/thuoc_thu/barfoed.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 7, 1, 5, 'Benedict - RCHO + Cu + OH', NULL, '/images/products/hoa_chat/thuoc_thu/benedict.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 7, 1, 3, 'Biuret - (H2NCO)2NH', NULL, '/images/products/hoa_chat/thuoc_thu/biuret.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 7, 1, 2, 'Bradford', NULL, '/images/products/hoa_chat/thuoc_thu/bradford.jpg', 1000, NOW(), 5, NULL, 0);

INSERT INTO products VALUES (0, 8, 1, 4, 'Acetone - (CH3)2CO', NULL, '/images/products/hoa_chat/hop_chat_huu_co/acetone.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 8, 1, 1, 'Benzen - C6H6', NULL, '/images/products/hoa_chat/hop_chat_huu_co/benzen.jpg', 1000, NOW(), 4, NULL, 0);
INSERT INTO products VALUES (0, 8, 1, 4, 'Chloroform - CHCl3', NULL, '/images/products/hoa_chat/hop_chat_huu_co/chloroform.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 8, 1, 1, 'Ethanal - CH3CHO', NULL, '/images/products/hoa_chat/hop_chat_huu_co/ethanal.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 8, 1, 3, 'Ethanol - C2H6O', NULL, '/images/products/hoa_chat/hop_chat_huu_co/ethanol.jpg', 1000, NOW(), 4, NULL, 0);
INSERT INTO products VALUES (0, 8, 1, 2, 'Etilen - C2H4', NULL, '/images/products/hoa_chat/hop_chat_huu_co/etilen.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 8, 1, 3, 'Methanol - CH3OH', NULL, '/images/products/hoa_chat/hop_chat_huu_co/methanol.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 8, 1, 6, 'Pentane - C5H12', NULL, '/images/products/hoa_chat/hop_chat_huu_co/pentane.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 8, 1, 1, 'Phenol - C6H5OH', NULL, '/images/products/hoa_chat/hop_chat_huu_co/phenol.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 8, 1, 6, 'Sucrose - C12H22O11', NULL, '/images/products/hoa_chat/hop_chat_huu_co/sucrose.jpg', 1000, NOW(), 4, NULL, 0);
INSERT INTO products VALUES (0, 8, 1, 3, 'Xylene - (CH3)2C6H4', NULL, '/images/products/hoa_chat/hop_chat_huu_co/xylene.jpg', 1000, NOW(), 5, NULL, 0);

INSERT INTO products VALUES (0, 9, 1, 5, 'Aluminium Oxit - Al2O3', NULL, '/images/products/hoa_chat/oxit/aluminium_oxit.jpg', 1000, NOW(), 4, NULL, 0);
INSERT INTO products VALUES (0, 9, 1, 5, 'Bari Oxit - BaO', NULL, '/images/products/hoa_chat/oxit/bari_oxit.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 9, 1, 3, 'Calcium Oxit - CaO', NULL, '/images/products/hoa_chat/oxit/calcium_oxit.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 9, 1, 5, 'Copper(II) Oxit - CuO', NULL, '/images/products/hoa_chat/oxit/copper2_oxit.png', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 9, 1, 2, 'Ferric Oxit - Fe2O3', NULL, '/images/products/hoa_chat/oxit/ferric_oxit.jpg', 1000, NOW(), 4, NULL, 0);
INSERT INTO products VALUES (0, 9, 1, 4, 'Iron2 Oxit - FeO', NULL, '/images/products/hoa_chat/oxit/iron2_oxit.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 9, 1, 5, 'Phosphorus Pentoxide - P4O10', NULL, '/images/products/hoa_chat/oxit/phosphorus_pentoxide.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 9, 1, 2, 'Sodium Oxit - Na2O', NULL, '/images/products/hoa_chat/oxit/sodium_oxit.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 9, 1, 4, 'Triiron Tetroxide - Fe3O4', NULL, '/images/products/hoa_chat/oxit/triiron_tetroxide.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 9, 1, 3, 'Zinc Oxit - ZnO', NULL, '/images/products/hoa_chat/oxit/zinc_oxit.jpg', 1000, NOW(), 4, NULL, 0);

INSERT INTO products VALUES (0, 10, 1, 1, 'Giá Đỡ Ống Nghiệm', NULL, '/images/products/dung_cu/gia_do_ong_nghiem.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 10, 1, 6, 'Kệ Đựng Ống Nghiệm', NULL, '/images/products/dung_cu/gia_do_ong_nghiem_2.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 10, 1, 5, 'Giá Đỡ Ống Nghiệm', NULL, '/images/products/dung_cu/gia_do_ong_nghiem_3.jpg', 1000, NOW(), 4, NULL, 0);
INSERT INTO products VALUES (0, 10, 1, 1, 'Giá Đỡ Ống Nghiệm', NULL, '/images/products/dung_cu/gia_do_ong_nghiem_4.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 10, 1, 2, 'Giá Ống Nghiệm', NULL, '/images/products/dung_cu/gia_do_ong_nghiem_5.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 10, 1, 1, 'Giá Đỡ Hai Tầng', NULL, '/images/products/dung_cu/gia_do_ong_nghiem_6.jpg', 1000, NOW(), 5, NULL, 0);

INSERT INTO products VALUES (0, 11, 1, 4, 'Kẹp Gỗ', NULL, '/images/products/dung_cu/kep_go.jpg', 1000, NOW(), 4, NULL, 0);
INSERT INTO products VALUES (0, 11, 1, 3, 'Kẹp Gỗ', NULL, '/images/products/dung_cu/kep_go_2.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 11, 1, 4, 'Kẹp Cán Sắt', NULL, '/images/products/dung_cu/kep_go_3.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 11, 1, 4, 'Kẹp Gỗ', NULL, '/images/products/dung_cu/kep_go_4.jpg', 1000, NOW(), 5, NULL, 0);

INSERT INTO products VALUES (0, 12, 1, 2, 'Bình Tam Giác', NULL, '/images/products/dung_cu/binh_tam_giac.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 12, 1, 2, 'Cốc Thủy Tinh', NULL, '/images/products/dung_cu/coc_thuy_tinh.jpg', 1000, NOW(), 4, NULL, 0);
INSERT INTO products VALUES (0, 12, 1, 2, 'Đũa Thủy Tinh', NULL, '/images/products/dung_cu/dua_thuy_tinh.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 12, 1, 2, 'Ống Nghiệm', NULL, '../images/products/dung_cu/ong_nghiem.jpg', 1000, NOW(), 4, NULL, 0);
INSERT INTO products VALUES (0, 12, 1, 2, 'Ống Nghiệm Có Nút Gỗ', NULL, '/images/products/dung_cu/ong_nghiem_2.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 12, 1, 2, 'Ống Nghiệm Nút Nhựa', NULL, '/images/products/dung_cu/ong_nghiem_3.jpg', 1000, NOW(), 4, NULL, 0);
INSERT INTO products VALUES (0, 12, 1, 2, 'Ống Nghiệm Nút Gỗ', NULL, '/images/products/dung_cu/ong_nghiem_4.jpg', 1000, NOW(), 5, NULL, 0);

INSERT INTO products VALUES (0, 13, 1, 6, 'Ông Hút Nhỏ Giọt', NULL, '/images/products/dung_cu/ong_nho_giot.jpg', 1000, NOW(), 4, NULL, 0);
INSERT INTO products VALUES (0, 13, 1, 6, 'Ông Hút Nhỏ Giọt', NULL, '/images/products/dung_cu/ong_nho_giot_2.jpg', 1000, NOW(), 4, NULL, 0);
INSERT INTO products VALUES (0, 13, 1, 6, 'Ông Hút Nhỏ Giọt', NULL, '/images/products/dung_cu/ong_nho_giot_3.jpg', 1000, NOW(), 4, NULL, 0);
INSERT INTO products VALUES (0, 13, 1, 6, 'Ông Hút Nhỏ Giọt', NULL, '/images/products/dung_cu/ong_nho_giot_4.jpg', 1000, NOW(), 4, NULL, 0);
INSERT INTO products VALUES (0, 13, 1, 6, 'Ông Hút Nhỏ Giọt', NULL, '/images/products/dung_cu/ong_nho_giot_5.jpg', 1000, NOW(), 4, NULL, 0);

INSERT INTO products VALUES (0, 14, 1, 5, 'Cân Điện Tử Extech SC600', NULL, '/images/products/thiet_bi/can_dien_tu.png', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 14, 1, 5, 'Cân Điện Tử Lutron GM-600G', NULL, '/images/products/thiet_bi/can_dien_tu_2.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 14, 1, 5, 'Cân Điện Tử Omron', NULL, '/images/products/thiet_bi/can_dien_tu_3.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 14, 1, 5, 'Cân Điện Tử Microlife', NULL, '/images/products/thiet_bi/can_dien_tu_4.jpg', 1000, NOW(), 5, NULL, 0);

INSERT INTO products VALUES (0, 15, 1, 6, 'Máy Khuấy Không Gia Nhiệt', NULL, '/images/products/thiet_bi/may_khuay.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 15, 1, 6, 'Máy Khuấy SHINKO TG-40', NULL, '/images/products/thiet_bi/may_khuay_2.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 15, 1, 6, 'Máy Khuấy Từ Hanna HI 324N', NULL, '/images/products/thiet_bi/may_khuay_3.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 15, 1, 6, 'Máy Khuấy Từ HI 200', NULL, '/images/products/thiet_bi/may_khuay_4.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 15, 1, 6, 'Máy Khuấy Đảo Chiều', NULL, '/images/products/thiet_bi/may_khuay_5.jpg', 1000, NOW(), 5, NULL, 0);

INSERT INTO products VALUES (0, 16, 1, 4, 'Máy Nghiền Mẫu IKA A-10', NULL, '/images/products/thiet_bi/may_nghien.png', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 16, 1, 4, 'Máy Nghiền Mẫu MF-10', NULL, '/images/products/thiet_bi/may_nghien_2.png', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 16, 1, 4, 'Máy Nghiền Mẫu Phân Tích', NULL, '/images/products/thiet_bi/may_nghien_3.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 16, 1, 4, 'Máy Nghiền Tube Mill', NULL, '/images/products/thiet_bi/may_nghien_4.jpg', 1000, NOW(), 5, NULL, 0);

INSERT INTO products VALUES (0, 17, 1, 1, 'Tủ Chân Không', NULL, '/images/products/thiet_bi/tu_chan_khong.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 17, 1, 1, 'Tủ Sấy', NULL, '/images/products/thiet_bi/tu_chan_khong_2.jpg', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 17, 1, 1, 'Tủ Hút Khí Độc', NULL, '/images/products/thiet_bi/tu_hut_khi_doc.png', 1000, NOW(), 5, NULL, 0);
INSERT INTO products VALUES (0, 17, 1, 1, 'Tủ Thao Tác PCR', NULL, '/images/products/thiet_bi/tu_pcr.jpg', 1000, NOW(), 5, NULL, 0);

UPDATE products SET description_product = 'Axit Sulfuric hay còn gọi là hóa chất H2SO4, tên gọi này có nguồn gốc từ tiếng Pháp là acide sulfurique. Axit Sulfuric có công thức phần tử là H2SO4. H2SO4 là một axit vô cơ gồm các nguyên tố lưu huỳnh, oxy, hidro; tồn tại ở dạng chất lỏng sánh như dầu, không mùi, không màu, không bay hơi, nặng gấp 2 lần nước (H2SO4 98% có D = 1,84g/cm3). H2SO4 có khả năng tan hoàn toàn trong nước theo bất kỳ tỷ lệ nào, khi tan trong nước H2SO4 tỏa rất nhiều nhiệt.';

-- ----------------------------
-- PRICE PRODUCT
-- ----------------------------
INSERT INTO price_product VALUES (1, NULL, 699000, 500000, NULL);
INSERT INTO price_product VALUES (2, NULL, 699000, 500000, NULL);
INSERT INTO price_product VALUES (3, NULL, 699000, 500000, NULL);
INSERT INTO price_product VALUES (4, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (5, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (6, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (7, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (8, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (9, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (10, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (11, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (12, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (13, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (14, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (15, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (16, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (17, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (18, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (19, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (20, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (21, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (22, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (23, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (24, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (25, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (26, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (27, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (28, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (29, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (30, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (31, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (32, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (33, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (34, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (35, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (36, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (37, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (38, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (39, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (40, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (41, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (42, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (43, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (44, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (45, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (46, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (47, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (48, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (49, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (50, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (51, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (52, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (53, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (54, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (55, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (56, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (57, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (58, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (59, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (60, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (61, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (62, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (63, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (64, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (65, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (66, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (67, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (68, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (69, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (70, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (71, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (72, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (73, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (74, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (75, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (76, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (77, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (78, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (79, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (80, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (81, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (82, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (83, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (84, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (85, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (86, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (87, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (88, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (89, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (90, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (91, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (92, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (93, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (94, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (95, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (96, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (97, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (98, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (99, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (100, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (101, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (102, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (103, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (104, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (105, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (106, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (107, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (108, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (109, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (110, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (111, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (112, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (113, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (114, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (115, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (116, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (117, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (118, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (119, NULL, 699000, 699000, NULL);
INSERT INTO price_product VALUES (120, NULL, 699000, 699000, NULL);

-- ----------------------------
-- SOLD PRODUCT
-- ----------------------------
INSERT INTO sold_product VALUES (1, NULL, 13);
INSERT INTO sold_product VALUES (2, NULL, 13);
INSERT INTO sold_product VALUES (3, NULL, 13);
INSERT INTO sold_product VALUES (4, NULL, 13);
INSERT INTO sold_product VALUES (5, NULL, 13);
INSERT INTO sold_product VALUES (6, NULL, 13);
INSERT INTO sold_product VALUES (7, NULL, 13);
INSERT INTO sold_product VALUES (8, NULL, 13);
INSERT INTO sold_product VALUES (9, NULL, 13);
INSERT INTO sold_product VALUES (10, NULL, 13);
INSERT INTO sold_product VALUES (11, NULL, 13);
INSERT INTO sold_product VALUES (12, NULL, 13);
INSERT INTO sold_product VALUES (13, NULL, 13);
INSERT INTO sold_product VALUES (14, NULL, 13);
INSERT INTO sold_product VALUES (15, NULL, 13);
INSERT INTO sold_product VALUES (16, NULL, 13);
INSERT INTO sold_product VALUES (17, NULL, 13);
INSERT INTO sold_product VALUES (18, NULL, 13);
INSERT INTO sold_product VALUES (19, NULL, 13);
INSERT INTO sold_product VALUES (20, NULL, 13);
INSERT INTO sold_product VALUES (21, NULL, 13);
INSERT INTO sold_product VALUES (22, NULL, 13);
INSERT INTO sold_product VALUES (23, NULL, 13);
INSERT INTO sold_product VALUES (24, NULL, 13);
INSERT INTO sold_product VALUES (25, NULL, 13);
INSERT INTO sold_product VALUES (26, NULL, 13);
INSERT INTO sold_product VALUES (27, NULL, 13);
INSERT INTO sold_product VALUES (28, NULL, 13);
INSERT INTO sold_product VALUES (29, NULL, 13);
INSERT INTO sold_product VALUES (30, NULL, 13);
INSERT INTO sold_product VALUES (31, NULL, 13);
INSERT INTO sold_product VALUES (32, NULL, 13);
INSERT INTO sold_product VALUES (33, NULL, 13);
INSERT INTO sold_product VALUES (34, NULL, 13);
INSERT INTO sold_product VALUES (35, NULL, 13);
INSERT INTO sold_product VALUES (36, NULL, 13);
INSERT INTO sold_product VALUES (37, NULL, 13);
INSERT INTO sold_product VALUES (38, NULL, 13);
INSERT INTO sold_product VALUES (39, NULL, 13);
INSERT INTO sold_product VALUES (40, NULL, 13);
INSERT INTO sold_product VALUES (41, NULL, 13);
INSERT INTO sold_product VALUES (42, NULL, 13);
INSERT INTO sold_product VALUES (43, NULL, 13);
INSERT INTO sold_product VALUES (44, NULL, 13);
INSERT INTO sold_product VALUES (45, NULL, 13);
INSERT INTO sold_product VALUES (46, NULL, 13);
INSERT INTO sold_product VALUES (47, NULL, 13);
INSERT INTO sold_product VALUES (48, NULL, 13);
INSERT INTO sold_product VALUES (49, NULL, 13);
INSERT INTO sold_product VALUES (50, NULL, 13);
INSERT INTO sold_product VALUES (51, NULL, 13);
INSERT INTO sold_product VALUES (52, NULL, 13);
INSERT INTO sold_product VALUES (53, NULL, 13);
INSERT INTO sold_product VALUES (54, NULL, 13);
INSERT INTO sold_product VALUES (55, NULL, 13);
INSERT INTO sold_product VALUES (56, NULL, 13);
INSERT INTO sold_product VALUES (57, NULL, 13);
INSERT INTO sold_product VALUES (58, NULL, 13);
INSERT INTO sold_product VALUES (59, NULL, 13);
INSERT INTO sold_product VALUES (60, NULL, 13);
INSERT INTO sold_product VALUES (61, NULL, 13);
INSERT INTO sold_product VALUES (62, NULL, 13);
INSERT INTO sold_product VALUES (63, NULL, 13);
INSERT INTO sold_product VALUES (64, NULL, 13);
INSERT INTO sold_product VALUES (65, NULL, 13);
INSERT INTO sold_product VALUES (66, NULL, 13);
INSERT INTO sold_product VALUES (67, NULL, 13);
INSERT INTO sold_product VALUES (68, NULL, 13);
INSERT INTO sold_product VALUES (69, NULL, 13);
INSERT INTO sold_product VALUES (70, NULL, 13);
INSERT INTO sold_product VALUES (71, NULL, 13);
INSERT INTO sold_product VALUES (72, NULL, 13);
INSERT INTO sold_product VALUES (73, NULL, 13);
INSERT INTO sold_product VALUES (74, NULL, 13);
INSERT INTO sold_product VALUES (75, NULL, 13);
INSERT INTO sold_product VALUES (76, NULL, 13);
INSERT INTO sold_product VALUES (77, NULL, 13);
INSERT INTO sold_product VALUES (78, NULL, 13);
INSERT INTO sold_product VALUES (79, NULL, 13);
INSERT INTO sold_product VALUES (80, NULL, 13);
INSERT INTO sold_product VALUES (81, NULL, 13);
INSERT INTO sold_product VALUES (82, NULL, 13);
INSERT INTO sold_product VALUES (83, NULL, 13);
INSERT INTO sold_product VALUES (84, NULL, 13);
INSERT INTO sold_product VALUES (85, NULL, 13);
INSERT INTO sold_product VALUES (86, NULL, 13);
INSERT INTO sold_product VALUES (87, NULL, 13);
INSERT INTO sold_product VALUES (88, NULL, 13);
INSERT INTO sold_product VALUES (89, NULL, 13);
INSERT INTO sold_product VALUES (90, NULL, 13);
INSERT INTO sold_product VALUES (91, NULL, 13);
INSERT INTO sold_product VALUES (92, NULL, 13);
INSERT INTO sold_product VALUES (93, NULL, 13);
INSERT INTO sold_product VALUES (94, NULL, 13);
INSERT INTO sold_product VALUES (95, NULL, 13);
INSERT INTO sold_product VALUES (96, NULL, 13);
INSERT INTO sold_product VALUES (97, NULL, 13);
INSERT INTO sold_product VALUES (98, NULL, 13);
INSERT INTO sold_product VALUES (99, NULL, 13);
INSERT INTO sold_product VALUES (100, NULL, 13);
INSERT INTO sold_product VALUES (101, NULL, 13);
INSERT INTO sold_product VALUES (102, NULL, 13);
INSERT INTO sold_product VALUES (103, NULL, 13);
INSERT INTO sold_product VALUES (104, NULL, 13);
INSERT INTO sold_product VALUES (105, NULL, 13);
INSERT INTO sold_product VALUES (106, NULL, 13);
INSERT INTO sold_product VALUES (107, NULL, 13);
INSERT INTO sold_product VALUES (108, NULL, 13);
INSERT INTO sold_product VALUES (109, NULL, 13);
INSERT INTO sold_product VALUES (110, NULL, 13);
INSERT INTO sold_product VALUES (111, NULL, 13);
INSERT INTO sold_product VALUES (112, NULL, 13);
INSERT INTO sold_product VALUES (113, NULL, 13);
INSERT INTO sold_product VALUES (114, NULL, 13);
INSERT INTO sold_product VALUES (115, NULL, 13);
INSERT INTO sold_product VALUES (116, NULL, 13);
INSERT INTO sold_product VALUES (117, NULL, 13);
INSERT INTO sold_product VALUES (118, NULL, 13);
INSERT INTO sold_product VALUES (119, NULL, 13);
INSERT INTO sold_product VALUES (120, NULL, 13);

-- ----------------------------
-- STATUS BILL
-- ----------------------------
INSERT INTO status_bill VALUES (1, 'Đã bán');
INSERT INTO status_bill VALUES (2, 'Đang bán');
INSERT INTO status_bill VALUES (3, 'Bị hủy');
