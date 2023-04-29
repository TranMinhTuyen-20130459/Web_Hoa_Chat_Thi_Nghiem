-- thêm giá trị mặc định cho các cột trong bảng bills 
ALTER TABLE bills ALTER COLUMN shop_id SET DEFAULT "1";
ALTER TABLE bills ALTER COLUMN from_name SET DEFAULT "k46-it-nlu";
ALTER TABLE bills ALTER COLUMN from_phone SET DEFAULT "123456789";
ALTER TABLE bills ALTER COLUMN from_address SET DEFAULT "Khoa CNTT - Đại học Nông Lâm";
ALTER TABLE bills ALTER COLUMN from_ward_name SET DEFAULT "Linh Trung";
ALTER TABLE bills ALTER COLUMN from_district_name SET DEFAULT "Thủ Đức";
ALTER TABLE bills ALTER COLUMN from_province_name SET DEFAULT "Hồ Chí Minh";

-- thêm các cột mới vào bảng bills để làm việc với api logistic
ALTER TABLE bills ADD COLUMN from_province_id varchar(20) DEFAULT('202'); -- tp.Hồ Chí Minh
ALTER TABLE bills ADD COLUMN from_district_id varchar(20) DEFAULT('3695'); -- tp.Thủ Đức
ALTER TABLE bills ADD COLUMN from_ward_id varchar(20) DEFAULT('90737'); -- phường Linh Trung
ALTER TABLE bills ADD COLUMN to_province_id varchar(20) DEFAULT('0');
ALTER TABLE bills ADD COLUMN to_district_id varchar(20) DEFAULT('0');
ALTER TABLE bills ADD COLUMN to_ward_id varchar(20) DEFAULT('0');

ALTER TABLE bills ADD COLUMN height DECIMAL DEFAULT(100);
ALTER TABLE bills ADD COLUMN length DECIMAL DEFAULT(100);
ALTER TABLE bills ADD COLUMN width DECIMAL DEFAULT(100);
ALTER TABLE bills ADD COLUMN weight DECIMAL DEFAULT(100);

ALTER TABLE bills ADD COLUMN fee DECIMAL;
ALTER TABLE bills ADD COLUMN lead_time VARCHAR(255);
ALTER TABLE bills ADD COLUMN active BOOLEAN;
ALTER TABLE bills ADD COLUMN updated_at VARCHAR(255);
ALTER TABLE bills ADD COLUMN created_at VARCHAR(255);
ALTER TABLE bills ADD COLUMN id_logistic VARCHAR(255);

-- xóa đi khóa ngoại giữa bảng bills và bảng account_customers
ALTER TABLE bills DROP FOREIGN KEY bills_ibfk_4;

ALTER TABLE account_customers
ADD COLUMN failed_count NUMERIC;

-- thêm 2 thuộc tính email và url_image_admin trong bảng admin
ALTER TABLE account_admins
ADD COLUMN email VARCHAR(255);
ALTER TABLE account_admins
ADD COLUMN url_image_admin VARCHAR(255);

ALTER TABLE account_customers MODIFY pass VARCHAR(250);
