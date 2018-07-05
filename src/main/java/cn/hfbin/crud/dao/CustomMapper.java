package cn.hfbin.crud.dao;

import cn.hfbin.crud.bean.Custom;
import cn.hfbin.crud.bean.CustomExample;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * Created by simao on 2018/7/3.
 */
public interface CustomMapper {
    /**
     * 检验用户名是否可用
     */
//    long countByExample(EmployeeExample example);

    /**
     * 批量删除客户
     */
    int deleteByExample(CustomExample example);

    /**
     * 客户删除
     */
    int deleteByPrimaryKey(Integer empId);


    /**
     * 客户保存
     */
    int insertSelective(Custom record);
    int insertCustomNoKey(Custom record);
    int insertCustom(Custom record);
//    void updateCustom(Custom record);

    void updateByExample(Custom record);
    void updateByPrimaryKey(Custom record);


    /**
     * 按照客户id查询客户
     */
    Custom selectByPrimaryKey(Integer empId);

    /**
     * 查询所有客户
//     */
//    List<Custom> selectByExampleWithDept(CustomExample example);
//

    @Select("select * from customtable order by update_time")
    public List<Custom> selectAllCustom();

    /**
     * 客户更新
     */
    int updateByPrimaryKeySelective(Custom record);

    List<Custom> searchAllCustom(Custom custom);

    List<Custom> selectByExample(CustomExample custom);
}
