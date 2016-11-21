package com.niit.latitude.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.niit.latitude.dao.PostDAO;
import com.niit.latitude.model.Post;
import com.niit.latitude.util.Util;



@Controller
public class PostController {
	
	@Autowired
	public Post post;
	
	@Autowired
	public PostDAO postDAO;

	
	@RequestMapping(value = "/posts", method = RequestMethod.GET)

	public String listPosts(Model model) {
		
		model.addAttribute("ispost", "true");
		model.addAttribute("post", post);
		model.addAttribute("postList", this.postDAO.list());
	
		return "home";
		
	}

	@RequestMapping(value = "/post/add", method = RequestMethod.POST)

	public String addPost(@ModelAttribute("post") Post post) {
		String newID = Util.removeComma(post.getId());
		post.setId(newID);
	
		postDAO.saveOrUpdate(post);
		return "redirect:/post";
	}
	
	@RequestMapping(value = "/post/delete/{id}")
	public String deleteCategory(@PathVariable("id") String id, ModelMap model) {
	
		postDAO.delete(id);
		model.addAttribute("message", "Successfully removed");
	
	return "redirect:/post";
}


}
