<!DOCTYPE html>
<html>
<head>
    <!-- <script src="${basePath}/js/jquery.min.js" type="text/javascript"></script> -->
    <link href="${basePath}/css/layui.css" rel="stylesheet" type="text/css">
    <script src="${basePath}/js/layui.all.js" type="text/javascript"></script>
    <style>
        .search {
            cursor: pointer;
        }

        th {
            font-color: #F0F0F0;
        }
    </style>
    <title>新来电:${caller}</title>
</head>
<body onload="init()">
<div id="workOrder" class="layui-form" style="display:none;text-align: center">
    <div class="layui-inline layui-form-pane" id="gdlx">
        <label class="layui-form-label">工单类型</label>
        <div class="layui-input-inline">
            <select name="modules" id="select" lay-filter="gdlx" lay-search="">
                <option value="">工单类型</option>
            </select>
        </div>
    </div>
    <button class="layui-btn" id="realGd" style="float: right;margin-top: 20px;margin-right: 20px">
        确认生成工单
    </button>
</div>
<div id="user_info" STYLE="text-align: center">
    <table class="layui-table">
        <thead>
        <tr>
            <th style="width: 130px;text-align: center;font-weight: bold;">电话号码</th>
            <th style="width: 130px;text-align: center;font-weight: bold;">报告人</th>
            <th style="width: 150px;text-align: center;font-weight: bold;">单位</th>
            <th style="width: 170px;text-align: center;font-weight: bold;">部门</th>
            <th style="width: 130px;text-align: center;font-weight: bold;">服务组</th>
            <th style="width: 130px;text-align: center;font-weight: bold;">咨询系统</th>
            <th style="width: 150px;text-align: center;font-weight: bold;">时间</th>
        </tr>
        </thead>
        <tbody id="userInfo">
        <tr id="data1">
            <td><input id="caller" class="layui-input" type='text'></td>
        <#--<span-->
        <#--onclick="searchPerson()" style="float: left;font-size: 30px;margin-top: 10px;margin-left: 5px"-->
        <#--class="layui-icon search">&#xe615;</span>-->
            <td>
                <input style="width: 75%;float: left" class="layui-input" id="baoGaoRen" type='text'>
                <span class="search" onclick="searchPerson()"><img style="width: 35px"
                                                                   src="../static/images/s13.png"></span>
            </td>
            <td id="unit" style="text-align: center"></td>
            <td id="buMen" style="text-align: center"></td>
            <td><input style="width: 100%;float: left" class="layui-input" readonly="readonly" type='text'
                       value="${fwz!}" id="fuWuZu"></td>
        <#--<span onclick="searchCommodities()" style="float: left;font-size: 30px;margin-top: 10px;margin-left: 5px" class="layui-icon search">&#xe615;</span>-->
        <#--<span onclick="searchZxt()"-->
        <#--style="float: left;font-size: 30px;margin-top: 10px;margin-left: 5px"-->
        <#--class="layui-icon search">&#xe615;</span>-->
            <td><input style="width: 75%;float: left" class="layui-input" readonly="readonly" type='text'
                       id="ziXunXiTong">
                <span class="search" onclick="searchZxt()"><img style="width: 35px"
                                                                src="../static/images/s13.png"></span>
            </td>
            <td id='time' style="text-align: center"></td>
        </tr>
        <tr>
            <td style="font-weight: bold;">摘要信息</td>
            <td colspan="6">
                <input id="info" placeholder="请输入摘要" class="layui-input" type="text"></input>

            </td>
        </tr>
        <tr>
            <td style="font-weight: bold;">详细信息</td>
            <td colspan="6"><input class="layui-input" id="xxinfo"></input></td>
        </tr>
        <tr>
            <td style="font-weight: bold;">原因</td>
            <td colspan="6">
                <input id="yy" placeholder="请输入原因" class="layui-input" type="text"></input>

            </td>
        </tr>
        <tr>
            <td style="font-weight: bold;">解决方案</td>
            <td colspan="6">
                <input id="jjfa" placeholder="请输入解决方案" class="layui-input" type="text"></input>

            </td>
        </tr>
        <tr>
            <td style="font-weight: bold;">备注</td>
            <td colspan="6"><input class="layui-input" id="beiZhu"></input></td>
        </tr>
        <tr>
            <td colspan="7" style="text-align: center">
                <button class="layui-btn" id="gd">生成工单</button>
                <button class="layui-btn" onclick="unBuild()">不生成工单</button>
                <button class="layui-btn" onclick="save()">保存</button>
            </td>
        </tr>
        </tbody>
    </table>
</div>
<div class="layui-card-body" id="person1" style="display: none">
    <!-- 条件查询 -->
    <span class="layui-btn" style="background-color :rgba(255,255,255,0);width: 100%;float: left">
        <input type="text" style="float: left;width: 200px;margin-left: 20px" id="personId" lay-verify="title"
               autocomplete="off" placeholder="请输入人员"
               class="layui-input" onkeypress="searchP()">
        <input type="text" style="float: left;width: 200px;margin-left: 20px" id="name" lay-verify="title"
               autocomplete="off" placeholder="请输入名称"
               class="layui-input" onkeypress="searchP()">
        <input type="text" style="float: left;width: 200px;margin-left: 20px" id="department" lay-verify="title"
               autocomplete="off" placeholder="请输入部门"
               class="layui-input" onkeypress="searchP()">
        <button class="layui-btn" style="float: left;margin-left: 20px" onclick="searchP()">搜索</button>
    </span>
    <div style="padding-top: 38px">
        <table id="person" lay-filter="demoEvent" style="padding-top: 10px"></table>
    </div>
</div>
<#--关键用户-->
<div class="layui-card-body" id="gjyh1" style="display: none">
    <!-- 条件查询 -->
    <span class="layui-btn" style="background-color :rgba(255,255,255,0);width: 100%;float: left">
        <input type="text" style="float: left;width: 200px;margin-left: 20px" lay-verify="title"
               autocomplete="off" placeholder="请输入人员"
               class="layui-input" id="g_personid" onkeypress="searchUser()">
        <input type="text" style="float: left;width: 200px;margin-left: 20px" lay-verify="title"
               autocomplete="off" id="g_displayname" placeholder="请输入名称"
               class="layui-input" onkeypress="searchUser()">
        <input type="text" style="float: left;width: 200px;margin-left: 20px" lay-verify="title"
               autocomplete="off" id="g_department" placeholder="请输入部门"
               class="layui-input" onkeypress="searchUser()">
        <button class="layui-btn" style="float: left;margin-left: 20px" onclick="searchUser()">搜索</button>
    </span>
    <div style="padding-top: 38px">
        <table id="t_gjyh" lay-filter="gjyhEvent" style="padding-top: 10px"></table>
    </div>
</div>


<div class="layui-card-body" id="zxt1" style="display: none">

    <span class="layui-btn" style="background-color :rgba(255,255,255,0);width: 100%;float: left">
        <input type="text" style="float: left;width: 200px;margin-left: 20px" id="zxt2" lay-verify="title"
               autocomplete="off" placeholder="请输入咨询系统"
               class="layui-input" onkeypress="searchZ()">
        <button class="layui-btn" style="" onclick="searchZ()">搜索</button>
    </span>

    <div style="padding-top: 38px">
        <table id="zxt" lay-filter="zxtEvent"></table>
    </div>
</div>


<div class="layui-card-body" id="commodities1" style="display: none">
    <span class="layui-btn" style="background-color :rgba(255,255,255,0);width: 100%;float: left">
        <input type="text" style="float: left;width: 200px;margin-left: 20px" id="commodities2" lay-verify="title"
               autocomplete="off" placeholder="请输入服务组"
               class="layui-input" onkeypress="searchC()">
        <button class="layui-btn" style="" onclick="searchC()">搜索</button>
    </span>
    <div style="padding-top: 38px">
        <table id="commodities" lay-filter="comEvent"></table>
    </div>
</div>
</body>
<script>
    function IEVersion() {
        var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串
        var isIE = userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1; //判断是否IE<11浏览器
        var isEdge = userAgent.indexOf("Edge") > -1 && !isIE; //判断是否IE的Edge浏览器
        var isIE11 = userAgent.indexOf('Trident') > -1 && userAgent.indexOf("rv:11.0") > -1;
        if (isIE) {
            var reIE = new RegExp("MSIE (\\d+\\.\\d+);");
            reIE.test(userAgent);
            var fIEVersion = parseFloat(RegExp["$1"]);
            if (fIEVersion == 7) {
                return 7;
            } else if (fIEVersion == 8) {
                return 8;
            } else if (fIEVersion == 9) {
                return 9;
            } else if (fIEVersion == 10) {
                return 10;
            } else {
                return 6;//IE版本<=7
            }
        } else if (isEdge) {
            return 'edge';//edge
        } else if (isIE11) {
            return 11; //IE11
        } else {
            return -1;//不是ie浏览器
        }
    }
</script>
<script>
    var $ = layui.jquery;

    function save() {
        var beiZhu = $("#beiZhu").val();
        var baoGao = $("#baoGaoRen").attr("userNameEn");
        var uinit = $("#unit").text();
        var buMen = $("#buMen").text();
        var fuWuZu = $("#fuWuZu").attr("com");
        var ziXun = $("#ziXunXiTong").attr("zxt");
        var info = $("#info").val();
        var callId = '${callId}';
        var luId = '${luId}';
        if (info == "请输入摘要") {
            info = "";
        }
        var time = $("#time").text();
        var caller = $("#caller").val();
        $.ajax({
            type: "POST",
            url: "${basePath}/seat/saveCall",
            data: {
                "beiZhu": beiZhu,
                "info": info,
                "time": time,
                "caller": caller,
                "baoGao": baoGao,
                "uinit": uinit,
                "buMen": buMen,
                "fuWuZu": fuWuZu,
                "ziXun": ziXun,
                "callId": callId,
                "luId": luId,
                "status": "WAPPER",
                "id": GetQueryString("repositoryId")
            },
            success: function (msg) {
                //layer.alert("保存成功！");
                layer.alert('保存成功！', function () {
                    window.close();
                });
            }
        });
    }
</script>
<script>
    var table;
    var person;
    var zxt;
    var gjyh;
    var $ = layui.jquery;

    function searchC() {
        var name = $("#commodities2").val();
        layui.use('table', function () {
            table = layui.table;
            table.render({
                elem: '#commodities'
                , id: 'commodities'
                , where: {"name": name}
                , url: '${basePath}/com/findByWhere' //数据接口
                , page: true //开启分页
                , cols: [[ //表头
                    {
                        field: 'commodity',
                        title: 'ID',
                        width: 200,
                        align: 'center',
                        event: 'comZxt',
                        style: 'cursor: pointer;'
                    }
                    , {
                        field: 'description',
                        title: '服务组',
                        align: 'center',
                        width: 230,
                        event: 'comZxt',
                        style: 'cursor: pointer;'
                    }
                ]],
                done: function () {
                    $("th").css({'font-weight': 'bold'});
                }
            });

        });
    }

    //搜索关键用户
    function searchUser() {
        var personid = $("#g_personid").val();
        if (personid == "请输入人员") {
            personid = "";
        }
        var name = $("#g_displayname").val();
        if (name == "请输入名称") {
            name = "";
        }
        var department = $("#g_department").val();
        if (department == "请输入部门") {
            department = "";
        }
        layui.use('table', function () {
            table = layui.table;
            table.render({
                elem: '#t_gjyh'
                , id: 't_gjyh'
                //,height: 315
                //,height:'full-155'
                , offset: 'auto'
                , where: {"personid": personid, "displayname": name, "department": department}
                , url: '${basePath}/workOrder/searchByWhere' //数据接口
                , page: true //开启分页
                , cols: [[ //表头
                    {
                        field: 'PERSONID',
                        title: '人员',
                        event: 'setSign',
                        width: 300,
                        align: 'center',
                        style: 'cursor: pointer;'
                    }
                    , {
                        field: 'DISPLAYNAME',
                        title: '名称',
                        align: 'center',
                        width: 130,
                        event: 'setSign',
                        style: 'cursor: pointer;'
                    }
                    , {
                        field: 'DEPARTMENT',
                        title: '部门',
                        align: 'center',
                        width: 300,
                        event: 'setSign',
                        style: 'cursor: pointer;'
                    }

                ]],
                done: function () {
                    $("th").css({'font-weight': 'bold'});
                }
            });

        });
    }

    function searchZ() {
        var name1 = $("#zxt2").val();
        if (name1 == "请输入咨询系统") {
            name1 = "";
        }
        layui.use('table', function () {
            table = layui.table;
            table.render({
                elem: '#zxt'
                , id: 'zxt'
                , offset: 'auto'
                , where: {"name": name1, "value": '${fwz}'}
                , url: '${basePath}/zxt/findByWhere' //数据接口
                , page: true //开启分页
                , cols: [[ //表头
                    {
                        field: 'value',
                        title: 'ID',
                        width: 200,
                        align: 'center',
                        event: 'chooseZxt',
                        style: 'cursor: pointer;'
                    }
                    , {
                        field: 'description',
                        title: '咨询系统',
                        align: 'center',
                        width: 230,
                        event: 'chooseZxt',
                        style: 'cursor: pointer;'
                    }
                ]],
                done: function () {
                    $("th").css({'font-weight': 'bold'});
                }
            });

        });
    }

    function searchP() {
        var personid = $("#personId").val();
        if (personid == "请输入人员") {
            personid = "";
        }
        var name = $("#name").val();
        if (name == "请输入名称") {
            name = "";
        }
        var department = $("#department").val();
        if (department == "请输入部门") {
            department = "";
        }
        layui.use('table', function () {
            table = layui.table;
            table.render({
                elem: '#person'
                , id: 'personWhere'
                //,height: 315
                //,height:'full-155'
                , offset: 'auto'
                , where: {"personid": personid, "displayname": name, "department": department}
                , url: '${basePath}/person/findPersonByWhere' //数据接口
                , page: true //开启分页
                , cols: [[ //表头
                    {
                        field: 'personid',
                        title: '人员',
                        event: 'setSign',
                        width: 200,
                        align: 'center',
                        style: 'cursor: pointer;'
                    }
                    , {
                        field: 'displayname',
                        title: '名称',
                        align: 'center',
                        width: 130,
                        event: 'setSign',
                        style: 'cursor: pointer;'
                    }
                    , {field: 'department', title: '部门', event: 'setSign', width: 210, style: 'cursor: pointer;'}

                ]],
                done: function () {
                    $("th").css({'font-weight': 'bold'});
                }
            });

        });
    }

    //默认咨询系统
    function zxtDef(fwz) {
        var zxt = '';
        if (fwz === 3) {
            zxt = fwz + 3;
        } else {
            zxt = fwz + 1;
        }
        $.ajax({
            type: "POST",
            url: "${basePath}/zxt/findById",
            data: "zxt=" + zxt,
            success: function (data) {
                $("#data1 td input:eq(3)").val(data.description);
                $("#data1 td input:eq(3)").attr("zxt", data.value);
            }
        })
    }

    function init() {
        if (IEVersion() < 11) {
            var pHolder = $("#personId").attr("placeholder");
            var nameHolder = $("#name").attr("placeholder");
            var depHolder = $("#department").attr("placeholder");
            var infoHolder = $("#info").attr("placeholder");
            var zxtHolder = $("#zxt2").attr("placeholder");
            $("#personId").val(pHolder).addClass("hint");
            $("#name").val(nameHolder).addClass("hint");
            $("#department").val(depHolder).addClass("hint");
            $("#info").val(infoHolder).addClass("hint");
            $("#zxt2").val(zxtHolder).addClass("hint");

            $("#personId").focus(function () {
                if ($(this).val() == pHolder) {
                    $(this).val("").removeClass("hint");
                }
            }).blur(function () {
                if ($(this).val().trim() === "") {
                    $(this).val(pHolder).addClass("hint");
                }
            });

            $("#name").focus(function () {
                if ($(this).val() == nameHolder) {
                    $(this).val("").removeClass("hint");
                }
            }).blur(function () {
                if ($(this).val().trim() === "") {
                    $(this).val(nameHolder).addClass("hint");
                }
            });
            $("#department").focus(function () {
                if ($(this).val() == depHolder) {
                    $(this).val("").removeClass("hint");
                }
            }).blur(function () {
                if ($(this).val().trim() === "") {
                    $(this).val(depHolder).addClass("hint");
                }
            });
            $("#info").focus(function () {
                if ($(this).val() == infoHolder) {
                    $(this).val("").removeClass("hint");
                }
            }).blur(function () {
                if ($(this).val().trim() === "") {
                    $(this).val(infoHolder).addClass("hint");
                }
            });
            $("#zxt2").focus(function () {
                if ($(this).val() == zxtHolder) {
                    $(this).val("").removeClass("hint");
                }
            }).blur(function () {
                if ($(this).val().trim() === "") {
                    $(this).val(zxtHolder).addClass("hint");
                }
            });
        }
        var myDate = new Date();
        var time = myDate.getFullYear() + "-" + (myDate.getMonth() + 1) + "-" + myDate.getDate() + " " + myDate.getHours() + ":" + myDate.getMinutes() + ":" + myDate.getSeconds();
        var caller =${caller};
        $.ajax({
            type: "post",
            url: "${basePath}/seat/findUserInfoByTel",
            data: "tel=" + caller,
            async: true,
            dataType: "json",
            success: function (data) {
                console.log(data);

                $.ajax({
                    type: "post",
                    url: "${basePath}/com/findByCom",
                    data: "com=${fwz}",
                    async: true,
                    dataType: "json",
                    success: function (data) {
                        // console.log(data);
                        $("#data1 td input:eq(2)").val(data.description);
                    }
                });
                var zxt = '${fwz}';
                zxtDef(zxt);
                $("#data1 td input:eq(0)").val(${caller});
                $("#data1 td input:eq(2)").attr("com", '${fwz}');
                $("#data1 td:eq(6)").text(time);
                if (data.length <= 0) {
                    $("#data1 td:eq(2)").text('');
                    $("#data1 td:eq(3)").text('');
                    $("#data1 td input:eq(1)").val('');
                    $("#data1 td input:eq(1)").attr("userNameEn", '');
                } else {
                    for (var i = 0; i < data.length; i++) {
                        $("#data1 td:eq(2)").text(data[i].unit);
                        $("#data1 td:eq(3)").text(data[i].depname);
                        $("#data1 td input:eq(1)").val(data[i].usernamecn);
                        $("#data1 td input:eq(1)").attr("userNameEn", data[i].usernameen);

                    }
                }

            }
        });
    }

    function searchPerson() {
        layui.use('table', function () {
            table = layui.table;
            table.render({
                elem: '#person'
                , id: 'person'
                , offset: 'auto'
                , url: '${basePath}/person/findAllPerson' //数据接口
                , page: true //开启分页
                , cols: [[ //表头
                    {
                        field: 'personid',
                        title: '人员',
                        event: 'setSign',
                        width: 200,
                        align: 'center',
                        style: 'cursor: pointer;'
                    }
                    , {
                        field: 'displayname',
                        title: '名称',
                        align: 'center',
                        width: 130,
                        event: 'setSign',
                        style: 'cursor: pointer;'
                    }
                    , {field: 'department', title: '部门', event: 'setSign', width: 210, style: 'cursor: pointer;'}

                ]],
                done: function () {
                    $("th").css({'font-weight': 'bold'});
                }
            });

        });

        person = layer.open({
            type: 1,
            title: ["选择人员"],
            area: ['900px', '600px'],
            content: $("#person1"),
            end: function () {
                $("#person1").hide();
            }
        });
    }

    //搜索关键用户
    function searchGjyh() {
        layui.use('table', function () {
            table = layui.table;
            table.render({
                elem: '#t_gjyh'
                , id: 't_gjyh'
                , offset: 'auto'
                , url: '${basePath}/workOrder/searchGjyh' //数据接口
                , page: true //开启分页
                , cols: [[ //表头
                    {
                        field: 'PERSONID',
                        title: '人员',
                        event: 'setSign',
                        width: 300,
                        align: 'center',
                        style: 'cursor: pointer;'
                    }
                    , {
                        field: 'DISPLAYNAME',
                        title: '名称',
                        align: 'center',
                        width: 130,
                        event: 'setSign',
                        style: 'cursor: pointer;'
                    }
                    , {
                        field: 'DEPARTMENT',
                        title: '部门',
                        align: 'center',
                        width: 300,
                        event: 'setSign',
                        style: 'cursor: pointer;'
                    }

                ]],
                done: function () {
                    $("th").css({'font-weight': 'bold'});
                }
            });

        });

        gjyh = layer.open({
            type: 1,
            title: ["选择关键人员"],
            area: ['900px', '600px'],
            content: $("#gjyh1"),
            end: function () {
                $("#gjyh1").hide();
            }
        });
    }

    function searchZxt() {
        layui.use('table', function () {
            table = layui.table;
            table.render({
                elem: '#zxt'
                , id: 'zxt'
                //,height: 315
                //,height:'full-155'
                , offset: 'auto'
                , url: '${basePath}/zxt/findAllZxt' //数据接口
                , page: true //开启分页
                , where: {"value": '${fwz}'}
                , cols: [[ //表头
                    {
                        field: 'value',
                        title: 'ID',
                        width: 200,
                        align: 'center',
                        event: 'chooseZxt',
                        style: 'cursor: pointer;'
                    }
                    , {
                        field: 'description',
                        title: '咨询系统',
                        align: 'center',
                        width: 230,
                        event: 'chooseZxt',
                        style: 'cursor: pointer;'
                    }
                ]],
                done: function () {
                    $("th").css({'font-weight': 'bold'});
                }
            });

        });
        zxt = layer.open({
            type: 1,
            title: ["选择咨询系统"],
            area: ['500px', '600px'],
            content: $("#zxt1"),
            end: function () {
                $("#zxt1").hide();
            }
        });
    }
</script>
<script>
    var $ = layui.jquery;
    layui.use('table', function () {
        table = layui.table;
        //监听单元格事件
        table.on('tool(demoEvent)', function (obj) {
            var data = obj.data;

            if (obj.event === 'setSign') {
                //layer.msg(data.locationsite);
                $.ajax({
                    type: "post",
                    url: "${basePath}/person/findUnitBySite",
                    data: "id=" + data.locationsite,
                    async: true,
                    dataType: "json",
                    success: function (data) {
                        $("#data1 td:eq(2)").text(data.description);
                    }
                });
                $("#data1 td input:eq(1)").val(data.displayname);
                $("#data1 td input:eq(1)").attr("userNameEn", data.personid);
                $("#data1 td:eq(3)").text(data.department);
                layer.close(person);
            }
        });
        table.on('tool(gjyhEvent)', function (obj) {
            var data = obj.data;
            console.log(data);
            if (obj.event === 'setSign') {
                //layer.msg(data.locationsite);
                $("#p_gjyh").val(data.DISPLAYNAME);
                $("#p_gjyh").attr("personid",data.PERSONID);
                layer.close(gjyh);
            }
        });
        table.on('tool(zxtEvent)', function (obj) {
            var data = obj.data;
            if (obj.event === 'chooseZxt') {
                //layer.msg(data.value);
                $("#data1 td input:eq(3)").val(data.description);
                $("#data1 td input:eq(3)").attr("zxt", data.value);
                layer.close(zxt);
            }
        });
    });
</script>
<script>
    var temp = 1;
    layui.use('form', function () {
        var form = layui.form;
        $("#gd").on('click', function () {
            form.render();
            var t = layer.open({
                type: 1,
                title: ["选择工单类型"],
                area: ['430px', '320px'],
                content: $("#workOrder"),
                success: function () {
                    if (temp == 1) {
                        $.ajax({
                            type: "POST",
                            url: "${basePath}/workOrder/findAll",
                            success: function (data) {
                                $("#select option").not(":first").empty();
                                for (var i = 0; i < data.length; i++) {
                                    $("#select").append("<option value='" + data[i].value + "'>" + data[i].description + "</option>");
                                }
                                form.render();
                            }
                        });
                        temp++;
                    }
                },
                end: function () {
                    layer.close(t);
                }
            });
        });
    })
</script>
<#--监听下拉框改变事件-->
<script>
    var qqlx = '';
    layui.use('form', function () {
        var form = layui.form;
        var $ = layui.$;
        var option1 = '<div class="layui-inline layui-form-pane"  id="qqlx">\n' +
                '        <label class="layui-form-label">请求类型</label>\n' +
                '        <div class="layui-input-inline">\n' +
                '            <select name="modules" id="s_qqlx" lay-filter="qqlx" lay-search="">\n' +
                '                <option value="">请求类型</option>\n' +
                '            </select>\n' +
                '        </div>\n' +
                '    </div>';
        var option2 = '<div class="layui-inline layui-form-pane"  id="fwqqfl">\n' +
                '        <label class="layui-form-label">服务请求分类</label>\n' +
                '        <div class="layui-input-inline">\n' +
                '            <select name="modules" id="qqtype" lay-filter="qqtype" lay-search="">\n' +
                '                <option value="">服务请求分类</option>\n' +
                '            </select>\n' +
                '        </div>\n' +
                '    </div>';
        var option3 = '<div class="layui-inline layui-form-pane"  id="sjlx">\n' +
                '        <label class="layui-form-label">事件类型</label>\n' +
                '        <div class="layui-input-inline">\n' +
                '            <select name="modules" id="s_sjlx" lay-filter="s_sjlx" lay-search="">\n' +
                '                <option value="">事件类型</option>\n' +
                '            </select>\n' +
                '        </div>\n' +
                '    </div>';
        var option4 = '<div class="layui-inline layui-form-pane" style="width: 321px;" id="gjyh"><label class="layui-form-label">关键用户</label><div class="layui-input-inline"><input style="width: 176px;float: left" class="layui-input" id="p_gjyh" type=\'text\' disabled>' +
                '<span class="search" onclick="searchGjyh()"><img style="width: 35px" src="../static/images/s13.png"></span></div></div>';
        var option5 = '';
        form.on('select(gdlx)', function (data) {
            // layer.alert(JSON.stringify(data));
            if (data.value == "PROBLEM") {//问题
                $(".layui-inline").not(":first").empty();
                // $("#gdlx").append(option3);

                form.render('select');
            } else if (data.value == "INCIDENT") {//事件
                $(".layui-inline").not(":first").empty();
                $("#gdlx").after(option3);
                $.ajax({
                    type: "POST",
                    url: "${basePath}/workOrder/incident",
                    success: function (data) {
                        //$("#c").empty();
                        for (var i = 0; i < data.length; i++) {
                            $("#s_sjlx").append("<option value='" + data[i].VALUE + "'>" + data[i].VALUE + "</option>");
                            form.render('select');
                        }
                    }
                })

            } else if (data.value == "SR") {//服务请求
                $(".layui-inline").not(":first").empty();
                $("#gdlx").after(option2);
                $("#gdlx").after(option1);
                $.ajax({
                    type: "POST",
                    url: "${basePath}/workOrder/sr",
                    success: function (data) {
                        for (var i = 0; i < data.length; i++) {
                            $("#s_qqlx").append("<option value='" + data[i].VALUE + "'>" + data[i].VALUE + "</option>");
                            form.render('select');
                        }
                    }
                })
            } else if (data.value == "") {
                $(".layui-inline").not(":first").empty();
            }
        });
        form.on('select(qqlx)', function (data) {
            qqlx = data.value;
            console.log(qqlx);
            $.ajax({
                type: "POST",
                url: "${basePath}/workOrder/sr/type",
                data: {"param": data.value},
                success: function (data) {
                    $("#qqtype option").not(":first").empty();
                    for (var i = 0; i < data.length; i++) {
                        $("#qqtype").append("<option value='" + data[i].VALUE + "'>" + data[i].VALUE + "</option>");
                    }
                    if (qqlx == '需求') {
                        $("#fwqqfl").after(option4);
                    } else {
                        $("#gjyh").remove();
                    }
                    form.render('select');
                }

            })
        })
    })
</script>
<#--工单生成-->
<script>
    var myDate = new Date();
    var time = myDate.getFullYear() + "-" + (myDate.getMonth() + 1) + "-" + myDate.getDate() + " " + myDate.getHours() + ":" + myDate.getMinutes() + ":" + myDate.getSeconds();
    layui.use('form', function () {
        var form = layui.form;
        var s_qqlx = '';
        var qqtype = '';
        var s_sjlx = '';
        form.on('select(qqtype)', function (data) {
            qqtype = data.value;
            console.log(qqtype);
        })
        form.on('select(s_sjlx)', function (data) {
            s_sjlx = data.value;
            // console.log(JSON.stringify(data));
        })
        $("#workOrder").on('click', '#realGd', function () {
            var baoGao = $("#baoGaoRen").attr("userNameEn");
            var gdlx = $("#select :checked").val();
            var info = $("#info").val();
            var gjyh=$("#p_gjyh").attr("personid");

            if (info == "请输入摘要") {
                info = "";
            }
            var xxinfo = $("#xxinfo").val();
            var yy = $("#yy").val();
            if (yy == "请输入原因") {
                yy = "";
            }
            var jjfa = $("#jjfa").val();
            if (jjfa == "请输入解决方案") {
                jjfa = "";
            }
            if (gjyh==""){
                layer.alert("关键用户不能为空！");
                return false;
            }
            // console.log(xxinfo+","+yy+","+jjfa);
            if (gdlx == "") {
                layer.alert("工单类型不能为空！");
                return false;

            } else if (gdlx == "SR") {
                if (qqlx == "") {
                    layer.alert("请求类型不能为空！");
                    return false;
                } else if(qqlx=="需求"){
                    //服务请求
                    var tables1 = {
                        UDTPYE: qqlx,
                        UDSRTYPE: qqtype,
                        REPORTEDBYID: baoGao,
                        REPORTEDPHONE: ${caller},
                        DESCRIPTION: info,
                        DESCRIPTION_LONGDESCRIPTION: xxinfo,
                        FR1CODE_LONGDESCRIPTION: yy,
                        FR2CODE_LONGDESCRIPTION: jjfa,
                        ACTUALFINISH: time,
                        UDRECORDID: GetQueryString("repositoryId"),
                        UDHQDEPT:gjyh
                    };
                    var param = {
                        personid: '${userId}',
                        type: 'SR', //工单类型
                        TABLES: tables1
                    };
                    $.ajax({
                        type: "POST",
                        url: "${basePath}/workOrder/add",
                        data: JSON.stringify(param),
                        dataType: 'json',
                        success: function (msg) {
                            realGd();
                            // console.log(msg.result);
                            // layer.alert("已生成工单！");
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            // alert(XMLHttpRequest.status);
                            // alert(XMLHttpRequest.readyState);
                            // alert(textStatus);
                            if (XMLHttpRequest.status == 200) {
                                layer.alert("联系人不存在，不能生成工单！")
                            }
                            // layer.alert(errorThrown);
                        },
                        complete: function (XMLHttpRequest, textStatus) {
                            this; // 调用本次AJAX请求时传递的options参数
                        }
                    })
                } else {
                    if (qqtype == "") {
                        layer.alert("服务请求分类不能为空！");
                        return false;
                    } else {
                        //服务请求
                        var tables1 = {
                            UDTPYE: qqlx,
                            UDSRTYPE: qqtype,
                            REPORTEDBYID: baoGao,
                            REPORTEDPHONE: ${caller},
                            DESCRIPTION: info,
                            DESCRIPTION_LONGDESCRIPTION: xxinfo,
                            FR1CODE_LONGDESCRIPTION: yy,
                            FR2CODE_LONGDESCRIPTION: jjfa,
                            ACTUALFINISH: time,
                            UDRECORDID: GetQueryString("repositoryId")
                        };
                        var param = {
                            personid: '${userId}',
                            type: 'SR', //工单类型
                            TABLES: tables1
                        };
                        $.ajax({
                            type: "POST",
                            url: "${basePath}/workOrder/add",
                            data: JSON.stringify(param),
                            dataType: 'json',
                            success: function (msg) {
                                realGd();
                                // console.log(msg.result);
                                // layer.alert("已生成工单！");
                            },
                            error: function (XMLHttpRequest, textStatus, errorThrown) {
                                // alert(XMLHttpRequest.status);
                                // alert(XMLHttpRequest.readyState);
                                // alert(textStatus);
                                if (XMLHttpRequest.status == 200) {
                                    layer.alert("联系人不存在，不能生成工单！")
                                }
                                // layer.alert(errorThrown);
                            },
                            complete: function (XMLHttpRequest, textStatus) {
                                this; // 调用本次AJAX请求时传递的options参数
                            }
                        })
                    }
                }
            } else if (gdlx == "INCIDENT") {
                if (s_sjlx == "") {
                    layer.alert("事件类型不能为空！");
                    return false;
                } else {

                    var tables2 = {
                        EXTERNALSYSTEM: "电话呼叫",
                        UDINCITYPE: s_sjlx,
                        REPORTEDBYID: baoGao,
                        REPORTEDPHONE: ${caller},
                        DESCRIPTION: info,
                        DESCRIPTION_LONGDESCRIPTION: xxinfo,
                        FR1CODE_LONGDESCRIPTION: yy,
                        FR2CODE_LONGDESCRIPTION: jjfa,
                        ACTUALFINISH: time,
                        UDCRTYPE: "一级",
                        ACTUALCONTACTDATE: time,
                        UDRECORDID: GetQueryString("repositoryId")
                    };
                    var param = {
                        personid: '${userId}',
                        type: 'INCIDENT', //工单类型
                        TABLES: tables2
                    };
                    $.ajax({
                        type: "POST",
                        url: "${basePath}/workOrder/add",
                        data: JSON.stringify(param),
                        dataType: 'json',
                        success: function (msg) {
                            realGd();
                            // layer.alert("已生成工单！");
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            // alert(XMLHttpRequest.status);
                            // alert(XMLHttpRequest.readyState);
                            // alert(textStatus);
                            if (XMLHttpRequest.status == 200) {
                                layer.alert("联系人不存在，不能生成工单！")
                            }
                            // layer.alert(errorThrown);
                        },
                        complete: function (XMLHttpRequest, textStatus) {
                            this; // 调用本次AJAX请求时传递的options参数
                        }
                    })
                }
            } else {
            <#--问题-->
                var tables = {
                    REPORTEDBYID: baoGao, //报告人
                    REPORTEDPHONE: ${caller},  //报告电话
                    DESCRIPTION: info,  //摘要
                    DESCRIPTION_LONGDESCRIPTION: xxinfo,  //详细摘要
                    FR1CODE_LONGDESCRIPTION: yy, //原因
                    FR2CODE_LONGDESCRIPTION: jjfa,  //解决方案
                    TARGETFINISH: time,  //计划结束时间
                    UDCRTYPE: '',  //等级程度
                    TARGETSTART: time,  //计划结束时间
                    UDZXT: $("#ziXunXiTong").attr("zxt"), //所属系统,
                    UDRECORDID: GetQueryString("repositoryId")
                };
                var param = {
                    personid: '${userId}',
                    type: 'PROBLEM', //工单类型
                    TABLES: tables
                };
                console.log(param);
                $.ajax({
                    type: "POST",
                    url: "${basePath}/workOrder/add",
                    data: JSON.stringify(param),
                    dataType: 'json',
                    success: function (msg) {
                        // console.log(msg);
                        realGd();
                        // layer.alert("已生成工单！");
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        // alert(XMLHttpRequest.status);
                        // alert(XMLHttpRequest.readyState);
                        // alert(textStatus);
                        if (XMLHttpRequest.status == 200) {
                            layer.alert("联系人不存在，不能生成工单！")
                        }
                        // layer.alert(errorThrown);
                    },
                    complete: function (XMLHttpRequest, textStatus) {
                        this; // 调用本次AJAX请求时传递的options参数
                    }
                })
            }
        })
    })
</script>
<#--保存通话记录-->
<script>
    var $ = layui.jquery;

    function realGd() {
        var xxinfo = $("#xxinfo").val();
        var yy = $("#yy").val();
        if (yy == "请输入原因") {
            yy = "";
        }
        var jjfa = $("#jjfa").val();
        if (jjfa == "请输入解决方案") {
            jjfa = "";
        }
        var beiZhu = $("#beiZhu").val();
        var baoGao = $("#baoGaoRen").attr("userNameEn");
        var uinit = $("#unit").text();
        var buMen = $("#buMen").text();
        var fuWuZu = $("#fuWuZu").attr("com");
        var ziXun = $("#ziXunXiTong").attr("zxt");
        var info = $("#info").val();
        var callId = '${callId}';
        var luId = '${luId}';
        var gdlx = $("#select :checked").val();
        var status = "close";
        if (info == "请输入摘要") {
            info = "";
        }
        var time = $("#time").text();
        var caller = $("#caller").val();
        $.ajax({
            type: "POST",
            url: "${basePath}/seat/saveCall",
            data: {
                "beiZhu": beiZhu,
                "info": info,
                "time": time,
                "caller": caller,
                "baoGao": baoGao,
                "uinit": uinit,
                "buMen": buMen,
                "fuWuZu": fuWuZu,
                "ziXun": ziXun,
                "callId": callId,
                "luId": luId,
                "gdlx": gdlx,
                "status": status,
                "yy": yy,
                "xxinfo": xxinfo,
                "jjfa": jjfa,
                "id": GetQueryString("repositoryId")
            },
            success: function (msg) {
                //layer.alert("保存成功！");
                layer.alert('已生成工单！', function () {
                    window.close();
                });
            }
        });
    }

    //不生成工单
    function unBuild() {
        var $ = layui.jquery;
        var xxinfo = $("#xxinfo").val();
        var yy = $("#yy").val();
        if (yy == "请输入原因") {
            yy = "";
        }
        var jjfa = $("#jjfa").val();
        if (jjfa == "请输入解决方案") {
            jjfa = "";
        }
        var beiZhu = $("#beiZhu").val();
        var baoGao = $("#baoGaoRen").attr("userNameEn");
        var uinit = $("#unit").text();
        var buMen = $("#buMen").text();
        var fuWuZu = $("#fuWuZu").attr("com");
        var ziXun = $("#ziXunXiTong").attr("zxt");
        var info = $("#info").val();
        var callId = '${callId}';
        var luId = '${luId}';
        var status = "appr";
        if (info == "请输入摘要") {
            info = "";
        }
        var time = $("#time").text();
        var caller = $("#caller").val();
        if (beiZhu == '') {
            layer.alert("注意：不生成工单的记录，请先在备注栏填写原因！")
        } else {
            $.ajax({
                type: "POST",
                url: "${basePath}/seat/saveCall",
                data: {
                    "beiZhu": beiZhu,
                    "info": info,
                    "time": time,
                    "caller": caller,
                    "baoGao": baoGao,
                    "uinit": uinit,
                    "buMen": buMen,
                    "fuWuZu": fuWuZu,
                    "ziXun": ziXun,
                    "callId": callId,
                    "luId": luId,
                    "status": status,
                    "yy": yy,
                    "xxinfo": xxinfo,
                    "jjfa": jjfa,
                    "id": GetQueryString("repositoryId")
                },
                success: function (msg) {
                    //layer.alert("保存成功！");
                    layer.alert('保存成功！', function () {
                        window.close();
                    });
                }
            });
        }

    }
</script>
<script>
    function GetQueryString(name) {

        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");

        var r = window.location.search.substr(1).match(reg);
        // console.log(r);
        if (r != null) {
            // console.log(unescape(r[2]));
            return unescape(r[2]);
        }
        return null;

    }
</script>
</html>