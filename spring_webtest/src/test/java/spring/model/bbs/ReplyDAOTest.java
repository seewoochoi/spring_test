package spring.model.bbs;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class ReplyDAOTest {

	private static ReplyDAO dao;
	private static BeanFactory beans;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		Resource resource = new ClassPathResource("daoTest.xml");
		beans = new XmlBeanFactory(resource);
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
		dao = (ReplyDAO)beans.getBean("reply");
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	@Ignore
	public void testRcount() {
		int bbsno = 1;
		int cnt = dao.rcount(bbsno);
		assertEquals(cnt,8); 
	} 

	@Test
	@Ignore
	public void testCreate() {
		ReplyDTO dto  = new ReplyDTO();
		dto.setContent("새로운내용");
		dto.setId("newid");
		dto.setBbsno(10);
		assertTrue(dao.create(dto));
	}

	@Test
	@Ignore
	public void testRead() {
		int rnum = 5;
		ReplyDTO dto = dao.read(rnum);
		assertNotNull(dto); 
	} 

	@Test
	@Ignore
	public void testUpdate() {
		ReplyDTO dto = dao.read(1);
		dto.setContent("내용변경11.12");
		assertTrue(dao.update(dto)); 
	}

	@Test
	@Ignore
	public void testList() {
		Map map = new HashMap();
		
		map.put("bbsno", 1);
		map.put("sno", 1);
		map.put("eno", 10);
		List<ReplyDTO> list= dao.list(map);

		assertEquals(list.size(),3);
		 
		 
	}

	@Test
	@Ignore
	public void testTotal() {
		int bbsno = 3;
		int total = dao.total(bbsno);
		assertEquals(total,3);
	}

	@Test
	public void testDelete() {
		int rnum = 8;
		assert(dao.delete(rnum));
		
	}

	@Test
	public void testBdelete() {
		int bbsno = 6;
		assert(dao.bdelete(bbsno));
	}

}
