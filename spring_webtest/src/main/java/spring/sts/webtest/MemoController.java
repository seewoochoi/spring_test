package spring.sts.webtest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.memo.memoDAO;
import spring.model.memo.memoDTO;
import spring.utility.webtest.Utility;
import spring.model.memo.memoService;






@Controller
public class MemoController {

		@Autowired
		private memoDAO dao;
		 
		@Autowired  
		private memoService mgr;
		
		@RequestMapping(value="/memo/delete",method=RequestMethod.POST)
		public String delete(int memono, Model model,HttpServletRequest request) {
			  
			boolean flag = dao.delete(memono);
			  
		if(flag) {
			model.addAttribute("col", request.getParameter("col"));
			model.addAttribute("word", request.getParameter("word"));
			model.addAttribute("nowPage", request.getParameter("nowPage"));
			
			return "redirect:/memo/list";
		}else {
			
			return "/error/error";
		}
		}
		@RequestMapping(value="/memo/delete",method=RequestMethod.GET)
		public String delete(int memono,HttpServletRequest request) {
			
			boolean flag = dao.checkRefnum(memono);
			
			request.setAttribute("flag", flag);
			 
			return "/memo/delete";
		}
		
	
		@RequestMapping(value="/memo/reply", method=RequestMethod.POST)
		public String reply(memoDTO dto,Model model,HttpServletRequest request) {
		 
			boolean flag = mgr.reply(dto);
			
			
			if(flag) {
				
				model.addAttribute("col", request.getParameter("col"));
				model.addAttribute("word", request.getParameter("word"));
				model.addAttribute("nowPage", request.getParameter("nowPage"));
				
				return "redirect:/memo/list";
			}else {
				return "error/error";
			}
			
		}
		
		@RequestMapping(value="/memo/reply", method=RequestMethod.GET)
		public String reply(int memono,Model model) {
			
			memoDTO dto = dao.replyRead(memono);
			
			model.addAttribute("dto", dto);
			
			return "/memo/reply";
		}
		
		@RequestMapping(value="/memo/update", method=RequestMethod.POST)
		public String update(memoDTO dto,Model model,HttpServletRequest request) {
			
			boolean flag = dao.update(dto);
			if(flag) {
				model.addAttribute("col", request.getParameter("col"));
				model.addAttribute("word", request.getParameter("word"));
				model.addAttribute("nowPage", request.getParameter("nowPage"));
				
				return "redirect:/memo/list";
			
			}
			return "error/error";
			
			
		}
		
		@RequestMapping(value="/memo/update", method=RequestMethod.GET)
		public String update(int memono,Model model) {
			
			memoDTO dto = dao.read(memono);
			
			model.addAttribute("dto", dto);
			
			return "/memo/update";
		}
		
		@RequestMapping("/memo/read")
		public String read(int memono, Model model) {
			 
			dao.upViewcnt(memono);
			
			memoDTO dto = dao.read(memono); 
			
			String content = dto.getContent();
		
			content = content.replaceAll("\r\n", "<br>");
			
			dto.setContent(content); 
			
			model.addAttribute("dto", dto);
			
			return "/memo/read";
		} 
		
		@RequestMapping(value="/memo/create",method=RequestMethod.POST)
		public String create(memoDTO dto) {
		 	
			if(dao.create(dto)) {
				return "redirect:/memo/list";
			}else {
				return "error/error";
			}
			
			
		} 
		 
		@RequestMapping(value="/memo/create",method=RequestMethod.GET)
		public String create() {
			
			return "/memo/create";
		}
		
		@RequestMapping("/memo/list")
		public String list(HttpServletRequest request) {
						  
			
			String col = Utility.checkNull(request.getParameter("col"));
			String word = Utility.checkNull(request.getParameter("word"));
			 
			if(col.equals("total"))word="";
			//paging관련
			int nowPage = 1;
			int recordPerPage = 5;
			
			if(request.getParameter("nowPage")!=null){
				nowPage = Integer.parseInt(request.getParameter("nowPage"));
			}
			//DB에서 가져올 순번 생성
			int sno = ((nowPage-1) * recordPerPage) + 1; 
			int eno = nowPage * recordPerPage;
			
			Map map = new HashMap();
			map.put("col", col); 
			map.put("word", word); 
			map.put("sno", sno); 
			map.put("eno", eno);
			 
			
			List<memoDTO> list = dao.list(map);
			  
			
			int totalRecord = dao.total(map);
			
			String paging = Utility.paging3(totalRecord, nowPage, recordPerPage, col, word);
			
			 
			request.setAttribute("list", list);
			request.setAttribute("paging", paging);
			request.setAttribute("col", col);
			request.setAttribute("word", word);
			request.setAttribute("nowPage", nowPage);
			 
			return "/memo/list";
		}
}
 