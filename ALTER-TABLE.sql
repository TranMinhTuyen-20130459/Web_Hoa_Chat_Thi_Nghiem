ALTER TABLE bills ALTER COLUMN shop_id SET DEFAULT "1";
ALTER TABLE bills ALTER COLUMN from_name SET DEFAULT "k46-it-nlu";
ALTER TABLE bills ALTER COLUMN from_phone SET DEFAULT "123456789";
ALTER TABLE bills ALTER COLUMN from_address SET DEFAULT "Khoa CNTT - Đại học Nông Lâm";
ALTER TABLE bills ALTER COLUMN from_ward_name SET DEFAULT "Linh Trung";
ALTER TABLE bills ALTER COLUMN from_district_name SET DEFAULT "Thủ Đức";
ALTER TABLE bills ALTER COLUMN from_province_name SET DEFAULT "Hồ Chí Minh";

ALTER TABLE bills DROP FOREIGN KEY bills_ibfk_4;

ALTER TABLE account_customers
ADD COLUMN failed_count NUMERIC;
