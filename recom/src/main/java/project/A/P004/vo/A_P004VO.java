package project.A.P004.vo;

import org.springframework.stereotype.Component;

@Component("activeVO")
public class A_P004VO {
	private String co_number;
	private String co_name;
	private String co_enddate;
	private String co_stdate;
	private String co_percent;
	private String co_usedate;
	private String co_check;
	private String mem_no;
	private String point_number;
	private String point_date;
	private String point_usedate;
	private String point_usemoney;
	private String order_number;
	private String point_content;
	private String mem_id;
	
	public A_P004VO() {

	}

	public A_P004VO(String co_number, String co_name, String co_enddate, String co_stdate, 
			String co_percent, String mem_id, String co_usedate, String co_check) {
		this.co_number = co_number;
		this.co_name = co_name;
		this.co_enddate = co_enddate;
		this.co_stdate = co_stdate;
		this.co_percent = co_percent;
		this.co_usedate = co_usedate;
		this.co_check = co_check;
		this.mem_id=mem_id;
	}

	public A_P004VO(String point_number, String point_date, String point_usedate, String point_usemoney, String order_number, String point_content, String mem_id) {
		
		this.point_number=point_number;
		this.point_date=point_date;
		this.point_usedate=point_usedate;
		this.point_usemoney=point_usemoney;
		this.order_number=order_number;
		this.point_content=point_content;
		this.mem_id=mem_id;
	}

	public String getCo_number() {
		return co_number;
	}

	public void setCo_number(String co_number) {
		this.co_number = co_number;
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

	public String getCo_stdate() {
		return co_stdate;
	}

	public void setCo_stdate(String co_stdate) {
		this.co_stdate = co_stdate;
	}

	public String getCo_percent() {
		return co_percent;
	}

	public void setCo_percent(String co_percent) {
		this.co_percent = co_percent;
	}

	public String getMem_no() {
		return mem_no;
	}

	public void setMem_no(String mem_no) {
		this.mem_no = mem_no;
	}

	public String getPoint_number() {
		return point_number;
	}

	public void setPoint_number(String point_number) {
		this.point_number = point_number;
	}

	public String getPoint_date() {
		return point_date;
	}

	public void setPoint_date(String point_date) {
		this.point_date = point_date;
	}

	public String getPoint_usedate() {
		return point_usedate;
	}

	public void setPoint_usedate(String point_usedate) {
		this.point_usedate = point_usedate;
	}

	public String getPoint_usemoney() {
		return point_usemoney;
	}

	public void setPoint_usemoney(String point_usemoney) {
		this.point_usemoney = point_usemoney;
	}

	public String getOrder_number() {
		return order_number;
	}

	public void setOrder_number(String order_number) {
		this.order_number = order_number;
	}

	public String getPoint_content() {
		return point_content;
	}

	public void setPoint_content(String point_content) {
		this.point_content = point_content;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getCo_usedate() {
		return co_usedate;
	}

	public void setCo_usedate(String co_usedate) {
		this.co_usedate = co_usedate;
	}

	public String getCo_check() {
		return co_check;
	}

	public void setCo_check(String co_check) {
		this.co_check = co_check;
	}
	
}
