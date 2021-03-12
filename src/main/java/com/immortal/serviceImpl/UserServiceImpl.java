package com.immortal.serviceImpl;

import com.immortal.dao.SysUserMapper;
import com.immortal.entity.po.SysUser;
import com.immortal.entity.po.SysUserExample;
import com.immortal.entity.vo.UserLoginCondition;
import com.immortal.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service("user")
public class UserServiceImpl implements UserService {
    @Resource
    private SysUserMapper userMapper;

    @Override
    public List<SysUser> queryElementList() {
        return null;
    }

    @Override
    public SysUser queryElementById() {
        return null;
    }

    @Override
    public Integer insertElement(Object o) {
        SysUser user = (SysUser)o;
        Date date = new Date();
        user.setCreateTime(date);
        user.setUpdateTime(date);
        user.setUserCode("m0005");
        user.setUserState("1");
        int isSuccess = userMapper.insertSelective(user);
        return isSuccess;
    }

    @Override
    public Integer selectElementByCondition(Object o) {
        UserLoginCondition user = (UserLoginCondition) o;
        Integer isSuccess = 0;
        if(null != user){
            SysUserExample userExample = new SysUserExample();
            SysUserExample.Criteria criteria = userExample.createCriteria();
            criteria.andUserNameEqualTo(user.getUserName());
            criteria.andUserPasswordEqualTo(user.getUserPassWord());
            List<SysUser> sysUsers = userMapper.selectByExample(userExample);
            if(sysUsers.size() == 1 && null != sysUsers){
                isSuccess = 1;
            }else {
                System.out.println("用户登录失败");
            }
        }
        return isSuccess;
    }

    @Override
    public void deleteElementById(Long id) {

    }

}
