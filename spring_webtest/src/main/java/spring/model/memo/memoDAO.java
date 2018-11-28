package spring.model.memo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import spring.db.webtest.DBClose;
import spring.db.webtest.DBOpen;
 
@Component
public class memoDAO {
		@Autowired
		private SqlSessionTemplate mybatis;
	
		public void setMybatis(SqlSessionTemplate mybatis) {
			this.mybatis = mybatis;
		} 
 
		public boolean checkRefnum(int memono) {
			boolean flag = false;
			int cnt = mybatis.selectOne("memo.checkRefnum",memono);
			if(cnt>0)flag=true;
			return flag;
		}
	
		public void upAnsnum(Map map) {

			mybatis.update("memo.upAnsnum", map);
	
		}
			
		
	
	public boolean replyCreate(memoDTO dto){
		boolean flag = false;
		int cnt = mybatis.insert("memo.replyCreate", dto);
		if(cnt>0)flag=true;
		
		return flag; 
	}
	
	public memoDTO replyRead(int memono) {
		
		return mybatis.selectOne("memo.replyRead", memono);
		
	}
	
	public void upViewcnt(int memono) {
		mybatis.update("memo.upViewcnt", memono);
	}
	public int total(Map map) {
		
		return mybatis.selectOne("memo.total", map);
	} 
	
	public List<memoDTO> list(Map map){
		
		return mybatis.selectList("memo.list", map);
	}
	
	public boolean delete(int memono) {
		boolean flag = false;
		int cnt = mybatis.delete("memo.delete", memono);
		if(cnt>0)flag=true;
		return flag;
	}  
	
	public boolean update(memoDTO dto) {
		boolean flag = false;
		int cnt = mybatis.update("memo.update",dto);
		if(cnt>0)flag=true;
		return flag;
		
		
		
	}
	
	public memoDTO read(int memono) {
		
		return mybatis.selectOne("memo.read", memono);
	}
	public boolean create(memoDTO dto) {
		boolean flag = false;
		int cnt = mybatis.insert("memo.create", dto);
		if(cnt>0)flag=true;
		
		return flag; 
	}
	
}

