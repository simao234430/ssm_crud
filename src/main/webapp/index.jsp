<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>客户列表</title>
	<%
		request.setAttribute("APP_PATH", request.getContextPath());
	%>
	<!-- web路径：
    不以/开始的相对路径，找资源，以当前资源的路径为基准，经常容易出问题。
    以/开始的相对路径，找资源，以服务器的路径为标准(http://localhost:3306)；需要加上项目名
            http://localhost:3306/crud
     -->
    <script src="https://cdn.bootcss.com/underscore.js/1.9.0/underscore-min.js"></script>
    <script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>

        <%--<script src="//cdn.bootcss.com/jqueryui/1.12.1/jquery-ui.js"></script>--%>
    <link href="${APP_PATH }/static/bootstrap-datepicker/dist/css/bootstrap-datepicker.css" rel="stylesheet">
    <link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	<%--<script src="${APP_PATH }/static/bootstrap-datepicker/dist/js/bootstrap-datepicker.js"></script>--%>

</head>
<body>
<!-- 客户修改的模态框 -->
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">客户修改</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal updateModel">
                    <%--<input type="hidden" name="_method" value="put" />--%>
                    <input type="hidden" name="id" class="form-control" value="">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input type="text" name="customname" class="form-control" id="name_update" placeholder="输入名字">
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">住址</label>
                        <div class="col-sm-10">
                            <input type="text" name="address" class="form-control" id="address_update" placeholder="输入住址">
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">电话</label>
                        <div class="col-sm-10">
                            <input type="text" name="phone" class="form-control" id="phone_update" placeholder="输入电话">
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <input id="man" type="radio" checked="checked" value="M" name="gender" />男
                            <input id="woman" type="radio" value="F" name="gender"/>女
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">生日</label>
                        <div class="col-sm-10">
                            <input name="birthday" type="date" id="birthday_update" value="2018-06-01"/>
                        </div>
                    </div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
			</div>
		</div>
	</div>
</div>



<!-- 客户添加的模态框 -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">客户添加</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal">
                    <%--<input type="hidden" name="id" class="form-control" value="">--%>

					<div class="form-group">
						<label class="col-sm-2 control-label">姓名</label>
						<div class="col-sm-10">
							<input type="text" name="customname" class="form-control" id="name_input" placeholder="输入名字">
							<span class="help-block"></span>
						</div>
					</div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">住址</label>
                        <div class="col-sm-10">
                            <input type="text" name="address" class="form-control" id="address_input" placeholder="输入住址">
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">电话</label>
                        <div class="col-sm-10">
                            <input type="text" name="phone" class="form-control" id="phone_input" placeholder="输入电话">
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <input id="man_update" type="radio" checked="checked" value="M" name="gender" />男
                            <input id="woman_update" type="radio" value="F" name="gender"/>女
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">生日</label>
                        <div class="col-sm-10">
                            <input name="birthday" type="date" id="birthday" value="2018-06-01"/>
                        </div>
                    </div>


				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" id="custom_save_btn">保存</button>
			</div>
		</div>
	</div>
</div>


<!-- 搭建显示页面 -->
<div class="container">
	<!-- 标题 -->
	<div class="row">
		<div class="col-md-12">
			<h1>SSM-CRUD</h1>
		</div>
	</div>
	<!-- 按钮 -->
	<div class="row">
        <div  id="serach_form">
            <form>
                <div class="form-group">
                    <label class="col-sm-2 control-label">id</label>
                    <input  name="id" class="form-control" value="">
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">姓名</label>
                    <div class="col-sm-10">
                        <input type="text" name="customname" class="form-control" id="_name_update" placeholder="输入名字">
                        <span class="help-block"></span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">住址</label>
                    <div class="col-sm-10">
                        <input type="text" name="address" class="form-control" id="_address_update" placeholder="输入住址">
                        <span class="help-block"></span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">电话</label>
                    <div class="col-sm-10">
                        <input type="text" name="phone" class="form-control" id="_phone_update" placeholder="输入电话">
                        <span class="help-block"></span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">性别</label>
                    <div class="col-sm-4">
                        <input id="_man" type="radio" checked="checked" value="M" name="gender" />男
                        <input id="_woman" type="radio" value="F" name="gender"/>女
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">生日</label>
                    <div class="col-sm-4">
                        <input name="birthday" type="date" id="_birthday_update" value=""/>
                    </div>
                </div>
            </form>
        </div>
		<div class="col-md-4 col-md-offset-8">
			<button class="btn btn-primary" id="emp_add_modal_btn">新增</button>
			<button class="btn btn-danger" id="emp_search_all_btn">搜索</button>
		</div>
	</div>
	<!-- 显示表格数据 -->
	<div class="row">
		<div class="col-md-12">
			<table class="table table-hover" id="emps_table">
				<thead>
				<tr>
					<th>
						<input type="checkbox" id="check_all"/>
					</th>
					<th>ID</th>
					<th>姓名</th>
					<th>性别</th>
					<th>生日</th>
					<th>地址</th>
					<th>电话</th>
                    <th>操作</th>

				</tr>
				</thead>
				<tbody>

				</tbody>
			</table>
		</div>
	</div>

	<!-- 显示分页信息 -->
	<div class="row">
		<!--分页文字信息  -->
		<div class="col-md-6" id="page_info_area"></div>
		<!-- 分页条信息 -->
		<div class="col-md-6" id="page_nav_area">

		</div>
	</div>

</div>

<script type="text/javascript">


    var totalRecord,currentPage;
    //1、页面加载完成以后，直接去发送ajax请求,要到分页数据
    $(function(){
        $.fn.serializeObject = function()
        {
            var o = {};
            var a = this.serializeArray();
            $.each(a, function() {
                if (o[this.name]) {
                    if (!o[this.name].push) {
                        o[this.name] = [o[this.name]];
                    }
                    o[this.name].push(this.value || '');
                } else {
                    o[this.name] = this.value || '';
                }
            });
            return o;


        };
        //去首页
        // $('#birthday').datepicker({
        // });
        to_mypage(1);
    });

    function to_mypage(pn){
        $.ajax({
            url:"${APP_PATH}/customes",
            data:"pn="+pn,
            type:"GET",
            success:function(result){
                //console.log(result);
                //1、解析并显示客户数据
                build_myemps_table(result);
                //2、解析并显示分页信息
                build_page_info(result);
                //3、解析显示分页条数据
                build_page_nav(result);
            }
        });
    }


    function build_myemps_table(result){
        //清空table表格
        $("#emps_table tbody").empty();
        var emps = result.extend.pageInfo.list;
        $.each(emps,function(index,item){
            var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
            var id = $("<td></td>").append(item.id);
            var name = $("<td></td>").append(item.customname);
            var gender = $("<td></td>").append(item.gender=='M'?"男":"女");
            var birthday = $("<td></td>").append(item.birthday);
            var address = $("<td></td>").append(item.address);
            var phone = $("<td></td>").append(item.phone);
            /**
             <button class="">
             <span class="" aria-hidden="true"></span>
             编辑
             </button>
             */
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
            //为编辑按钮添加一个自定义的属性，来表示当前客户id
            editBtn.attr("edit-id",item.id);
            var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            //为删除按钮添加一个自定义的属性来表示当前删除的客户id
            delBtn.attr("del-id",item.id);
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
            //var delBtn =
            //append方法执行完成以后还是返回原来的元素
            $("<tr></tr>").append(checkBoxTd)
                .append(id)
                .append(name)
                .append(gender)
                .append(birthday)
                .append(address)
                .append(phone)
                .append(btnTd)
                .appendTo("#emps_table tbody");
        });
    }


    //解析显示分页信息
    function build_page_info(result){
        $("#page_info_area").empty();
        $("#page_info_area").append("当前"+result.extend.pageInfo.pageNum+"页,总"+
            result.extend.pageInfo.pages+"页,总"+
            result.extend.pageInfo.total+"条记录");
        totalRecord = result.extend.pageInfo.total;
        currentPage = result.extend.pageInfo.pageNum;
    }
    //解析显示分页条，点击分页要能去下一页....
    function build_page_nav(result){
        //page_nav_area
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");

        //构建元素
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("上一页"));
        if(result.extend.pageInfo.hasPreviousPage == false){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }else{
            //为元素添加点击翻页的事件
            firstPageLi.click(function(){
                to_mypage(1);
            });
            prePageLi.click(function(){
                to_mypage(result.extend.pageInfo.pageNum -1);
            });
        }



        var nextPageLi = $("<li></li>").append($("<a></a>").append("下一页"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
        if(result.extend.pageInfo.hasNextPage == false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else{
            nextPageLi.click(function(){
                to_mypage(result.extend.pageInfo.pageNum +1);
            });
            lastPageLi.click(function(){
                to_mypage(result.extend.pageInfo.pages);
            });
        }



        //添加首页和前一页 的提示
        ul.append(firstPageLi).append(prePageLi);
        //1,2，3遍历给ul中添加页码提示
        $.each(result.extend.pageInfo.navigatepageNums,function(index,item){

            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if(result.extend.pageInfo.pageNum == item){
                numLi.addClass("active");
            }
            numLi.click(function(){
                to_mypage(item);
            });
            ul.append(numLi);
        });
        //添加下一页和末页 的提示
        ul.append(nextPageLi).append(lastPageLi);

        //把ul加入到nav
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }

    //清空表单样式及内容
    function reset_form(ele){
        $(ele)[0].reset();
        //清空表单样式
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    }

    //点击新增按钮弹出模态框。
    $("#emp_add_modal_btn").click(function(){
        //清除表单数据（表单完整重置（表单的数据，表单的样式））
        reset_form("#empAddModal form");
        //s$("")[0].reset();
        //发送ajax请求，查出部门信息，显示在下拉列表中
        //getDepts("#empAddModal select");
        //弹出模态框
        $("#empAddModal").modal({
            backdrop:"static"
        });
    });

    //查出所有的部门信息并显示在下拉列表中
    function getDepts(ele){
        //清空之前下拉列表的值
        $(ele).empty();
        $.ajax({
            url:"${APP_PATH}/depts",
            type:"GET",
            success:function(result){
                //{"code":100,"msg":"处理成功！",
                //"extend":{"depts":[{"deptId":1,"deptName":"开发部"},{"deptId":2,"deptName":"测试部"}]}}
                //console.log(result);
                //显示部门信息在下拉列表中
                //$("#empAddModal select").append("")
                $.each(result.extend.depts,function(){
                    var optionEle = $("<option></option>").append(this.deptName).attr("value",this.deptId);
                    optionEle.appendTo(ele);
                });
            }
        });

    }

    // //校验表单数据
    // function validate_add_form(){
    //     //1、拿到要校验的数据，使用正则表达式
    //     var empName = $("#empName_add_input").val();
    //     var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
    //     if(!regName.test(empName)){
    //         //alert("用户名可以是2-5位中文或者6-16位英文和数字的组合");
    //         show_validate_msg("#empName_add_input", "error", "用户名可以是2-5位中文或者6-16位英文和数字的组合");
    //         return false;
    //     }else{
    //         show_validate_msg("#empName_add_input", "success", "");
    //     };
    //
    //     //2、校验邮箱信息
    //     var email = $("#email_add_input").val();
    //     var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
    //     if(!regEmail.test(email)){
    //         //alert("邮箱格式不正确");
    //         //应该清空这个元素之前的样式
    //         show_validate_msg("#email_add_input", "error", "邮箱格式不正确");
    //         /* $("#email_add_input").parent().addClass("has-error");
    //         $("#email_add_input").next("span").text("邮箱格式不正确"); */
    //         return false;
    //     }else{
    //         show_validate_msg("#email_add_input", "success", "");
    //     }
    //     return true;
    // }

    // //显示校验结果的提示信息
    // function show_validate_msg(ele,status,msg){
    //     //清除当前元素的校验状态
    //     $(ele).parent().removeClass("has-success has-error");
    //     $(ele).next("span").text("");
    //     if("success"==status){
    //         $(ele).parent().addClass("has-success");
    //         $(ele).next("span").text(msg);
    //     }else if("error" == status){
    //         $(ele).parent().addClass("has-error");
    //         $(ele).next("span").text(msg);
    //     }
    // }

    //校验用户名是否可用
    <%--$("#empName_add_input").change(function(){--%>
        <%--//发送ajax请求校验用户名是否可用--%>
        <%--var empName = this.value;--%>
        <%--$.ajax({--%>
            <%--url:"${APP_PATH}/checkuser",--%>
            <%--data:"empName="+empName,--%>
            <%--type:"POST",--%>
            <%--success:function(result){--%>
                <%--if(result.code==100){--%>
                    <%--show_validate_msg("#empName_add_input","success","用户名可用");--%>
                    <%--$("#emp_save_btn").attr("ajax-va","success");--%>
                <%--}else{--%>
                    <%--show_validate_msg("#empName_add_input","error",result.extend.va_msg);--%>
                    <%--$("#emp_save_btn").attr("ajax-va","error");--%>
                <%--}--%>
            <%--}--%>
        <%--});--%>
    <%--});--%>

    //点击保存，保存客户。
    $("#custom_save_btn").click(function() {
        // var sendData = {
        //     "customname": "BeJson",
        //     "id": 4,
        //     "gender": "'M'",
        //     "birthday": "'2018-03-11'",
        //     "phone": 3423,
        //     "address": "'方法'"
        // };
        // var formArray = $("#empAddModal form").serializeArray();
        // var Data = arrayToJson(formArray);
        var Data = $("#empAddModal form").serializeObject();
        $.ajax({
            url:"${APP_PATH}/Custom",
            type:"POST",
            dataType: 'json',
            contentType: 'application/json',
            //dataType: 'text',
            //contentType:'application/json;charset=UTF-8',
            // datatype:'json',
            data:JSON.stringify($("#empAddModal form").serializeObject()),
            //data:JSON.stringify($("#empAddModal form")),
            success:function(result) {
                // alert(result.msg);
                if(result.code == 100){
                    //员工保存成功；
                    //1、关闭模态框
                    $("#empAddModal").modal('hide');

                    //2、来到最后一页，显示刚才保存的数据
                    //发送ajax请求显示最后一页数据即可
                    to_mypage(totalRecord);
                }else{
                    // //显示失败信息
                    // //console.log(result);
                    // //有哪个字段的错误信息就显示哪个字段的；
                    // if(undefined != result.extend.errorFields.email){
                    //     //显示邮箱错误信息
                    //     show_validate_msg("#email_add_input", "error", result.extend.errorFields.email);
                    // }
                    // if(undefined != result.extend.errorFields.empName){
                    //     //显示员工名字的错误信息
                    //     show_validate_msg("#empName_add_input", "error", result.extend.errorFields.empName);
                    // }
                }
            }
        });

    });
    //点击保存，保存客户。
    $("#emp_save_btn").click(function(){
        // //1、模态框中填写的表单数据提交给服务器进行保存
        // //1、先对要提交给服务器的数据进行校验
        // if(!validate_add_form()){
        //     return false;
        // };
        // //1、判断之前的ajax用户名校验是否成功。如果成功。
        // if($(this).attr("ajax-va")=="error"){
        //     return false;
        // }

        //2、发送ajax请求保存客户
        $.ajax({
            url:"${APP_PATH}/custom/update/",
            type:"POST",
            data:$("#empAddModal form").serialize(),
            success:function(result){
                //alert(result.msg);
                if(result.code == 100){
                    //客户保存成功；
                    //1、关闭模态框
                    $("#empAddModal").modal('hide');

                    //2、来到最后一页，显示刚才保存的数据
                    //发送ajax请求显示最后一页数据即可
                    to_mypage(totalRecord);
                }else{
                    //显示失败信息
                    //console.log(result);
                    //有哪个字段的错误信息就显示哪个字段的；
                    if(undefined != result.extend.errorFields.email){
                        //显示邮箱错误信息
                        show_validate_msg("#email_add_input", "error", result.extend.errorFields.email);
                    }
                    if(undefined != result.extend.errorFields.empName){
                        //显示客户名字的错误信息
                        show_validate_msg("#empName_add_input", "error", result.extend.errorFields.empName);
                    }
                }
            }
        });
    });

    //1、我们是按钮创建之前就绑定了click，所以绑定不上。
    //1）、可以在创建按钮的时候绑定。    2）、绑定点击.live()
    //jquery新版没有live，使用on进行替代
    $(document).on("click",".edit_btn",function(){

        // $("#emp_update_btn").attr("edit-id",$(this).attr("edit-id"));
        $("input:hidden[name='id']").val($(this).attr("edit-id"));
        //填充信息
        $("#empUpdateModal form input").eq(1).val($(this).parents("tr").children('td').eq(2).prop("innerHTML"));
        $("#empUpdateModal form input").eq(2).val($(this).parents("tr").children('td').eq(5).prop("innerHTML"));
        $("#empUpdateModal form input").eq(3).val($(this).parents("tr").children('td').eq(6).prop("innerHTML"));
        if($(this).parents("tr").children('td').eq(3).html() == '男'){
            //$("#woman").removeAttr("checked");
            $("#man").prop("checked","true");

            // alert("man");
        }else{
            //$("#man").removeAttr("checked");
            $("#woman").prop("checked","true");

            // alert("woman");
        }
        // $("#empUpdateModal form input").eq(4).val($(this).parents("tr").children('td').eq(3).val());
        $("#empUpdateModal form input").eq(6).val($(this).parents("tr").children('td').eq(4).html().substring(0,10));
        $("#empUpdateModal").modal({
            backdrop:"static"
        });
    });

    function getEmp(id){
        $.ajax({
            url:"${APP_PATH}/emp/"+id,
            type:"GET",
            success:function(result){
                //console.log(result);
                var empData = result.extend.emp;
                $("#empName_update_static").text(empData.empName);
                $("#email_update_input").val(empData.email);
                $("#empUpdateModal input[name=gender]").val([empData.gender]);
                $("#empUpdateModal select").val([empData.dId]);
            }
        });
    }

    //点击更新，更新客户信息
    $("#emp_update_btn").click(function(){
        //填充以前的信息
        //填充id
        var sendData = $("#empUpdateModal form").serializeObject();
        sendData._method = "put"
        // $("input:hidden[name='id']").val($(this).attr("edit-id"));
        $.ajax({
            url:"${APP_PATH}/custom/update",
            type:"POST",
            dataType: 'json',
            contentType: 'application/json',
            data:JSON.stringify(sendData),
            success:function(result){
                //alert(result.msg);
                //1、关闭对话框
                $("#empUpdateModal").modal("hide");
                //2、回到本页面
                //currentPage = result.extend.pageInfo.pageNum;
                to_mypage(totalRecord);
            }
        });
    });

    //单个删除
    $(document).on("click",".delete_btn",function(){
        //1、弹出是否确认删除对话框
        // var empName = $(this).parents("tr").find("td:eq(2)").text();
        var customId = $(this).attr("del-id");
        //alert($(this).parents("tr").find("td:eq(1)").text());
        if(confirm("确认删除【"+customId+"】吗？")){
            //确认，发送ajax请求删除即可
            $.ajax({
                url:"${APP_PATH}/custom/delete/"+customId,
                type:"POST",
                success:function(result){
                    // alert(result.msg);
                    //回到本页
                    to_mypage(totalRecord);
                }
            });
        }
    });

    //完成全选/全不选功能
    $("#check_all").click(function(){
        //attr获取checked是undefined;
        //我们这些dom原生的属性；attr获取自定义属性的值；
        //prop修改和读取dom原生属性的值
        $(".check_item").prop("checked",$(this).prop("checked"));
    });

    //check_item
    $(document).on("click",".check_item",function(){
        //判断当前选择中的元素是否5个
        var flag = $(".check_item:checked").length==$(".check_item").length;
        $("#check_all").prop("checked",flag);
    });

    //点击全部删除，就批量删除
    $("#emp_search_all_btn").click(function(){

        $.ajax({
            url:"${APP_PATH}/custom/search",
            type:"POST",
            dataType: 'json',
            contentType: 'application/json',
            data:JSON.stringify($("#serach_form form").serializeObject()),
            success:function(result){
                // alert(result.msg);
                //回到当前页面
                // to_mypage(1);
                //1、解析并显示客户数据
                build_myemps_table(result);
                //2、解析并显示分页信息
                build_page_info(result);
                //3、解析显示分页条数据
                build_page_nav(result);
            }
        });
        //
        <%--var empNames = "";--%>
        <%--var del_idstr = "";--%>
        <%--$.each($(".check_item:checked"),function(){--%>
            <%--//this--%>
            <%--empNames += $(this).parents("tr").find("td:eq(2)").text()+",";--%>
            <%--//组装客户id字符串--%>
            <%--del_idstr += $(this).parents("tr").find("td:eq(1)").text()+"-";--%>
        <%--});--%>
        <%--//去除empNames多余的,--%>
        <%--empNames = empNames.substring(0, empNames.length-1);--%>
        <%--//去除删除的id多余的---%>
        <%--del_idstr = del_idstr.substring(0, del_idstr.length-1);--%>
        <%--if(confirm("确认删除【"+empNames+"】吗？")){--%>
            <%--//发送ajax请求删除--%>
            <%--$.ajax({--%>
                <%--url:"${APP_PATH}/emp/"+del_idstr,--%>
                <%--type:"DELETE",--%>
                <%--success:function(result){--%>
                    <%--alert(result.msg);--%>
                    <%--//回到当前页面--%>
                    <%--to_mypage(currentPage);--%>
                <%--}--%>
            <%--});--%>
        <%--}--%>
    });
</script>
</body>
</html>