CREATE TRIGGER `limit_stars`
BEFORE INSERT ON `review_product` FOR EACH ROW
BEGIN
	IF NEW.stars > 5 OR NEW.stars < 1 THEN SIGNAL SQLSTATE '45001' SET message_text = 'stars must be in 1 - 5';
	END IF;
END;

CREATE TRIGGER `limit_stars_update`
BEFORE UPDATE ON `review_product` FOR EACH ROW
BEGIN
	IF NEW.stars > 5 OR NEW.stars < 1 THEN SIGNAL SQLSTATE '45001' SET message_text = 'stars must be in 1 - 5';
	END IF;
END;

CREATE TRIGGER `trigger_sold`
AFTER INSERT ON `bill_detail` FOR EACH ROW
BEGIN	
	UPDATE `sold_product` SET quantity_sold = (SELECT SUM(quantity) FROM bill_detail WHERE id_product = NEW.id_product) WHERE id_product = NEW.id_product;
END;

CREATE TRIGGER `insert_sold_product`
AFTER INSERT ON `products` FOR EACH ROW
BEGIN
	INSERT INTO `sold_product` VALUES (NEW.id_product, NOW(), 0);
END;

CREATE TRIGGER `delete_product`
AFTER DELETE ON `price_product` FOR EACH ROW
BEGIN
	DELETE FROM `sold_product` WHERE `id_product` = OLD.id_product;
	DELETE FROM `products` WHERE `id_product` = OLD.id_product;
END;
