package spring.sts.webtest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.img.ImgDAO;
import spring.model.img.ImgDTO;
import spring.utility.webtest.Utility;



@Controller
public class ImgController {
	 
	@Autowired
	private ImgDAO dao;
	
	@RequestMapping(value="/Img/delete", method=RequestMethod.POST)
	public String delete(int no, String passwd,String oldfile , HttpServletRequest request
			,Model model) {
	
		String upDir = request.getRealPath("/Img/storage");
		Map map = new HashMap();
		map.put("no", no);
		map.put("passwd", passwd);
		boolean pflag = dao.passCheck(map);
		
		System.out.println(no+passwd);
		if(pflag) {
			if(dao.delete(no)) {
				
			 	
				model.addAttribute("col", request.getParameter("col"));
				model.addAttribute("word", request.getParameter("word"));
				model.addAttribute("nowPage", request.getParameter("nowPage"));
				
				
			}
			return "redirect:/Img/list";
		}else {
			return "/error/error";
		}
	
	}

	
	@RequestMapping(value="/Img/delete", method=RequestMethod.GET)
	public String delete(int no,String passwd) {
			
			return "/Img/delete";
			
		
	}
		 
	
	@RequestMapping(value="/Img/create", method=RequestMethod.POST)
	public String create(HttpServletRequest request,ImgDTO dto,Model model) {
		String upDir = request.getRealPath("/Img/storage");
		
		int size= (int)dto.getFnameMF().getSize();
	 	String fname= null;
	 
	 	if(size>0){
	 		fname=Utility.saveFileSpring(dto.getFnameMF(), upDir);
	 	}else{
	 		fname="member.jpg";
	 	}
	 	
	 	dto.setFname(fname);
	 	  
	 	boolean flag= dao.create(dto);
	 	
	 	if(flag) {
	 		model.addAttribute("col", request.getParameter("col"));
	 		model.addAttribute("word", request.getParameter("word"));
	 		model.addAttribute("nowPage", request.getParameter("nowPage"));
	 		model.addAttribute("flag", flag);
	 		
	 		return "redirect:/Img/list";
	 	}else {
	 		return "error/error";
	 	}
		
	}
	@RequestMapping(value="/Img/create", method=RequestMethod.GET)
	public String create() {
		
		return "/Img/create";
	}
	
	@RequestMapping(value="/Img/update", method=RequestMethod.POST)
	public String update(int no, HttpServletRequest request,String passwd,
			ImgDTO dto,String oldfile,Model model) {
		String upDir = request.getRealPath("/Img/storage");
		
		Map map = new HashMap();
		map.put("no", no); 
		map.put("passwd",passwd );
		  
		
		boolean flag = dao.passCheck(map);
		boolean flag2 = false;
		String fname = null;
		int filesize = (int)dto.getFnameMF().getSize();
		
		if(flag==true){
			if(filesize>0){
				Utility.deleteFile(upDir, oldfile);	
				fname = Utility.saveFileSpring(dto.getFnameMF(), upDir);
		
		 	}
		 		dto.setFname(fname);
		 		 
		 		  
		 	flag2 = dao.update(dto);
			System.out.println(flag2);	 
			System.out.println(flag);	 
		 	model.addAttribute("col", request.getParameter("col"));
		 	model.addAttribute("word", request.getParameter("word"));
		 	model.addAttribute("nowPage", request.getParameter("nowPage"));
		 	 	
		 	return "redirect:/Img/list";
		}else {
			return "/error/error";
		}
	}
	@RequestMapping(value="/Img/update", method=RequestMethod.GET)
	public String update(int no, Model model) {
	
		ImgDTO dto = dao.read(no);
		
		model.addAttribute("dto", dto);
		
		return "/Img/update";
	}
	
	
	@RequestMapping("/Img/read")
	public String read(int no,Model model) {
		
		ImgDTO dto = dao.read(no);
	 	 
	 	List list = dao.Imgread(no);
	 	
	 	int[] no1 = (int[])list.get(0);
	 	
	 	String[] fname1 = (String[])list.get(1);
		
	 	  model.addAttribute("fname1", fname1);
	 	  model.addAttribute("dto", dto);
	 	  model.addAttribute("no1", no1);

		
		return "/Img/read";
	}
	@RequestMapping("/Img/list")
	public String list(HttpServletRequest request,Model model) {
		 
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		
		if(col.equals("total")) {
		word = "";
		}
		int nowPage = 1; 
		if(request.getParameter("nowPage")!=null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage = 5;
		int sno = ((nowPage-1)*recordPerPage)+1;
		int eno = nowPage*recordPerPage;
		
		
	
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		

		List<ImgDTO> list = dao.list(map);
		int totalRecord = dao.total(map);
		
		String paging = Utility.paging3(totalRecord, nowPage, recordPerPage, col, word);
		
		
		model.addAttribute("list", list);
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		model.addAttribute("paging", paging);
		model.addAttribute("nowPage", nowPage);
		  
		
		
		return "/Img/list";
	}
	
}
