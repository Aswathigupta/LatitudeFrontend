package com.niit.latitude.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.latitude.dao.PostCommentDAO;
import com.niit.latitude.dao.PostDAO;
import com.niit.latitude.model.Post;
import com.niit.latitude.model.PostComment;



@Controller
public class HomeController {
	
	
	@Autowired
	public Post post;
	
	@Autowired
	public PostDAO postDAO;
	
	@Autowired
	public PostComment postComment;
	
	@Autowired
	public PostCommentDAO postCommentDAO;
	
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
	
	
	
	@RequestMapping("/postComment")
	public ModelAndView postcomment() {
		ModelAndView mv = new ModelAndView("/home");	
		
		mv.addObject("postComment", postComment);
		mv.addObject("ispostcomment", "true");
		mv.addObject("postCommentList", postCommentDAO.list());
		
		return mv;
	}
	
	

}
