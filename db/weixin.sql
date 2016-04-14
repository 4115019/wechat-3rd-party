/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2016/4/13 14:10:17                           */
/*==============================================================*/


drop index Index_authorizerAppid on WX_AUTHORIZER_INFO;

drop table if exists WX_AUTHORIZER_INFO;

drop table if exists WX_BUSINESS_INFO;

drop table if exists WX_COMPONENT_ACCESS_TOKEN;

drop table if exists WX_COMPONENT_VERIFY_TICKET;

drop table if exists WX_FUNC_INFO;

drop table if exists WX_PRE_AUTH_CODE;

drop index Index_authorizerAppid on WX_USER_ACCESS_TOKEN;

drop table if exists WX_USER_ACCESS_TOKEN;

drop table if exists WX_WECHAT_THIRD_PARTY_CONFIG;

/*==============================================================*/
/* Table: WX_AUTHORIZER_INFO                                    */
/*==============================================================*/
create table WX_AUTHORIZER_INFO
(
   id                   bigint not null comment '����',
   authorizerAppid      varchar(50) not null default '' comment '��Ȩ��appid',
   nickName             varchar(50) not null default '' comment '��Ȩ���ǳ�',
   headImg              varchar(200) not null default '' comment '��Ȩ��ͷ��',
   serviceTypeInfo      tinyint(4) not null comment '��Ȩ�����ں�����',
   verifyTypeInfo       tinyint(4) not null default 0 comment '��Ȩ����֤���ͣ�-1����δ��֤��0����΢����֤��1��������΢����֤��2������Ѷ΢����֤��3������������֤ͨ������δͨ��������֤��4������������֤ͨ������δͨ��������֤����ͨ��������΢����֤��5������������֤ͨ������δͨ��������֤����ͨ������Ѷ΢����֤',
   userName             varchar(50) not null default '' comment '��Ȩ�����ںŵ�ԭʼID',
   alias                varchar(50) not null default '' comment '��Ȩ�����ں������õ�΢�źţ�����Ϊ��',
   qrcodeUrl            varchar(200) not null default '' comment '��ά��ͼƬ��URL���������������Ҳ���б���',
   createTime           timestamp not null default CURRENT_TIMESTAMP comment '����ʱ��',
   authorizationStatus  tinyint(4) not null default 0 comment '��Ȩ״̬,0Ϊ����Ȩ,1Ϊ��ȡ����Ȩ',
   primary key (id)
);

alter table WX_AUTHORIZER_INFO comment '�洢΢�Ź����˺ŵĻ�����Ϣ';

/*==============================================================*/
/* Index: Index_authorizerAppid                                 */
/*==============================================================*/
create unique index Index_authorizerAppid on WX_AUTHORIZER_INFO
(
   authorizerAppid
);

/*==============================================================*/
/* Table: WX_BUSINESS_INFO                                      */
/*==============================================================*/
create table WX_BUSINESS_INFO
(
   id                   bigint not null comment '����',
   authorizerInfoId     bigint not null comment '�����˺Ż�����Ϣid',
   businessInfoName     tinyint(4) not null default 0 comment '��ҵ��������',
   businessInfoStatus   tinyint(4) not null default 0 comment '��ҵ���ܿ�ͨ״̬',
   primary key (id)
);

alter table WX_BUSINESS_INFO comment '�洢΢�ŵ���ҵ���ܿ�ͨ���';

/*==============================================================*/
/* Table: WX_COMPONENT_ACCESS_TOKEN                             */
/*==============================================================*/
create table WX_COMPONENT_ACCESS_TOKEN
(
   id                   bigint not null comment '����',
   componentAppid       varchar(50) not null default '' comment 'componentAppid',
   componentAccessToken varchar(200) not null default '' comment '΢�ŵ�����component_access_token',
   expiresIn            int not null default 0 comment '��Чʱ��',
   createTime           timestamp not null default CURRENT_TIMESTAMP comment '����ʱ��',
   failureTime          timestamp not null default CURRENT_TIMESTAMP comment 'ʧЧʱ��',
   primary key (id)
);

alter table WX_COMPONENT_ACCESS_TOKEN comment '�洢������ƽ̨��componentAccessToken';

/*==============================================================*/
/* Table: WX_COMPONENT_VERIFY_TICKET                            */
/*==============================================================*/
create table WX_COMPONENT_VERIFY_TICKET
(
   id                   bigint not null comment '����',
   componentAppid       varchar(50) not null default '' comment '΢�ŵ�����componentAppid',
   componentVerifyTicket varchar(100) not null default '' comment '΢�ŵ�����component_verify_ticket',
   createTime           timestamp not null default CURRENT_TIMESTAMP comment '����ʱ��',
   deadline             timestamp not null default CURRENT_TIMESTAMP comment 'ʧЧʱ��',
   primary key (id)
);

alter table WX_COMPONENT_VERIFY_TICKET comment '�洢΢�ŵ�����ƽ̨component_verify_ticket��Ϣ';

/*==============================================================*/
/* Table: WX_FUNC_INFO                                          */
/*==============================================================*/
create table WX_FUNC_INFO
(
   id                   bigint not null comment 'zhujian',
   authorizerInfoId     bigint not null default 0 comment '΢����Ȩ�������˺Ż�����Ϣid,����΢�Ź��ںŻ�����Ϣ��',
   funcName             int not null default 0 comment 'Ȩ�޵�����id',
   primary key (id)
);

alter table WX_FUNC_INFO comment '�洢ÿ�����ںŵ�Ȩ����Ϣ';

/*==============================================================*/
/* Table: WX_PRE_AUTH_CODE                                      */
/*==============================================================*/
create table WX_PRE_AUTH_CODE
(
   id                   bigint not null comment '����',
   preAuthCode          varchar(100) not null default '' comment '΢��Ԥ��Ȩ��',
   createTime           timestamp not null default CURRENT_TIMESTAMP,
   expiresIn            int default 0 comment '��Ч��',
   primary key (id)
);

alter table WX_PRE_AUTH_CODE comment '�洢΢�ŵ�Ԥ��Ȩ��';

/*==============================================================*/
/* Table: WX_USER_ACCESS_TOKEN                                  */
/*==============================================================*/
create table WX_USER_ACCESS_TOKEN
(
   id                   bigint not null comment '����',
   authorizerInfoId     bigint not null comment '����΢�Ź��ںŻ�����Ϣid',
   authorizerAppid      varchar(50) not null default '' comment '��Ȩ��appid',
   authorizerAccessToken varchar(200) not null default '' comment '��Ȩ������',
   expiresIn            int not null default 0 comment '��Ч��',
   authorizerRefreshToken varchar(200) not null default '' comment '�ӿڵ���ƾ��ˢ������',
   createTime           timestamp not null default CURRENT_TIMESTAMP comment '����ʱ��',
   primary key (id)
);

alter table WX_USER_ACCESS_TOKEN comment '�洢΢����Ȩ����access_token��refresh_token';

/*==============================================================*/
/* Index: Index_authorizerAppid                                 */
/*==============================================================*/
create unique index Index_authorizerAppid on WX_USER_ACCESS_TOKEN
(
   authorizerAppid
);

/*==============================================================*/
/* Table: WX_WECHAT_THIRD_PARTY_CONFIG                          */
/*==============================================================*/
create table WX_WECHAT_THIRD_PARTY_CONFIG
(
   id                   bigint not null comment '����',
   componentAppid       varchar(50) not null default '' comment '΢�ŵ�����component_appid',
   componentAppsecret   varchar(50) not null default '' comment '΢�ŵ�����component_appsecret',
   token                varchar(50) not null default '' comment '΢�ŵ�����token��Ϣ',
   encodeingAesKey      varchar(100) not null default '' comment '΢�ŵ������ӽ���key',
   authorizationUrl     varchar(100) not null default '' comment '��Ȩ�¼�����url',
   redirectUrl          varchar(100) not null default '' comment '��Ȩ�¼���תurl',
   componentAccessToken varchar(200) not null default '' comment '������component_access_token',
   messgesUrl           varchar(100) not null default '' comment '���ں���Ϣ���¼�����URL',
   componentVerifyTicket varchar(200) not null default '' comment '΢�ŵ�����component_verfiy_ticket',
   createTime           timestamp not null default CURRENT_TIMESTAMP comment '����ʱ��',
   updateTime           timestamp not null default CURRENT_TIMESTAMP comment '����ʱ��',
   primary key (id)
);

alter table WX_WECHAT_THIRD_PARTY_CONFIG comment '�洢΢�ŵ�������������Ϣ';

