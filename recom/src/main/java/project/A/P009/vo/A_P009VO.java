package project.A.P009.vo;

import org.springframework.stereotype.Component;

@Component("A_P009VO")
public class A_P009VO {

	private int de_number;
	private String mem_id;
	private String de_division;
	private String de_contents;
	private String de_date;
	
	public int getDe_number() {
		return de_number;
	}
	public void setDe_number(int de_number) {
		this.de_number = de_number;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getDe_division() {
		return de_division;
	}
	public void setDe_division(String de_division) {
		this.de_division = de_division;
	}
	public String getDe_contents() {
		return de_contents;
	}
	public void setDe_contents(String de_contents) {
		this.de_contents = de_contents;
	}
	public String getDe_date() {
		return de_date;
	}
	public void setDe_date(String de_date) {
		this.de_date = de_date;
	}
	
	
	
}
