<!DOCTYPE html>
<html>
<title>呼叫中心</title>
<head>
    <!--<script src="${basePath}/js/jquery.min.js" type="text/javascript"></script>-->
    <link href="${basePath}/css/layui.css" rel="stylesheet" type="text/css">
    <script src="${basePath}/js/layui.all.js" type="text/javascript"></script>
    <style type="text/css">
        #ref {
            cursor: pointer;
        }

        th {
            /*background-color: #009688;*/
            /*//font-size: 40px;*/
            font-weight: bold;
        }
    </style>
</head>
<body onload="init()">
<ul class="layui-nav layui-bg-green" lay-filter="">
    <li class="layui-nav-item">
        <button id="agent" class="layui-btn" onclick="setAgent()" style="font-weight: bold">签入</button>
    </li>
    <li class="layui-nav-item">
        <button class="layui-btn" id="zhiXian" onclick="zhiXian()" style="font-weight: bold">置闲</button>
    </li>
<#--<li class="layui-nav-item"><button class="layui-btn" onclick="testDelivered()">测试弹窗</button></li>-->
    <li class="layui-nav-item" style="float: right">
        <button class="layui-btn" onclick="openCall()" style="font-weight: bold">话务查询</button>
    </li>
</ul>
<#--width="0" height="0"-->
<OBJECT ID="RTsapiBar" width="0" height="0" codebase="${basePath}/RTsapiBar.cab#version=1,0,0,7"
        CLASSID="CLSID:6663C5E2-E0D8-4EA9-8871-1E4A28F6F1FA">

</OBJECT>
<div id="user_info" STYLE="display: none;text-align: center">
    <table class="layui-table">
        <thead>
        <tr>
            <th style="width: 130px;text-align: center;font-weight: bold;">电话号码</th>
            <th style="width: 60px;text-align: center;font-weight: bold;">报告人</th>
            <th style="width: 80px;text-align: center;font-weight: bold;">单位</th>
            <th style="width: 170px;text-align: center;font-weight: bold;">部门</th>
            <th style="width: 130px;text-align: center;font-weight: bold;">职位</th>
            <th style="width: 130px;text-align: center;font-weight: bold;">咨询系统</th>
            <th style="width: 230px;text-align: center;font-weight: bold;">时间</th>
        </tr>
        </thead>
        <tbody id="userInfo">
        <tr>
            <td>摘要信息</td>
            <td colspan="6"><input class="layui-input" type="text" id="info"></td>
        </tr>
        <tr>
            <td>备注</td>
            <td colspan="6"><input class="layui-input" type="text" id="beiZhu"></td>
        </tr>
        <tr>
            <td colspan="7" style="text-align: center">
                <button class="layui-btn" onclick="save()">保存</button>
            </td>
        </tr>
        </tbody>
    </table>
</div>
<div class="layui-card">
    <div class="layui-card-header layui-icon" style="color: rgba(84,82,83,0.95)">&#xe63b; 来电人员记录表<span title="刷新"
                                                                                                       id="ref"
                                                                                                       style="float: right;height: 15px;"><li
            style=" color: rgba(43,84,44,0.65);" class="layui-icon layui-icon-refresh" onclick="shua()"></li></span>
    </div>
    <div class="x-body" style="padding-top: 10px;width: 100%">
    <#--<xblock>-->
        <div class="layui-btn-group">
            <!-- 条件查询 -->
            <span class="layui-btn" style="background-color :rgba(255,255,255,0);width: 100%;float: left">
                    <button style="float: left" class="layui-btn" onclick="shua();"><i class="layui-icon">&#xe669;</i>刷新
                </button>
                        <input type="text" style="float: left;width: 200px;margin-left: 20px" id="FWZ"
                               lay-verify="title" autocomplete="off" placeholder="请输入服务组"
                               class="layui-input" onkeypress="search()">
                        <input type="text" style="float: left;width: 200px;margin-left: 20px" id="SSXT"
                               lay-verify="title" autocomplete="off" placeholder="请输入所属系统"
                               class="layui-input" onkeypress="search()">
                        <input type="text" style="float: left;width: 200px;margin-left: 20px" id="ZY" lay-verify="title"
                               autocomplete="off" placeholder="请输入摘要"
                               class="layui-input" onkeypress="search()">
                        <button class="layui-btn" style="float: left;margin-left: 20px" onclick="search()">搜索</button>
                </span>
        </div>
    <#--</xblock>-->
    </div>
    <div class="layui-card-body" style="padding-top: 0px">
        <table id="list" lay-filter="respository"></table>
    </div>

</div>

</body>
<script>
    function shua() {
        table.reload("listReload", { //此处是上文提到的 初始化标识id
            where: {
                key: {
                    'timestamp': (new Date()).valueOf()
                }
            }
        });
    }
</script>
<script>
    //注意：导航 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function () {
        var element = layui.element;
    });
</script>
<script language="JavaScript" for="RTsapiBar" event="InService()">
    //alert('aInService');
    /*注册连接CTI服务器事件的回调函数*/
    OnInService();
</script>
<script language="JavaScript" for="RTsapiBar" event="Delivered(callid,caller,called,alerting,reason,localstate,data)">
    //alert('aDelivered');
    /*呼叫振铃事件回调函数  */
    Delivered(callid, caller, called, alerting, reason, localstate, data);
</script>
<script language="JavaScript" for="RTsapiBar" event="Established(callid,caller,called,answer,reason,localstate,data)">
    //alert('aEstablished');
    /*呼叫接听事件回调函数  */
    Established(callid, caller, called, answer, reason, localstate, data);
</script>
<script language="JavaScript" for="RTsapiBar" event="AgentReady(cause,dev,agent,pw,queue)">
    //alert('AgentReady');
    /*注册座席示闲事件的回调函数  */
    AgentReady(cause, dev, agent, pw, queue);
</script>
<script language="JavaScript" for="RTsapiBar" event="AgentLoggedOn(cause,dev,agent,pw,queue)">
    //alert('aLoggedOn');
    /*注册座席登陆(签入)事件的回调函数 */
    AgentLoggedOn(cause, dev, agent, pw, queue);
</script>
<script language="JavaScript" for="RTsapiBar" event="AgentLoggedOff(cause,dev,agent,pw,queue)">
    //alert('AgentLoggedOff');
    /*注册座席登出(签出)事件的回调函数  */
    AgentLoggedOff(cause, dev, agent, pw, queue);
    // alert("成功");
</script>
<script language="JavaScript" for="RTsapiBar" event="AgentNotReady(cause,dev,agent,pw,queue)">
    //alert('AgentNotReady');
    /*注册座席示忙事件的回调函数  */
    AgentNotReady(cause, dev, agent, pw, queue);
</script>
<script language="JavaScript" for="RTsapiBar" event="AgentWorkNotReady(cause,dev,agent,pw,queue)">
    //alert('AgentWorkNotReady');
    /*座席工作示忙(事后手动置闲)事件回调函数 */
    AgentWorkNotReady(cause, dev, agent, pw, queue);
</script>
<script language="JavaScript" for="RTsapiBar" event="AgentWorkReady(cause,dev,agent,pw,queue)">
    //alert('AgentWorkReady');
    /*座席工作示闲(事后自动置闲)事件回调函数	 */
    AgentWorkReady(cause, dev, agent, pw, queue);
</script>
<script>
    layui.use('laydate', function () {
        var laydate = layui.laydate;
        //日期
        laydate.render({
            type: 'datetime',
            elem: '#strDate'
        });
        laydate.render({
            type: 'datetime',
            elem: '#endDate'
        });
    })
</script>
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
    var queueid;
    var seatid;
    var extension;
    var $ = layui.jquery;

    /**
     * 签入
     */
    function setAgent() {
        var state = $("#agent").text();
        if (state == "签出") {
            if (RTsapiBar.SetAgentState('', 1, 0) == 0) {
                $("#zhiXian").attr({"disabled": "disabled"});
                RTsapiBar.SetAgentState('', 2, 0)
            } else {
                alert("签出失败");
            }

        } else {
            if (RTsapiBar.SetAgentState('', 0, 0) == 0) {
                $("#zhiXian").attr("disabled", false);
                RTsapiBar.SetAgentState('', 3, 0)
            } else {
                alert("签入失败");
            }
        }

    }

    function zhiXian() {
        var state = $("#zhiXian").text();
        //alert(state);
        if (state == "置忙") {
            if (RTsapiBar.SetAgentState('', 2, 0) == 0) {
                //$("#zhiXian").text("置闲");
            } else {
                alert("置忙失败");
            }

        } else {
            if (RTsapiBar.SetAgentState('', 3, 0) == 0) {
                //$("#zhiXian").text("置忙");
            } else {
                alert("失败");
            }
        }
    }
</script>
<script>
    var $ = layui.jquery;

    var fwz = '';

    function init() {
        if (IEVersion() < 11) {
            var fwzHolder = $("#FWZ").attr("placeholder");
            var xtHolder = $("#SSXT").attr("placeholder");
            var zyHolder = $("#ZY").attr("placeholder");
            $("#FWZ").val(fwzHolder).addClass("hint");
            $("#SSXT").val(xtHolder).addClass("hint");
            $("#ZY").val(zyHolder).addClass("hint");

            $("#FWZ").focus(function () {
                if ($(this).val() == fwzHolder) {
                    $(this).val("").removeClass("hint");
                }
            }).blur(function () {
                if ($(this).val().trim() === "") {
                    $(this).val(fwzHolder).addClass("hint");
                }
            });

            $("#SSXT").focus(function () {
                if ($(this).val() == xtHolder) {
                    $(this).val("").removeClass("hint");
                }
            }).blur(function () {
                if ($(this).val().trim() === "") {
                    $(this).val(xtHolder).addClass("hint");
                }
            });
            $("#ZY").focus(function () {
                if ($(this).val() == zyHolder) {
                    $(this).val("").removeClass("hint");
                }
            }).blur(function () {
                if ($(this).val().trim() === "") {
                    $(this).val(zyHolder).addClass("hint");
                }
            });
        }

        $.ajax({
            type: "post",
            url: "${basePath}/seat/findSeat",
            data: "userId=${userId}",
            async: true,
            dataType: "json",
            success: function (data) {
                //console.log(data.extension, data.queueid, data.seatid);
                fwz = data.fwz;
                queueid = data.queueid;
                seatid = data.seatid;
                extension = data.extension;
                RTsapiBar.SetCTIServer("10.185.19.11");
                RTsapiBar.SetLocalDevice(data.extension);//连接分机
                RTsapiBar.SetAgent(data.seatid, "123456");//坐席ID为100
                RTsapiBar.SetQueue(data.queueid);//设置坐席ID的队列
                var ret = RTsapiBar.CreateCTIEnv();///ret返回0 表示请求正常
                if (ret == 0) {
                    //请求正常
                    if (RTsapiBar.SetAgentState("", 0, 0) == 0) {
                        //layer.msg("签入成功");
                        if (RTsapiBar.SetAgentState('', 3, 0) == 0) {

                        } //坐席100示闲，成功后报AgentReady事件
                        else {
                            layer.msg("示闲失败")
                        }
                    } else {
                        layer.msg("签入失败");
                    }

                } else {
                    layer.msg("连接CTI服务器失败!");
                }
            }

        });
    }

    function saveLog(caller, callid, lyid, usernameen, depname, fwz, udsystem, unit) {
        var id = 0;
    <#--var unit = '';-->
    <#--$.ajax({-->
    <#--type: "post",-->
    <#--url: "${basePath}/seat/findUserInfoByTel",-->
    <#--data: "tel=" + caller,-->
    <#--async: false,-->
    <#--dataType: "json",-->
    <#--success: function (data) {-->
    <#--// console.log(data[0]);-->
    <#--if (!data.length<=0){-->
    <#--unit = data[0].unit;-->
    <#--}-->

    <#--}-->
    <#--});-->

        $.ajax({
            type: "POST",
            url: "${basePath}/seat/saveLog",
            data: {
                "caller": caller,
                "callid": callid,
                "lyid": lyid,
                "usernameen": usernameen,
                "depname": depname,
                "fwz": fwz,
                "udsystem": udsystem,
                "unit": unit,
                "time": (new Date()).valueOf()
            },
            async: false,
            success: function (msg) {
                // console.log(msg);
                id = msg;
            }
        });
        return id;
    }

    function search() {
        var fwz = $("#FWZ").val();
        if (fwz == "请输入服务组") {
            fwz = "";
        }
        var zy = $("#ZY").val();
        if (zy == "请输入摘要") {
            zy = "";
        }
        var ssxt = $("#SSXT").val();
        if (ssxt == "请输入所属系统") {
            ssxt = "";
        }
        layui.use('table', function () {
            table = layui.table;
            table.render({
                elem: '#list'
                , id: 'listReload'
                , where: {"fwz": fwz, "zy": zy, "ssxt": ssxt}
                , url: '${basePath}/seat/findCallByWhere' //数据接口
                , page: true //开启分页
                , limit: 15 //每页显示得条数
                , limits: [15, 30, 45, 60, 75, 90]
                , cols: [[ //表头
                    {type: 'checkbox', fixed: 'left'}
                    , {field: 'repositoryid', title: '序号', width: 60, align: 'center'}
                    , {field: 'commoditygroup', title: '服务组', align: 'center', width: 180}
                    , {field: 'udsystem', title: '所属系统', align: 'center', width: 180}
                    , {field: 'description', title: '摘要', width: 410, align: 'left'}
                    , {field: 'person', title: '来电人员', width: 90, align: 'center'}
                    , {field: 'lxfs', title: '来电号码', width: 130, align: 'center'}
                    , {field: 'filterdate', title: '来电时间', width: 180, sort: true, align: 'center'}
                    , {field: 'department', title: '来电部门', width: 140, align: 'center'}
                    , {field: 'unit', title: '来电单位', align: 'center', width: 110}
                    , {field: 'callid', title: '通话ID', align: 'center', width: 110}
                    , {field: 'lyid', title: '录音ID', align: 'center', width: 180}
                    , {field: 'right', title: '操作', toolbar: '#look', align: 'center', width: 70}
                ]],
                done: function () {
                    $("th").css({'font-weight': 'bold'});
                }
            });

        });
    }
</script>

<script>
    var table;
    var $ = layui.jquery;
    layui.use('table', function () {
        table = layui.table;
        table.render({
            elem: '#list'
            , id: 'listReload'
            , url: '${basePath}/seat/findAllCall' //数据接口
            , page: true //开启分页
            , limit: 15 //每页显示得条数
            , limits: [15, 30, 45, 60, 75, 90]
            , cols: [[ //表头
                {type: 'checkbox', fixed: 'left'}
                , {field: 'repositoryid', title: '序号', width: 60, align: 'center'}
                , {field: 'commoditygroup', title: '服务组', align: 'center', width: 180}
                , {field: 'udsystem', title: '所属系统', align: 'center', width: 180}
                , {field: 'description', title: '摘要', width: 410, align: 'left'}
                , {field: 'person', title: '来电人员', width: 90, align: 'center'}
                , {field: 'lxfs', title: '来电号码', width: 130, align: 'center'}
                , {field: 'filterdate', title: '来电时间', width: 180, sort: true, align: 'center'}
                , {field: 'department', title: '来电部门', width: 140, align: 'center'}
                , {field: 'unit', title: '来电单位', align: 'center', width: 110}
                , {field: 'callid', title: '通话ID', align: 'center', width: 110}
                , {field: 'lyid', title: '录音ID', align: 'center', width: 180}
                , {field: 'right', title: '操作', toolbar: '#look', align: 'center', width: 70}
            ]],
            done: function () {
                $("th").css({'font-weight': 'bold'});
            }
        });

    });
</script>
<script type="text/html" id="look">
    <a class="layui-btn layui-btn-xs" lay-event="edit">查看</a>
</script>
<script>
    var $ = layui.jquery;

    function OnInService() {
    }

    function testDelivered() {
        Delivered('', '18783641236', '', '', '', '', '123456,123456');
    }

    /**
     * 振铃事件
     *
     * */
    function Delivered(callid, caller, called, alerting, reason, localstate, data) {
        if (caller != extension) {
            data = data.split(",")[0];
            var luId = data.substring(2);
            if (caller.length == 12) {
                caller = caller.substring(1, 12);
            } else if (caller.length == 4) {
                caller = caller.substring(1, 4);
                caller = '02882907' + caller;
            }
            var reId = 0;
            $.ajax({
                type: "post",
                url: "${basePath}/seat/findUserInfoByTel",
                data: "tel=" + caller,
                async: false,
                dataType: "json",
                success: function (data) {
                    var udsystem = '';
                    if (fwz === 'L' || fwz === 'S') {
                        udsystem = fwz + '2';
                    } else {
                        udsystem = fwz + '1';
                    }

                    if (data.length <= 0) {
                        reId = saveLog(caller, callid, luId, null, null, fwz, udsystem, '');
                    } else {
                        // for (var i = 0; i < data.length; i++) {
                        //解决通讯录有多条数据时，记录重复保存的问题

                        reId = saveLog(caller, callid, luId, data[0].usernameen, data[0].depname, fwz, udsystem, data[0].unit);
                        // }
                    }
                }
            });
            window.open("${basePath}/user/info?caller=" + caller + "&fwz=" + fwz + "&callId=" + callid + "&luId=" + luId + "&repositoryId=" + reId);
            shua();
        } else {
            // console.log("主叫");
        }
    }

    /*座席登陆(签入)事件 */
    function AgentLoggedOn(cause, dev, agent, pw, queue) {
        layer.msg("签入成功");
        $("#agent").text("签出");
    }

    function AgentReady(cause, dev, agent, pw, queue) {
        $("#zhiXian").text("置忙");
        layer.msg("示闲成功");
    }

    /*
    签出事件
     */
    function AgentLoggedOff(cause, dev, agent, pw, queue) {
        $("#agent").text("签入");
    }

    /*置忙*/
    function AgentNotReady(cause, dev, agent, pw, queue) {
        layer.msg("示忙成功");
        $("#zhiXian").text("置闲");

    }

    function AgentWorkNotReady(cause, dev, agent, pw, queue) {
        //座席工作示忙(事后手动置闲)
        if (RTsapiBar.SetAgentState('', 3, 0) == 0) {
        } else {
            alert("失败");
        }
    }

    function AgentWorkReady(cause, dev, agent, pw, queue) {
        //座席工作示忙(事后自动置闲)
        $("#zhiXian").text("置忙");
    }
</script>
<script>
    function openCall() {
        window.open("http://10.185.19.11/ccmp/stat/license.do");
        shua();
    }
</script>
<script>
    layui.use('table', function () {
        var table = layui.table;
        //监听表格复选框选择
        table.on('checkbox(respository)', function (obj) {
        });
        //监听工具条
        table.on('tool(respository)', function (obj) {
            var data = obj.data;

            if (obj.event === 'edit') {
                $("#userInfo tr").remove();
                $("#userInfo").prepend("<tr><td>" + data.lxfs + "</td><td>" + data.person + "</td><td>" + data.unit + "</td><td>" + data.department + "</td><td>" + data.zhiWei + "</td><td>" + data.udsystem + "</td><td>" + data.filterdate + "</td></tr>");
                $("#userInfo").append("<tr>\n" +
                        "                <td>摘要信息</td>\n" +
                        "                <td colspan=\"6\"><input readonly=\"readonly\" class=\"layui-input\" id=\"info\" value='" + data.description + "'></td>\n" +
                        "            </tr>");
                $("#userInfo").append("<tr>\n" +
                        "                <td>详细信息</td>\n" +
                        "                <td colspan=\"6\"><input readonly=\"readonly\" class=\"layui-input\" id=\"info\" value='" + data.description_LONGDESCRIPTION + "'></td>\n" +
                        "            </tr>");
                $("#userInfo").append("<tr>\n" +
                        "                <td>原因</td>\n" +
                        "                <td colspan=\"6\"><input readonly=\"readonly\" class=\"layui-input\" id=\"info\" value='" + data.fr1CODE_LONGDESCRIPTION + "'></td>\n" +
                        "            </tr>");
                $("#userInfo").append("<tr>\n" +
                        "                <td>解决方案</td>\n" +
                        "                <td colspan=\"6\"><input readonly=\"readonly\" class=\"layui-input\" id=\"info\" value='" + data.fr2CODE_LONGDESCRIPTION + "'></td>\n" +
                        "            </tr>");
                $("#userInfo").append("<tr>\n" +
                        "                <td>备注</td>\n" +
                        "                <td colspan=\"6\"><input readonly=\"readonly\" class=\"layui-input\" type=\"text\" value='" + data.remark + "' id=\"beiZhu\"></td>\n" +
                        "            </tr>");
                layui.use('layer', function () {
                    layer.open({
                        type: 1,
                        title: "详细列表",
                        area: ['900px', '600px'],
                        content: $("#user_info"),
                        end: function () {
                            $("#user_info").hide();
                        }
                    });
                });
            }
        });
    });
</script>

</html>
