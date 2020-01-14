package project.D.P001.vo;
import java.sql.Date;
import org.springframework.stereotype.Component;

@Component("D_P001VO")
public class D_P001VO {

	private String review_number;
	private String sell_number;
	private String pro_number;
	private String mem_id;
    private String review_stdate;
    private String review_pdscore;
    private String review_content; 
    private String review_url;
    private String review_monthpoint;
    private String review_totalpoint;
    
    
    private String sell_title;
    private String sell_price;
    private String sell_score;
    private String sell_content;
    private String sell_thumbnail;
    private String mem_nick;
    

    
	public D_P001VO() {
	}     

    
	public String getReview_number() {
		return review_number;
	}
	public void setReview_number(String review_number) {
		this.review_number = review_number;
	}
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

	public String getReview_stdate() {
		return review_stdate;
	}
	public void setReview_stdate(String review_stdate) {
		this.review_stdate = review_stdate;
	}
	public String getReview_pdscore() {
		return review_pdscore;
	}
	public void setReview_pdscore(String review_pdscore) {
		this.review_pdscore = review_pdscore;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getReview_url() {
		return review_url;
	}
	public void setReview_url(String review_url) {
		this.review_url = review_url;
	}
	public String getReview_monthpoint() {
		return review_monthpoint;
	}
	public void setReview_monthpoint(String review_monthpoint) {
		this.review_monthpoint = review_monthpoint;
	}
	public String getReview_totalpoint() {
		return review_totalpoint;
	}
	public void setReview_totalpoint(String review_totalpoint) {
		this.review_totalpoint = review_totalpoint;
	}
	public String getSell_price() {
		return sell_price;
	}
	public void setSell_price(String sell_price) {
		this.sell_price = sell_price;
	}
	public String getSell_score() {
		return sell_score;
	}
	public void setSell_score(String sell_score) {
		this.sell_score = sell_score;
	}
	public String getSell_content() {
		return sell_content;
	}
	public void setSell_content(String sell_content) {
		this.sell_content = sell_content;
	}
	public String getSell_thumbnail() {
		return sell_thumbnail;
	}
	public void setSell_thumbnail(String sell_thumbnail) {
		this.sell_thumbnail = sell_thumbnail;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getSell_title() {
		return sell_title;
	}
	public void setSell_title(String sell_title) {
		this.sell_title = sell_title;
	}
	public String getMem_nick() {
		return mem_nick;
	}
	public void setMem_nick(String mem_nick) {
		this.mem_nick = mem_nick;
	}



    
    
    
	
	
}