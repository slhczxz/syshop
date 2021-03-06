package com.sy.shop.controller;

import com.sy.shop.api.UserApi;
import com.sy.shop.commons.dto.BaseResult;
import com.sy.shop.commons.utils.EmailUtils;
import com.sy.shop.constant.ConstantUtils;
import com.sy.shop.domain.TbUser;
import com.sy.shop.dto.TbUserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
public class UserController {

    @Autowired
    EmailUtils emailUtils;


    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String login() {
        return "login";
    }

    /**
     * 登录
     * @param model
     * @param tbUserDTO
     * @param request
     * @return
     */
    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(Model model, TbUserDTO tbUserDTO, HttpServletRequest request) {
        TbUserDTO userDTO = UserApi.login(tbUserDTO);
        if(!tbUserDTO.getVerification().equals(request.getSession().getAttribute(ConstantUtils.KAPTCHA_SESSION_KEY))){
            model.addAttribute("baseResult", BaseResult.fail("验证码错误"));
            return "login";
        }
        if (userDTO == null) {
            //登录失败
            model.addAttribute("baseResult", BaseResult.fail("用户名或者密码错误"));
            return "login";
        } else {
            //登录成功
            request.getSession().setAttribute(ConstantUtils.SESSION_USER_KEY, userDTO);
            return "redirect:/index";
        }
    }
    @RequestMapping(value = "myself", method = RequestMethod.GET)
    public String myself(HttpServletRequest request) {
        return "myself";
    }

    @RequestMapping(value = "register",method = RequestMethod.GET)
    public String register(){
        return "register";
    }

    @RequestMapping(value = "register",method = RequestMethod.POST)
    public String register(TbUserDTO tbUserDTO){
        TbUserDTO register = UserApi.register(tbUserDTO);
        System.out.println(register);
        return "register";
    }
}
