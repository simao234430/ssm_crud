//package cn.hfbin.crud.test;
//
//import org.apache.ibatis.session.SqlSession;
//import org.apache.ibatis.session.SqlSessionFactory;
//
//import java.io.IOException;
//
//public class Test {
//
//    @Test
//    public void  testDynamicSql() throws IOException {
//        SqlSessionFactory sqlSessionFactory=getSqlSessionFactory();
//        SqlSession openSession=sqlSessionFactory.openSession();
//        try {
//            EmployeeMapperDynamicSQL   mapper=	openSession.getMapper(EmployeeMapperDynamicSQL.class);
//            Employee employee=new Employee(null, "%h%", null, null);
//            List<Employee>  emps=  mapper.getEmpsByConditionIf(employee);
//            for(Employee emp: emps)
//                System.out.println(emp);
//            // 查询的时候如果某些条件没带可能sql拼装会有问题
//            // 1.给where 后面加上1=1，以后的条件都and
//            //2.  mybatis 使用where 标签将所有的查询条件包括在内。
//            // mybatis 就会将where标签后面第一个and 去掉
//            // where只会去掉第一个多出来的and 或者  or
//        } catch (Exception e) {
//            // TODO: handle exception
//            e.printStackTrace();
//        }
//
//    }
//}