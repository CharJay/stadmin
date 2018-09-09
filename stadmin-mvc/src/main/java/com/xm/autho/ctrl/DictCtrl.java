package com.xm.autho.ctrl;

import com.framework.core.db.bean.RetMsg;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/dict")
public class DictCtrl {
	
	private static final Logger logger = LoggerFactory.getLogger(DictCtrl.class);
	

	@RequestMapping(value = { "getData" }, method = RequestMethod.POST)
	@ResponseBody
	public RetMsg<String> getData(HttpServletRequest request, String classId, String entryId) {
		
		return null;
	}
}
