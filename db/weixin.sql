
/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2016/4/26 13:32:12                           */
/*==============================================================*/



/*==============================================================*/
/* Table: WX_ARTICLE_DAY                                        */
/*==============================================================*/
create table wx_article_day
(
   id                   bigint not null comment '主键',
   officialAccountId    bigint not null default 0 comment '微信公众账号基本信息id',
   refDate              date not null default '0000-00-00' comment '数据的日期',
   msgid                varchar(20) not null default '' comment '这里的msgid实际上是由msgid（图文消息id，这也就是群发接口调用后返回的msg_data_id）和index（消息次序索引）组成， 例如12003_3， 其中12003是msgid，即一次群发的消息的id； 3为index，假设该次群发的图文消息共5个文章（因为可能为多图文），3表示5个中的第3个',
   title                varchar(50) not null default '' comment '图文消息的标题',
   intPageReadUser      int not null default 0 comment '图文页（点击群发图文卡片进入的页面）的阅读人数',
   intPageReadCount     int not null default 0 comment '图文页的阅读次数',
   oriPageReadUser      int not null default 0 comment '原文页（点击图文页“阅读原文”进入的页面）的阅读人数，无原文页时此处数据为0',
   oriPageReadCount     int not null default 0 comment '原文页的阅读次数',
   shareUser            int not null default 0 comment '分享的人数',
   shareCount           int not null default 0 comment '分享的次数
            ',
   addToFavUser         int not null default 0 comment '收藏的人数',
   addToFavCount        int not null default 0 comment '收藏的次数',
   primary key (id)
);

alter table wx_article_day comment '存储微信文章的统计数据';

/*==============================================================*/
/* Table: WX_ARTICLE_HOUR                                       */
/*==============================================================*/
create table wx_article_hour
(
   id                   bigint not null comment '主键',
   officialAccountId    bigint not null default 0 comment '微信公众账号基本信息id',
   refDate              date not null default '0000-00-00' comment '数据的日期',
   refHour              int not null default 0 comment '数据的小时，包括从000到2300，分别代表的是[000,100)到[2300,2400)，即每日的第1小时和最后1小时',
   msgid                varchar(20) not null default '' comment '这里的msgid实际上是由msgid（图文消息id，这也就是群发接口调用后返回的msg_data_id）和index（消息次序索引）组成， 例如12003_3， 其中12003是msgid，即一次群发的消息的id； 3为index，假设该次群发的图文消息共5个文章（因为可能为多图文），3表示5个中的第3个',
   title                varchar(50) not null default '' comment '图文消息的标题',
   intPageReadUser      int not null default 0 comment '图文页（点击群发图文卡片进入的页面）的阅读人数',
   intPageReadCount     int not null default 0 comment '图文页的阅读次数',
   oriPageReadUser      int not null default 0 comment '原文页（点击图文页“阅读原文”进入的页面）的阅读人数，无原文页时此处数据为0',
   oriPageReadCount     int not null default 0 comment '原文页的阅读次数',
   shareUser            int not null default 0 comment '分享的人数',
   shareCount           int not null default 0 comment '分享的次数
            ',
   addToFavUser         int not null default 0 comment '收藏的人数',
   addToFavCount        int not null default 0 comment '收藏的次数',
   primary key (id)
);

alter table wx_article_hour comment '存储微信文章的分时统计数据';

/*==============================================================*/
/* Table: WX_ARTICLE_SHARE_DAY                                  */
/*==============================================================*/
create table wx_article_share_day
(
   id                   bigint not null,
   officialAccountId    bigint not null default 0 comment '微信公众号基本信息id',
   refDate              date not null default '0000-00-00' comment '数据的日期',
   shareScene           tinyint(4) not null default 0 comment '分享的场景
            1代表好友转发 2代表朋友圈 3代表腾讯微博 255代表其他',
   shareCount           int not null default 0 comment '分享的次数',
   shareUser            int not null default 0 comment '分享的人数',
   primary key (id)
);

alter table wx_article_share_day comment '村抽微信图文分享每日统计数据';

/*==============================================================*/
/* Table: WX_ARTICLE_SHARE_HOUR                                 */
/*==============================================================*/
create table wx_article_share_hour
(
   id                   bigint not null,
   officialAccountId    bigint not null default 0 comment '微信公众号基本信息id',
   refDate              date not null default '0000-00-00' comment '数据的日期',
   refHour              int not null default 0 comment '数据的小时，包括从000到2300，分别代表的是[000,100)到[2300,2400)，即每日的第1小时和最后1小时',
   shareScene           tinyint(4) not null default 0 comment '分享的场景
            1代表好友转发 2代表朋友圈 3代表腾讯微博 255代表其他',
   shareCount           int not null default 0 comment '分享的次数',
   shareUser            int not null default 0 comment '分享的人数',
   primary key (id)
);

alter table wx_article_share_hour comment '村抽微信图文分享每日分时统计数据';

/*==============================================================*/
/* Table: WX_AUTHENTICATION_MESSAGE                             */
/*==============================================================*/
create table wx_authentication_message
(
   id                   bigint not null,
   officialAccountId    bigint not null default 0 comment '微信公众号基本信息id',
   toUserName           varchar(50) not null default '' comment '开发者微信号',
   fromUserName         varchar(50) not null default '' comment '系统账号',
   createTime           timestamp not null default CURRENT_TIMESTAMP comment '消息创建时间',
   msgType              tinyint(4) not null default 0 comment '消息类型',
   event                tinyint(4) not null default 0 comment '事件类型 ',
   expiredTime          timestamp  comment '认证过期时间',
   failTime             timestamp  comment '失败发生时间 ',
   failReason           varchar(200) default '' comment '认证失败的原因',
   advised              tinyint(4) not null default 0 comment '消息是否已经通知',
   primary key (id)
);

alter table wx_authentication_message comment '记录微信公众号的认证消息';

/*==============================================================*/
/* Table: WX_AUTHORIZER_ACCESS_TOKEN                            */
/*==============================================================*/
create table wx_authorizer_access_token
(
   id                   bigint not null comment '主键',
   officialAccountId    bigint not null default 0 comment '微信公众账号基本信息表id，关联微信公众号基本信息表',
   authorizerAppid      varchar(50) not null default '' comment '授权方appid',
   authorizerAccessToken varchar(200) not null default '' comment '授权方令牌',
   expiresIn            bigint not null default 0 comment '截止时间',
   authorizerRefreshToken varchar(200) not null default '' comment '接口调用凭据刷新令牌',
   createTime           timestamp not null default CURRENT_TIMESTAMP comment '创建时间',
   primary key (id)
);

alter table wx_authorizer_access_token comment '存储微信授权方的access_token和refresh_token';

/*==============================================================*/
/* Index: officialAccountId_index                               */
/*==============================================================*/
create unique index officialAccountId_index on wx_authorizer_access_token
(
   officialAccountId
);

/*==============================================================*/
/* Table: WX_AUTHORIZER_INFO                                    */
/*==============================================================*/
create table wx_authorizer_info
(
   id                   bigint not null comment '主键',
   officialAccountId    bigint not null default 0 comment '微信公众账号基本信息表id，关联微信公众号基本信息表',
   authorizerAppid      varchar(50) not null default '' comment '授权方appid',
   headImg              varchar(200) default '' comment '授权方头像',
   alias                varchar(50) not null default '' comment '授权方公众号所设置的微信号，可能为空',
   qrcodeUrl            varchar(200) not null default '' comment '二维码图片的URL，开发者最好自行也进行保存',
   createTime           timestamp not null default CURRENT_TIMESTAMP comment '创建时间',
   authorizationStatus  tinyint(4) not null default 0 comment '授权状态,0为已授权,1为已取消授权',
   primary key (id)
);

alter table wx_authorizer_info comment '存储微信公众账号的基本信息';

/*==============================================================*/
/* Index: officialAccountId_index                               */
/*==============================================================*/
create unique index officialAccountId_index on wx_authorizer_info
(
   officialAccountId
);

/*==============================================================*/
/* Table: WX_BUSINESS_INFO                                      */
/*==============================================================*/
create table wx_business_info
(
   id                   bigint not null comment '主键',
   officialAccountId    bigint not null default 0 comment '微信公众账号基本信息表id，关联微信公众号基本信息表',
   businessInfoName     tinyint(4) not null default 0 comment '商业功能名称',
   businessInfoStatus   tinyint(4) not null default 0 comment '商业功能开通状态',
   primary key (id)
);

alter table wx_business_info comment '存储微信的商业功能开通情况';

/*==============================================================*/
/* Table: WX_COMPONENT_ACCESS_TOKEN                             */
/*==============================================================*/
create table wx_component_access_token
(
   id                   bigint not null comment '主键',
   componentAppid       varchar(50) not null default '' comment 'componentAppid',
   componentAccessToken varchar(200) not null default '' comment '微信第三方component_access_token',
   expiresIn            int not null default 0 comment '有效时间',
   createTime           timestamp not null default CURRENT_TIMESTAMP comment '创建时间',
   failureTime          timestamp not null default '0000-00-00 00:00:00' comment '失效时间',
   primary key (id)
);

alter table wx_component_access_token comment '存储第三方平台的componentAccessToken';

/*==============================================================*/
/* Table: WX_COMPONENT_VERIFY_TICKET                            */
/*==============================================================*/
create table wx_component_verify_ticket
(
   id                   bigint not null comment '主键',
   componentAppid       varchar(50) not null default '' comment '微信第三方componentAppid',
   componentVerifyTicket varchar(100) not null default '' comment '微信第三方component_verify_ticket',
   createTime           timestamp not null default CURRENT_TIMESTAMP comment '创建时间',
   deadline             timestamp not null default '0000-00-00 00:00:00' comment '失效时间',
   primary key (id)
);

alter table wx_component_verify_ticket comment '存储微信第三方平台component_verify_ticket信息';

/*==============================================================*/
/* Table: WX_CUSTOM_SERVICE                                     */
/*==============================================================*/
create table wx_custom_service
(
   id                   bigint not null,
   officialAccountId    bigint not null default 0 comment '微信公众号基本信息表id',
   kfAccount            varchar(50) not null default '' comment '完整客服账号，格式为：账号前缀@公众号微信号',
   kfNick               varchar(50) not null default '' comment '客服昵称',
   kfId                 int not null default 0 comment '客服工号',
   nickname             varchar(20) not null default '' comment '客服昵称，最长6个汉字或12个英文字符',
   kfHeadimgurl         varchar(200) not null default '' comment '客服头像',
   password             char(10) default '' comment '客服账号登录密码，格式为密码明文的32位加密MD5值。该密码仅用于在公众平台官网的多客服功能中使用，若不使用多客服功能，则不必设置密码',
   createTime           timestamp not null default CURRENT_TIMESTAMP comment '创建时间',
   primary key (id)
);

alter table wx_custom_service comment '存储微信的客服信息';

/*==============================================================*/
/* Table: WX_ERROR_CODE                                         */
/*==============================================================*/
create table wx_error_code
(
   id                   bigint not null,
   code                 varchar(10) not null default '' comment '微信错误码',
   msg                  varchar(100) not null default '' comment '微信错误消息说明',
   primary key (id)
);

alter table wx_error_code comment '存储微信接口调用的所有错误码';

/*==============================================================*/
/* Table: WX_EVENT                                              */
/*==============================================================*/
create table wx_event
(
   id                   bigint not null,
   toUserId             bigint not null default 0 comment '收到消息一方的用户id，关联微信个人用户表或微信公众账号基本信息表',
   fromUserId           bigint not null default 0 comment '消息发送方的用户id',
   toUserName           varchar(50) not null default '' comment '接收方微信号',
   fromUserName         varchar(50) not null default '' comment '发送方微信号openid',
   createTime           timestamp not null default CURRENT_TIMESTAMP comment '消息创建时间',
   msgType              tinyint(4) not null default 0 comment '消息类型',
   ticket               varchar(50) not null default '' comment '二维码的ticket，可用来换取二维码图片',
   eventKey             varchar(20) default '' comment '事件KEY值，qrscene_为前缀，后面为二维码的参数值',
   primary key (id)
);

alter table wx_event comment '存储微信用户事件消息记录';

/*==============================================================*/
/* Table: WX_FUNC_INFO                                          */
/*==============================================================*/
create table wx_func_info
(
   id                   bigint not null comment 'zhujian',
   officialAccountId    bigint not null default 0 comment '微信公众账号基本信息表id，关联微信公众号基本信息表',
   funcName             int not null default 0 comment '权限的名称id',
   primary key (id)
);

alter table wx_func_info comment '存储每个公众号的权限信息';

/*==============================================================*/
/* Table: WX_INTERFACE_SUMMARY                                  */
/*==============================================================*/
create table wx_interface_summary
(
   id                   bigint not null,
   officialAccountId    bigint not null default 0 comment '微信公众账号基本信息id',
   refDate              date not null default '0000-00-00' comment '数据的日期',
   callbackCount        int not null default 0 comment '通过服务器配置地址获得消息后，被动回复用户消息的次数',
   failCount            int not null comment '上述动作的失败次数',
   totalTimeCost        int not null default 0 comment '总耗时，除以callback_count即为平均耗时',
   maxTimeCost          int not null default 0 comment '最大耗时',
   primary key (id)
);

alter table wx_interface_summary comment '存储微信的接口分析数据';

/*==============================================================*/
/* Table: WX_INTERFACE_SUMMARY_HOUR                             */
/*==============================================================*/
create table wx_interface_summary_hour
(
   id                   bigint not null,
   officialAccountId    bigint not null default 0 comment '微信公众账号基本信息id',
   refDate              date not null default '0000-00-00' comment '数据的日期',
   refHour              int not null default 0 comment '数据的小时',
   callbackCount        int not null default 0 comment '通过服务器配置地址获得消息后，被动回复用户消息的次数',
   failCount            int not null default 0 comment '上述动作的失败次数',
   totalTimeCost        int not null default 0 comment '总耗时，除以callback_count即为平均耗时',
   maxTimeCost          int not null default 0 comment '最大耗时',
   primary key (id)
);

alter table wx_interface_summary_hour comment '存储微信的接口分时分析数据';

/*==============================================================*/
/* Table: WX_KEYWORD_REPLY_SETTING                              */
/*==============================================================*/
create table wx_keyword_reply_setting
(
   id                   bigint not null comment '主键',
   officialAccountId    bigint not null default 0 comment '微信公众号基本信息id，关联微信公众号基本信息表',
   ruleName             varchar(50) not null default '' comment '规则名称',
   replyMod             tinyint(4) not null default 0 comment '回复模式，reply_all代表全部回复，random_one代表随机回复其中一条',
   replyOpen            tinyint(4) not null default 0 comment '我方的规则开启状态，0为关闭，1位开启',
   plat                 tinyint(4) not null default 0 comment '设置平台方，1,代表在微信后台设置，2代表在我方后台设置',
   createTime           timestamp not null default CURRENT_TIMESTAMP comment '创建时间',
   primary key (id)
);

alter table wx_keyword_reply_setting comment '存储微信关键词自动回复设置';

/*==============================================================*/
/* Table: WX_KEYWORD_REPLY_SETTING_KEYWORD                      */
/*==============================================================*/
create table wx_keyword_reply_setting_keyword
(
   id                   bigint not null comment '主键',
   keywordReplySettingId bigint not null default 0 comment '微信关键词自动回复设置id',
   type                 tinyint(4) not null default 0 comment '匹配消息类型，支持文本（text）、图片（img）、语音（voice）、视频（video，图文消息（news）',
   matchMode            tinyint(4) not null default 0 comment '匹配模式，contain代表消息中含有该关键词即可，equal表示消息内容必须和关键词严格相同',
   content              varchar(500) not null default '' comment '对于文本类型，content是文本内容，对于图文、图片、语音、视频类型，content是mediaID',
   primary key (id)
);

alter table wx_keyword_reply_setting_keyword comment '存储关键词回复的关键词';

/*==============================================================*/
/* Table: WX_KEYWORD_REPLY_SETTING_NEWS                         */
/*==============================================================*/
create table wx_keyword_reply_setting_news
(
   id                   bigint not null,
   keywordReplySettingReplyId bigint not null default 0 comment '微信关键词自动回复设置回复信息id,关联微信关键词自动回复设置回复信息表',
   title                varchar(50) not null default '' comment '图文消息的标题',
   author               varchar(20) not null default '' comment '作者',
   digest               varchar(500) not null default '' comment '摘要',
   showCover            tinyint(4) not null default 0 comment '是否显示封面，0为不显示，1为显示',
   coverUrl             varchar(200) not null default '' comment '封面图片的URL',
   contentUrl           varchar(200) not null default '' comment '正文的URL',
   sourceUrl            varchar(200) default '' comment '原文的URL，若置空则无查看原文入口',
   primary key (id)
);

alter table wx_keyword_reply_setting_news comment '存储微信关键词自动回复设置的回复图文信息';

/*==============================================================*/
/* Table: WX_KEYWORD_REPLY_SETTING_REPLY                        */
/*==============================================================*/
create table wx_keyword_reply_setting_reply
(
   id                   bigint not null,
   keywordReplySettingId bigint not null default 0 comment '微信关键词自动回复设置id',
   type                 tinyint(4) not null default 0 comment '匹配消息类型，支持文本（text）、图片（img）、语音（voice）、视频（video，图文消息（news）',
   content              varchar(500) not null default '',
   primary key (id)
);

alter table wx_keyword_reply_setting_reply comment '存储微信关键词自动回复设置回复信息';

/*==============================================================*/
/* Table: WX_MASS_MESSAGE                                       */
/*==============================================================*/
create table wx_mass_message
(
   id                   bigint not null comment '主键',
   officialAccountId    bigint not null default 0 comment '微信公众号基本信息id',
   groupId              varchar(50) not null default '' comment '微信群组id',
   mediaId              varchar(50) not null default '' comment '用于群发的消息的media_id',
   msgType              tinyint(4) not null default 0 comment '群发的消息类型，',
   touser               varchar(10000) not null default '' comment '填写图文消息的接收者，一串OpenID列表，OpenID最少2个，最多10000个',
   title                varchar(50) not null default '' comment '消息的标题',
   description          varchar(500) not null default '' comment '消息的描述',
   thumbMediaId         varchar(50) not null default '' comment '视频缩略图的媒体ID',
   isToAll              tinyint(4) not null default 0 comment '用于设定是否向全部用户发送',
   msgDataId            varchar(50) default '' comment '消息的数据ID，，该字段只有在群发图文消息时，才会出现。可以用于在图文分析数据接口中，获取到对应的图文消息的数据，是图文分析数据接口中的msgid字段中的前半部分，详见图文分析数据接口中的msgid字段的介绍。',
   msgId                varchar(50) not null default '' comment '消息发送任务的ID',
   content              text not null default '',
   totalCount           int not null default 0 comment 'group_id下粉丝数；或者openid_list中的粉丝数',
   filterCount          int not null default 0 comment '过滤（过滤是指特定地区、性别的过滤、用户设置拒收的过滤，用户接收已超4条的过滤）后，准备发送的粉丝数，原则上，FilterCount = SentCount + ErrorCount',
   status               int not null default 0 comment '群发消息的结果',
   errorCount           int not null default 0 comment '发送失败的粉丝数',
   sendCount            int not null default 0 comment '发送成功的粉丝数',
   createTime           timestamp not null default CURRENT_TIMESTAMP comment '消息发送时间',
   primary key (id)
);

alter table wx_mass_message comment '微信群发消息记录';

/*==============================================================*/
/* Table: WX_MEDIA                                              */
/*==============================================================*/
create table wx_media
(
   id                   bigint(0) not null comment '主键',
   officialAccountId    bigint not null default 0 comment '微信公众号基本信息id,关联微信公众号基本信息表',
   mediaId              varchar(50) not null default '' comment '媒体文件的唯一标识
            ',
   type                 tinyint(4) not null default 0 comment '媒体文件的类型',
   createdAt            timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' comment '媒体文件上传时间',
   path                 varchar(200) not null default '' comment '素材存储本地路径',
   mediaType            tinyint(4) not null default 0 comment '素材类型,永久或临时',
   createTime           timestamp not null default CURRENT_TIMESTAMP comment '创建时间',
   primary key (id)
);

alter table wx_media comment '存储微信的素材信息';

/*==============================================================*/
/* Table: WX_MESSAGE                                            */
/*==============================================================*/
create table wx_message
(
   id                   bigint not null comment '消息id',
   toUserId             bigint not null default 0 comment '收到消息一方的用户id，关联微信个人用户表或微信公众账号基本信息表',
   fromUserId           bigint not null default 0 comment '消息发送方的用户id',
   toUserName           varchar(50) not null default '' comment '接收方微信号',
   fromUserName         varchar(50) not null default '' comment '发送方微信号openid',
   createTime           timestamp not null default CURRENT_TIMESTAMP comment '消息创建时间',
   msgType              tinyint(4) not null default 0 comment '消息类型',
   msgId                bigint not null default 0 comment '消息id，64位整型',
   content              varchar(500) default '' comment '消息内容',
   picUrl               varchar(200) default '' comment '图片链接',
   mediaId              varchar(50) default '' comment '图片消息媒体id，可以调用多媒体文件下载接口拉取数据。',
   format               varchar(20) default '' comment '语音格式，如amr，speex等',
   recongnition         varchar(50) default '' comment '语音识别结果',
   thumbMediaId         varchar(50) default '' comment '视频消息缩略图的媒体id，可以调用多媒体文件下载接口拉取数据',
   locationX            varchar(50) default '' comment '地理位置维度',
   locationY            varchar(50) default '' comment '地理位置经度',
   scale                int default 0 comment '地图缩放大小',
   locationLabel        varchar(50) default '' comment '地理位置信息',
   title                varchar(50) default '' comment '消息标题',
   description          varchar(500) default '' comment '消息描述',
   url                  varchar(200) default '' comment '消息链接',
   ticket               varchar(50) default '' comment '二维码的ticket，可用来换取二维码图片',
   musicUrl             varchar(200) default '' comment '音乐链接',
   hqMusicUrl           varchar(200) default '' comment '高质量音乐链接，WIFI环境优先使用该链接播放音乐',
   articleCount         int default 0 comment '文章数量',
   primary key (id)
);

alter table wx_message comment '存储公众号和用户的消息发送记录';

/*==============================================================*/
/* Table: WX_MESSAGE_DISTRIBUTION_DAY                           */
/*==============================================================*/
create table wx_message_distribution_day
(
   id                   bigint not null comment '主键',
   officialAccountId    bigint not null default 0 comment '微信公众号基本信息id',
   refDate              date not null default '0000-00-00' comment '数据的日期',
   countInterval        tinyint(4) not null default 0 comment '当日发送消息量分布的区间，0代表 “0”，1代表“1-5”，2代表“6-10”，3代表“10次以上”',
   msgUser              int not null default 0 comment '上行发送了（向公众号发送了）消息的用户数',
   primary key (id)
);

alter table wx_message_distribution_day comment '存储微信每天发送消息量分布';

/*==============================================================*/
/* Table: WX_MESSAGE_SEND_DAY                                   */
/*==============================================================*/
create table wx_message_send_day
(
   id                   bigint not null comment '主键',
   refDate              date not null default '0000-00-00' comment '数据的日期',
   msgType              tinyint(4) not null default 0 comment '消息类型，代表含义如下：
            1代表文字 2代表图片 3代表语音 4代表视频 6代表第三方应用消息（链接消息）',
   msgUser              int not null default 0 comment '上行发送了（向公众号发送了）消息的用户数
            ',
   msgCount             int not null default 0 comment '上行发送了消息的消息总数',
   primary key (id)
);

alter table wx_message_send_day comment '存储微信消息发送概况数据信息';

/*==============================================================*/
/* Table: WX_MESSAGE_SEND_HOUR                                  */
/*==============================================================*/
create table wx_message_send_hour
(
   id                   bigint not null comment '主键',
   refDate              date not null default '0000-00-00' comment '数据的日期',
   refHour              int not null default 0 comment '数据的小时，包括从000到2300，分别代表的是[000,100)到[2300,2400)，即每日的第1小时和最后1小时',
   msgType              tinyint(4) not null default 0 comment '消息类型，代表含义如下：
            1代表文字 2代表图片 3代表语音 4代表视频 6代表第三方应用消息（链接消息）',
   msgUser              int not null default 0 comment '上行发送了（向公众号发送了）消息的用户数
            ',
   msgCount             int not null default 0 comment '上行发送了消息的消息总数',
   primary key (id)
);

alter table wx_message_send_hour comment '存储微信消息发送分时概况数据信息';

/*==============================================================*/
/* Table: WX_OFFICIAL_ACCOUNT                                   */
/*==============================================================*/
create table wx_official_account
(
   id                   bigint not null,
   appid                varchar(100) not null default '' comment '微信公众号appid',
   accountType          tinyint(4) not null default 0 comment '公众账号的绑定方式,1为授权绑定,2为手动绑定
            ',
   serviceTypeInfo      tinyint(4) not null default 0 comment '公众号类型，0代表订阅号，1代表由历史老帐号升级后的订阅号，2代表服务号',
   verifyTypeInfo       tinyint(4) not null default 0 comment '授权方认证类型，-1代表未认证，0代表微信认证，1代表新浪微博认证，2代表腾讯微博认证，3代表已资质认证通过但还未通过名称认证，4代表已资质认证通过、还未通过名称认证，但通过了新浪微博认证，5代表已资质认证通过、还未通过名称认证，但通过了腾讯微博认证',
   nickName             varchar(50) not null default '' comment '公众号名称',
   userName             varchar(50) not null default '' comment '公众号原始id',
   createTime           timestamp not null default CURRENT_TIMESTAMP comment '记录创建时间',
   primary key (id)
);

alter table wx_official_account comment '微信公众账号的appid和绑定类型';

/*==============================================================*/
/* Table: WX_OFFICIAL_ACCOUNT_ACCESS_TOKEN                      */
/*==============================================================*/
create table wx_official_account_access_token
(
   id                   bigint not null,
   officialAccountId    bigint not null default 0 comment '微信公众号基本信息id，关联微信公众号基本信息表',
   appid                varchar(50) not null default '' comment '微信的appid',
   expiresIn            bigint not null default 0 comment '截止时间',
   accessToken          varchar(200) not null default '' comment '微信公众号的accessToken',
   createTime           timestamp not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '记录创建时间',
   primary key (id)
);

alter table wx_official_account_access_token comment '手动绑定的微信公众号accesstoken信息';

/*==============================================================*/
/* Table: WX_OFFICIAL_ACCOUNT_INFO                              */
/*==============================================================*/
create table wx_official_account_info
(
   id                   bigint not null comment '主键',
   officialAccountId    bigint not null default 0 comment '微信公众账号基本信息表id，关联微信公众号基本信息表',
   appid                varchar(100) not null default '' comment '微信的公众号appid',
   appSecret            varchar(100) not null default '' comment '微信公众号appSecret',
   token                varchar(100) not null default '' comment '微信公众号的token',
   encodingAesKey       varchar(100) not null default '' comment '微信公众号encodingAesKey',
   wechatId             varchar(50) comment '微信号id',
   messageUrl           varchar(200) not null default '' comment '公众号消息接收地址',
   createTime           timestamp not null default CURRENT_TIMESTAMP comment '创建时间',
   primary key (id)
);

alter table wx_official_account_info comment '手动绑定的微信公众账号信息';

/*==============================================================*/
/* Table: WX_PERSONAL_USER                                      */
/*==============================================================*/
create table wx_personal_user
(
   id                   bigint not null,
   officialAccountId    bigint not null default 0 comment '用户所属的公众号id，关联公众号基本信息表',
   openid               varchar(50) not null default '' comment '用户的标识，对当前公众号唯一',
   subscribe            tinyint(4) not null default 0 comment '用户是否订阅该公众号标识，值为0时，代表此用户没有关注该公众号，拉取不到其余信息，只有openid和UnionID（在该公众号绑定到了微信开放平台账号时才有）。',
   nickName             varchar(20) not null default '' comment '用户的昵称',
   sex                  tinyint(4) not null default 0 comment '用户的性别，值为1时是男性，值为2时是女性，值为0时是未知',
   city                 varchar(20) not null default '' comment '用户所在城市',
   country              varchar(20) not null default '' comment '用户所在国家',
   province             varchar(20) not null default '' comment '用户所在省份',
   language             varchar(20) not null default '' comment '用户的语言，简体中文为zh_CN',
   headimgurl           varchar(200) not null default '' comment '用户头像，最后一个数值代表正方形头像大小（有0、46、64、96、132数值可选，0代表640*640正方形头像），用户没有头像时该项为空。若用户更换头像，原有头像URL将失效。',
   subscribeTime        timestamp not null default '0000-00-00 00:00:00' comment '用户关注时间，为时间戳。如果用户曾多次关注，则取最后关注时间',
   unionid              varchar(50) not null default '' comment '只有在用户将公众号绑定到微信开放平台帐号后，才会出现该字段。',
   remark               varchar(20) not null default '' comment '公众号运营者对粉丝的备注，公众号运营者可在微信公众平台用户管理界面对粉丝添加备注',
   groupid              varchar(50) default '' comment '用户所在的分组ID',
   createTime           timestamp not null default CURRENT_TIMESTAMP comment '消息创建时间',
   primary key (id)
);

alter table wx_personal_user comment '存储微信的个人用户信息';

/*==============================================================*/
/* Table: WX_PRE_AUTH_CODE                                      */
/*==============================================================*/
create table wx_pre_auth_code
(
   id                   bigint not null comment '主键',
   preAuthCode          varchar(100) not null default '' comment '微信预授权码',
   createTime           timestamp not null default CURRENT_TIMESTAMP,
   expiresIn            int default 0 comment '有效期',
   primary key (id)
);

alter table wx_pre_auth_code comment '存储微信的预授权码';

/*==============================================================*/
/* Table: WX_REPLY_SETTING                                      */
/*==============================================================*/
create table wx_reply_setting
(
   id                   bigint not null comment '主键',
   officialAccountId    bigint not null default 0 comment '微信公众号基本信息id',
   replyOpen            tinyint(4) not null default 0 comment '回复是否开启，0代表未开启，1代表开启',
   replyType            tinyint(4) not null default 0 comment '动作类型，1代表关注回复，2代表消息自动回复',
   type                 tinyint(4) default 0 comment '自动回复的类型。关注后自动回复和消息自动回复的类型仅支持文本（text）、图片（img）、语音（voice）、视频（video），关键词自动回复则还多了图文消息（news） ',
   content              varchar(1000) default '' comment '对于文本类型，content是文本内容，对于图文、图片、语音、视频类型，content是mediaID',
   plat                 tinyint(4) not null default 0 comment '设置平台方，1,代表在微信后台设置，2代表在我方后台设置',
   createTime           timestamp not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '创建时间',
   primary key (id)
);

alter table wx_reply_setting comment '存储微信的自动回复和消息自动回复设置信息';

/*==============================================================*/
/* Table: WX_SYSTEM_USER                                        */
/*==============================================================*/
create table wx_system_user
(
   id                   bigint not null,
   userName             varchar(20) not null default '' comment '用户名称',
   email                varchar(50) not null default '' comment '邮箱账号',
   password             varchar(100) not null default '' comment '密码',
   createTime           timestamp not null default CURRENT_TIMESTAMP comment '创建时间',
   primary key (id)
);

alter table wx_system_user comment '系统用户表';

/*==============================================================*/
/* Table: WX_USER_DATA                                          */
/*==============================================================*/
create table wx_user_data
(
   id                   bigint not null,
   officialAccountId    bigint not null default 0 comment '微信公众号基本信息id，关联公众号基本信息表',
   refDate              date not null default '0000-00-00' comment '数据的日期',
   userSource           tinyint(4) not null default 0 comment '用户的渠道，数值代表的含义如下：
            0代表其他（包括带参数二维码） 3代表扫二维码 17代表名片分享 35代表搜号码（即微信添加朋友页的搜索） 39代表查询微信公众帐号 43代表图文页右上角菜单',
   newUser              int not null default 0 comment '新增的用户数量',
   cancel               int not null default 0 comment '取消关注的用户数量，new_user减去cancel_user即为净增用户数量',
   cumulateUser         int not null default 0 comment '总用户量',
   primary key (id)
);

alter table wx_user_data comment '存储用户分析数据';

/*==============================================================*/
/* Table: WX_USER_LOCATION                                      */
/*==============================================================*/
create table wx_user_location
(
   id                   bigint not null comment '主键',
   toUserId             bigint not null default 0 comment '收到消息一方的用户id，关联微信个人用户表或微信公众账号基本信息表',
   fromUserId           bigint not null default 0 comment '消息发送方的用户id',
   toUserName           varchar(50) not null default '' comment '接收方微信号',
   fromUserName         varchar(50) not null default '' comment '发送方微信号openid',
   createTime           timestamp not null default CURRENT_TIMESTAMP comment '消息创建时间',
   msgType              tinyint(4) not null default 0 comment '消息类型',
   event                tinyint(4) not null default 0 comment '事件类型',
   latitude             varchar(50) not null default '' comment '地理位置维度',
   longitude            varchar(50) not null default '' comment '地理位置经度',
   locationPrecision    varchar(50) not null default '' comment '地理位置精度',
   primary key (id)
);

alter table wx_user_location comment '微信用户地理位置上报事件信息';

/*==============================================================*/
/* Table: WX_USER_OFFICIAL_ACCOUNT                              */
/*==============================================================*/
create table wx_user_official_account
(
   id                   bigint not null,
   userId               bigint not null default 0 comment '系统用户id',
   officialAccountId    bigint not null default 0 comment '微信公众号基本信息表id,关联微信公众号基本信息表',
   primary key (id)
);

alter table wx_user_official_account comment '关联用户表和微信公众号基本信息关联表';

/*==============================================================*/
/* Table: WX_WECHAT_THIRD_PARTY_CONFIG                          */
/*==============================================================*/
create table wx_wechat_third_party_config
(
   id                   bigint not null comment '主键',
   componentAppid       varchar(50) not null default '' comment '微信第三方component_appid',
   componentAppsecret   varchar(50) not null default '' comment '微信第三方component_appsecret',
   token                varchar(50) not null default '' comment '微信第三方token信息',
   encodeingAesKey      varchar(100) not null default '' comment '微信第三方加解密key',
   authorizationUrl     varchar(100) not null default '' comment '授权事件接收url',
   redirectUrl          varchar(100) not null default '' comment '授权事件跳转url',
   componentAccessToken varchar(200) not null default '' comment '第三方component_access_token',
   messgesUrl           varchar(100) not null default '' comment '公众号消息与事件接收URL',
   componentVerifyTicket varchar(200) not null default '' comment '微信第三方component_verfiy_ticket',
   createTime           timestamp  NOT NULL DEFAULT '0000-00-00 00:00:00' comment '创建时间',
   updateTime           timestamp not null default CURRENT_TIMESTAMP comment '更新时间',
   primary key (id)
);

alter table wx_wechat_third_party_config comment '存储微信第三方的配置信息';
