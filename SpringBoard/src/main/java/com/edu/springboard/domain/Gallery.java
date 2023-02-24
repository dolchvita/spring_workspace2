package com.edu.springboard.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Gallery {
	private int gallery_idx;
	private String title;
	private String writer;
	private String content;
	private int hit;
	
	// collection용 리스트
	private List<Photo> photoList;
	
	
	// 바이너리 파일을 처리해보자! -- DTO 자동 매핑된다
	/* 6-2) 뽀인트!!
	 * 클라이언트에서 파일들을 여러개 보낼 것이기 때문에,
	 * 배열 자료형으로 가지고 있자
	 */
	private MultipartFile[] photo;
	
}
