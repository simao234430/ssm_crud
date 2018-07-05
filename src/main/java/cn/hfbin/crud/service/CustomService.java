package cn.hfbin.crud.service;

import cn.hfbin.crud.bean.Custom;
import cn.hfbin.crud.bean.CustomExample;
import cn.hfbin.crud.dao.CustomMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by simao on 2018/7/3.
 */
@Service
public class CustomService {

    public CustomMapper getCustomMapper() {
        return customMapper;
    }

    @Autowired
    private CustomMapper customMapper;

    /**
     * 查询所有客户
     * @return
     */
//    public List<Custom> getAll() {
//        // TODO Auto-generated method stub
//        //return customMapper.selectByExampleWithDept(null);
//        return customMapper.selectAllCustom();
//    }
//
//    /**
//     * 客户保存
//     * @param custom
//     *
//     */
//    public void saveEmp(Custom custom) {
//        // TODO Auto-generated method stub
//        customMapper.insertSelective(custom);
//    }
//
//    /**
//     * 检验用户名是否可用
//     *
//     * @param empName
//     * @return  true：代表当前姓名可用   fasle：不可用
//     */
////    public boolean checkUser(String empName) {
////        // TODO Auto-generated method stub
////        CustomExample example = new CustomExample();
////        //这个我相信学过Hibernate 的同学都知道这个用法 不难 你可以理解为在where 加入条件
////        CustomExample.Criteria criteria = example.createCriteria();
////        //andEmpNameEqualTo根据词意来理解这个相当于 传入的这个empName与数据库的empName进行对比 不存在返回 0 ，存在返回其他
////        criteria.andEmpNameEqualTo(empName);
////        long count = customMapper.countByExample(example);
////        return count == 0;
////    }
//    /**
//     * 按照客户id查询客户
//     * @param id
//     * @return
//     */
//    public Custom getEmp(Integer id) {
//        // TODO Auto-generated method stub
//        Custom employee = customMapper.selectByPrimaryKey(id);
//        return employee;
//    }
//
//    /**
//     * 客户更新
//     * @param employee
//     */
//    public void updateEmp(Custom employee) {
//        // TODO Auto-generated method stub
//        customMapper.updateByPrimaryKeySelective(employee);
//    }
//
//    /**
//     * 客户删除
//     * @param id
//     */
//    public void deleteEmp(Integer id) {
//        // TODO Auto-generated method stub
//        customMapper.deleteByPrimaryKey(id);
//    }
//
//
//    /**
//     * 批量删除客户
//     * @param ids
//     */
//    public void deleteBatch(List<Integer> ids) {
//        // TODO Auto-generated method stub
//        CustomExample example = new CustomExample();
//        CustomExample.Criteria criteria = example.createCriteria();
//        //delete from xxx where emp_id in(1,2,3)
////        criteria.andEmpIdIn(ids);
//        customMapper.deleteByExample(example);
//    }

    public void saveCustom(Custom custom) {
        customMapper.insertCustomNoKey(custom);
    }

    public List<Custom> selectAllCustom() {

        return customMapper.selectAllCustom();
    }

    public void updateCustom(Custom person) {
        customMapper.updateByPrimaryKey(person);
    }

    public void deleteCustom(Integer id) {
        customMapper.deleteByPrimaryKey(id);
    }

//    public List<Custom> searchAllCustom(Custom custom) {
//        customMapper.selectByExample();
////        return customMapper.searchAllCustom(custom);
//    }
}
