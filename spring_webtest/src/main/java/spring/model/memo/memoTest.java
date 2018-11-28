package spring.model.memo;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class memoTest { 
 
	public static void main(String[] args) {

		Resource resource = new ClassPathResource("daoTest.xml");
		
		BeanFactory factory = new XmlBeanFactory(resource); 
		 
		memoDAO dao = (memoDAO)factory.getBean("memo");
		  
//		list(dao); 
	read(dao);
//		total(dao);
//		create(dao); 
		 
//		update(dao); 
//		replyread(dao); 
//	reply(dao);
//		checkRefnum(dao);  
//	delete(dao);  
//		passCheck(dao);
	} 
	
	private static void passCheck(memoDAO dao) {
		Map map = new HashMap();
		map.put("memono", 1); 
		map.put("passwd", 1); 
		if(dao.passCheck(map)) {   
			p("올바른 패스워드 입니다.");
		}else { 
			p(" 잘못된 패스워드 입니다.");
		}
		
	}

	private static void delete(memoDAO dao) {
		if (dao.checkRefnum(3)) {
			System.out.println(dao.checkRefnum(3));
				p("실패"); 
		} else {  
			if (dao.delete(3)) {
			 	p("성공"); 
			}  
			 
		}

	}

	private static void checkRefnum(memoDAO dao) {
		if(dao.checkRefnum(2)) {
			p("답변 있는 글이므로 삭제 할수 없습니다.");
		}else {    
			p("삭제가능합니다.");
		}
		
	}

	private static void reply(memoDAO dao) {
		memoDTO dto = dao.replyRead(4);
		dto.setTitle("제목ㅇ이당");
		dto.setContent("게시판 제목 좋은거21");
		
		Map map = new HashMap();
		map.put("grpno", dto.getGrpno());
		map.put("ansnum", dto.getAnsnum());
		
		dao.upAnsnum(map);
		if(dao.replyCreate(dto)) {
			p("성공");  
		}else { 
			p("실패");
		}
		
	}

	private static void replyread(memoDAO dao) {
		memoDTO dto = dao.replyRead(2);
		p("번호:" +dto.getMemono());
		p("indent"+dto.getIndent());
		p("title"+dto.getTitle());
		p("ansnum" +dto.getAnsnum());
		
	}

	private static void update(memoDAO dao) {
		memoDTO dto = dao.read(3);
		dto.setTitle("으악~");
		dto.setContent("내용변경");
		 
		
		if(dao.update(dto)) {
			p("성공");
		}else {
			p("실패");
		}
		 
	}



	private static void create(memoDAO dao) {
		memoDTO dto = new memoDTO(); 
		dto.setTitle("게시판 제목");
		dto.setContent("게시판 내용");
		 
		
		if (dao.create(dto)) { 
			p("성공");
		} else { 
			p("실패");
		}

		
	}

	private static void total(memoDAO dao) {
		Map map = new HashMap();
		map.put("col", "title");
		map.put("word", "3");
		
		int total = dao.total(map);
		p("전체레코드수:" + total);
		
		
	}
 
	private static void read(memoDAO dao) {
		memoDTO dto = dao.read(3);
		p(dto);
		
	}  

	private static void list(memoDAO dao) {
		Map map = new HashMap();
		map.put("col", "name");
		map.put("word", "");
		map.put("sno", 1); 
		map.put("eno", 10);
		
		List<memoDTO> list= dao.list(map);
		
		Iterator<memoDTO> iter= list.iterator();
		
		while(iter.hasNext()) {
			memoDTO dto = iter.next();
			p(dto);
			p("----------------------------");
		}
	}

	private static void p(String string) {
		// TODO Auto-generated method stub
		System.out.println(string);
	}

	private static void p(memoDTO dto) {
		
		p("번호:" + dto.getMemono());
		p("번호:" + dto.getTitle());
		p("번호:" + dto.getContent());
		p("번호:" + dto.getWdate());
		p("번호:" + dto.getViewcnt());

		
	}

}
