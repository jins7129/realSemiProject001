package com.between.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.between.common.SqlMapConfig;
import com.between.dto.TbBoardDto;
import com.between.dto.TbUserDto;

public class TbUserDaoImpl extends SqlMapConfig implements TbUserDao{
	private String usernamespace = "com.between.common.mapper.";
	
	//로그인
	@Override
	public TbUserDto login(String userId, String userPw) {
		SqlSession session = null; 
		TbUserDto dto = new TbUserDto();
		
		dto.setUserId(userId);
		dto.setUserPw(userPw);
		
		try {
			session = getSqlSessionFactory().openSession(true);
			dto = session.selectOne(usernamespace+"login",dto);
		} catch (Exception e) {
			System.out.println("에러 login");
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return dto;
	}

	//유저정보 업데이트
	@Override
	public int userUpdate(TbUserDto dto) {
		SqlSession session = null; 
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.insert(usernamespace + "userUpdate",dto);
			
		} catch (Exception e) {
			System.out.println("에러 insert");
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return res ;
	}

	//유저탈퇴 
	@Override
	public int userDelete(String userId) {
		SqlSession session = null; 
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.delete(usernamespace+"userDelete",userId);
		} catch (Exception e) {
			System.out.println("에러 delete");
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return res; 
	}

	//내 글 목록 보기 
	@Override
	public List<TbBoardDto> userBoardList(String userId) {
		
		SqlSession session = null; 
		List<TbBoardDto> list = null;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			list = session.selectList(usernamespace+"userBoardList",userId);
			System.out.println("여기는 보드리스트 "+list);
		} catch (Exception e) {
			System.out.println("에러 userBoardList ");
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		
		return list;
	}
	
	

	//내 글 상세보기 
	@Override
	public TbBoardDto userBoardSelectOne(int boardNum) {
		
		SqlSession session = null; 
		TbBoardDto dto = null; 
		
		try {
			session = getSqlSessionFactory().openSession(true);
			dto = session.selectOne(usernamespace+"userBoardSelectOne",boardNum);
		} catch (Exception e) {
			System.out.println("에러 유저의 글하나 보기 ");
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		
		return dto;
	}
	
	
		
	//내 글 수정  
	@Override
	public int userBoardUpdate(TbBoardDto dto) {
		SqlSession session = null; 
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.update(usernamespace+"userBoardUpdate",dto);
		} catch (Exception e) {
			System.out.println("에러 글 업데이트");
			e.printStackTrace();
		}
		
		return res;
	}

	//내 글 목록 찾기 
	@Override
	public List<TbBoardDto> userBoardSearch(String boardTitle, String userId) {
		SqlSession session = null; 
		List<TbBoardDto> list = null; 
		Map<String, String> map = new HashMap<String, String>();
		map.put("boardTitle", boardTitle);
		map.put("userId", userId);
		
		
		try {
			session = getSqlSessionFactory().openSession(true);
			list = session.selectList(usernamespace+"userBoardSearch",map);
			
		} catch (Exception e) {
			System.out.println("글검색 에러");
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return list;
	}

	//내글 다중 삭제
	@Override
	public int userBoardMultiDelete(String[] boardNum) {
		SqlSession session = null; 
		int res = 0; 
		
		Map<String, String[]> map = new HashMap<String, String[]>();
		map.put("boardNums", boardNum);
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.delete(usernamespace+"userBoardMultiDelete",map);
			if(res == boardNum.length) {
				session.commit();
			}
		} catch (Exception e) {
			System.out.println("에러 다중 삭제에서 ....");
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return res;
	}

	//내글 하나만 삭제
	@Override
	public int userBoardDelete(int boardNum) {
		SqlSession session = null; 
		int res =0; 
		
		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.delete(usernamespace+"userBoardDelete",boardNum);
		} catch (Exception e) {
			System.out.println("에러 단일 삭제 ....");
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return res;
	}



		
	
	


}
