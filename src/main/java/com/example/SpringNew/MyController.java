package com.example.SpringNew;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class MyController {
	@RequestMapping("apicall")
	public String apicall()
	{
		return "apicall";
	}
	
	@RequestMapping("test")
	public ModelAndView test()
	{
		ArrayList<String> arrayList=new ArrayList();
		arrayList.add("JBK");
		arrayList.add("JavaByKiran");
		arrayList.add("KiranAcademy");
	
		
		ModelAndView modelAndView=new ModelAndView("test","data", arrayList);
		
		return modelAndView;
	}

}
