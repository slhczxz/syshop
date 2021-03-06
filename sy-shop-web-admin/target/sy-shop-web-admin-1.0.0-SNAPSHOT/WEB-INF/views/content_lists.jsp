<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>

    <title>我的商城 | 后台管理</title>
    <jsp:include page="../includes/header.jsp"/>


</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <jsp:include page="../includes/nav.jsp"/>
    <jsp:include page="../includes/menu.jsp"/>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                用户管理
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li class="active">用户列表</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">

            <c:if test="${baseResult.status==200}">
                <div class="row">
                    <div class="box-body">
                        <div class="alert alert-${baseResult.status==200?"success":"danger"} alert-dismissible">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                ${baseResult.message}
                        </div>
                    </div>
                </div>
            </c:if>


            <!-- Small boxes (Stat box) -->
            <!-- /.row -->
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title">用户列表</h3>

                        </div>
                        <div class="row">
                            <div class="col-sm-12" style="padding-left: 25px">
                                <a href="${pageContext.request.contextPath}/content/form" type="button" class="btn btn-sm btn-default"><i
                                        class="fa fa-plus"></i> 新增</a>&nbsp;&nbsp;
                                <a type="button" onclick="App.deleteItems('${pageContext.request.contextPath}/content/deletemulti')" class="btn btn-sm btn-default"><i
                                        class="fa fa-trash"></i> 删除</a>&nbsp;&nbsp;
                                <a type="button" class="btn btn-sm btn-default"><i class="fa fa-download"></i> 导入</a>&nbsp;&nbsp;
                                <a type="button" class="btn btn-sm btn-default"><i class="fa fa-upload"></i> 导出</a>


                            </div>

                        </div>
                        <!-- /.box-header -->
                            <div class="box-body form-horizontal">
                                <div class="col-sm-4 form-group">
                                    <label for="title" class="col-sm-3 control-label">标题</label>
                                    <div class="col-sm-8">
                                        <input class="form-control" id="title" placeholder="标题"/>
                                    </div>

                                </div>
                                <div class="col-sm-4 form-group">
                                    <label for="subTitle" class="col-sm-3 control-label">副标题</label>
                                    <div class="col-sm-8">
                                        <input class="form-control" id="subTitle" placeholder="副标题"/>
                                    </div>
                                </div>
                                <div class="col-sm-4 form-group">
                                    <label for="titleDesc" class="col-sm-3 control-label">标题描述</label>
                                    <div class="col-sm-8">
                                        <input class="form-control" id="titleDesc" placeholder="标题描述"/>
                                    </div>
                                </div>
                                <div class="box-tools">
                                    <button type="button" onclick="search()" class="btn  btn-primary btn-sm">搜索</button>
                                </div>
                            </div>

                        <div class="box-body table-responsive no-padding">
                            <table id="myDataTable" class="table table-hover">
                                <thead>
                                <tr>
                                    <th><input type="checkbox" class="minimal checkbox-master"></th>
                                    <th>ID</th>
                                    <th>分类</th>
                                    <th>标题</th>
                                    <th>副标题</th>
                                    <th>标题排序</th>
                                    <th>链接</th>
                                    <th>图片1</th>
                                    <th>图片2</th>
                                    <th>创建时间</th>
                                    <th>修改时间</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>

                            </table>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                </div>
            </div>
            <!-- /.row (main row) -->

        </section>
        <!-- /.content -->
    </div>
    <jsp:include page="../includes/copyright.jsp"/>


    <!-- Add the sidebar's background. This div must be placed
         immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->



<jsp:include page="../includes/footer.jsp"/>
<script src="${pageContext.request.contextPath}/static/js/app/App.js"></script>

<script>
    var columns = [
        {
            "data": function (row, type, val, meta) {
                return "<input type='checkbox' id='"+row.id+"' class='minimal '/>"
            }
        },
        {"data": "id"},
        {"data": "parent.name"},
        {"data": "title"},
        {"data": "subTitle"},
        {"data": "titleDesc"},
        {"data": function (row,type,val,meta) {
                if(row.url == ""){
                    return "";
                }else {
                    return ' <a href="'+row.url+'">查看</a>'}
            }},
        {"data": function (row,type,val,meta) {
                if(row.pic1==""){
                    return "";
                }else {
                    return ' <a href="'+row.pic+'">查看</a>'}
            }},
        {"data": function (row,type,val,meta) {
                if(row.pic2 == null){
                    return "";
                }else{
                    return ' <a href="'+row.pic2+'">查看</a>'
                }

            }},
        {"data": function (row, type, val, meta) {
                var date =  new Date(row.created);
                var time = date.getUTCFullYear()+"-"+date.getUTCMonth()+"-"+date.getUTCDay()+" "+date.getUTCHours()+":"+date.getMinutes()+":"+date.getUTCSeconds()
                return time;
            }},
        {"data": function (row, type, val, meta) {
                var date =  new Date(row.updated);
                var time = date.getUTCFullYear()+"-"+date.getUTCMonth()+"-"+date.getUTCDay()+" "+date.getUTCHours()+":"+date.getMinutes()+":"+date.getUTCSeconds()
                return time;
            }},
        {
            "data": function (row, type, val, meta) {
                return ' <button type="button" onclick="App.checkdatitl('+row.id+')" class="btn btn-sm btn-default"><i class="fa fa-search"></i>查看</button>' +
                    '&nbsp&nbsp<a href="/content/form?id='+row.id+'" type="button" class="btn btn-sm btn-primary"><i class="fa fa-edit"></i>编辑</a>' +
                    '&nbsp&nbsp<button type="button" onclick="App.checkdelet('+row.id+')" class="btn btn-sm btn-danger"><i class="fa fa-trash"></i>删除</button>'
            }
        }

    ]

    var dt = App.myDataTable(columns)

    function search() {
        var title = $("#title").val();
        var subTitle = $("#subTitle").val();
        var titleDesc = $("#titleDesc").val();
        var param = {
            "title":title,
            "subTitle":subTitle,
            "titleDesc":titleDesc
        };
       App.search(dt,param)
    }
   function btnModalClick(){
        App.btnModalClick()
    }
</script>
</body>
</html>
