package com.mid.pro.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mid.pro.model.MenuFilesVO;
import com.mid.pro.model.MenuListVO;
import com.mid.pro.model.MenuVO;
import com.mid.pro.util.Pager;

@Repository
public class MenuDAO {
	
	@Inject
	private SqlSession sqlSession;
	static final String NAMESPACE = "menuMapper.";
	
	//list
	public List<MenuVO> menuList(MenuVO menuVO) throws Exception{
		return sqlSession.selectList(NAMESPACE + "menuList", menuVO);
	}
	
	//select One
	public MenuVO menuSelect(MenuVO menuVO) throws Exception{
		return sqlSession.selectOne(NAMESPACE + "menuSelect", menuVO);
	}
	
	//write
	public int menuWrite(MenuVO menuVO) throws Exception{
		return sqlSession.insert(NAMESPACE + "menuWrite", menuVO);
	}
	
	//update
	public int menuUpdate(MenuVO menuVO) throws Exception{
		
		return sqlSession.update(NAMESPACE + "menuUpdate", menuVO);
	}
	//delete
	public int menuDelete(MenuVO menuVO) throws Exception{
		return sqlSession.delete(NAMESPACE + "menuDelete", menuVO);			
	}
//	//count
//	public int menuCount(Pager pager)throws Exception{
//		return sqlSession.selectOne(NAMESPACE + "menuCount", pager);
//	}
	
	//fileList
	public List<MenuFilesVO> fileList(int num) throws Exception{
		return sqlSession.selectList(NAMESPACE + "fileList", num);
	}
	//fileWrite
	public int fileWrite(MenuFilesVO menufilesVO) throws Exception{
		return sqlSession.insert(NAMESPACE + "fileWrite", menufilesVO);
	}
	//fileDelete
	public int fileDelete(MenuFilesVO menufilesVO) throws Exception{
		return sqlSession.delete(NAMESPACE + "fileDelete", menufilesVO);
	}
	//fileSelect
	public MenuFilesVO fileSelect(MenuFilesVO menufilesVO) throws Exception{
		return sqlSession.selectOne(NAMESPACE + "fileSelect", menufilesVO);
	}
}
