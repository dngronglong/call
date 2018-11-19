package com.user.call.controller;

import com.user.call.bean.CommoditiesBean;
import com.user.call.bean.LayDataBean;
import com.user.call.bean.RepositoryBean;
import com.user.call.bean.SeatBean;
import com.user.call.bean.TelBookBean;
import com.user.call.bean.ZxtBean;
import com.user.call.repository.SeatRepository;
import com.user.call.repository.TelBookRepository;
import com.user.call.repository.UserInfoRepository;
import com.user.call.service.CallService;
import com.user.call.service.CommoditiesService;
import com.user.call.service.TelService;
import com.user.call.service.ZxtService;
import com.user.call.utils.StrUtil;

import java.io.PrintStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping({"/seat"})
public class SeatController {
    private int id;
    @Resource
    private SeatRepository seatRepository;
    @Resource
    private UserInfoRepository userInfoRepository;
    @Resource
    private TelBookRepository telBookRepository;
    @Resource
    private CallService callService;
    @Resource
    private CommoditiesService commoditiesService;
    @Resource
    private ZxtService zxtService;
//    @Resource
//    private TelService telService;
//    private String callId;
//    private String lyId;

    @ResponseBody
    @PostMapping(value = {"/findSeat"}, produces = {"application/json;charset=utf-8"})
    public SeatBean findSeat(String userId, HttpServletRequest rq, HttpServletResponse rp) {
        HttpSession session = rq.getSession();
        SeatBean seatBean = this.seatRepository.findByMaxUserId(userId);
        session.setAttribute("seat", seatBean);
        String fwz = this.commoditiesService.findByCom(seatBean.getFWZ()).getDESCRIPTION();
        session.setAttribute("fwz", fwz);
        return seatBean;
    }

    @ResponseBody
    @PostMapping(value = {"/findUserInfoByTel"}, produces = {"application/json;charset=utf-8"})
    public List<TelBookBean> findUserInfoByTel(String tel, HttpServletRequest rq) {
        HttpSession session = rq.getSession();
        tel = "%" + tel;
//        System.out.println(tel);
        List<TelBookBean> list = this.telBookRepository.findByTel(tel);
//        System.out.println(list);
        if (list.size() != 0) {
            String depName = ((TelBookBean) list.get(0)).getDEPNAME();
            String[] dep = depName.split("\\/");
            if (dep.length == 3) {
                ((TelBookBean) list.get(0)).setDEPNAME(dep[0]);
                ((TelBookBean) list.get(0)).setUNIT(dep[1]);
            } else {
                ((TelBookBean) list.get(0)).setDEPNAME(dep[0]);
            }
        }
        session.setAttribute("caller", tel);
        return list;
    }

    @ResponseBody
    @PostMapping(value = {"/saveCall"}, produces = {"application/json;charset=utf-8"})
    public void saveCall(String beiZhu, String info, String time, String caller, String baoGao, String uinit, String buMen, String fuWuZu, String ziXun, String callId, String luId, String gdlx, String status,String yy,String xxinfo,String jjfa,Integer id, HttpServletRequest rq) {
        Date date = null;
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            date = f.parse(time);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        String zhiWei = "";
        if (this.telBookRepository.findByTel("%" + caller).size() >= 1) {
            zhiWei = ((TelBookBean) this.telBookRepository.findByTel("%" + caller).get(0)).getFULLDEP().split("\\/")[0];
        }
        RepositoryBean repositoryBean = new RepositoryBean();
        repositoryBean.setREPOSITORYID(id);
        repositoryBean.setCOMMODITYGROUP(fuWuZu);
        repositoryBean.setUDSYSTEM(ziXun);
        repositoryBean.setLXFS(caller);
        repositoryBean.setUNIT(uinit);
        repositoryBean.setDEPARTMENT(buMen);
        repositoryBean.setPERSON(baoGao);
        repositoryBean.setFILTERDATE(date);
        repositoryBean.setHASLD("0");
        repositoryBean.setREMARK(beiZhu);
        repositoryBean.setDESCRIPTION(info);
        repositoryBean.setZhiWei(zhiWei);
        repositoryBean.setSTATUS(status);
        repositoryBean.setCALLID(callId);
        repositoryBean.setLYID(luId);
        repositoryBean.setDESCRIPTION_LONGDESCRIPTION(xxinfo);
        repositoryBean.setFR1CODE_LONGDESCRIPTION(yy);
        repositoryBean.setFR2CODE_LONGDESCRIPTION(jjfa);
//        System.out.println(repositoryBean);
        if (gdlx != null) {
            repositoryBean.setGDLX(gdlx);
        } else
            repositoryBean.setGDLX("");
        int logId = userInfoRepository.saveAndFlush(repositoryBean).getREPOSITORYID();
    }

    @ResponseBody
    @PostMapping(value = {"/saveLog"}, produces = {"application/json;charset=utf-8"})
    public int saveLog(String caller, String callid, String lyid, String usernameen, String depname, String fwz,String udsystem,String unit) {
//        this.callId = callid;
//        this.lyId = lyid;
        Date date = new Date();
        usernameen = usernameen.toUpperCase();
        RepositoryBean repositoryBean = new RepositoryBean();
        repositoryBean.setLXFS(caller);
        repositoryBean.setCALLID(callid);
        repositoryBean.setLYID(lyid);
        repositoryBean.setPERSON(usernameen);
        repositoryBean.setDEPARTMENT(depname);
        repositoryBean.setFILTERDATE(date);
        repositoryBean.setHASLD("0");
        repositoryBean.setSTATUS("WAPPR");
        repositoryBean.setCOMMODITYGROUP(fwz);
        repositoryBean.setUDSYSTEM(udsystem);
        repositoryBean.setUNIT(unit);
        RepositoryBean re = (RepositoryBean) this.userInfoRepository.save(repositoryBean);
        return re.getREPOSITORYID();
        //System.out.println(this.id);
    }

    @ResponseBody
    @GetMapping(value = {"/findAllCall"}, produces = {"application/json;charset=utf-8"})
    public LayDataBean findAllCall(int page, int limit) {
        int count = this.userInfoRepository.findCount();
        if (page == 1) {
            page = 0;
        } else {
            page = (page - 1) * limit;
            limit = page + limit;
        }
        List<RepositoryBean> listData = this.userInfoRepository.findByPage(page, limit);
        for (int i = 0; i < listData.size(); i++) {
            String userName = ((RepositoryBean) listData.get(i)).getPERSON();
            String fwz = ((RepositoryBean) listData.get(i)).getCOMMODITYGROUP();
            String zxxt = ((RepositoryBean) listData.get(i)).getUDSYSTEM();
            if (userName != null) {
                userName = userName.toLowerCase();
                if (this.telBookRepository.findByUserNameEEN(userName) != null) {
                    ((RepositoryBean) listData.get(i)).setPERSON(this.telBookRepository.findByUserNameEEN(userName).getUSERNAMECN());
                }
            }
            if ((fwz != null) &&
                    (this.commoditiesService.findByCom(fwz) != null)) {
                ((RepositoryBean) listData.get(i)).setCOMMODITYGROUP(this.commoditiesService.findByCom(fwz).getDESCRIPTION());
            }
            if ((zxxt != null) &&
                    (this.zxtService.findByValue(zxxt) != null)) {
                ((RepositoryBean) listData.get(i)).setUDSYSTEM(this.zxtService.findByValue(zxxt).getDESCRIPTION());
            }
        }
        LayDataBean layDataBean = new LayDataBean();
        layDataBean.setCode(0);
        layDataBean.setCount(count);
        layDataBean.setData(listData);
        //System.out.println(layDataBean);
        return layDataBean;
    }

    @ResponseBody
    @GetMapping(value = {"/findCallByWhere"}, produces = {"application/json;charset=utf-8"})
    public LayDataBean findCallByWhere(int page, int limit, String fwz, String zy, String ssxt) {
        if (page == 1) {
            page = 0;
        } else {
            page = (page - 1) * limit;
            limit = page + limit;
        }
        List<RepositoryBean> list = null;
        int count;
        if ((StrUtil.isContainChinese(fwz)) || (StrUtil.isContainChinese(zy))) {
            count = callService.countByCn(fwz, zy, ssxt);
            list = (List<RepositoryBean>) callService.findByCn(fwz, zy, ssxt, page, limit);
            for (int i = 0; i < list.size(); i++) {
                fwz = ((RepositoryBean) list.get(i)).getCOMMODITYGROUP();
                zy = ((RepositoryBean) list.get(i)).getZXXT();
                String userName = ((RepositoryBean) list.get(i)).getPERSON();
                if (userName != null) {
                    userName = userName.toLowerCase();
                    if (this.telBookRepository.findByUserNameEEN(userName) != null) {
                        ((RepositoryBean) list.get(i)).setPERSON(this.telBookRepository.findByUserNameEEN(userName).getUSERNAMECN());
                    }
                }
                if ((fwz != null) &&
                        (this.commoditiesService.findByCom(fwz) != null)) {
                    ((RepositoryBean) list.get(i)).setCOMMODITYGROUP(this.commoditiesService.findByCom(fwz).getDESCRIPTION());
                }
                if ((zy != null) &&
                        (this.zxtService.findByValue(zy) != null)) {
                    ((RepositoryBean) list.get(i)).setZXXT(this.zxtService.findByValue(zy).getDESCRIPTION());
                }
            }
        } else {
            fwz = fwz.toUpperCase();
            zy = zy.toUpperCase();
            ssxt = ssxt.toUpperCase();
            count = callService.findCount(fwz, zy, ssxt);
            list = (List<RepositoryBean>) callService.findCallByWhere(fwz, zy, ssxt, page, limit);
            for (int i = 0; i < list.size(); i++) {
                fwz = ((RepositoryBean) list.get(i)).getCOMMODITYGROUP();
                zy = ((RepositoryBean) list.get(i)).getZXXT();
                String userName = ((RepositoryBean) list.get(i)).getPERSON();
                if (userName != null) {
                    userName = userName.toLowerCase();
                    if (this.telBookRepository.findByUserNameEEN(userName) != null) {
                        ((RepositoryBean) list.get(i)).setPERSON(this.telBookRepository.findByUserNameEEN(userName).getUSERNAMECN());
                    }
                }
                if ((fwz != null) &&
                        (this.commoditiesService.findByCom(fwz) != null)) {
                    ((RepositoryBean) list.get(i)).setCOMMODITYGROUP(this.commoditiesService.findByCom(fwz).getDESCRIPTION());
                }
                if ((zy != null) &&
                        (this.zxtService.findByValue(zy) != null)) {
                    ((RepositoryBean) list.get(i)).setZXXT(this.zxtService.findByValue(zy).getDESCRIPTION());
                }
            }
        }
        LayDataBean layDataBean = new LayDataBean();
        layDataBean.setCode(0);
        layDataBean.setCount(count);
        layDataBean.setData(list);
        return layDataBean;
    }
}
