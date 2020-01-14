package project.A.P001.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("A_P001VO")
public class A_P001VO {
	private String mem_no = "";
	private String mem_id = "";
	private String mem_pw = "";
	private String mem_nick = "";
	private String mem_name = "";
	private String mem_email1 = "";
	private String mem_email2 = "";
	private String mem_tel = "";
	private String mem_zip = "";
	private String mem_address1 = "";
	private String mem_address2 = "";
	private String mem_division = "";
	private String mem_verify = "";
	private int mem_point;
	private int mem_point_test;
	
	public A_P001VO() {
}

	public String getMem_no() {
		return mem_no;
	}

	public void setMem_no(String mem_no) {
		this.mem_no = mem_no;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_pw() {
		return mem_pw;
	}

	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}

	public String getMem_nick() {
		return mem_nick;
	}

	public void setMem_nick(String mem_nick) {
		this.mem_nick = mem_nick;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
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

	public String getMem_tel() {
		return mem_tel;
	}

	public void setMem_tel(String mem_tel) {
		this.mem_tel = mem_tel;
	}

	public String getMem_zip() {
		return mem_zip;
	}

	public void setMem_zip(String mem_zip) {
		this.mem_zip = mem_zip;
	}

	public String getMem_address1() {
		return mem_address1;
	}

	public void setMem_address1(String mem_address1) {
		this.mem_address1 = mem_address1;
	}

	public String getMem_address2() {
		return mem_address2;
	}

	public void setMem_address2(String mem_address2) {
		this.mem_address2 = mem_address2;
	}

	public String getMem_division() {
		return mem_division;
	}

	public void setMem_division(String mem_division) {
		this.mem_division = mem_division;
	}

	public String getMem_verify() {
		return mem_verify;
	}

	public void setMem_verify(String mem_verify) {
		this.mem_verify = mem_verify;
	}

	public int getMem_point() {
		return mem_point;
	}

	public void setMem_point(int mem_point) {
		this.mem_point = mem_point;
	}

	public int getMem_point_test() {
		return mem_point_test;
	}

	public void setMem_point_test(int mem_point_test) {
		this.mem_point_test = mem_point_test;
	}

	

	
	
}