package com.shop.table.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;


public class FileVO  {

	private String fileCd;		//파일코드 ( 랜덤 20자리 )
	private String filePath;	//디비저장시
	private String fileNm;		//파일명
	private String orgFileNm;//원본 파일명
	
	@JsonIgnore
	private MultipartFile file;	//업로드 파일
	
	@JsonIgnore
	private List<MultipartFile> filelist;	//업로드 파일

	
	
	public String getOrgFileNm() {
		return orgFileNm;
	}

	public void setOrgFileNm(String orgFileNm) {
		this.orgFileNm = orgFileNm;
	}

	public String getFileCd() {
		return fileCd;
	}

	public void setFileCd(String fileCd) {
		this.fileCd = fileCd;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getFileNm() {
		return fileNm;
	}

	public void setFileNm(String fileNm) {
		this.fileNm = fileNm;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public List<MultipartFile> getFilelist() {
		return filelist;
	}

	public void setFilelist(List<MultipartFile> filelist) {
		this.filelist = filelist;
	}
	
	
}
