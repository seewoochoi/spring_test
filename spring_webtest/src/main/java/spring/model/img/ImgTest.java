package spring.model.img;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class ImgTest { 
 
	public static void main(String[] args) {

		Resource resource = new ClassPathResource("daoTest.xml");
		
		BeanFactory factory = new XmlBeanFactory(resource); 
		 
		ImgDAO dao = (ImgDAO)factory.getBean("img");
		   
		list(dao);   
//		read(dao);
//		total(dao);
//	 	create(dao); 
//		update(dao); 
//		delete(dao);  
//		updateFile(dao);
//		updatePw(dao);
//		getGrade(dao);
//		getFname(dao); 
//		findId(dao);
//		findPw(dao);
//		loginCheck(dao);
//		duplicateEmail(dao);
//		duplicateID(dao);
//		duplicatePw(dao);
		passCheck(dao);
	} 
	  

	private static void passCheck(ImgDAO dao) {
		 Map map = new HashMap();
		 map.put("no", 3);  
		 map.put("passwd", "1234");  
	
		 
		 if(dao.passCheck(map)) { 
			 p("성공");
		 }else {
			 p("실패");
		 }
		
	}


	private static void duplicatePw(ImgDAO dao) {
		Map map = new HashMap();
		map.put("id", "223");
		map.put("olfpasswd", "111111");
		if(dao.duplicatePw(map)) {
			p("성공");
		}else {  
			p("실패");
		}
		
	}


	private static void duplicateID(ImgDAO dao) {
		if(dao.duplicateID("user2133")) {
			p("중복");
		}else {
			p("성공");
		}
		
	}


	private static void duplicateEmail(ImgDAO dao) {
		if(dao.duplicateEmail("asdf")) {
			p("중복");
		}else {
			p("성공");
		}
	}
	


	private static void loginCheck(ImgDAO dao) {
		Map map = new HashMap();
		map.put("id", "user3");
		map.put("passwd", "1111");
		if(dao.loginCheck(map)) {
			p("성공");
		}else {
			p("실패");
		}
	}


	private static void findPw(ImgDAO dao) {
		Map map = new HashMap();
		map.put("mname", "개발자3");
		map.put("id", "user3");
		p(dao.findPw(map));
	} 


	private static void findId(ImgDAO dao) {
		Map map = new HashMap();
		map.put("mname", "개발자3");
		map.put("email", "email3@mail.com");
		p(dao.findId(map));
		
			
			   
		} 
	

	private static void getFname(ImgDAO dao) {
		p(dao.getFname("admin"));
		
	}


	private static void getGrade(ImgDAO dao) {
		p(dao.getGrade("admin"));
		
	}


	private static void updatePw(ImgDAO dao) {
		Map map = new HashMap();
		map.put("id", "bear"); 
		map.put("passwd", "1111");
		if(dao.updatePw(map)) { 
			p("성공");
		}else {
			p("실패");
		}
	}


	private static void updateFile(ImgDAO dao) {
		Map map = new HashMap();
		map.put("fname", "Img.jpg");
		map.put("id", "user3");
		if(dao.updateFile(map)) {
			p("성공");
		}else {
			p("실패");
		}
		
	} 


	private static void delete(ImgDAO dao) { 
			if (dao.delete(1)) {
			 	p("성공"); 
			} else {
				p("실패");
			}
			 
		}  

	


	private static void update(ImgDAO dao) {
		ImgDTO dto = dao.read(1);
		dto.setName("12344"); 
		dto.setTitle("시작");  
		dto.setPasswd("1111"); 
		dto.setFname("member1.jpg");
		 
		 
		if(dao.update(dto)) {
			p("성공");
		}else {
			p("실패");
		}
		 
	}



	private static void create(ImgDAO dao) {
		ImgDTO dto = new ImgDTO(); 
		dto.setName("1234"); 
		dto.setTitle("연습1");  
		dto.setPasswd("1234"); 
		dto.setFname("member.jpg");
	 
		
		if (dao.create(dto)) { 
			p("성공");
		} else { 
			p("실패");
		}

		 
	}

	private static void total(ImgDAO dao) {
		Map map = new HashMap();
		map.put("col", "title");
		map.put("word", "연습");
		 
		int total = dao.total(map);
		p("전체레코드수:" + total);
		 
		
	}
 
	private static void read(ImgDAO dao) {
		ImgDTO dto = dao.read(3);
		p(dto);
		 
	}  

	private static void list(ImgDAO dao) {
		Map map = new HashMap();
		map.put("col", "mname");
		map.put("word", "");
		map.put("sno", 1); 
		map.put("eno", 10);
		
		List<ImgDTO> list= dao.list(map);
		
		Iterator<ImgDTO> iter= list.iterator();
		
		while(iter.hasNext()) {
			ImgDTO dto = iter.next();
			p(dto);
			p("----------------------------");
		}
	}

	private static void p(String string) {
		// TODO Auto-generated method stub
		System.out.println(string);
	}

	private static void p(ImgDTO dto) {
		 
		p("번호:" + dto.getNo());  
		p("번호:" + dto.getName());  
		p("번호:" + dto.getTitle()); 
		p("번호:" + dto.getPasswd());
		p("번호:" + dto.getFname()); 
		


		
	}

}
