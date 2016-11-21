package com.niit.latitude.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.niit.latitude.dao.PostCommentDAO;
import com.niit.latitude.model.PostComment;
import com.niit.latitude.util.Util;

@Controller
public class PostCommentController {

	@Autowired
	public PostComment postComment;
	
	@Autowired
	public PostCommentDAO postCommentDAO;

	
	@RequestMapping(value = "/postComments", method = RequestMethod.GET)

	public String listPostComments(Model model) {
		
		model.addAttribute("ispostcomment", "true");
		model.addAttribute("postComment", postComment);
		model.addAttribute("postCommentList", this.postCommentDAO.list());
	
		return "home";
		
	}

	@RequestMapping(value = "/comment/add", method = RequestMethod.POST)

	public String addPostComment(@ModelAttribute("postComment") PostComment postComment) {
		String newID = Util.removeComma(postComment.getId());
		postComment.setId(newID);
	
		postCommentDAO.saveOrUpdate(postComment);
		return "redirect:/post";
	}
}
