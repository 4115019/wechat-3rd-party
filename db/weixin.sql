/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2016/4/15 16:40:00                           */
/*==============================================================*/


drop table if exists WX_ARTICLE_DAY;

drop table if exists WX_ARTICLE_HOUR;

drop table if exists WX_ARTICLE_SHARE_DAY;

drop table if exists WX_ARTICLE_SHARE_HOUR;

drop table if exists WX_AUTHENTICATION_MESSAGE;

drop index officialAccountId_index on WX_AUTHORIZER_ACCESS_TOKEN;

drop table if exists WX_AUTHORIZER_ACCESS_TOKEN;

drop index officialAccountId_index on WX_AUTHORIZER_INFO;

drop table if exists WX_AUTHORIZER_INFO;

drop table if exists WX_BUSINESS_INFO;

drop table if exists WX_COMPONENT_ACCESS_TOKEN;

drop table if exists WX_COMPONENT_VERIFY_TICKET;

drop table if exists WX_CUSTOM_SERVICE;

drop table if exists WX_EVENT;

drop table if exists WX_FUNC_INFO;

drop table if exists WX_INTERFACE_SUMMARY;

drop table if exists WX_INTERFACE_SUMMARY_HOUR;

drop table if exists WX_MASS_MESSAGE;

drop table if exists WX_MEDIA;

drop table if exists WX_MESSAGE;

drop table if exists WX_MESSAGE_DISTRIBUTION_DAY;

drop table if exists WX_MESSAGE_SEND_DAY;

drop table if exists WX_MESSAGE_SEND_HOUR;

drop table if exists WX_OFFICIAL_ACCOUNT;

drop table if exists WX_OFFICIAL_ACCOUNT_ACCESS_TOKEN;

drop table if exists WX_OFFICIAL_ACCOUNT_INFO;

drop table if exists WX_PERSONAL_USER;

drop table if exists WX_PRE_AUTH_CODE;

drop table if exists WX_SYSTEM_USER;

drop table if exists WX_USER_DATA;

drop table if exists WX_USER_LOCATION;

drop table if exists WX_USER_OFFICIAL_ACCOUNT;

drop table if exists WX_WECHAT_THIRD_PARTY_CONFIG;

/*==============================================================*/
/* Table: WX_ARTICLE_DAY                                        */
/*==============================================================*/
create table WX_ARTICLE_DAY
(
   id                   bigint not null comment '����',
   officialAccountId    bigint not null default 0 comment '΢�Ź����˺Ż�����Ϣid',
   refDate              date not null default '0000-00-00' comment '���ݵ�����',
   msgid                varchar(20) not null default '' comment '�����msgidʵ��������msgid��ͼ����Ϣid����Ҳ����Ⱥ���ӿڵ��ú󷵻ص�msg_data_id����index����Ϣ������������ɣ� ����12003_3�� ����12003��msgid����һ��Ⱥ������Ϣ��id�� 3Ϊindex������ô�Ⱥ����ͼ����Ϣ��5�����£���Ϊ����Ϊ��ͼ�ģ���3��ʾ5���еĵ�3��',
   title                varchar(50) not null default '' comment 'ͼ����Ϣ�ı���',
   intPageReadUser      int not null default 0 comment 'ͼ��ҳ�����Ⱥ��ͼ�Ŀ�Ƭ�����ҳ�棩���Ķ�����',
   intPageReadCount     int not null default 0 comment 'ͼ��ҳ���Ķ�����',
   oriPageReadUser      int not null default 0 comment 'ԭ��ҳ�����ͼ��ҳ���Ķ�ԭ�ġ������ҳ�棩���Ķ���������ԭ��ҳʱ�˴�����Ϊ0',
   oriPageReadCount     int not null default 0 comment 'ԭ��ҳ���Ķ�����',
   shareUser            int not null default 0 comment '���������',
   shareCount           int not null default 0 comment '����Ĵ���
            ',
   addToFavUser         int not null default 0 comment '�ղص�����',
   addToFavCount        int not null default 0 comment '�ղصĴ���',
   primary key (id)
);

alter table WX_ARTICLE_DAY comment '�洢΢�����µ�ͳ������';

/*==============================================================*/
/* Table: WX_ARTICLE_HOUR                                       */
/*==============================================================*/
create table WX_ARTICLE_HOUR
(
   id                   bigint not null comment '����',
   officialAccountId    bigint not null default 0 comment '΢�Ź����˺Ż�����Ϣid',
   refDate              date not null default '0000-00-00' comment '���ݵ�����',
   refHour              int not null default 0 comment '���ݵ�Сʱ��������000��2300���ֱ�������[000,100)��[2300,2400)����ÿ�յĵ�1Сʱ�����1Сʱ',
   msgid                varchar(20) not null default '' comment '�����msgidʵ��������msgid��ͼ����Ϣid����Ҳ����Ⱥ���ӿڵ��ú󷵻ص�msg_data_id����index����Ϣ������������ɣ� ����12003_3�� ����12003��msgid����һ��Ⱥ������Ϣ��id�� 3Ϊindex������ô�Ⱥ����ͼ����Ϣ��5�����£���Ϊ����Ϊ��ͼ�ģ���3��ʾ5���еĵ�3��',
   title                varchar(50) not null default '' comment 'ͼ����Ϣ�ı���',
   intPageReadUser      int not null default 0 comment 'ͼ��ҳ�����Ⱥ��ͼ�Ŀ�Ƭ�����ҳ�棩���Ķ�����',
   intPageReadCount     int not null default 0 comment 'ͼ��ҳ���Ķ�����',
   oriPageReadUser      int not null default 0 comment 'ԭ��ҳ�����ͼ��ҳ���Ķ�ԭ�ġ������ҳ�棩���Ķ���������ԭ��ҳʱ�˴�����Ϊ0',
   oriPageReadCount     int not null default 0 comment 'ԭ��ҳ���Ķ�����',
   shareUser            int not null default 0 comment '���������',
   shareCount           int not null default 0 comment '����Ĵ���
            ',
   addToFavUser         int not null default 0 comment '�ղص�����',
   addToFavCount        int not null default 0 comment '�ղصĴ���',
   primary key (id)
);

alter table WX_ARTICLE_HOUR comment '�洢΢�����µķ�ʱͳ������';

/*==============================================================*/
/* Table: WX_ARTICLE_SHARE_DAY                                  */
/*==============================================================*/
create table WX_ARTICLE_SHARE_DAY
(
   id                   bigint not null,
   officialAccountId    bigint not null default 0 comment '΢�Ź��ںŻ�����Ϣid',
   refDate              date not null default '0000-00-00' comment '���ݵ�����',
   shareScene           tinyint(4) not null default 0 comment '����ĳ���
            1�������ת�� 2��������Ȧ 3������Ѷ΢�� 255��������',
   shareCount           int not null default 0 comment '����Ĵ���',
   shareUser            int not null default 0 comment '���������',
   primary key (id)
);

alter table WX_ARTICLE_SHARE_DAY comment '���΢��ͼ�ķ���ÿ��ͳ������';

/*==============================================================*/
/* Table: WX_ARTICLE_SHARE_HOUR                                 */
/*==============================================================*/
create table WX_ARTICLE_SHARE_HOUR
(
   id                   bigint not null,
   officialAccountId    bigint not null default 0 comment '΢�Ź��ںŻ�����Ϣid',
   refDate              date not null default '0000-00-00' comment '���ݵ�����',
   refHour              int not null default 0 comment '���ݵ�Сʱ��������000��2300���ֱ�������[000,100)��[2300,2400)����ÿ�յĵ�1Сʱ�����1Сʱ',
   shareScene           tinyint(4) not null default 0 comment '����ĳ���
            1�������ת�� 2��������Ȧ 3������Ѷ΢�� 255��������',
   shareCount           int not null default 0 comment '����Ĵ���',
   shareUser            int not null default 0 comment '���������',
   primary key (id)
);

alter table WX_ARTICLE_SHARE_HOUR comment '���΢��ͼ�ķ���ÿ�շ�ʱͳ������';

/*==============================================================*/
/* Table: WX_AUTHENTICATION_MESSAGE                             */
/*==============================================================*/
create table WX_AUTHENTICATION_MESSAGE
(
   id                   bigint not null,
   officialAccountId    bigint not null default 0 comment '΢�Ź��ںŻ�����Ϣid',
   toUserName           varchar(50) not null default '' comment '������΢�ź�',
   fromUserName         varchar(50) not null default '' comment 'ϵͳ�˺�',
   createTime           timestamp not null default CURRENT_TIMESTAMP comment '��Ϣ����ʱ��',
   msgType              tinyint(4) not null default 0 comment '��Ϣ����',
   event                tinyint(4) not null default 0 comment '�¼����� ',
   expiredTime          timestamp default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '��֤����ʱ��',
   failTime             timestamp default CURRENT_TIMESTAMP comment 'ʧ�ܷ���ʱ�� ',
   failReason           varchar(200) default '' comment '��֤ʧ�ܵ�ԭ��',
   advised              tinyint(4) not null default 0 comment '��Ϣ�Ƿ��Ѿ�֪ͨ',
   primary key (id)
);

alter table WX_AUTHENTICATION_MESSAGE comment '��¼΢�Ź��ںŵ���֤��Ϣ';

/*==============================================================*/
/* Table: WX_AUTHORIZER_ACCESS_TOKEN                            */
/*==============================================================*/
create table WX_AUTHORIZER_ACCESS_TOKEN
(
   id                   bigint not null comment '����',
   officialAccountId    bigint not null default 0 comment '΢�Ź����˺Ż�����Ϣ��id������΢�Ź��ںŻ�����Ϣ��',
   authorizerAppid      varchar(50) not null default '' comment '��Ȩ��appid',
   authorizerAccessToken varchar(200) not null default '' comment '��Ȩ������',
   expiresIn            int not null default 0 comment '��Ч��',
   authorizerRefreshToken varchar(200) not null default '' comment '�ӿڵ���ƾ��ˢ������',
   createTime           timestamp not null default CURRENT_TIMESTAMP comment '����ʱ��',
   primary key (id)
);

alter table WX_AUTHORIZER_ACCESS_TOKEN comment '�洢΢����Ȩ����access_token��refresh_token';

/*==============================================================*/
/* Index: officialAccountId_index                               */
/*==============================================================*/
create unique index officialAccountId_index on WX_AUTHORIZER_ACCESS_TOKEN
(
   officialAccountId
);

/*==============================================================*/
/* Table: WX_AUTHORIZER_INFO                                    */
/*==============================================================*/
create table WX_AUTHORIZER_INFO
(
   id                   bigint not null comment '����',
   officialAccountId    bigint not null default 0 comment '΢�Ź����˺Ż�����Ϣ��id������΢�Ź��ںŻ�����Ϣ��',
   authorizerAppid      varchar(50) not null default '' comment '��Ȩ��appid',
   headImg              varchar(200) not null default '' comment '��Ȩ��ͷ��',
   alias                varchar(50) not null default '' comment '��Ȩ�����ں������õ�΢�źţ�����Ϊ��',
   qrcodeUrl            varchar(200) not null default '' comment '��ά��ͼƬ��URL���������������Ҳ���б���',
   createTime           timestamp not null default CURRENT_TIMESTAMP comment '����ʱ��',
   authorizationStatus  tinyint(4) not null default 0 comment '��Ȩ״̬,0Ϊ����Ȩ,1Ϊ��ȡ����Ȩ',
   primary key (id)
);

alter table WX_AUTHORIZER_INFO comment '�洢΢�Ź����˺ŵĻ�����Ϣ';

/*==============================================================*/
/* Index: officialAccountId_index                               */
/*==============================================================*/
create unique index officialAccountId_index on WX_AUTHORIZER_INFO
(
   officialAccountId
);

/*==============================================================*/
/* Table: WX_BUSINESS_INFO                                      */
/*==============================================================*/
create table WX_BUSINESS_INFO
(
   id                   bigint not null comment '����',
   officialAccountId    bigint not null default 0 comment '΢�Ź����˺Ż�����Ϣ��id������΢�Ź��ںŻ�����Ϣ��',
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
/* Table: WX_CUSTOM_SERVICE                                     */
/*==============================================================*/
create table WX_CUSTOM_SERVICE
(
   id                   bigint not null,
   officialAccountId    bigint not null default 0 comment '΢�Ź��ںŻ�����Ϣ��id',
   kfAccount            varchar(50) not null default '' comment '�����ͷ��˺ţ���ʽΪ���˺�ǰ׺@���ں�΢�ź�',
   kfNick               varchar(50) not null default '' comment '�ͷ��ǳ�',
   kfId                 int not null default 0 comment '�ͷ�����',
   nickname             varchar(20) not null default '' comment '�ͷ��ǳƣ��6�����ֻ�12��Ӣ���ַ�',
   kfHeadimgurl         varchar(200) not null default '' comment '�ͷ�ͷ��',
   password             char(10) default '' comment '�ͷ��˺ŵ�¼���룬��ʽΪ�������ĵ�32λ����MD5ֵ��������������ڹ���ƽ̨�����Ķ�ͷ�������ʹ�ã�����ʹ�ö�ͷ����ܣ��򲻱���������',
   createTime           timestamp not null default CURRENT_TIMESTAMP comment '����ʱ��',
   primary key (id)
);

alter table WX_CUSTOM_SERVICE comment '�洢΢�ŵĿͷ���Ϣ';

/*==============================================================*/
/* Table: WX_EVENT                                              */
/*==============================================================*/
create table WX_EVENT
(
   id                   bigint not null,
   toUserId             bigint not null default 0 comment '�յ���Ϣһ�����û�id������΢�Ÿ����û����΢�Ź����˺Ż�����Ϣ��',
   fromUserId           bigint not null default 0 comment '��Ϣ���ͷ����û�id',
   toUserName           varchar(50) not null default '' comment '���շ�΢�ź�',
   fromUserName         varchar(50) not null default '' comment '���ͷ�΢�ź�openid',
   createTime           timestamp not null default CURRENT_TIMESTAMP comment '��Ϣ����ʱ��',
   msgType              tinyint(4) not null default 0 comment '��Ϣ����',
   ticket               varchar(50) not null default '' comment '��ά���ticket����������ȡ��ά��ͼƬ',
   eventKey             varchar(20) default '' comment '�¼�KEYֵ��qrscene_Ϊǰ׺������Ϊ��ά��Ĳ���ֵ',
   primary key (id)
);

alter table WX_EVENT comment '�洢΢���û��¼���Ϣ��¼';

/*==============================================================*/
/* Table: WX_FUNC_INFO                                          */
/*==============================================================*/
create table WX_FUNC_INFO
(
   id                   bigint not null comment 'zhujian',
   officialAccountId    bigint not null default 0 comment '΢�Ź����˺Ż�����Ϣ��id������΢�Ź��ںŻ�����Ϣ��',
   funcName             int not null default 0 comment 'Ȩ�޵�����id',
   primary key (id)
);

alter table WX_FUNC_INFO comment '�洢ÿ�����ںŵ�Ȩ����Ϣ';

/*==============================================================*/
/* Table: WX_INTERFACE_SUMMARY                                  */
/*==============================================================*/
create table WX_INTERFACE_SUMMARY
(
   id                   bigint not null,
   officialAccountId    bigint not null default 0 comment '΢�Ź����˺Ż�����Ϣid',
   refDate              date not null default '0000-00-00' comment '���ݵ�����',
   callbackCount        int not null default 0 comment 'ͨ�����������õ�ַ�����Ϣ�󣬱����ظ��û���Ϣ�Ĵ���',
   failCount            int not null comment '����������ʧ�ܴ���',
   totalTimeCost        int not null default 0 comment '�ܺ�ʱ������callback_count��Ϊƽ����ʱ',
   maxTimeCost          int not null default 0 comment '����ʱ',
   primary key (id)
);

alter table WX_INTERFACE_SUMMARY comment '�洢΢�ŵĽӿڷ�������';

/*==============================================================*/
/* Table: WX_INTERFACE_SUMMARY_HOUR                             */
/*==============================================================*/
create table WX_INTERFACE_SUMMARY_HOUR
(
   id                   bigint not null,
   officialAccountId    bigint not null default 0 comment '΢�Ź����˺Ż�����Ϣid',
   refDate              date not null default '0000-00-00' comment '���ݵ�����',
   refHour              int not null default 0 comment '���ݵ�Сʱ',
   callbackCount        int not null default 0 comment 'ͨ�����������õ�ַ�����Ϣ�󣬱����ظ��û���Ϣ�Ĵ���',
   failCount            int not null default 0 comment '����������ʧ�ܴ���',
   totalTimeCost        int not null default 0 comment '�ܺ�ʱ������callback_count��Ϊƽ����ʱ',
   maxTimeCost          int not null default 0 comment '����ʱ',
   primary key (id)
);

alter table WX_INTERFACE_SUMMARY_HOUR comment '�洢΢�ŵĽӿڷ�ʱ��������';

/*==============================================================*/
/* Table: WX_MASS_MESSAGE                                       */
/*==============================================================*/
create table WX_MASS_MESSAGE
(
   id                   bigint not null comment '����',
   officialAccountId    bigint not null default 0 comment '΢�Ź��ںŻ�����Ϣid',
   groupId              varchar(50) not null default '' comment '΢��Ⱥ��id',
   mediaId              varchar(50) not null default '' comment '����Ⱥ������Ϣ��media_id',
   msgType              tinyint(4) not null default 0 comment 'Ⱥ������Ϣ���ͣ�',
   touser               varchar(10000) not null default '' comment '��дͼ����Ϣ�Ľ����ߣ�һ��OpenID�б�OpenID����2�������10000��',
   title                varchar(50) not null default '' comment '��Ϣ�ı���',
   description          varchar(500) not null default '' comment '��Ϣ������',
   thumbMediaId         varchar(50) not null default '' comment '��Ƶ����ͼ��ý��ID',
   isToAll              tinyint(4) not null default 0 comment '�����趨�Ƿ���ȫ���û�����',
   msgDataId            varchar(50) default '' comment '��Ϣ������ID�������ֶ�ֻ����Ⱥ��ͼ����Ϣʱ���Ż���֡�����������ͼ�ķ������ݽӿ��У���ȡ����Ӧ��ͼ����Ϣ�����ݣ���ͼ�ķ������ݽӿ��е�msgid�ֶ��е�ǰ�벿�֣����ͼ�ķ������ݽӿ��е�msgid�ֶεĽ��ܡ�',
   msgId                varchar(50) not null default '' comment '��Ϣ���������ID',
   content              text not null default '',
   totalCount           int not null default 0 comment 'group_id�·�˿��������openid_list�еķ�˿��',
   filterCount          int not null default 0 comment '���ˣ�������ָ�ض��������Ա�Ĺ��ˡ��û����þ��յĹ��ˣ��û������ѳ�4���Ĺ��ˣ���׼�����͵ķ�˿����ԭ���ϣ�FilterCount = SentCount + ErrorCount',
   status               int not null default 0 comment 'Ⱥ����Ϣ�Ľ��',
   errorCount           int not null default 0 comment '����ʧ�ܵķ�˿��',
   sendCount            int not null default 0 comment '���ͳɹ��ķ�˿��',
   createTime           timestamp not null default CURRENT_TIMESTAMP comment '��Ϣ����ʱ��',
   primary key (id)
);

alter table WX_MASS_MESSAGE comment '΢��Ⱥ����Ϣ��¼';

/*==============================================================*/
/* Table: WX_MEDIA                                              */
/*==============================================================*/
create table WX_MEDIA
(
   id                   bigint(0) not null comment '����',
   officialAccountId    bigint not null default 0 comment '΢�Ź��ںŻ�����Ϣid,����΢�Ź��ںŻ�����Ϣ��',
   mediaId              varchar(50) not null default '' comment 'ý���ļ���Ψһ��ʶ
            ',
   type                 tinyint(4) not null default 0 comment 'ý���ļ�������',
   createdAt            timestamp default CURRENT_TIMESTAMP comment 'ý���ļ��ϴ�ʱ��',
   path                 varchar(200) not null default '' comment '�زĴ洢����·��',
   mediaType            tinyint(4) not null default 0 comment '�ز�����,���û���ʱ',
   createTime           timestamp not null default CURRENT_TIMESTAMP comment '����ʱ��',
   primary key (id)
);

alter table WX_MEDIA comment '�洢΢�ŵ��ز���Ϣ';

/*==============================================================*/
/* Table: WX_MESSAGE                                            */
/*==============================================================*/
create table WX_MESSAGE
(
   id                   bigint not null comment '��Ϣid',
   toUserId             bigint not null default 0 comment '�յ���Ϣһ�����û�id������΢�Ÿ����û����΢�Ź����˺Ż�����Ϣ��',
   fromUserId           bigint not null default 0 comment '��Ϣ���ͷ����û�id',
   toUserName           varchar(50) not null default '' comment '���շ�΢�ź�',
   fromUserName         varchar(50) not null default '' comment '���ͷ�΢�ź�openid',
   createTime           timestamp not null default CURRENT_TIMESTAMP comment '��Ϣ����ʱ��',
   msgType              tinyint(4) not null default 0 comment '��Ϣ����',
   msgId                bigint not null default 0 comment '��Ϣid��64λ����',
   content              varchar(500) default '' comment '��Ϣ����',
   picUrl               varchar(200) default '' comment 'ͼƬ����',
   mediaId              varchar(50) default '' comment 'ͼƬ��Ϣý��id�����Ե��ö�ý���ļ����ؽӿ���ȡ���ݡ�',
   format               varchar(20) default '' comment '������ʽ����amr��speex��',
   recongnition         varchar(50) default '' comment '����ʶ����',
   thumbMediaId         varchar(50) default '' comment '��Ƶ��Ϣ����ͼ��ý��id�����Ե��ö�ý���ļ����ؽӿ���ȡ����',
   locationX            varchar(50) default '' comment '����λ��ά��',
   locationY            varchar(50) default '' comment '����λ�þ���',
   scale                int default 0 comment '��ͼ���Ŵ�С',
   locationLabel        varchar(50) default '' comment '����λ����Ϣ',
   title                varchar(50) default '' comment '��Ϣ����',
   description          varchar(500) default '' comment '��Ϣ����',
   url                  varchar(200) default '' comment '��Ϣ����',
   ticket               varchar(50) default '' comment '��ά���ticket����������ȡ��ά��ͼƬ',
   musicUrl             varchar(200) default '' comment '��������',
   hqMusicUrl           varchar(200) default '' comment '�������������ӣ�WIFI��������ʹ�ø����Ӳ�������',
   articleCount         int default 0 comment '��������',
   primary key (id)
);

alter table WX_MESSAGE comment '�洢���ںź��û�����Ϣ���ͼ�¼';

/*==============================================================*/
/* Table: WX_MESSAGE_DISTRIBUTION_DAY                           */
/*==============================================================*/
create table WX_MESSAGE_DISTRIBUTION_DAY
(
   id                   bigint not null comment '����',
   officialAccountId    bigint not null default 0 comment '΢�Ź��ںŻ�����Ϣid',
   refDate              date not null default '0000-00-00' comment '���ݵ�����',
   countInterval        tinyint(4) not null default 0 comment '���շ�����Ϣ���ֲ������䣬0���� ��0����1����1-5����2����6-10����3����10�����ϡ�',
   msgUser              int not null default 0 comment '���з����ˣ����ںŷ����ˣ���Ϣ���û���',
   primary key (id)
);

alter table WX_MESSAGE_DISTRIBUTION_DAY comment '�洢΢��ÿ�췢����Ϣ���ֲ�';

/*==============================================================*/
/* Table: WX_MESSAGE_SEND_DAY                                   */
/*==============================================================*/
create table WX_MESSAGE_SEND_DAY
(
   id                   bigint not null comment '����',
   refDate              date not null default '0000-00-00' comment '���ݵ�����',
   msgType              tinyint(4) not null default 0 comment '��Ϣ���ͣ����������£�
            1�������� 2����ͼƬ 3�������� 4������Ƶ 6���������Ӧ����Ϣ��������Ϣ��',
   msgUser              int not null default 0 comment '���з����ˣ����ںŷ����ˣ���Ϣ���û���
            ',
   msgCount             int not null default 0 comment '���з�������Ϣ����Ϣ����',
   primary key (id)
);

alter table WX_MESSAGE_SEND_DAY comment '�洢΢����Ϣ���͸ſ�������Ϣ';

/*==============================================================*/
/* Table: WX_MESSAGE_SEND_HOUR                                  */
/*==============================================================*/
create table WX_MESSAGE_SEND_HOUR
(
   id                   bigint not null comment '����',
   refDate              date not null default '0000-00-00' comment '���ݵ�����',
   refHour              int not null default 0 comment '���ݵ�Сʱ��������000��2300���ֱ�������[000,100)��[2300,2400)����ÿ�յĵ�1Сʱ�����1Сʱ',
   msgType              tinyint(4) not null default 0 comment '��Ϣ���ͣ����������£�
            1�������� 2����ͼƬ 3�������� 4������Ƶ 6���������Ӧ����Ϣ��������Ϣ��',
   msgUser              int not null default 0 comment '���з����ˣ����ںŷ����ˣ���Ϣ���û���
            ',
   msgCount             int not null default 0 comment '���з�������Ϣ����Ϣ����',
   primary key (id)
);

alter table WX_MESSAGE_SEND_HOUR comment '�洢΢����Ϣ���ͷ�ʱ�ſ�������Ϣ';

/*==============================================================*/
/* Table: WX_OFFICIAL_ACCOUNT                                   */
/*==============================================================*/
create table WX_OFFICIAL_ACCOUNT
(
   id                   bigint not null,
   appid                varchar(100) not null default '' comment '΢�Ź��ں�appid',
   accountType          tinyint(4) not null default 0 comment '�����˺ŵİ󶨷�ʽ,1Ϊ��Ȩ��,2Ϊ�ֶ���
            ',
   serviceTypeInfo      tinyint(4) not null default 0 comment '���ں����ͣ�0�����ĺţ�1��������ʷ���ʺ�������Ķ��ĺţ�2��������',
   verifyTypeInfo       tinyint(4) not null default 0 comment '��Ȩ����֤���ͣ�-1����δ��֤��0����΢����֤��1��������΢����֤��2������Ѷ΢����֤��3������������֤ͨ������δͨ��������֤��4������������֤ͨ������δͨ��������֤����ͨ��������΢����֤��5������������֤ͨ������δͨ��������֤����ͨ������Ѷ΢����֤',
   nickName             varchar(50) not null default '' comment '���ں�����',
   userName             varchar(50) not null default '' comment '���ں�ԭʼid',
   createTime           timestamp not null default CURRENT_TIMESTAMP comment '��¼����ʱ��',
   primary key (id)
);

alter table WX_OFFICIAL_ACCOUNT comment '΢�Ź����˺ŵ�appid�Ͱ�����';

/*==============================================================*/
/* Table: WX_OFFICIAL_ACCOUNT_ACCESS_TOKEN                      */
/*==============================================================*/
create table WX_OFFICIAL_ACCOUNT_ACCESS_TOKEN
(
   id                   bigint not null,
   officialAccountId    bigint not null default 0 comment '΢�Ź��ںŻ�����Ϣid������΢�Ź��ںŻ�����Ϣ��',
   appid                varchar(50) not null default '' comment '΢�ŵ�appid',
   expiresIn            int not null default 0 comment '��Ч��',
   accessToken          varchar(200) not null default '' comment '΢�Ź��ںŵ�accessToken',
   createTime           timestamp not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '��¼����ʱ��',
   primary key (id)
);

alter table WX_OFFICIAL_ACCOUNT_ACCESS_TOKEN comment '�ֶ��󶨵�΢�Ź��ں�accesstoken��Ϣ';

/*==============================================================*/
/* Table: WX_OFFICIAL_ACCOUNT_INFO                              */
/*==============================================================*/
create table WX_OFFICIAL_ACCOUNT_INFO
(
   id                   bigint not null comment '����',
   officialAccountId    bigint not null default 0 comment '΢�Ź����˺Ż�����Ϣ��id������΢�Ź��ںŻ�����Ϣ��',
   appid                varchar(100) not null default '' comment '΢�ŵĹ��ں�appid',
   appSecret            varchar(100) not null default '' comment '΢�Ź��ں�appSecret',
   token                varchar(100) not null default '' comment '΢�Ź��ںŵ�token',
   encodingAesKey       varchar(100) not null default '' comment '΢�Ź��ں�encodingAesKey',
   wechatId             varchar(50) comment '΢�ź�id',
   messageUrl           varchar(200) not null default '' comment '���ں���Ϣ���յ�ַ',
   createTime           timestamp not null default CURRENT_TIMESTAMP comment '����ʱ��',
   primary key (id)
);

alter table WX_OFFICIAL_ACCOUNT_INFO comment '�ֶ��󶨵�΢�Ź����˺���Ϣ';

/*==============================================================*/
/* Table: WX_PERSONAL_USER                                      */
/*==============================================================*/
create table WX_PERSONAL_USER
(
   id                   bigint not null,
   officialAccountId    bigint not null default 0 comment '�û������Ĺ��ں�id���������ںŻ�����Ϣ��',
   openid               varchar(50) not null default '' comment '�û��ı�ʶ���Ե�ǰ���ں�Ψһ',
   subscribe            tinyint(4) not null default 0 comment '�û��Ƿ��ĸù��ںű�ʶ��ֵΪ0ʱ��������û�û�й�ע�ù��ںţ���ȡ����������Ϣ��ֻ��openid��UnionID���ڸù��ںŰ󶨵���΢�ſ���ƽ̨�˺�ʱ���У���',
   nickName             varchar(20) not null default '' comment '�û����ǳ�',
   sex                  tinyint(4) not null default 0 comment '�û����Ա�ֵΪ1ʱ�����ԣ�ֵΪ2ʱ��Ů�ԣ�ֵΪ0ʱ��δ֪',
   city                 varchar(20) not null default '' comment '�û����ڳ���',
   country              varchar(20) not null default '' comment '�û����ڹ���',
   province             varchar(20) not null default '' comment '�û�����ʡ��',
   language             varchar(0) not null default '' comment '�û������ԣ���������Ϊzh_CN',
   headimgurl           varchar(200) not null default '' comment '�û�ͷ�����һ����ֵ����������ͷ���С����0��46��64��96��132��ֵ��ѡ��0����640*640������ͷ�񣩣��û�û��ͷ��ʱ����Ϊ�ա����û�����ͷ��ԭ��ͷ��URL��ʧЧ��',
   subscribeTime        timestamp not null comment '�û���עʱ�䣬Ϊʱ���������û�����ι�ע����ȡ����עʱ��',
   unionid              varchar(50) not null comment 'ֻ�����û������ںŰ󶨵�΢�ſ���ƽ̨�ʺź󣬲Ż���ָ��ֶΡ�',
   remark               varchar(20) not null comment '���ں���Ӫ�߶Է�˿�ı�ע�����ں���Ӫ�߿���΢�Ź���ƽ̨�û��������Է�˿��ӱ�ע',
   groupid              varchar(50) not null comment '�û����ڵķ���ID',
   createTime           timestamp not null comment '��Ϣ����ʱ��',
   primary key (id)
);

alter table WX_PERSONAL_USER comment '�洢΢�ŵĸ����û���Ϣ';

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
/* Table: WX_SYSTEM_USER                                        */
/*==============================================================*/
create table WX_SYSTEM_USER
(
   id                   bigint not null,
   userName             varchar(20) not null default '' comment '�û�����',
   email                varchar(50) not null default '' comment '�����˺�',
   password             varchar(100) not null default '' comment '����',
   createTime           timestamp not null default CURRENT_TIMESTAMP comment '����ʱ��',
   primary key (id)
);

alter table WX_SYSTEM_USER comment 'ϵͳ�û���';

/*==============================================================*/
/* Table: WX_USER_DATA                                          */
/*==============================================================*/
create table WX_USER_DATA
(
   id                   bigint not null,
   officialAccountId    bigint not null default 0 comment '΢�Ź��ںŻ�����Ϣid���������ںŻ�����Ϣ��',
   refDate              date not null default '0000-00-00' comment '���ݵ�����',
   userSource           tinyint(4) not null default 0 comment '�û�����������ֵ����ĺ������£�
            0����������������������ά�룩 3����ɨ��ά�� 17������Ƭ���� 35�����Ѻ��루��΢���������ҳ�������� 39�����ѯ΢�Ź����ʺ� 43����ͼ��ҳ���Ͻǲ˵�',
   newUser              int not null default 0 comment '�������û�����',
   cancel               int not null default 0 comment 'ȡ����ע���û�������new_user��ȥcancel_user��Ϊ�����û�����',
   cumulateUser         int not null default 0 comment '���û���',
   primary key (id)
);

alter table WX_USER_DATA comment '�洢�û���������';

/*==============================================================*/
/* Table: WX_USER_LOCATION                                      */
/*==============================================================*/
create table WX_USER_LOCATION
(
   id                   bigint not null comment '����',
   toUserId             bigint not null default 0 comment '�յ���Ϣһ�����û�id������΢�Ÿ����û����΢�Ź����˺Ż�����Ϣ��',
   fromUserId           bigint not null default 0 comment '��Ϣ���ͷ����û�id',
   toUserName           varchar(50) not null default '' comment '���շ�΢�ź�',
   fromUserName         varchar(50) not null default '' comment '���ͷ�΢�ź�openid',
   createTime           timestamp not null default CURRENT_TIMESTAMP comment '��Ϣ����ʱ��',
   msgType              tinyint(4) not null default 0 comment '��Ϣ����',
   event                tinyint(4) not null default 0 comment '�¼�����',
   latitude             varchar(50) not null default '' comment '����λ��ά��',
   longitude            varchar(50) not null default '' comment '����λ�þ���',
   locationPrecision    varchar(50) not null default '' comment '����λ�þ���',
   primary key (id)
);

alter table WX_USER_LOCATION comment '΢���û�����λ���ϱ��¼���Ϣ';

/*==============================================================*/
/* Table: WX_USER_OFFICIAL_ACCOUNT                              */
/*==============================================================*/
create table WX_USER_OFFICIAL_ACCOUNT
(
   id                   bigint not null,
   userId               bigint not null default 0 comment 'ϵͳ�û�id',
   officialAccountId    bigint not null default 0 comment '΢�Ź��ںŻ�����Ϣ��id,����΢�Ź��ںŻ�����Ϣ��',
   primary key (id)
);

alter table WX_USER_OFFICIAL_ACCOUNT comment '�����û����΢�Ź��ںŻ�����Ϣ������';

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

