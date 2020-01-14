package project.E.P001.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component("E_P001VO")
public class E_P001VO {
	
	private int order_number;
	private int order_seq_num;
	private int od_number;
	private int orderdetail_seq;
	
	private String mem_id;
	private String sell_number;
	private String sell_title;
	private String order_size;
	private String order_color;
	private String detail_quantity;
	private String pro_price;
	private String sell_price;
	private String seller_id;
	private String order_total_price;
	private String order_total_sale_price;
	private String final_order_total_pro_price;
	private String final_order_total_price;
	private String od_recomReview;
	
	
	private String delivery_payment;
	private String delivery_method;
	private String mem_name;
	private String mem_tel;
	private String mem_email1;
	private String mem_email2;
	private String order_zip;
	private String order_address1;
	private String order_address2;
	private String order_request;
	private String order_pointuse;
	private String pay_method;
	private String co_number;
	private String co_name;
	private String co_enddate;
	private String co_percent;
	private String choice_review;
	private String delivery_price;
	private String total_delivery_price;
	
	private String deli_number;
	private String deli_name;
	private String od_state;
	
	private String point_save;
	private String point_save_total;
	
	
	public E_P001VO() {
	}



	public int getOd_number() {
		return od_number;
	}



	public void setOd_number(int od_number) {
		this.od_number = od_number;
	}



	public int getOrder_seq_num() {
		return order_seq_num;
	}



	public void setOrder_seq_num(int order_seq_num) {
		this.order_seq_num = order_seq_num;
	}



	public int getOrderdetail_seq() {
		return orderdetail_seq;
	}



	public void setOrderdetail_seq(int orderdetail_seq) {
		this.orderdetail_seq = orderdetail_seq;
	}



	public String getSell_number() {
		return sell_number;
	}



	public void setSell_number(String sell_number) {
		this.sell_number = sell_number;
	}


	
	public String getSell_title() {
		return sell_title;
	}



	public void setSell_title(String sell_title) {
		this.sell_title = sell_title;
	}


	

	public String getSell_price() {
		return sell_price;
	}



	public void setSell_price(String sell_price) {
		this.sell_price = sell_price;
	}



	public String getDetail_quantity() {
		return detail_quantity;
	}



	public void setDetail_quantity(String detail_quantity) {
		this.detail_quantity = detail_quantity;
	}



	public String getOrder_size() {
		return order_size;
	}



	public void setOrder_size(String order_size) {
		this.order_size = order_size;
	}



	public String getOrder_color() {
		return order_color;
	}


	public void setOrder_color(String order_color) {
		this.order_color = order_color;
	}

	
	public String getPro_price() {
		return pro_price;
	}



	public void setPro_price(String pro_price) {
		this.pro_price = pro_price;
	}
	

	public String getOrder_total_price() {
		return order_total_price;
	}



	public void setOrder_total_price(String order_total_price) {
		this.order_total_price = order_total_price;
	}



	public String getOrder_total_sale_price() {
		return order_total_sale_price;
	}



	public void setOrder_total_sale_price(String order_total_sale_price) {
		this.order_total_sale_price = order_total_sale_price;
	}



	public int getOrder_number() {
		return order_number;
	}



	public void setOrder_number(int order_number) {
		this.order_number = order_number;
	}


	public String getFinal_order_total_pro_price() {
		return final_order_total_pro_price;
	}



	public void setFinal_order_total_pro_price(String string) {
		this.final_order_total_pro_price = string;
	}



	public String getCo_number() {
		return co_number;
	}



	public void setCo_number(String co_number) {
		this.co_number = co_number;
	}



	public String getOrder_pointuse() {
		return order_pointuse;
	}



	public void setOrder_pointuse(String order_pointuse) {
		this.order_pointuse = order_pointuse;
	}



	public String getFinal_order_total_price() {
		return final_order_total_price;
	}



	public void setFinal_order_total_price(String final_order_total_price) {
		this.final_order_total_price = final_order_total_price;
	}



	public String getPay_method() {
		return pay_method;
	}



	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}

	
	

	public String getDelivery_payment() {
		return delivery_payment;
	}



	public void setDelivery_payment(String delivery_payment) {
		this.delivery_payment = delivery_payment;
	}



	public String getDelivery_method() {
		return delivery_method;
	}



	public void setDelivery_method(String delivery_method) {
		this.delivery_method = delivery_method;
	}


	public String getMem_id() {
		return mem_id;
	}



	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
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



	public String getOrder_request() {
		return order_request;
	}



	public void setOrder_request(String order_request) {
		this.order_request = order_request;
	}



	public String getChoice_review() {
		return choice_review;
	}


	public void setChoice_review(String choice_review) {
		this.choice_review = choice_review;
	}



	public String getSeller_id() {
		return seller_id;
	}



	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}



	public String getDeli_number() {
		return deli_number;
	}



	public void setDeli_number(String deli_number) {
		this.deli_number = deli_number;
	}



	public String getDeli_name() {
		return deli_name;
	}



	public void setDeli_name(String deli_name) {
		this.deli_name = deli_name;
	}



	public String getOd_state() {
		return od_state;
	}



	public void setOd_state(String od_state) {
		this.od_state = od_state;
	}



	public String getPoint_save() {
		return point_save;
	}



	public void setPoint_save(String point_save) {
		this.point_save = point_save;
	}



	public String getPoint_save_total() {
		return point_save_total;
	}



	public void setPoint_save_total(String point_save_total) {
		this.point_save_total = point_save_total;
	}



	public String getDelivery_price() {
		return delivery_price;
	}



	public void setDelivery_price(String delivery_price) {
		this.delivery_price = delivery_price;
	}



	public String getCo_name() {
		return co_name;
	}



	public void setCo_name(String co_name) {
		this.co_name = co_name;
	}



	public String getCo_enddate() {
		return co_enddate;
	}



	public void setCo_enddate(String co_enddate) {
		this.co_enddate = co_enddate;
	}



	public String getCo_percent() {
		return co_percent;
	}



	public void setCo_percent(String co_percent) {
		this.co_percent = co_percent;
	}



	public String getTotal_delivery_price() {
		return total_delivery_price;
	}



	public void setTotal_delivery_price(String total_delivery_price) {
		this.total_delivery_price = total_delivery_price;
	}



	public String getOd_recomReview() {
		return od_recomReview;
	}



	public void setOd_recomReview(String od_recomReview) {
		this.od_recomReview = od_recomReview;
	}
	
	
	
}

