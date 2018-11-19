<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <link href="../resources/static/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <script src="../resources/static/js/jquery.min.js" type="text/javascript"></script>

</head>
<body onload="init()">
<div>
    <OBJECT ID="RTsapiBar" WIDTH=850 HEIGHT=32 codebase="RTsapiBar.cab#version=1,0,0,7" CLASSID="CLSID:6663C5E2-E0D8-4EA9-8871-1E4A28F6F1FA" >

    </OBJECT>
    <script language="JavaScript" for="RTsapiBar" event="InService()">
        //alert('aInService');
        /*注册连接CTI服务器事件的回调函数*/
        OnInService();
    </script>
    <script language="JavaScript" for="RTsapiBar" event="Delivered(callid,caller,called,alerting,reason,localstate,data)">
        //alert('aDelivered');
        /*呼叫振铃事件回调函数  */
        Delivered(callid,caller,called,alerting,reason,localstate,data);
    </script>
    <script language="JavaScript" for="RTsapiBar" event="Established(callid,caller,called,answer,reason,localstate,data)">
        //alert('aEstablished');
        /*呼叫接听事件回调函数  */
        Established(callid,caller,called,answer,reason,localstate,data);
    </script>
    <script language="JavaScript" for="RTsapiBar" event="AgentReady(cause,dev,agent,pw,queue)">
        //alert('AgentReady');
        /*注册座席示闲事件的回调函数  */
        AgentReady(cause,dev,agent,pw,queue);
    </script>
    <script language="JavaScript" for="RTsapiBar" event="AgentLoggedOn(cause,dev,agent,pw,queue)">
        //alert('aLoggedOn');
        /*注册座席登陆(签入)事件的回调函数 */
        AgentLoggedOn(cause,dev,agent,pw,queue);
    </script>
</div>
<table style="margin: 0 auto" class="table table-bordered">
    <thead>
    <tr>
        <th>序号</th>
        <th>录音ID</th>
        <th>来电号码</th>
        <th>来电单位</th>
        <th>来电部门</th>
        <th>来点人员</th>
        <th>持续时间</th>
        <th>重要级别</th>
        <th>录音播放</th>
        <th>录音下载</th>
        <th>详情</th>
    </tr>
    </thead>
</table>
</body>

<script>
    function init() {
        // alert("ss");
        RTsapiBar.SetCTIServer("10.185.19.11");
        RTsapiBar.SetLocalDevice("6000");
        RTsapiBar.SetAgent("100","123456");//坐席ID为100
        RTsapiBar.SetQueue("9100");//设置坐席ID的队列
        // RTsapiBar.CreateCTIEnv();//开启CTI服务，成功后会报InService事件
        var ret=RTsapiBar.CreateCTIEnv();///ret返回0 表示请求正常
        if(ret==0){
            //请求正常
            if(RTsapiBar.SetAgentState("",0,0)==0){
                //AgentLoggedOn();
                //alert(RTsapiBar.SetAgentState("",0,0));
                if (RTsapiBar.SetAgentState('',3,0)==0){

                } //坐席100示闲，成功后报AgentReady事件
            }else{
                alert("签入失败");
            }

        }else{
            alert("连接CTI服务器失败!");
        }
        //RTsapiBar.SetAgentState("9990",0,0);//坐席100登陆（签入）9990技能组队列，成功后报AgentLoggedOn事件
        //RTsapiBar.SetAgentState('9990',1,0); //坐席100登出（签出）9990技能组队列，成功后报AgentLoggedOff事件
        //RTsapiBar.SetAgentState('',3,0); //坐席100示闲，成功后报AgentReady事件
        //RTsapiBar.SetAgentState('',2,0); //坐席100示忙，成功后报AgentNotReady事件
    }
</script>

<script>
    function OnInService(){
        //alert("OnInService");


    }
    function Delivered(callid,caller,called,alerting,reason,localstate,data) {
        alert(caller);
    }
    /*座席登陆(签入)事件 */
    function AgentLoggedOn(cause,dev,agent,pw,queue){
        //alert("AgentLoggedOn");
        //printMsg("[AgentLoggedOn]dev:"+dev+",agent:"+agent+",pw:"+pw+",queue:"+queue);
        //alert("登录成功");
    }
    function AgentReady(cause,dev,agent,pw,queue){
        //alert("AgentReady");
//        printMsg("[AgentReady]dev:"+dev+",agent:"+agent+",pw:"+pw+",queue:"+queue);
        //alert("示闲成功");
    }
</script>

</html>
