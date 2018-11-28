package spring.model.member;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class MemberTest { 
 
	public static void main(String[] args) {

		Resource resource = new ClassPathResource("daoTest.xml");
		
		BeanFactory factory = new XmlBeanFactory(resource); 
		 
		MemberDAO dao = (MemberDAO)factory.getBean("member");
		  
//		list(dao); 
		read(dao);
//		total(dao);
//		create(dao); 
//		update(dao); 
//		delete(dao);  
//		updateFile(dao);
		updatePw(dao);
//		getGrade(dao);
//		getFname(dao);
//		findId(dao);
//		findPw(dao);
//		loginCheck(dao);
//		duplicateEmail(dao);
//		duplicateID(dao);
//		duplicatePw(dao);
	} 
	 

	private static void duplicatePw(MemberDAO dao) {
		Map map = new HashMap();
		map.put("id", "223");
		map.put("olfpasswd", "111111");
		if(dao.duplicatePw(map)) {
			p("성공");
		}else {  
			p("실패");
		}
		
	}


	private static void duplicateID(MemberDAO dao) {
		if(dao.duplicateID("user2133")) {
			p("중복");
		}else {
			p("성공");
		}
		
	}


	private static void duplicateEmail(MemberDAO dao) {
		if(dao.duplicateEmail("asdf")) {
			p("중복");
		}else {
			p("성공");
		}
	}
	


	private static void loginCheck(MemberDAO dao) {
		Map map = new HashMap();
		map.put("id", "user3");
		map.put("passwd", "1111");
		if(dao.loginCheck(map)) {
			p("성공");
		}else {
			p("실패");
		}
	}


	private static void findPw(MemberDAO dao) {
		Map map = new HashMap();
		map.put("mname", "개발자3");
		map.put("id", "user3");
		p(dao.findPw(map));
	} 


	private static void findId(MemberDAO dao) {
		Map map = new HashMap();
		map.put("mname", "개발자3");
		map.put("email", "email3@mail.com");
		p(dao.findId(map));
		
			
			   
		} 
	

	private static void getFname(MemberDAO dao) {
		p(dao.getFname("admin"));
		
	}


	private static void getGrade(MemberDAO dao) {
		p(dao.getGrade("admin"));
		
	}


	private static void updatePw(MemberDAO dao) {
		Map map = new HashMap();
		map.put("id", "bear"); 
		map.put("passwd", "1111");
		if(dao.updatePw(map)) { 
			p("성공");
		}else {
			p("실패");
		}
	}


	private static void updateFile(MemberDAO dao) {
		Map map = new HashMap();
		map.put("fname", "member.jpg");
		map.put("id", "user3");
		if(dao.updateFile(map)) {
			p("성공");
		}else {
			p("실패");
		}
		
	} 


	private static void delete(MemberDAO dao) { 
			if (dao.delete("user5")) {
			 	p("성공"); 
			}  
			 
		}

	


	private static void update(MemberDAO dao) {
		MemberDTO dto = dao.read("bear");
		dto.setPasswd("1234"); 
		dto.setMname("실험");
		dto.setTel("111-222-333");
	 	dto.setEmail("email.com");
		dto.setZipcode("1234");
		dto.setAddress1("경기도");;
		dto.setAddress2("소흘");;
		dto.setJob("A01");
		dto.setFname("member.jpg");	  
		 
		
		if(dao.update(dto)) {
			p("성공");
		}else {
			p("실패");
		}
		 
	}



	private static void create(MemberDAO dao) {
		MemberDTO dto = new MemberDTO(); 
		dto.setMname("22실험");
		dto.setId("2흠냐");
 		dto.setPasswd("1234");
		dto.setTel("2111-222-333");
	 	dto.setEmail("2email.com");
		dto.setZipcode("21");
		dto.setAddress1("2경기도");
		dto.setAddress2("2소흘");
		dto.setJob("A01"); 
		dto.setFname("member.jpg");	  
	
		
		if (dao.create(dto)) { 
			p("성공");
		} else { 
			p("실패");
		}

		
	}

	private static void total(MemberDAO dao) {
		Map map = new HashMap();
		map.put("col", "mname");
		map.put("word", "1");
		 
		int total = dao.total(map);
		p("전체레코드수:" + total);
		
		
	}
 
	private static void read(MemberDAO dao) {
		MemberDTO dto = dao.read("user3");
		p(dto);
		
	}  

	private static void list(MemberDAO dao) {
		Map map = new HashMap();
		map.put("col", "mname");
		map.put("word", "");
		map.put("sno", 1); 
		map.put("eno", 10);
		
		List<MemberDTO> list= dao.list(map);
		
		Iterator<MemberDTO> iter= list.iterator();
		
		while(iter.hasNext()) {
			MemberDTO dto = iter.next();
			p(dto);
			p("----------------------------");
		}
	}

	private static void p(String string) {
		// TODO Auto-generated method stub
		System.out.println(string);
	}

	private static void p(MemberDTO dto) {
		
		p("번호:" + dto.getId());
		p("번호:" + dto.getMname());
		p("번호:" + dto.getTel());
		p("번호:" + dto.getEmail());
		p("번호:" + dto.getZipcode());
		p("번호:" + dto.getAddress1());
		p("번호:" + dto.getAddress2());
		p("번호:" + dto.getJob());
		p("번호:" + dto.getGrade());
		p("번호:" + dto.getFname());
		p("번호:" + dto.getPasswd());


		
	}

}
