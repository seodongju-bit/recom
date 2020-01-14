package project.B.P002.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("B_P002VO")
public class B_P002VO {
	private String order_number="";
	private String delivery_method="";
	private String pay_method="";
	private String mem_name = "";
	private String mem_tel = "";
	private String mem_email1 = "";
	private String mem_email2 = "";
	private String order_zip = "";
	private String order_address1 = "";
	private String order_address2 = "";
	private Date order_date;
	private String choice_review="";
	private String od_state="";
	private String od_color="";
	private String od_size="";
	
	private String sell_number ="";
	private String pro_number ="";
	private String sell_price ="";
	private String sell_contents ="";
	private String sell_date ="";
	private String sell_title ="";
	private String sell_thumbnail ="";
	private String sell_quantity ="";
	private String mem_id ="";
	private String option_yn ="";
	private String od_quantity="";
	private String seller_id = "";
	
	private String pro_vendor ="";
	private String pro_name ="";
	private String pro_brand ="";
	
	private String option_size ="";
	private String option_color ="";
	private String option_quantity ="";
	private String nextval ="";
	
	private String orderer_id = "";
	
	public String getSell_number() {
		return sell_number;
	}
	public void setSell_number(String sell_number) {
		this.sell_number = sell_number;
	}
	public String getPro_number() {
		return pro_number;
	}
	public void setPro_number(String pro_number) {
		this.pro_number = pro_number;
	}
	public String getSell_price() {
		return sell_price;
	}
	public void setSell_price(String sell_price) {
		this.sell_price = sell_price;
	}
	public String getSell_contents() {
		return sell_contents;
	}
	public void setSell_contents(String sell_contents) {
		this.sell_contents = sell_contents;
	}
	public String getSell_date() {
		return sell_date;
	}
	public void setSell_date(String sell_date) {
		this.sell_date = sell_date;
	}
	public String getSell_title() {
		return sell_title;
	}
	public void setSell_title(String sell_title) {
		this.sell_title = sell_title;
	}
	public String getSell_thumbnail() {
		return sell_thumbnail;
	}
	public void setSell_thumbnail(String sell_thumbnail) {
		this.sell_thumbnail = sell_thumbnail;
	}
	public String getSell_quantity() {
		return sell_quantity;
	}
	public void setSell_quantity(String sell_quantity) {
		this.sell_quantity = sell_quantity;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getOption_yn() {
		return option_yn;
	}
	public void setOption_yn(String option_yn) {
		this.option_yn = option_yn;
	}
	public String getPro_vendor() {
		return pro_vendor;
	}
	public void setPro_vendor(String pro_vendor) {
		this.pro_vendor = pro_vendor;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public String getPro_brand() {
		return pro_brand;
	}
	public void setPro_brand(String pro_brand) {
		this.pro_brand = pro_brand;
	}
	public String getOption_size() {
		return option_size;
	}
	public void setOption_size(String option_size) {
		this.option_size = option_size;
	}
	public String getOption_color() {
		return option_color;
	}
	public void setOption_color(String option_color) {
		this.option_color = option_color;
	}
	public String getOption_quantity() {
		return option_quantity;
	}
	public void setOption_quantity(String option_quantity) {
		this.option_quantity = option_quantity;
	}
	public String getNextval() {
		return nextval;
	}
	public void setNextval(String nextval) {
		this.nextval = nextval;
	}
	public String getOrder_number() {
		return order_number;
	}
	public void setOrder_number(String order_number) {
		this.order_number = order_number;
	}
	public String getDelivery_method() {
		return delivery_method;
	}
	public void setDelivery_method(String delivery_method) {
		this.delivery_method = delivery_method;
	}
	public String getPay_method() {
		return pay_method;
	}
	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_tel() {
		return mem_tel;
	}
	public void setMem_tel(String mem_tel) {
		this.mem_tel = mem_tel;
	}
	public String getMem_email1() {
		return mem_email1;
	}
	public void setMem_email1(String mem_email1) {
		this.mem_email1 = mem_email1;
	}
	public String getMem_email2() {
		return mem_email2;
	}
	public void setMem_email2(String mem_email2) {
		this.mem_email2 = mem_email2;
	}
	public String getOrder_zip() {
		return order_zip;
	}
	public void setOrder_zip(String order_zip) {
		this.order_zip = order_zip;
	}
	public String getOrder_address1() {
		return order_address1;
	}
	public void setOrder_address1(String order_address1) {
		this.order_address1 = order_address1;
	}
	public String getOrder_address2() {
		return order_address2;
	}
	public void setOrder_address2(String order_address2) {
		this.order_address2 = order_address2;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public String getOd_state() {
		return od_state;
	}
	public void setOd_state(String od_state) {
		this.od_state = od_state;
	}
	public String getOd_quantity() {
		return od_quantity;
	}
	public void setOd_quantity(String od_quantity) {
		this.od_quantity = od_quantity;
	}
	public String getSeller_id() {
		return seller_id;
	}
	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}
	public String getOrderer_id() {
		return orderer_id;
	}
	public void setOrderer_id(String orderer_id) {
		this.orderer_id = orderer_id;
	}
	public String getChoice_review() {
		return choice_review;
	}
	public void setChoice_review(String choice_review) {
		this.choice_review = choice_review;
	}
	public String getOd_color() {
		return od_color;
	}
	public void setOd_color(String od_color) {
		this.od_color = od_color;
	}
	public String getOd_size() {
		return od_size;
	}
	public void setOd_size(String od_size) {
		this.od_size = od_size;
	}
	
	
}
