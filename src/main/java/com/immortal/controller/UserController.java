package com.immortal.controller;

import com.immortal.entity.po.SysUser;
import com.immortal.entity.vo.UserLoginCondition;
import com.immortal.service.UserService;
import com.immortal.utils.VerifyCodeUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

@Controller
public class UserController {
    @Resource
    private UserService userService;

    /**
     * 访问注册页面
     *
     * @return
     */
    @RequestMapping("getRegister")
    public String userRegister() {
        return "redirect:register";
    }

    @RequestMapping("register")
    public String getRegister() {
        return "regist";
    }

    @RequestMapping("managerIndex")
    public String managerMenu(){
        return "managerIndex";
    }
    /**
     * 提交注册请求 添加用户
     *
     * @param user
     * @param request
     * @return
     * @throws IOException
     */
    @RequestMapping("userRegister")
    public String userRegist(SysUser user, String verifyCode, HttpServletRequest request) throws IOException {
        String code = (String) request.getSession().getAttribute("verifyCode");
        if (null != verifyCode && verifyCode.equalsIgnoreCase(code)) {
            Integer isSuccess = userService.insertElement(user);
            return "redirect:login";
        }else{
            return "regist";
        }

    }

    /**
     * 头像上传
     */
    @RequestMapping("upload")
    public String uploadImage(@RequestParam("userImage") MultipartFile userImage, HttpSession session) throws IOException {
        if (null == userImage) {
            System.out.println("文件为空！");
        } else {
            String originalFilename = userImage.getOriginalFilename();
            String path = session.getServletContext().getRealPath("/src/main/webapp/file");
            File file = new File(path);
            if (!file.exists()) {
                file.mkdirs();
            }
            File imageFile = new File(file, originalFilename);
            userImage.transferTo(imageFile);
            session.setAttribute("url", originalFilename);
        }
        return "regist";
    }


    /**
     * 访问登录页面
     *
     * @return
     */
    @RequestMapping("login")
    public String userLogin() {
        return "login";
    }

    /**
     * 登录页面的验证码
     */
    @RequestMapping("getImage")
    public void getImage(HttpServletRequest request, HttpServletResponse response) throws IOException {
        VerifyCodeUtil.setHeight(35);
        VerifyCodeUtil.setWidth(90);
        VerifyCodeUtil.setSize(10);
        VerifyCodeUtil.setDsize(20);
        String verifyCode = VerifyCodeUtil.generateVerifyCode();
        request.getSession().setAttribute("verifyCode", verifyCode);
        BufferedImage image = VerifyCodeUtil.getBufferedImage(verifyCode);
        ServletOutputStream os = response.getOutputStream();
        ImageIO.write(image, "png", os);
    }

    /**
     * 用户登录
     */
    @PostMapping("userLogin")
    public String userLogin(UserLoginCondition userLoginCondition, HttpSession session, Model model) {
        //1.在session中拿到验证码 与前端的验证码进行比对
        String code = (String) session.getAttribute("verifyCode");
        Integer isSuccess = 0;
        //2.如果验证码相等 则写入到数据库 否则
        if (null != userLoginCondition && userLoginCondition.getVerifyCode().equalsIgnoreCase(code)) {
            //根据用户名和密码来查询用户
            isSuccess = userService.selectElementByCondition(userLoginCondition);
            session.setAttribute("isSuccess", isSuccess);
            session.setAttribute("username",userLoginCondition.getUserName());
            return "redirect:managerIndex";
        } else {
            session.setAttribute("isSuccess", isSuccess);
        }
        return "redirect:login";
    }

    /**
     * 退出登录
     */
    @RequestMapping("exit")
    public String exitSystem(HttpServletRequest request){
        request.getSession().removeAttribute("isSuccess");
        request.getSession().removeAttribute("verifyCode");
        request.getSession().removeAttribute("username");
        request.getSession().invalidate();  //让整个session失效
        return "redirect:login";

    }

}
