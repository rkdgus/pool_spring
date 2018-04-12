package com.dgit.domain;

public class ClinicVO {
	private int clinic_no;
	private String clinic_type;
	private String clinic_title;
	private String clinic_content;
	private String clinic_path;
	public int getClinic_no() {
		return clinic_no;
	}
	public void setClinic_no(int clinic_no) {
		this.clinic_no = clinic_no;
	}
	public String getClinic_type() {
		return clinic_type;
	}
	public void setClinic_type(String clinic_type) {
		this.clinic_type = clinic_type;
	}
	public String getClinic_title() {
		return clinic_title;
	}
	public void setClinic_title(String clinic_title) {
		this.clinic_title = clinic_title;
	}
	public String getClinic_content() {
		return clinic_content;
	}
	public void setClinic_content(String clinic_content) {
		this.clinic_content = clinic_content;
	}
	public String getClinic_path() {
		return clinic_path;
	}
	public void setClinic_path(String clinic_path) {
		this.clinic_path = clinic_path;
	}
	public ClinicVO() {}
	@Override
	public String toString() {
		return "ClinicVO [clinic_no=" + clinic_no + ", clinic_type=" + clinic_type + ", clinic_title=" + clinic_title
				+ ", clinic_content=" + clinic_content + ", clinic_path=" + clinic_path + "]";
	}
	
	
}
