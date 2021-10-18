package com.kh.DAYWORK.address.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.DAYWORK.address.model.vo.Address;
import com.kh.DAYWORK.address.model.vo.PageInfo;
import com.kh.DAYWORK.member.model.vo.Member;

@Repository
public class AddressDAO {

	// 주소록 삭제
	public int deleteAddress(SqlSessionTemplate sqlSession, String[] list) {
		int result = 0;
		
		for(int i = 0 ; i < list.length ; i++) {
			result += sqlSession.update("address-mapper.deleteAddress", list[i]);
		}
		return result;
	}

	// 주소록 추가
	public int insertAddress(SqlSessionTemplate sqlSession, Address a) {
		return sqlSession.insert("address-mapper.insertAddress", a);
	}

	// 주소록 수정
	public int updateAddress(SqlSessionTemplate sqlSession, Address a) {
		return sqlSession.update("address-mapper.updateAddress", a);
	}

	// 주소록 상세 조회
	public Address detailAddress(SqlSessionTemplate sqlSession, Integer aNo) {
		return sqlSession.selectOne("address-mapper.detailAddress", aNo);
	}

	public Member detailMember(SqlSessionTemplate sqlSession, Integer mNo) {
		return sqlSession.selectOne("address-mapper.detailMember", mNo);
	}
	
	// 주소록 목록 조회, 2가 붙은 것은 사내 주소록
	public int getListCount(SqlSessionTemplate sqlSession, HashMap map) {
		return sqlSession.selectOne("address-mapper.getListCount", map);
	}

	public ArrayList<Address> selectAddress(SqlSessionTemplate sqlSession, PageInfo pi, HashMap map) {
		int offset = pi.getBoardLimit() * (pi.getCurrentPage() - 1);
		RowBounds row = new RowBounds(offset, pi.getBoardLimit());

		return (ArrayList)sqlSession.selectList("address-mapper.selectAddress", map, row);
	}

	public int getListCount2(SqlSessionTemplate sqlSession, HashMap map) {
		return sqlSession.selectOne("address-mapper.getListCount2", map);
	}

	public ArrayList<Address> selectAddress2(SqlSessionTemplate sqlSession, PageInfo pi, HashMap map) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds row = new RowBounds(offset, pi.getBoardLimit()); 
		
		return (ArrayList)sqlSession.selectList("address-mapper.selectAddress2", map, row);
	}

}
