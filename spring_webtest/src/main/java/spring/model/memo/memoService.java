package spring.model.memo;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.db.webtest.DBClose;
import spring.db.webtest.DBOpen;




 
@Service
public class memoService {
	
	@Autowired
	public memoDAO dao;
	
	public boolean reply(memoDTO dto) {
		boolean flag = false;
	
		
		try {
			
		
			Map map = new HashMap();
			map.put("grpno", dto.getGrpno());
			map.put("ansnum", dto.getAnsnum());

			dao.upAnsnum(map);
		
			flag  =dao.replyCreate(dto);
			
			
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
	
			}finally {
				
			
		} 
		
		
		return flag;
	}
}
