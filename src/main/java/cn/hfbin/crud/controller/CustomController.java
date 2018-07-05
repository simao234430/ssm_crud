package cn.hfbin.crud.controller;


import cn.hfbin.crud.bean.Custom;
import cn.hfbin.crud.bean.CustomExample;
import cn.hfbin.crud.dto.Msg;
import cn.hfbin.crud.service.CustomService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sun.tools.internal.xjc.reader.xmlschema.bindinfo.BIConversion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 处理客户CRUD请求
 */
@Controller
public class CustomController {

    @Autowired
    private CustomService customService;

    @RequestMapping("/testJson")
    @ResponseBody
    public Custom testJson(Custom person) {
        System.out.println("person:" + person);
        return person;
    }


    @RequestMapping(value = "/custom/delete/{id}", method = RequestMethod.POST)
    @ResponseBody
    public Msg deleteCustom(@PathVariable("id") Integer id) {
        customService.deleteCustom(id);
        return Msg.success();
    }

    @RequestMapping(value = "/custom/search", method = RequestMethod.POST)
    @ResponseBody
    public Msg deleteCustom(@RequestBody Custom person) {

        CustomExample example = new CustomExample();
        example.or().andIdEqualTo(person.getId());
        example.or().andCustomnameLike(person.getCustomname());
        List<Custom> customs = customService.getCustomMapper().selectByExample(example);


//        person.setBirthday(null);
//        PageHelper.startPage(1, 20);
//        List<Custom> customs = customService.searchAllCustom(person);
        PageInfo page = new PageInfo(customs, 1);
        return Msg.success().add("pageInfo", page);
    }

    @RequestMapping(value = "/custom/update", method = RequestMethod.POST)
    @ResponseBody
    public Msg editCustom(@RequestBody Custom person) {
//        System.out.println("person:" + person);
//        System.out.println("person:" + person.getCustomname());
//        System.out.println("person:" + person.getAddress());
//        System.out.println("person:" + person.getGender());
//        System.out.println("person:" + person.getBirthday());
//        System.out.println("person:" + person.getPhone());
        customService.updateCustom(person);
        return Msg.success();
    }

    @RequestMapping(value = "/Custom", method = RequestMethod.POST)
    @ResponseBody
    public Msg addCustom(@RequestBody Custom person) {
        System.out.println("#########person:" + person);
        System.out.println(person.getCustomname());
        customService.saveCustom(person);
        return Msg.success();
    }

    @RequestMapping("/customes")
    @ResponseBody
    public Msg getEmpsWithJson(
            @RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        // 这不是一个分页查
        // 引入PageHelper分页插件
        // 在查询之前只需要调用，传入页码，以及每页的大小
        PageHelper.startPage(pn, 20);
        // startPage后面紧跟的这个查询就是一个分页查询
        List<Custom> customs = customService.selectAllCustom();
        // 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
        // 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
        PageInfo page = new PageInfo(customs, 5);
        return Msg.success().add("pageInfo", page);
//        return Msg.success();
    }


}
