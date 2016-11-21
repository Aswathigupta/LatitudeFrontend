package com.niit.latitude.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.latitude.dao.PostDAO;
import com.niit.latitude.model.Post;



@Controller
public class HomeController {
	
	
	@Autowired
	public Post post;
	
	@Autowired
	public PostDAO postDAO;
	
	@RequestMapping("/")
	public ModelAndView load(HttpSession session) {
		ModelAndView mv = new ModelAndView("/home");	
//		session.setAttribute("category", category);
//		session.setAttribute("categoryList", categoryDAO.list());
		return mv;
	}
	
	@RequestMapping("/post")
	public ModelAndView post() {
		ModelAndView mv = new ModelAndView("/home");
		
		mv.addObject("post", post);
		mv.addObject("ispost", "true");
		mv.addObject("postList", postDAO.list());
		
		return mv;
	}
	
	
	
	@RequestMapping("/postcomment")
	public ModelAndView postcomment() {
		ModelAndView mv = new ModelAndView("/home");	
		mv.addObject("ispostcomment", "true");
		return mv;
	}
	
	

}
