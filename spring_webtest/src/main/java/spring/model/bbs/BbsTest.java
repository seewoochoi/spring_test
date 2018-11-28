package spring.model.bbs;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class BbsTest { 

	public static void main(String[] args) {

		Resource resource = new ClassPathResource("daoTest.xml");
		
		BeanFactory factory = new XmlBeanFactory(resource);
		
		BbsDAO dao = (BbsDAO)factory.getBean("dao");
		
//		list(dao);
//		read(dao);
//		total(dao);
//		create(dao); 
//		update(dao);
//		replyread(dao); 
//		reply(dao);
//		refnumcheck(dao);  
		delete(dao); 
//		passCheck(dao);
	} 
	
	private static void passCheck(BbsDAO dao) {
		Map map = new HashMap();
		map.put("bbsno", 1); 
		map.put("passwd", 1); 
		if(dao.passCheck(map)) {   
			p("올바른 패스워드 입니다.");
		}else { 
			p(" 잘못된 패스워드 입니다.");
		}
		
	}

	private static void delete(BbsDAO dao) {
		if (dao.checkRefnum(3)) {
			System.out.println(dao.checkRefnum(3));
			p("실패");
		} else {
			if (dao.delete(11)) {
			 	p("성공"); 
			}
		}

	}

	private static void refnumcheck(BbsDAO dao) {
		if(dao.checkRefnum(7)) {
			p("답변 있는 글이므로 삭제 할수 없습니다.");
		}else { 
			p("삭제가능합니다.");
		}
		
	}

	private static void reply(BbsDAO dao) {
		BbsDTO dto = dao.replyRead(11);
		dto.setWname("유후좋은거12");
		dto.setContent("게시판 제목 좋은거21");
		dto.setPasswd("게시판 내용 좋은거21");
		dto.setPasswd("1234");
		dto.setFilesize(100);
		dto.setFilename("test1.txt");
		
		
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

	private static void replyread(BbsDAO dao) {
		BbsDTO dto = dao.replyRead(24);
		p("번호:" +dto.getBbsno());
		p("indent"+dto.getIndent());
		p("title"+dto.getTitle());
		p("ansnum" +dto.getAnsnum());
		
	}

	private static void update(BbsDAO dao) {
		BbsDTO dto = dao.read(1);
		dto.setWname("얄라숑");
		dto.setTitle("으악~");
		dto.setContent("내용변경");
		dto.setFilename("text2.txt");
		dto.setFilesize(50);
		
		if(dao.update(dto)) {
			p("성공");
		}else {
			p("실패");
		}
		 
	}



	private static void create(BbsDAO dao) {
		BbsDTO dto = new BbsDTO(); 
		dto.setWname("야호5");
		dto.setTitle("게시판 제목");
		dto.setContent("게시판 내용");
		dto.setPasswd("1234");
		dto.setFilesize(100); 
		dto.setFilename("test.txt");
		
		if (dao.create(dto)) { 
			p("성공");
		} else { 
			p("실패");
		}

		
	}

	private static void total(BbsDAO dao) {
		Map map = new HashMap();
		map.put("col", "wname");
		map.put("word", "1");
		
		int total = dao.total(map);
		p("전체레코드수:" + total);
		
		
	}

	private static void read(BbsDAO dao) {
		BbsDTO dto = dao.read(1);
		p(dto);
		
	}

	private static void list(BbsDAO dao) {
		Map map = new HashMap();
		map.put("col", "name");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 10);
		
		List<BbsDTO> list= dao.list(map);
		
		Iterator<BbsDTO> iter= list.iterator();
		
		while(iter.hasNext()) {
			BbsDTO dto = iter.next();
			p(dto);
			p("----------------------------");
		}
	}

	private static void p(String string) {
		// TODO Auto-generated method stub
		System.out.println(string);
	}

	private static void p(BbsDTO dto) {
		
		p("번호:" + dto.getBbsno());
		p("번호:" + dto.getWname());
		p("번호:" + dto.getTitle());
		p("번호:" + dto.getContent());
		p("번호:" + dto.getWdate());
		p("번호:" + dto.getViewcnt());
		p("번호:" + dto.getFilename());
		p("번호:" + dto.getFilesize());
		
	}

}
