package com.edu.mvc1.client.model;

import org.springframework.stereotype.Repository;

import com.sun.tools.javac.util.List;

@Repository
public class MybatisBoardDAO implements BoardDAO{

	@Override
	public List selectAll() {
		return null;
	}

	@Override
	public Board select(int board_idx) {
		return null;
	}

	@Override
	public void insert(Board board) {
		
	}

	@Override
	public void update(Board board) {
		
	}

	@Override
	public void delete(int board_idx) {
		
	}

}
