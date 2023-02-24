package com.edu.mvc1.client.model;

import com.sun.tools.javac.util.List;

public interface BoardDAO {
	public List selectAll();
	public Board select(int board_idx);
	public void insert(Board board);
	public void update(Board board);
	public void delete(int board_idx);
}
