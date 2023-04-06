-- cột id_user_fb để lưu thông tin về tài khoản Fb người dùng đăng nhập vào hệ thống , nếu người dùng không đăng nhập = tài khoản Fb thì cột này có giá trị null 
ALTER TABLE account_customers
		ADD COLUMN id_user_fb VARCHAR(50) UNIQUE;
		
-- cột id_user_gg để lưu thông tin về tài khoản Gg người dùng đăng nhập vào hệ thống , nếu người dùng không đăng nhập = tài khoản Gg thì cột này có giá trị null     
ALTER TABLE account_customers
		ADD COLUMN id_user_gg VARCHAR(50) UNIQUE;
		
-- đổi giá trị của cột user_id trong bảng log từ bigint sang varchar(50) 		
ALTER TABLE `logs`
	MODIFY COLUMN user_id VARCHAR(50);
	
ALTER TABLE account_admins
			ADD COLUMN full_name varchar(50);
