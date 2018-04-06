package com.dgit.domain;

public class GalleryVO {
	private int gallery_num;
	private String gallery_name;
	private String gallery_path;
	private String gallery_type;

	public int getGallery_num() {
		return gallery_num;
	}

	public void setGallery_num(int gallery_num) {
		this.gallery_num = gallery_num;
	}

	public String getGallery_name() {
		return gallery_name;
	}

	public void setGallery_name(String gallery_name) {
		this.gallery_name = gallery_name;
	}

	public String getGallery_path() {
		return gallery_path;
	}

	public void setGallery_path(String gallery_path) {
		this.gallery_path = gallery_path;
	}

	public String getGallery_type() {
		return gallery_type;
	}

	public void setGallery_type(String gallery_type) {
		this.gallery_type = gallery_type;
	}

	@Override
	public String toString() {
		return "GalleryVO [gallery_name=" + gallery_name + ", gallery_path=" + gallery_path + ", gallery_type="
				+ gallery_type + "]";
	}

}
