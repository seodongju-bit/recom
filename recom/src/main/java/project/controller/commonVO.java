package project.controller;


import org.springframework.stereotype.Component;

@Component("commonVO")
public class commonVO {               


   private String common_name;
   public String getCommon_name() {
	return common_name;
}
public void setCommon_name(String common_name) {
	this.common_name = common_name;
}
public String getCommon_code() {
	return common_code;
}
public void setCommon_code(String common_code) {
	this.common_code = common_code;
}
private String common_code;

   
   
}