package project.A.P007.vo;

import org.springframework.stereotype.Component;

@Component("makecouponVO")
public class A_P007VO {
	private String co_number;
	private String co_name;
	private String co_enddate;
	private String co_stdate;
	private String co_percent;
	
	public A_P007VO() {

	}

	public A_P007VO(String co_number, String co_name, String co_enddate, String co_stdate,
			String co_percent) {
		this.co_number = co_number;
		this.co_name = co_name;
		this.co_enddate = co_enddate;
		this.co_stdate = co_stdate;
		this.co_percent = co_percent;
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
	
}
