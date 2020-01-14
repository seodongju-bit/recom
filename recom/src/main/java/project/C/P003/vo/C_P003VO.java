package project.C.P003.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("C_P003VO")
public class C_P003VO {
	private String de_number;
	private String mem_id;
	private String de_division;
    private Date de_date;
	private String de_contents;
	
	private String qu_number;
	private String qu_contents;
	private String qu_answer;
    private Date qu_date;
	
    private String oq_number;
    private String oq_question;
    private String oq_answer;
    
    
    private String order_number;
    private String sell_number;
    private String sell_title;
    private String sell_thumbnail;
	
	
	public C_P003VO() {
	}
	public String getDe_number() {             
		return de_number;
	}
	public void setDe_number(String de_number) {
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
	public Date getDe_date() {            
		return de_date;
	}
	public void setDe_date(Date de_date) {
		this.de_date = de_date;
	}
	public String getDe_contents() {
		return de_contents;
	}
	public void setDe_contents(String de_contents) {
		this.de_contents = de_contents;
	}
	public String getQu_number() {
		return qu_number;
	}
	public void setQu_number(String qu_number) {
		this.qu_number = qu_number;
	}
	public String getQu_contents() {
		return qu_contents;
	}
	public void setQu_contents(String qu_contents) {
		this.qu_contents = qu_contents;
	}
	public String getQu_answer() {
		return qu_answer;
	}
	public void setQu_answer(String qu_answer) {
		this.qu_answer = qu_answer;
	}
	public Date getQu_date() {
		return qu_date;
	}
	public void setQu_date(Date qu_date) {
		this.qu_date = qu_date;
	}
	
	public String getOq_number() {
		return oq_number;
	}
	public void setOq_number(String oq_number) {
		this.oq_number = oq_number;
	}
	public String getOq_question() {
		return oq_question;
	}
	public void setOq_question(String oq_question) {
		this.oq_question = oq_question;
	}
	public String getOq_answer() {
		return oq_answer;
	}
	public void setOq_answer(String oq_answer) {
		this.oq_answer = oq_answer;
	}
	public String getOrder_number() {
		return order_number;
	}
	public void setOrder_number(String order_number) {
		this.order_number = order_number;
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
	public String getSell_thumbnail() {
		return sell_thumbnail;
	}
	public void setSell_thumbnail(String sell_thumbnail) {
		this.sell_thumbnail = sell_thumbnail;
	}
	
	   

}
