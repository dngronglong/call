package com.user.call.bean;

import javax.persistence.*;

/**
 * Created with IDEA
 * author:DongRonglong
 * Date:2018/7/4
 * Time:14:49
 * 工单表
 */
@Entity
@Table(name = "TICKET")
public class TicketBean {
    @Id
    @SequenceGenerator(name = "ticket_seq",sequenceName = "repository_seq",allocationSize = 1)
    @GeneratedValue(generator = "ticket_seq",strategy = GenerationType.SEQUENCE)
    private int TICKETID;
}
