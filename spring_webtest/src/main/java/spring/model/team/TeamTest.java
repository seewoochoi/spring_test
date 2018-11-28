package spring.model.team;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class TeamTest {

	public static void main(String[] args) {

		Resource resource = new ClassPathResource("daoTest.xml");

		BeanFactory factory = new XmlBeanFactory(resource);

		TeamDAO dao = (TeamDAO) factory.getBean("team");

		list(dao); 
//		read(dao); 
//		total(dao);
//		create(dao); 

//		update(dao); 
//		replyread(dao); 
//		reply(dao);
//		checkRefnum(dao);  
//		delete(dao);  
//		passCheck(dao);
	}

	private static void passCheck(TeamDAO dao) {
		Map map = new HashMap();
		map.put("Teamno", 1);
		map.put("passwd", 1);
		if (dao.passCheck(map)) {
			p("올바른 패스워드 입니다.");
		} else {
			p(" 잘못된 패스워드 입니다.");
		}

	}

	private static void delete(TeamDAO dao) {
//		if (dao.checkRefnum(3)) {
//			System.out.println(dao.checkRefnum(3));
//				p("실패"); 
//		} else {  
		if (dao.delete(4)) {
			p("성공");
		}

	}
 
	private static void checkRefnum(TeamDAO dao) {
		if (dao.checkRefnum(13)) {
			p("답변 있는 글이므로 삭제 할수 없습니다.");
		} else { 
			p("삭제가능합니다."); 
		} 

	} 

	private static void reply(TeamDAO dao) {
		TeamDTO dto = dao.replyRead(15);
		dto.setPhone("222-22-1221");
		dto.setHobby("독서당");
		dto.setSkills("Java2");
		dto.setGender("남자"); 
		dto.setZipcode("13345");
		dto.setAddress("서울시 종로구 관철동이당");
		dto.setAddress2("젊음의 거리이당");

		Map map = new HashMap();
		map.put("grpno", dto.getGrpno());
		map.put("ansnum", dto.getAnsnum());

		dao.upAnsnum(map);
		if (dao.replyCreate(dto)) {
			p("성공");
		} else {
			p("실패");
		}

	}

	private static void replyRead(TeamDAO dao) {
		TeamDTO dto = dao.replyRead(2);
		p(dto);

	}

	private static void update(TeamDAO dao) {
		TeamDTO dto = new TeamDTO();
		dto.setNo(4);
		dto.setName("실험2");
		dto.setPhone("111-111-1111");
		dto.setHobby("독서");
		dto.setSkills("Java,JSP");
		dto.setGender("여자");
		dto.setZipcode("12345");
		dto.setAddress("서울시 종로구 관철동");
		dto.setAddress2("젊음의 거리");

		if (dao.update(dto)) {
			p("성공");
		} else {
			p("실패");
		}

	}

	private static void create(TeamDAO dao) {
		TeamDTO dto = new TeamDTO();
		dto.setName("실험1");
		dto.setPhone("111-111-1111");
		dto.setHobby("독서");
		dto.setSkills("Java");
		dto.setGender("여자");
		dto.setZipcode("12345");
		dto.setAddress("서울시 종로구 관철동");
		dto.setAddress2("젊음의 거리");

		if (dao.create(dto)) {
			p("성공");
		} else {
			p("실패");
		}

	}

	private static void total(TeamDAO dao) {
		Map map = new HashMap();
		map.put("col", "title");
		map.put("word", "3");

		int total = dao.total(map);
		p("전체레코드수:" + total);

	}

	private static void read(TeamDAO dao) {
		TeamDTO dto = dao.read(3);
		p(dto);

	}

	private static void list(TeamDAO dao) {
		Map map = new HashMap();
		map.put("col", "name");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 10);

		List<TeamDTO> list = dao.list(map);

		Iterator<TeamDTO> iter = list.iterator();
 
		while (iter.hasNext()) {
			TeamDTO dto = iter.next();
			p(dto);
			p("----------------------------");
		}
	}

	private static void p(String string) {
		// TODO Auto-generated method stub
		System.out.println(string);
	}

	private static void p(TeamDTO dto) {

		p("번호:" + dto.getName());
		p("번호:" + dto.getPhone());
		p("번호:" + dto.getHobby());
		p("번호:" + dto.getSkills());
		p("번호:" + dto.getGender());
		p("번호:" + dto.getZipcode()); 
		p("번호:" + dto.getAddress());
		p("번호:" + dto.getAddress2());
	

	}

}
