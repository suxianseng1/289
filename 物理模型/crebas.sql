/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     2018/10/26 9:41:29                           */
/*==============================================================*/



-- Type package declaration
create or replace package PDTypes  
as
    TYPE ref_cursor IS REF CURSOR;
end;

-- Integrity package declaration
create or replace package IntegrityPackage AS
 procedure InitNestLevel;
 function GetNestLevel return number;
 procedure NextNestLevel;
 procedure PreviousNestLevel;
 end IntegrityPackage;
/

-- Integrity package definition
create or replace package body IntegrityPackage AS
 NestLevel number;

-- Procedure to initialize the trigger nest level
 procedure InitNestLevel is
 begin
 NestLevel := 0;
 end;


-- Function to return the trigger nest level
 function GetNestLevel return number is
 begin
 if NestLevel is null then
     NestLevel := 0;
 end if;
 return(NestLevel);
 end;

-- Procedure to increase the trigger nest level
 procedure NextNestLevel is
 begin
 if NestLevel is null then
     NestLevel := 0;
 end if;
 NestLevel := NestLevel + 1;
 end;

-- Procedure to decrease the trigger nest level
 procedure PreviousNestLevel is
 begin
 NestLevel := NestLevel - 1;
 end;

 end IntegrityPackage;
/


drop trigger "CompoundDeleteTrigger_material"
/

drop trigger "CompoundInsertTrigger_material"
/

drop trigger "CompoundUpdateTrigger_material"
/

drop trigger "tib_material"
/

drop trigger "CompoundDeleteTrigger_order"
/

drop trigger "CompoundInsertTrigger_order"
/

drop trigger "CompoundUpdateTrigger_order"
/

drop trigger "tib_order"
/

drop trigger "CompoundDeleteTrigger_order_ch"
/

drop trigger "CompoundInsertTrigger_order_ch"
/

drop trigger "CompoundUpdateTrigger_order_ch"
/

drop trigger "tib_order_change"
/

drop trigger "CompoundDeleteTrigger_upcoming"
/

drop trigger "CompoundInsertTrigger_upcoming"
/

drop trigger "CompoundUpdateTrigger_upcoming"
/

drop trigger "tib_upcoming"
/

drop trigger "CompoundDeleteTrigger_order"
/

drop trigger "CompoundInsertTrigger_order"
/

drop trigger "CompoundUpdateTrigger_order"
/

drop trigger "tib_order"
/

drop trigger "CompoundDeleteTrigger_order"
/

drop trigger "CompoundInsertTrigger_order"
/

drop trigger "CompoundUpdateTrigger_order"
/

drop trigger "tib_order"
/

alter table E_MATERIAL
   drop constraint FK_E_MATERI_REFERENCE_E_ORDER
/

alter table E_ORDER_CHANGE
   drop constraint FK_E_ORDER__REFERENCE_E_ORDER
/

alter table "Product_SN"
   drop constraint FK_PRODUCT__REFERENCE_WIP
/

alter table WIP
   drop constraint FK_WIP_REFERENCE_工单
/

alter table WIP
   drop constraint FK_WIP_REFERENCE_工序信息
/

alter table WIP
   drop constraint FK_WIP_REFERENCE_工序物料
/

alter table 人员与工种关系表
   drop constraint FK_人员与工种关系表_REFERENCE_工种
/

alter table 人员与工种关系表
   drop constraint FK_人员与工种关系表_REFERENCE_人员
/

alter table 人员与设备关系表
   drop constraint FK_人员与设备关系表_REFERENCE_设备
/

alter table 人员与设备关系表
   drop constraint FK_人员与设备关系表_REFERENCE_人员
/

alter table 工单
   drop constraint FK_工单_REFERENCE_E_ORDER
/

alter table 工单ERP工艺表
   drop constraint FK_工单ERP工艺表_REFERENCE_工单
/

alter table 工序信息
   drop constraint FK_工序信息_REFERENCE_BOP
/

alter table 工序信息
   drop constraint FK_工序信息_REFERENCE_工序工作中心
/

alter table 工序参数
   drop constraint FK_工序参数_REFERENCE_工序信息
/

alter table 工序工时
   drop constraint FK_工序工时_REFERENCE_工序信息
/

alter table 工序工装，刀具，量具，辅具
   drop constraint FK_工序工装，刀具，_REFERENCE_工序信息
/

alter table 工序文件
   drop constraint FK_工序文件_REFERENCE_工序信息
/

alter table 工序物料
   drop constraint FK_工序物料_REFERENCE_工序信息
/

alter table 工序计划表
   drop constraint FK_工序计划表_REFERENCE_工单
/

alter table 工序计划表
   drop constraint FK_工序计划表_REFERENCE_工种
/

alter table 工序计划表
   drop constraint FK_工序计划表_REFERENCE_班组
/

alter table 工序计划表
   drop constraint FK_工序计划表_REFERENCE_人员
/

alter table 工序计划表
   drop constraint FK_工序计划表_REFERENCE_设备
/

alter table 工序设备
   drop constraint FK_工序设备_REFERENCE_工序信息
/

alter table 工步信息
   drop constraint FK_工步信息_REFERENCE_工序信息
/

alter table 库位
   drop constraint FK_库位_REFERENCE_库房
/

alter table 库存
   drop constraint FK_库存_REFERENCE_库位
/

alter table 库存
   drop constraint FK_库存_REFERENCE_半成品
/

alter table 库存
   drop constraint FK_库存_REFERENCE_元器件
/

alter table 库存
   drop constraint FK_库存_REFERENCE_产品
/

alter table 库存
   drop constraint FK_库存_REFERENCE_标准紧固件
/

alter table 库存
   drop constraint FK_库存_REFERENCE_金属材料
/

alter table 库存
   drop constraint FK_库存_REFERENCE_非金属材料
/

alter table 库存
   drop constraint FK_库存_REFERENCE_复合材料
/

alter table 库存
   drop constraint FK_库存_REFERENCE_机电配套件
/

alter table 库存
   drop constraint FK_库存_REFERENCE_仪器仪表
/

alter table 库存
   drop constraint FK_库存_REFERENCE_刀具
/

alter table 库存
   drop constraint FK_库存_REFERENCE_量具
/

alter table 库存
   drop constraint FK_库存_REFERENCE_工具
/

alter table 库存
   drop constraint FK_库存_REFERENCE_工装
/

alter table 班组
   drop constraint FK_班组_REFERENCE_组织
/

alter table 班组
   drop constraint FK_班组_REFERENCE_人员
/

alter table 班组与工种关系表
   drop constraint FK_班组与工种关系表_REFERENCE_班组
/

alter table 班组与工种关系表
   drop constraint FK_班组与工种关系表_REFERENCE_工种
/

alter table 班组与设备关系表
   drop constraint FK_班组与设备关系表_REFERENCE_设备
/

alter table 班组与设备关系表
   drop constraint FK_班组与设备关系表_REFERENCE_班组
/

alter table 维护设置
   drop constraint FK_维护设置_REFERENCE_设备
/

drop table BOP cascade constraints
/

drop table BOP列表 cascade constraints
/

drop table ERP工种 cascade constraints
/

drop table E_MATERIAL cascade constraints
/

drop table E_ORDER cascade constraints
/

drop table E_ORDER_CHANGE cascade constraints
/

drop table P_UPCOMING cascade constraints
/

drop table "Product_SN" cascade constraints
/

drop table WIP cascade constraints
/

drop table 产品 cascade constraints
/

drop table CIDPPUB.产品主数据 cascade constraints
/

drop table 人员 cascade constraints
/

drop table 人员与工种关系表 cascade constraints
/

drop table 人员与设备关系表 cascade constraints
/

drop table CIDPPUB.人员主数据 cascade constraints
/

drop table 仪器仪表 cascade constraints
/

drop table CIDPPUB.仪器仪表主数据 cascade constraints
/

drop table 保养记录 cascade constraints
/

drop table 元器件 cascade constraints
/

drop table CIDPPUB.元器件主数据 cascade constraints
/

drop table 刀具 cascade constraints
/

drop table CIDPPUB.刀具主数据 cascade constraints
/

drop table 半成品 cascade constraints
/

drop table CIDPPUB.半成品主数据 cascade constraints
/

drop table 复合材料 cascade constraints
/

drop table CIDPPUB.复合材料主数据 cascade constraints
/

drop table 工具 cascade constraints
/

drop table CIDPPUB.工具主数据 cascade constraints
/

drop table 工单 cascade constraints
/

drop table 工单ERP工艺表 cascade constraints
/

drop table 工序信息 cascade constraints
/

drop table 工序参数 cascade constraints
/

drop table 工序工作中心 cascade constraints
/

drop table 工序工时 cascade constraints
/

drop table 工序工装，刀具，量具，辅具 cascade constraints
/

drop table 工序文件 cascade constraints
/

drop table 工序物料 cascade constraints
/

drop table 工序计划表 cascade constraints
/

drop table 工序设备 cascade constraints
/

drop table 工步信息 cascade constraints
/

drop table 工种 cascade constraints
/

drop table 工装 cascade constraints
/

drop table CIDPPUB.工装主数据 cascade constraints
/

drop table 库位 cascade constraints
/

drop table 库存 cascade constraints
/

drop table 库房 cascade constraints
/

drop table 归还记录 cascade constraints
/

drop table CIDPPUB.机电配套主数据 cascade constraints
/

drop table 机电配套件 cascade constraints
/

drop table CIDPPUB.标准件主数据 cascade constraints
/

drop table 标准紧固件 cascade constraints
/

drop table 班组 cascade constraints
/

drop table 班组与工种关系表 cascade constraints
/

drop table 班组与设备关系表 cascade constraints
/

drop table CIDPPUB.生产厂商主数据 cascade constraints
/

drop table 组织 cascade constraints
/

drop table CIDPPUB.组织主数据 cascade constraints
/

drop table 维护设置 cascade constraints
/

drop table 设备 cascade constraints
/

drop table CIDPPUB.设备主数据 cascade constraints
/

drop table 量具 cascade constraints
/

drop table CIDPPUB.量具主数据 cascade constraints
/

drop table 金属材料 cascade constraints
/

drop table CIDPPUB.金属材料主数据 cascade constraints
/

drop table 非金属材料 cascade constraints
/

drop table CIDPPUB.非金属材料主数据 cascade constraints
/

drop table 领用记录 cascade constraints
/

drop user CIDPPUB
/

drop user "User_2"
/

drop sequence MATERIAL_SEQUE
/

drop sequence ORDER_CHANGE_SEQUE
/

drop sequence ORDER_SEQUE
/

drop sequence SQUE_UPCOMING
/

create sequence MATERIAL_SEQUE
increment by 1
start with 1
/

create sequence ORDER_CHANGE_SEQUE
increment by 1
start with 1
/

create sequence ORDER_SEQUE
increment by 1
start with 1
/

create sequence SQUE_UPCOMING
increment by 1
start with 1
/

/*==============================================================*/
/* User: CIDPPUB                                                */
/*==============================================================*/
create user CIDPPUB 
  identified by ""
/

/*==============================================================*/
/* User: "User_2"                                               */
/*==============================================================*/
create user "User_2" 
  identified by ""
/

/*==============================================================*/
/* Table: BOP                                                   */
/*==============================================================*/
create table BOP 
(
   ID                   NUMBER               not null,
   产品类型                 NUMBER,
   产品或半成品_ID            NUMBER,
   产品名称                 VARCHAR2(64 BYTE),
   版本号                  VARCHAR2(64 BYTE),
   发布时间                 TIMESTAMP,
   发布者                  VARCHAR2(64 BYTE),
   备注                   VARCHAR2(255 BYTE),
   更新时间                 TIMESTAMP,
   创建时间                 TIMESTAMP,
   更新用户                 VARCHAR2(64 BYTE),
   创建用户                 VARCHAR2(64 BYTE),
   constraint PK_BOP primary key (ID)
)
/

/*==============================================================*/
/* Table: BOP列表                                                 */
/*==============================================================*/
create table BOP列表 
(
   ID                   NUMBER               not null,
   BOP_ID               NUMBER,
   备注                   VARCHAR2(250 BYTE),
   "工单id"               CHAR(10),
   当前工艺                 NUMBER(1),
   constraint PK_BOP列表 primary key (ID)
)
/

comment on column BOP列表.当前工艺 is
'1：是当前工艺  0：非当前工艺'
/

/*==============================================================*/
/* Table: ERP工种                                                 */
/*==============================================================*/
create table ERP工种 
(
   ID                   NUMBER               not null,
   工种名称                 VARCHAR2(64 BYTE),
   部门                   VARCHAR2(64 BYTE),
   constraint PK_ERP工种 primary key (ID)
)
/

/*==============================================================*/
/* Table: E_MATERIAL                                            */
/*==============================================================*/
create table E_MATERIAL 
(
   ID                   INT                  not null,
   ORDER_ID             INT,
   PROCESS_NO           VARCHAR2(50 BYTE),
   PROCESS_DES          VARCHAR2(255 BYTE),
   WORK_CENTER          VARCHAR2(50 BYTE),
   WORK_CENTER_DES      VARCHAR2(255 BYTE),
   CONTROL_CODE         VARCHAR2(50 BYTE),
   PREPARE_HOURS        NUMBER,
   PREPARATION_UNIT     VARCHAR2(50 BYTE),
   POWER_HOURS          NUMBER,
   POWER_UNIT           VARCHAR2(50 BYTE),
   PAY_ATT              NUMBER,
   PAY_UNIT             VARCHAR2(50 BYTE),
   MANUFA_COSTS         NUMBER,
   MANUFACTURING_UNIT   VARCHAR2(50 BYTE),
   PROJECT_CODE         VARCHAR2(50 BYTE),
   MATERIAL_CODE        VARCHAR(50),
   COUNT                INT,
   UNIT                 VARCHAR2(50 BYTE),
   UPDATE_TIME          TIMESTAMP,
   CREATE_TIME          TIMESTAMP,
   UPDATE_USER          VARCHAR2(50 BYTE),
   CREATE_USER          VARCHAR2(50 BYTE),
   constraint PK_E_MATERIAL primary key (ID)
)
/

/*==============================================================*/
/* Table: E_ORDER                                               */
/*==============================================================*/
create table E_ORDER 
(
   ID                   INT                  not null,
   ORDER_NO             VARCHAR2(50 BYTE),
   CHILD_NO             VARCHAR2(50 BYTE),
   WBS                  VARCHAR2(50 BYTE),
   CODE_TEST            INT,
   STORAGE              VARCHAR2(50 BYTE),
   OUT_NO               VARCHAR(50),
   ORDER_TYPE           VARCHAR2(50 BYTE),
   ORDER_TYPE_NAME      VARCHAR2(50 BYTE),
   MATERIAL_NO          VARCHAR(50),
   MATERIAL_NAME        VARCHAR2(50 BYTE),
   DESCRIPTION          VARCHAR2(255 BYTE),
   COUNT                INT,
   START_TIME           TIMESTAMP,
   FINISH_TIME          TIMESTAMP,
   DISPATCHER           VARCHAR2(50 BYTE),
   DISPATCHER_NAME      VARCHAR2(50 BYTE),
   UPDATE_TIME          TIMESTAMP,
   CREATE_TIME          TIMESTAMP,
   UPDATE_USER          VARCHAR2(50 BYTE),
   CREATE_USER          VARCHAR2(50 BYTE),
   constraint PK_E_ORDER primary key (ID)
)
/

/*==============================================================*/
/* Table: E_ORDER_CHANGE                                        */
/*==============================================================*/
create table E_ORDER_CHANGE 
(
   ID                   INT                  not null,
   ORDER_ID             INT,
   CHANGE_FLAG          NUMBER,
   CHANGE_TYPE          NUMBER,
   WBS                  VARCHAR2(50 BYTE),
   CODE_TEST            int,
   STORAGE              VARCHAR(20),
   ORDER_TYPE           VARCHAR2(50 BYTE),
   ORDER_TYPE_NAME      VARCHAR2(50 BYTE),
   ORDER_NO             VARCHAR2(50 BYTE),
   MATERIAL_NO          VARCHAR(50),
   MATERIAL_NAME        VARCHAR2(50 BYTE),
   DESCRIPTION          VARCHAR2(255 BYTE),
   COUNT                INT,
   START_TIME           TIMESTAMP,
   FINISH_TIME          TIMESTAMP,
   DISPATCHER           VARCHAR2(50 BYTE),
   DISPATCHER_NAME      VARCHAR2(50 BYTE),
   UPDATE_TIME          TIMESTAMP,
   CREATE_TIME          TIMESTAMP,
   UPDATE_USER          VARCHAR2(50 BYTE),
   CREATE_USER          VARCHAR2(50 BYTE),
   constraint PK_E_ORDER_CHANGE primary key (ID)
)
/

/*==============================================================*/
/* Table: P_UPCOMING                                            */
/*==============================================================*/
create table P_UPCOMING 
(
   ID                   INT                  not null,
   TASK_NAME            VARCHAR2(50),
   APP_SEND_UID         VARCHAR2(50),
   TASK_TYPE            VARCHAR2(50),
   SEND_TIME            DATE,
   END_TIME             DATE,
   PRIORITY             INT,
   URL                  VARCHAR2(200),
   TASK_DESC            VARCHAR2(500),
   STATUS               INT,
   constraint PK_P_UPCOMING primary key (ID)
)
/

/*==============================================================*/
/* Table: "Product_SN"                                          */
/*==============================================================*/
create table "Product_SN" 
(
   ID                   INT                  not null,
   WIP_ID               VARCHAR(30),
   "Product_SN"         VARCHAR(30),
   "Material_No"        VARCHAR2(30 BYTE),
   "Batch_Number"       VARCHAR(30),
   "Quality_Grade"      VARCHAR(30),
   "Certificate_No"     VARCHAR(30),
   "Expiry_Date"        VARCHAR(30),
   "Material_Count"     VARCHAR(30),
   CREATE_TIME          VARCHAR(50),
   UPDATE_USER          VARCHAR2(50 BYTE),
   CREATE_USER          VARCHAR2(50 BYTE),
   constraint PK_PRODUCT_SN primary key (ID)
)
/

/*==============================================================*/
/* Table: WIP                                                   */
/*==============================================================*/
create table WIP 
(
   ID                   VARCHAR(30)          not null,
   "Rout_ID"            CHAR(10),
   "Step_ID"            VARCHAR2(50 BYTE),
   UPDATE_TIME          VARCHAR(30),
   CREATE_TIME          VARCHAR(30),
   "Submit_Time"        VARCHAR(30),
   "Submit_User_ID"     VARCHAR(30),
   UPDATE_USER_ID       VARCHAR2(50 BYTE),
   CREATE_USER_ID       VARCHAR2(50 BYTE),
   constraint PK_WIP primary key (ID)
)
/

/*==============================================================*/
/* Table: 产品                                                    */
/*==============================================================*/
create table 产品 
(
   ID                   NUMBER               not null,
   WLBH                 VARCHAR2(128 BYTE),
   更新时间                 TIMESTAMP,
   创建时间                 TIMESTAMP,
   更新用户                 VARCHAR2(50 BYTE),
   创建用户                 VARCHAR2(50 BYTE),
   constraint PK_产品 primary key (ID)
)
/

/*==============================================================*/
/* Table: 产品主数据                                                 */
/*==============================================================*/
create table CIDPPUB.产品主数据 
(
   ID                   VARCHAR2(32)         not null,
   DATAID               VARCHAR2(32),
   VERSION              VARCHAR2(50),
   VERSIONSTATUS        VARCHAR2(50),
   DATASTATUS           VARCHAR2(50),
   CREATEUSER           VARCHAR2(32),
   MODIFYUSER           VARCHAR2(32),
   MODIFYTIME           DATE,
   CREATEDEPT           VARCHAR2(32),
   CREATEDATE           DATE                 default SYSDATE,
   VALIDDATE            DATE,
   SECRETLEVEL          VARCHAR2(50),
   DATAORIGIN           VARCHAR2(50),
   FLBM                 VARCHAR2(128),
   FLMC                 VARCHAR2(128),
   WLBH                 VARCHAR2(128),
   MC                   VARCHAR2(128),
   DH                   VARCHAR2(128),
   TH                   VARCHAR2(128),
   CPLB                 VARCHAR2(128),
   C                    VARCHAR2(128),
   K                    VARCHAR2(128),
   G                    VARCHAR2(128),
   DYFW                 VARCHAR2(128),
   GNMS                 VARCHAR2(128),
   WLMS                 VARCHAR2(256),
   KTGRM                VARCHAR2(32),
   VERPR                NUMBER(12,2),
   STPRS                NUMBER(12,2),
   BWTTY                VARCHAR2(32),
   BKLAS                VARCHAR2(32),
   XYSART               VARCHAR2(32),
   XJZART               VARCHAR2(32),
   WQCART               VARCHAR2(32),
   IQCART               VARCHAR2(32),
   FEVOR                VARCHAR2(32),
   SBDKZ                VARCHAR2(32),
   LGPRO                VARCHAR2(32),
   LGFSB                VARCHAR2(32),
   BESKZ                VARCHAR2(32),
   BSTMI                VARCHAR2(64),
   DISPO                VARCHAR2(32),
   DISGR                VARCHAR2(32),
   MSTAE                VARCHAR2(32),
   EISBE                VARCHAR2(64),
   EKGRP                VARCHAR2(32),
   ZXLH                 VARCHAR2(32),
   JLDW                 VARCHAR2(32),
   XMJD                 VARCHAR2(64),
   DZEIT                VARCHAR2(64),
   SJBBH                VARCHAR2(64),
   constraint PK_产品主数据 primary key (ID)
         USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
     TABLESPACE "USERS"  ENABLE,
   constraint AK_KEY_1_产品主数据 unique (ID)
         USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
     TABLESPACE "USERS"  ENABLE
)
SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS"
/

comment on column CIDPPUB.产品主数据.FLBM is
'产品分类'
/

comment on column CIDPPUB.产品主数据.FLMC is
'分类名称'
/

comment on column CIDPPUB.产品主数据.WLBH is
'物料编号'
/

comment on column CIDPPUB.产品主数据.MC is
'物料名称'
/

comment on column CIDPPUB.产品主数据.DH is
'代号'
/

comment on column CIDPPUB.产品主数据.TH is
'图号'
/

comment on column CIDPPUB.产品主数据.CPLB is
'产品类别'
/

comment on column CIDPPUB.产品主数据.C is
'长（mm）'
/

comment on column CIDPPUB.产品主数据.K is
'宽（mm）'
/

comment on column CIDPPUB.产品主数据.G is
'高（mm）'
/

comment on column CIDPPUB.产品主数据.DYFW is
'工作电压范围（V）'
/

comment on column CIDPPUB.产品主数据.GNMS is
'主要功能描述'
/

comment on column CIDPPUB.产品主数据.WLMS is
'物料描述'
/

comment on column CIDPPUB.产品主数据.KTGRM is
'科目设置组'
/

comment on column CIDPPUB.产品主数据.VERPR is
'移动平均价'
/

comment on column CIDPPUB.产品主数据.STPRS is
'标准价格'
/

comment on column CIDPPUB.产品主数据.BWTTY is
'评估类别'
/

comment on column CIDPPUB.产品主数据.BKLAS is
'评估类'
/

comment on column CIDPPUB.产品主数据.XYSART is
'激活下厂验收检验'
/

comment on column CIDPPUB.产品主数据.XJZART is
'激活下厂监制检验'
/

comment on column CIDPPUB.产品主数据.WQCART is
'激活超期复检'
/

comment on column CIDPPUB.产品主数据.IQCART is
'激活入厂检验'
/

comment on column CIDPPUB.产品主数据.FEVOR is
'生产管理员'
/

comment on column CIDPPUB.产品主数据.SBDKZ is
'独立/集中'
/

comment on column CIDPPUB.产品主数据.LGPRO is
'生产仓储地点'
/

comment on column CIDPPUB.产品主数据.LGFSB is
'外部采购库存地点'
/

comment on column CIDPPUB.产品主数据.BESKZ is
'采购类型'
/

comment on column CIDPPUB.产品主数据.BSTMI is
'最小批量大小'
/

comment on column CIDPPUB.产品主数据.DISPO is
'MRP控制者'
/

comment on column CIDPPUB.产品主数据.DISGR is
'MRP组'
/

comment on column CIDPPUB.产品主数据.MSTAE is
'物料状态'
/

comment on column CIDPPUB.产品主数据.EISBE is
'安全库存'
/

comment on column CIDPPUB.产品主数据.EKGRP is
'采购组'
/

comment on column CIDPPUB.产品主数据.ZXLH is
'是否启用序列号'
/

comment on column CIDPPUB.产品主数据.JLDW is
'计量单位'
/

comment on column CIDPPUB.产品主数据.XMJD is
'项目阶段'
/

comment on column CIDPPUB.产品主数据.DZEIT is
'自制生产'
/

comment on column CIDPPUB.产品主数据.SJBBH is
'设计版本号'
/

/*==============================================================*/
/* Table: 人员                                                    */
/*==============================================================*/
create table 人员 
(
   ID                   NUMBER               not null,
   YGBM                 VARCHAR2(64 BYTE),
   备注                   VARCHAR(255),
   更新时间                 TIMESTAMP,
   创建时间                 TIMESTAMP,
   更新用户                 VARCHAR2(50 BYTE),
   创建用户                 VARCHAR2(50 BYTE),
   constraint PK_人员 primary key (ID)
)
/

/*==============================================================*/
/* Table: 人员与工种关系表                                              */
/*==============================================================*/
create table 人员与工种关系表 
(
   ID                   NUMBER               not null,
   工种_ID                NUMBER,
   人员_ID                NUMBER,
   更新时间                 TIMESTAMP,
   创建时间                 TIMESTAMP,
   更新用户                 VARCHAR2(50 BYTE),
   创建用户                 VARCHAR2(50 BYTE),
   constraint PK_人员与工种关系表 primary key (ID)
)
/

/*==============================================================*/
/* Table: 人员与设备关系表                                              */
/*==============================================================*/
create table 人员与设备关系表 
(
   ID                   NUMBER               not null,
   设备_ID                NUMBER,
   人员_ID                NUMBER,
   更新时间                 TIMESTAMP,
   创建时间                 TIMESTAMP,
   更新用户                 VARCHAR2(50 BYTE),
   创建用户                 VARCHAR2(50 BYTE),
   constraint PK_人员与设备关系表 primary key (ID)
)
/

/*==============================================================*/
/* Table: 人员主数据                                                 */
/*==============================================================*/
create table CIDPPUB.人员主数据 
(
   ID                   VARCHAR2(32)         not null,
   DATAID               VARCHAR2(32),
   VERSION              VARCHAR2(50),
   VERSIONSTATUS        VARCHAR2(50),
   DATASTATUS           VARCHAR2(50),
   CREATEUSER           VARCHAR2(32),
   MODIFYUSER           VARCHAR2(32),
   MODIFYTIME           DATE,
   CREATEDEPT           VARCHAR2(32),
   CREATEDATE           DATE                 default SYSDATE,
   VALIDDATE            DATE,
   SECRETLEVEL          VARCHAR2(50),
   DATAORIGIN           VARCHAR2(50),
   YGBM                 VARCHAR2(64),
   XM                   VARCHAR2(64),
   ZJLX                 VARCHAR2(64),
   ZJH                  VARCHAR2(128),
   XB                   VARCHAR2(64),
   CSRQ                 DATE,
   MZ                   VARCHAR2(64),
   CJGZSJ               DATE,
   RYLB                 VARCHAR2(64),
   TSXBS                VARCHAR2(64),
   SMDJ                 VARCHAR2(64),
   GJ                   VARCHAR2(64),
   CSD                  VARCHAR2(128),
   HKSZD                VARCHAR2(128),
   JG                   VARCHAR2(128),
   ZZMM                 VARCHAR2(64),
   HYZZ                 VARCHAR2(64),
   XL                   VARCHAR2(64),
   XW                   VARCHAR2(64),
   JRDWSJ               DATE,
   BM                   VARCHAR2(64),
   JRBMSJ               DATE,
   GW                   VARCHAR2(64),
   GWMC                 VARCHAR2(64),
   JRGWSJ               DATE,
   YGXS                 VARCHAR2(64),
   YGLY                 VARCHAR2(64),
   YGSF                 VARCHAR2(64),
   YGZT                 VARCHAR2(64),
   CYM                  VARCHAR2(64),
   HKLX                 VARCHAR2(64),
   ZYJSZG               VARCHAR2(64),
   ZWQDSJ               DATE,
   ZWPRSJ               DATE,
   ZYZGDJ               VARCHAR2(64),
   DJQDSJ               DATE,
   YGSCG                VARCHAR2(64),
   SMRYGW               VARCHAR2(64),
   SXZY                 VARCHAR2(64),
   XZZW                 VARCHAR2(64),
   BZ                   VARCHAR2(64),
   BYYX                 VARCHAR2(64),
   YGBH                 VARCHAR2(64),
   HKXXDZ               VARCHAR2(128),
   RYLB2                VARCHAR2(64),
   TXLX                 VARCHAR2(64),
   LXFS                 VARCHAR2(64),
   YX                   VARCHAR2(64),
   constraint PK_人员主数据 primary key (ID)
         USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
     TABLESPACE "USERS"  ENABLE,
   constraint AK_KEY_1_人员主数据 unique (ID)
         USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
     TABLESPACE "USERS"  ENABLE
)
SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS"
/

comment on column CIDPPUB.人员主数据.YGBM is
'员工编码'
/

comment on column CIDPPUB.人员主数据.XM is
'姓名'
/

comment on column CIDPPUB.人员主数据.ZJLX is
'证件类型'
/

comment on column CIDPPUB.人员主数据.ZJH is
'证件号'
/

comment on column CIDPPUB.人员主数据.XB is
'性别'
/

comment on column CIDPPUB.人员主数据.CSRQ is
'出生日期'
/

comment on column CIDPPUB.人员主数据.MZ is
'民族'
/

comment on column CIDPPUB.人员主数据.CJGZSJ is
'参加工作时间'
/

comment on column CIDPPUB.人员主数据.RYLB is
'人员类别'
/

comment on column CIDPPUB.人员主数据.TSXBS is
'特殊项标识'
/

comment on column CIDPPUB.人员主数据.SMDJ is
'涉密等级'
/

comment on column CIDPPUB.人员主数据.GJ is
'国籍'
/

comment on column CIDPPUB.人员主数据.CSD is
'出生地'
/

comment on column CIDPPUB.人员主数据.HKSZD is
'户口所在地'
/

comment on column CIDPPUB.人员主数据.JG is
'籍贯'
/

comment on column CIDPPUB.人员主数据.ZZMM is
'政治面貌'
/

comment on column CIDPPUB.人员主数据.HYZZ is
'婚姻状况'
/

comment on column CIDPPUB.人员主数据.XL is
'学历'
/

comment on column CIDPPUB.人员主数据.XW is
'学位'
/

comment on column CIDPPUB.人员主数据.JRDWSJ is
'进入本单位工作时间'
/

comment on column CIDPPUB.人员主数据.BM is
'部门'
/

comment on column CIDPPUB.人员主数据.JRBMSJ is
'加入当前部门时间'
/

comment on column CIDPPUB.人员主数据.GW is
'岗位'
/

comment on column CIDPPUB.人员主数据.GWMC is
'岗位名称'
/

comment on column CIDPPUB.人员主数据.JRGWSJ is
'加入当前岗位时间'
/

comment on column CIDPPUB.人员主数据.YGXS is
'用工形式'
/

comment on column CIDPPUB.人员主数据.YGLY is
'员工来源'
/

comment on column CIDPPUB.人员主数据.YGSF is
'员工身份'
/

comment on column CIDPPUB.人员主数据.YGZT is
'员工状态'
/

comment on column CIDPPUB.人员主数据.CYM is
'曾用名'
/

comment on column CIDPPUB.人员主数据.HKLX is
'户口类型'
/

comment on column CIDPPUB.人员主数据.ZYJSZG is
'专业技术资格'
/

comment on column CIDPPUB.人员主数据.ZWQDSJ is
'专业技术职务取得时间'
/

comment on column CIDPPUB.人员主数据.ZWPRSJ is
'专业技术职务聘任时间'
/

comment on column CIDPPUB.人员主数据.ZYZGDJ is
'职业资格等级'
/

comment on column CIDPPUB.人员主数据.DJQDSJ is
'职业资格等级取得时间'
/

comment on column CIDPPUB.人员主数据.YGSCG is
'因公私出国'
/

comment on column CIDPPUB.人员主数据.SMRYGW is
'涉密人员岗位'
/

comment on column CIDPPUB.人员主数据.SXZY is
'所学专业'
/

comment on column CIDPPUB.人员主数据.XZZW is
'行政职务'
/

comment on column CIDPPUB.人员主数据.BZ is
'备注'
/

comment on column CIDPPUB.人员主数据.BYYX is
'毕业院校'
/

comment on column CIDPPUB.人员主数据.YGBH is
'员工编号'
/

comment on column CIDPPUB.人员主数据.HKXXDZ is
'户口详细地址'
/

comment on column CIDPPUB.人员主数据.RYLB2 is
'人员类别2'
/

comment on column CIDPPUB.人员主数据.TXLX is
'通讯类型'
/

comment on column CIDPPUB.人员主数据.LXFS is
'联系方式'
/

comment on column CIDPPUB.人员主数据.YX is
'邮箱'
/

/*==============================================================*/
/* Table: 仪器仪表                                                  */
/*==============================================================*/
create table 仪器仪表 
(
   ID                   NUMBER               not null,
   YQBM                 VARCHAR2(64 BYTE),
   更新时间                 TIMESTAMP,
   创建时间                 TIMESTAMP,
   更新用户                 VARCHAR2(50 BYTE),
   创建用户                 VARCHAR2(50 BYTE),
   constraint PK_仪器仪表 primary key (ID)
)
/

/*==============================================================*/
/* Table: 仪器仪表主数据                                               */
/*==============================================================*/
create table CIDPPUB.仪器仪表主数据 
(
   ID                   VARCHAR2(32)         not null,
   DATAID               VARCHAR2(32),
   VERSION              VARCHAR2(50),
   VERSIONSTATUS        VARCHAR2(50),
   DATASTATUS           VARCHAR2(50),
   CREATEUSER           VARCHAR2(32),
   MODIFYUSER           VARCHAR2(32),
   MODIFYTIME           DATE,
   CREATEDEPT           VARCHAR2(32),
   CREATEDATE           DATE                 default SYSDATE,
   VALIDDATE            DATE,
   SECRETLEVEL          VARCHAR2(50),
   DATAORIGIN           VARCHAR2(50),
   LSBM                 VARCHAR2(64),
   FLBM                 VARCHAR2(64),
   FLMC                 VARCHAR2(64),
   YQBM                 VARCHAR2(64),
   MC                   VARCHAR2(64),
   XH                   VARCHAR2(128),
   GG                   VARCHAR2(128),
   JDDJ                 VARCHAR2(128),
   SCCJ                 VARCHAR2(128),
   YZ                   VARCHAR2(32),
   CCBH                 VARCHAR2(64),
   CCSJ                 VARCHAR2(64),
   QYSJ                 VARCHAR2(64),
   GLZT                 VARCHAR2(64),
   SYQX                 VARCHAR2(64),
   ZCYT                 VARCHAR2(64),
   BZ                   VARCHAR2(512),
   JLDW                 VARCHAR2(32),
   CCSJN                DATE,
   QYSJN                DATE,
   EQUI_ZZBFRQ          DATE,
   EQUI_ZZEDGL          VARCHAR2(128),
   EQUI_ZZYPXLH         VARCHAR2(128),
   EQUI_ZZFWBH          VARCHAR2(128),
   EQUI_ZZCPH           VARCHAR2(64),
   EQUI_ZZLXFS          VARCHAR2(128),
   EQUI_ZZSX            VARCHAR2(32),
   EQUI_ZZFJD           VARCHAR2(32),
   EQUI_ZZTZSB          VARCHAR2(32),
   EQUI_ZZGJSB          VARCHAR2(32),
   EQUI_ZZSBMJ          VARCHAR2(32),
   EQUI_ZZJK            VARCHAR2(32),
   ILOA_KOKRS           VARCHAR2(32),
   EQUI_BEGRU           VARCHAR2(32),
   ILOA_BEBER           VARCHAR2(64),
   EQUI_ANSDT           DATE,
   EQUI_HERLD           VARCHAR2(64),
   EQUZ_DATAB           DATE,
   SJBBH                VARCHAR2(64),
   constraint PK_仪器仪表主数据 primary key (ID)
         USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
     STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
     PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
     BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
     TABLESPACE "USERS"  ENABLE,
   constraint AK_KEY_1_仪器仪表主数据 unique (ID)
         USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
     STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
     PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
     BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
     TABLESPACE "USERS"  ENABLE
)
SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"
/

comment on column CIDPPUB.仪器仪表主数据.LSBM is
'历史编码'
/

comment on column CIDPPUB.仪器仪表主数据.FLBM is
'仪器仪表分类'
/

comment on column CIDPPUB.仪器仪表主数据.FLMC is
'分类名称'
/

comment on column CIDPPUB.仪器仪表主数据.YQBM is
'仪器编码'
/

comment on column CIDPPUB.仪器仪表主数据.MC is
'名称'
/

comment on column CIDPPUB.仪器仪表主数据.XH is
'型号'
/

comment on column CIDPPUB.仪器仪表主数据.GG is
'规格'
/

comment on column CIDPPUB.仪器仪表主数据.JDDJ is
'精度等级'
/

comment on column CIDPPUB.仪器仪表主数据.SCCJ is
'生产厂家'
/

comment on column CIDPPUB.仪器仪表主数据.YZ is
'原值'
/

comment on column CIDPPUB.仪器仪表主数据.CCBH is
'出厂编号'
/

comment on column CIDPPUB.仪器仪表主数据.CCSJ is
'仪器仪表出厂时间'
/

comment on column CIDPPUB.仪器仪表主数据.QYSJ is
'仪器仪表启用时间'
/

comment on column CIDPPUB.仪器仪表主数据.GLZT is
'管理状态'
/

comment on column CIDPPUB.仪器仪表主数据.SYQX is
'使用期限'
/

comment on column CIDPPUB.仪器仪表主数据.ZCYT is
'资产用途'
/

comment on column CIDPPUB.仪器仪表主数据.BZ is
'备注'
/

comment on column CIDPPUB.仪器仪表主数据.JLDW is
'计量单位'
/

comment on column CIDPPUB.仪器仪表主数据.CCSJN is
'出厂时间'
/

comment on column CIDPPUB.仪器仪表主数据.QYSJN is
'启用时间'
/

comment on column CIDPPUB.仪器仪表主数据.EQUI_ZZBFRQ is
'报废日期'
/

comment on column CIDPPUB.仪器仪表主数据.EQUI_ZZEDGL is
'额定功率(KW)'
/

comment on column CIDPPUB.仪器仪表主数据.EQUI_ZZYPXLH is
'硬盘序列号'
/

comment on column CIDPPUB.仪器仪表主数据.EQUI_ZZFWBH is
'房屋编号'
/

comment on column CIDPPUB.仪器仪表主数据.EQUI_ZZCPH is
'车牌号'
/

comment on column CIDPPUB.仪器仪表主数据.EQUI_ZZLXFS is
'厂家联系方式'
/

comment on column CIDPPUB.仪器仪表主数据.EQUI_ZZSX is
'属性'
/

comment on column CIDPPUB.仪器仪表主数据.EQUI_ZZFJD is
'是否防静电设施'
/

comment on column CIDPPUB.仪器仪表主数据.EQUI_ZZTZSB is
'是否特种设备'
/

comment on column CIDPPUB.仪器仪表主数据.EQUI_ZZGJSB is
'是否军工关键设备'
/

comment on column CIDPPUB.仪器仪表主数据.EQUI_ZZSBMJ is
'密级'
/

comment on column CIDPPUB.仪器仪表主数据.EQUI_ZZJK is
'是否进口'
/

comment on column CIDPPUB.仪器仪表主数据.ILOA_KOKRS is
'成本中心'
/

comment on column CIDPPUB.仪器仪表主数据.EQUI_BEGRU is
'授权组'
/

comment on column CIDPPUB.仪器仪表主数据.ILOA_BEBER is
'工厂区域'
/

comment on column CIDPPUB.仪器仪表主数据.EQUI_ANSDT is
'购置日期'
/

comment on column CIDPPUB.仪器仪表主数据.EQUI_HERLD is
'制造国别'
/

comment on column CIDPPUB.仪器仪表主数据.EQUZ_DATAB is
'开始生效日期'
/

comment on column CIDPPUB.仪器仪表主数据.SJBBH is
'设计版本号'
/

/*==============================================================*/
/* Table: 保养记录                                                  */
/*==============================================================*/
create table 保养记录 
(
   ID                   NUMBER               not null,
   保养类型                 NUMBER,
   维护设置_ID              NUMBER,
   保养日期                 TIMESTAMP,
   保养人员                 VARCHAR2(64 BYTE),
   完成状态                 NUMBER,
   保养备注                 VARCHAR2(256 BYTE),
   更新时间                 TIMESTAMP,
   创建时间                 TIMESTAMP,
   更新用户                 VARCHAR2(50 BYTE),
   创建用户                 VARCHAR2(50 BYTE),
   constraint PK_保养记录 primary key (ID)
)
/

/*==============================================================*/
/* Table: 元器件                                                   */
/*==============================================================*/
create table 元器件 
(
   ID                   NUMBER               not null,
   物料编号                 VARCHAR2(64 BYTE),
   更新时间                 TIMESTAMP,
   创建时间                 TIMESTAMP,
   更新用户                 VARCHAR2(50 BYTE),
   创建用户                 VARCHAR2(50 BYTE),
   constraint PK_元器件 primary key (ID)
)
/

/*==============================================================*/
/* Table: 元器件主数据                                                */
/*==============================================================*/
create table CIDPPUB.元器件主数据 
(
   ID                   VARCHAR2(32)         not null,
   DATAID               VARCHAR2(32),
   VERSION              VARCHAR2(50),
   VERSIONSTATUS        VARCHAR2(50),
   DATASTATUS           VARCHAR2(50),
   CREATEUSER           VARCHAR2(32),
   MODIFYUSER           VARCHAR2(32),
   MODIFYTIME           DATE,
   CREATEDEPT           VARCHAR2(32),
   CREATEDATE           DATE                 default SYSDATE,
   VALIDDATE            DATE,
   SECRETLEVEL          VARCHAR2(50),
   DATAORIGIN           VARCHAR2(50),
   WLBH                 VARCHAR2(64),
   FLBM                 VARCHAR2(64),
   FLMC                 VARCHAR2(64),
   XH                   VARCHAR2(128),
   ZLDJ                 VARCHAR2(128),
   ZGF                  VARCHAR2(512),
   XHGG                 VARCHAR2(128),
   JLDW                 VARCHAR2(64),
   GCJK                 VARCHAR2(64),
   FZXS                 VARCHAR2(128),
   ZYTJ                 VARCHAR2(128),
   FJXY                 VARCHAR2(512),
   XXGF                 VARCHAR2(512),
   WXCC                 VARCHAR2(128),
   DCS                  VARCHAR2(512),
   FH                   VARCHAR2(64),
   FZLX                 VARCHAR2(64),
   YS                   VARCHAR2(64),
   YYDJ                 VARCHAR2(64),
   DYFW                 VARCHAR2(64),
   YHSC                 VARCHAR2(64),
   YYYX                 VARCHAR2(64),
   BYYX                 VARCHAR2(64),
   CJYX                 VARCHAR2(64),
   FZCL                 VARCHAR2(64),
   QMX                  VARCHAR2(64),
   ZXPL                 VARCHAR2(64),
   DK                   VARCHAR2(64),
   CS                   VARCHAR2(64),
   ZT                   VARCHAR2(64),
   TDP                  VARCHAR2(64),
   MX                   VARCHAR2(64),
   ZXZLDY               VARCHAR2(64),
   FXZLDY               VARCHAR2(64),
   ZXZLDL               VARCHAR2(64),
   JCDY                 VARCHAR2(64),
   ZGGZPL               VARCHAR2(64),
   HJTX                 VARCHAR2(64),
   GZDY                 VARCHAR2(64),
   ZXDL                 VARCHAR2(64),
   FXDL                 VARCHAR2(64),
   GL                   VARCHAR2(64),
   JDDJ                 VARCHAR2(64),
   DLFW                 VARCHAR2(64),
   GZPL                 VARCHAR2(64),
   HYJ                  VARCHAR2(64),
   XS                   VARCHAR2(64),
   XQDY                 VARCHAR2(64),
   DZDY                 VARCHAR2(64),
   XQDZ                 VARCHAR2(64),
   GZSJ                 VARCHAR2(64),
   SFSJ                 VARCHAR2(64),
   FZFW                 VARCHAR2(64),
   WDD                  VARCHAR2(64),
   JQD                  VARCHAR2(64),
   EDFZ                 VARCHAR2(64),
   SCDY                 VARCHAR2(64),
   PLFW                 VARCHAR2(64),
   GH                   VARCHAR2(64),
   SCBX                 VARCHAR2(64),
   DGZ                  VARCHAR2(64),
   EDDL                 VARCHAR2(64),
   ZLDZ                 VARCHAR2(64),
   XZPL                 VARCHAR2(64),
   GZDL                 VARCHAR2(64),
   XYSJ                 VARCHAR2(64),
   SDFS                 VARCHAR2(64),
   AZXS                 VARCHAR2(64),
   LS                   VARCHAR2(64),
   ZK                   VARCHAR2(64),
   DLSX                 VARCHAR2(64),
   PB                   VARCHAR2(64),
   CSJL                 VARCHAR2(64),
   DDM                  VARCHAR2(64),
   SYHJ                 VARCHAR2(64),
   FZ                   VARCHAR2(64),
   FZLXPCB              VARCHAR2(64),
   GZWD                 VARCHAR2(64),
   ZSXS                 VARCHAR2(64),
   ZDLJKYM              VARCHAR2(64),
   FDL                  VARCHAR2(64),
   YSD                  VARCHAR2(64),
   IOS                  VARCHAR2(64),
   CSYC                 VARCHAR2(64),
   JKTX                 VARCHAR2(64),
   TDS                  VARCHAR2(64),
   SXHGS                VARCHAR2(64),
   RAM                  VARCHAR2(64),
   CFQ                  VARCHAR2(64),
   BMJD                 VARCHAR2(64),
   SCDL                 VARCHAR2(64),
   ZDDL                 VARCHAR2(64),
   ZTWZ                 VARCHAR2(64),
   WLMS                 VARCHAR2(256),
   KTGRM                VARCHAR2(32),
   VERPR                NUMBER(12,2),
   STPRS                NUMBER(12,2),
   BWTTY                VARCHAR2(32),
   BKLAS                VARCHAR2(32),
   XYSART               VARCHAR2(32),
   XJZART               VARCHAR2(32),
   WQCART               VARCHAR2(32),
   IQCART               VARCHAR2(32),
   FEVOR                VARCHAR2(32),
   SBDKZ                VARCHAR2(32),
   LGPRO                VARCHAR2(32),
   LGFSB                VARCHAR2(32),
   BESKZ                VARCHAR2(32),
   BSTMI                VARCHAR2(64),
   DISPO                VARCHAR2(32),
   DISGR                VARCHAR2(32),
   MSTAE                VARCHAR2(32),
   EKGRP                VARCHAR2(32),
   EISBE                VARCHAR2(64),
   LSWLBM               VARCHAR2(64),
   JTWZBM               VARCHAR2(128),
   JDMGDJ               VARCHAR2(128),
   SCCSQC               VARCHAR2(128),
   SCCSJC               VARCHAR2(128),
   JGDW                 VARCHAR2(64),
   WGJHDHRQ             VARCHAR2(64),
   MC                   VARCHAR2(64),
   SJBBH                VARCHAR2(64),
   constraint PK_元器件主数据 primary key (ID)
         USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
     TABLESPACE "USERS"  ENABLE,
   constraint AK_KEY_1_元器件主数据 unique (ID)
         USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
     TABLESPACE "USERS"  ENABLE
)
SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS"
/

comment on column CIDPPUB.元器件主数据.WLBH is
'物料编号'
/

comment on column CIDPPUB.元器件主数据.FLBM is
'元器件分类'
/

comment on column CIDPPUB.元器件主数据.FLMC is
'分类名称'
/

comment on column CIDPPUB.元器件主数据.XH is
'型号'
/

comment on column CIDPPUB.元器件主数据.ZLDJ is
'质量等级'
/

comment on column CIDPPUB.元器件主数据.ZGF is
'总规范'
/

comment on column CIDPPUB.元器件主数据.XHGG is
'型号规格'
/

comment on column CIDPPUB.元器件主数据.JLDW is
'计量单位'
/

comment on column CIDPPUB.元器件主数据.GCJK is
'国产/进口'
/

comment on column CIDPPUB.元器件主数据.FZXS is
'封装形式'
/

comment on column CIDPPUB.元器件主数据.ZYTJ is
'专用条件'
/

comment on column CIDPPUB.元器件主数据.FJXY is
'附加协议'
/

comment on column CIDPPUB.元器件主数据.XXGF is
'详细规范/技术条件'
/

comment on column CIDPPUB.元器件主数据.WXCC is
'外形尺寸'
/

comment on column CIDPPUB.元器件主数据.DCS is
'电参数特选要求'
/

comment on column CIDPPUB.元器件主数据.FH is
'符号'
/

comment on column CIDPPUB.元器件主数据.FZLX is
'封装类型'
/

comment on column CIDPPUB.元器件主数据.YS is
'颜色'
/

comment on column CIDPPUB.元器件主数据.YYDJ is
'应用等级'
/

comment on column CIDPPUB.元器件主数据.DYFW is
'电压范围'
/

comment on column CIDPPUB.元器件主数据.YHSC is
'用户手册'
/

comment on column CIDPPUB.元器件主数据.YYYX is
'一院优选'
/

comment on column CIDPPUB.元器件主数据.BYYX is
'八院优选'
/

comment on column CIDPPUB.元器件主数据.CJYX is
'厂级优选'
/

comment on column CIDPPUB.元器件主数据.FZCL is
'封装材料'
/

comment on column CIDPPUB.元器件主数据.QMX is
'气密性'
/

comment on column CIDPPUB.元器件主数据.ZXPL is
'中心频率'
/

comment on column CIDPPUB.元器件主数据.DK is
'带宽'
/

comment on column CIDPPUB.元器件主数据.CS is
'插损'
/

comment on column CIDPPUB.元器件主数据.ZT is
'状态'
/

comment on column CIDPPUB.元器件主数据.TDP is
'替代品'
/

comment on column CIDPPUB.元器件主数据.MX is
'模型'
/

comment on column CIDPPUB.元器件主数据.ZXZLDY is
'正向直流电压'
/

comment on column CIDPPUB.元器件主数据.FXZLDY is
'反向直流电压'
/

comment on column CIDPPUB.元器件主数据.ZXZLDL is
'正向直流电流'
/

comment on column CIDPPUB.元器件主数据.JCDY is
'击穿电压'
/

comment on column CIDPPUB.元器件主数据.ZGGZPL is
'最高工作频率'
/

comment on column CIDPPUB.元器件主数据.HJTX is
'焊接特性（有铅、无铅、镀金）'
/

comment on column CIDPPUB.元器件主数据.GZDY is
'工作电压'
/

comment on column CIDPPUB.元器件主数据.ZXDL is
'正向电流'
/

comment on column CIDPPUB.元器件主数据.FXDL is
'反向电压'
/

comment on column CIDPPUB.元器件主数据.GL is
'功率'
/

comment on column CIDPPUB.元器件主数据.JDDJ is
'精度等级'
/

comment on column CIDPPUB.元器件主数据.DLFW is
'电流范围'
/

comment on column CIDPPUB.元器件主数据.GZPL is
'工作频率'
/

comment on column CIDPPUB.元器件主数据.HYJ is
'焊压接'
/

comment on column CIDPPUB.元器件主数据.XS is
'芯数'
/

comment on column CIDPPUB.元器件主数据.XQDY is
'线圈电压'
/

comment on column CIDPPUB.元器件主数据.DZDY is
'动作电压'
/

comment on column CIDPPUB.元器件主数据.XQDZ is
'线圈电阻'
/

comment on column CIDPPUB.元器件主数据.GZSJ is
'动作时间'
/

comment on column CIDPPUB.元器件主数据.SFSJ is
'释放时间'
/

comment on column CIDPPUB.元器件主数据.FZFW is
'负载范围（触点电流）'
/

comment on column CIDPPUB.元器件主数据.WDD is
'稳定度'
/

comment on column CIDPPUB.元器件主数据.JQD is
'准确度'
/

comment on column CIDPPUB.元器件主数据.EDFZ is
'额定负载'
/

comment on column CIDPPUB.元器件主数据.SCDY is
'输出电压'
/

comment on column CIDPPUB.元器件主数据.PLFW is
'频率范围'
/

comment on column CIDPPUB.元器件主数据.GH is
'功耗'
/

comment on column CIDPPUB.元器件主数据.SCBX is
'输出波形'
/

comment on column CIDPPUB.元器件主数据.DGZ is
'电感值'
/

comment on column CIDPPUB.元器件主数据.EDDL is
'额定电流'
/

comment on column CIDPPUB.元器件主数据.ZLDZ is
'直流电阻'
/

comment on column CIDPPUB.元器件主数据.XZPL is
'谐振频率'
/

comment on column CIDPPUB.元器件主数据.GZDL is
'工作电流'
/

comment on column CIDPPUB.元器件主数据.XYSJ is
'响应时间'
/

comment on column CIDPPUB.元器件主数据.SDFS is
'锁定方式'
/

comment on column CIDPPUB.元器件主数据.AZXS is
'安装形式'
/

comment on column CIDPPUB.元器件主数据.LS is
'路数'
/

comment on column CIDPPUB.元器件主数据.ZK is
'阻抗'
/

comment on column CIDPPUB.元器件主数据.DLSX is
'电缆属性'
/

comment on column CIDPPUB.元器件主数据.PB is
'屏蔽'
/

comment on column CIDPPUB.元器件主数据.CSJL is
'传输距离'
/

comment on column CIDPPUB.元器件主数据.DDM is
'单模/多模'
/

comment on column CIDPPUB.元器件主数据.SYHJ is
'使用环境（陆海空）'
/

comment on column CIDPPUB.元器件主数据.FZ is
'封装（名称）'
/

comment on column CIDPPUB.元器件主数据.FZLXPCB is
'封装类型（PCB封装形式）'
/

comment on column CIDPPUB.元器件主数据.GZWD is
'工作温度'
/

comment on column CIDPPUB.元器件主数据.ZSXS is
'噪声系数'
/

comment on column CIDPPUB.元器件主数据.ZDLJKYM is
'最大逻辑可用门'
/

comment on column CIDPPUB.元器件主数据.FDL is
'放大量'
/

comment on column CIDPPUB.元器件主数据.YSD is
'1db压缩点'
/

comment on column CIDPPUB.元器件主数据.IOS is
'I/O数'
/

comment on column CIDPPUB.元器件主数据.CSYC is
'传输延迟'
/

comment on column CIDPPUB.元器件主数据.JKTX is
'接口特性'
/

comment on column CIDPPUB.元器件主数据.TDS is
'通道数'
/

comment on column CIDPPUB.元器件主数据.SXHGS is
'锁相环个数'
/

comment on column CIDPPUB.元器件主数据.RAM is
'RAM块大小'
/

comment on column CIDPPUB.元器件主数据.CFQ is
'乘法器'
/

comment on column CIDPPUB.元器件主数据.BMJD is
'编码精度'
/

comment on column CIDPPUB.元器件主数据.SCDL is
'输出电流'
/

comment on column CIDPPUB.元器件主数据.ZDDL is
'最大电流'
/

comment on column CIDPPUB.元器件主数据.ZTWZ is
'专特物资（禁限用）'
/

comment on column CIDPPUB.元器件主数据.WLMS is
'物料描述'
/

comment on column CIDPPUB.元器件主数据.KTGRM is
'科目设置组'
/

comment on column CIDPPUB.元器件主数据.VERPR is
'移动平均价'
/

comment on column CIDPPUB.元器件主数据.STPRS is
'标准价格'
/

comment on column CIDPPUB.元器件主数据.BWTTY is
'评估类别'
/

comment on column CIDPPUB.元器件主数据.BKLAS is
'评估类'
/

comment on column CIDPPUB.元器件主数据.XYSART is
'激活下厂验收检验'
/

comment on column CIDPPUB.元器件主数据.XJZART is
'激活下厂监制检验'
/

comment on column CIDPPUB.元器件主数据.WQCART is
'激活超期复检'
/

comment on column CIDPPUB.元器件主数据.IQCART is
'激活入厂检验'
/

comment on column CIDPPUB.元器件主数据.FEVOR is
'生产管理员'
/

comment on column CIDPPUB.元器件主数据.SBDKZ is
'独立/集中'
/

comment on column CIDPPUB.元器件主数据.LGPRO is
'生产仓储地点'
/

comment on column CIDPPUB.元器件主数据.LGFSB is
'外部采购库存地点'
/

comment on column CIDPPUB.元器件主数据.BESKZ is
'采购类型'
/

comment on column CIDPPUB.元器件主数据.BSTMI is
'最小批量大小'
/

comment on column CIDPPUB.元器件主数据.DISPO is
'MRP控制者'
/

comment on column CIDPPUB.元器件主数据.DISGR is
'MRP组'
/

comment on column CIDPPUB.元器件主数据.MSTAE is
'物料状态'
/

comment on column CIDPPUB.元器件主数据.EKGRP is
'采购组'
/

comment on column CIDPPUB.元器件主数据.EISBE is
'安全库存'
/

comment on column CIDPPUB.元器件主数据.LSWLBM is
'历史物料编码'
/

comment on column CIDPPUB.元器件主数据.JTWZBM is
'集团物资编码'
/

comment on column CIDPPUB.元器件主数据.JDMGDJ is
'静电敏感等级'
/

comment on column CIDPPUB.元器件主数据.SCCSQC is
'生产厂家全称'
/

comment on column CIDPPUB.元器件主数据.SCCSJC is
'生产厂家简称'
/

comment on column CIDPPUB.元器件主数据.JGDW is
'价格单位'
/

comment on column CIDPPUB.元器件主数据.WGJHDHRQ is
'外购计划到货周期'
/

comment on column CIDPPUB.元器件主数据.MC is
'物料名称'
/

comment on column CIDPPUB.元器件主数据.SJBBH is
'设计版本号'
/

/*==============================================================*/
/* Table: 刀具                                                    */
/*==============================================================*/
create table 刀具 
(
   ID                   NUMBER               not null,
   WLBH                 VARCHAR2(128 BYTE),
   更新时间                 TIMESTAMP,
   创建时间                 TIMESTAMP,
   更新用户                 VARCHAR2(50 BYTE),
   创建用户                 VARCHAR2(50 BYTE),
   constraint PK_刀具 primary key (ID)
)
/

/*==============================================================*/
/* Table: 刀具主数据                                                 */
/*==============================================================*/
create table CIDPPUB.刀具主数据 
(
   ID                   VARCHAR2(32)         not null,
   DATAID               VARCHAR2(32),
   VERSION              VARCHAR2(50),
   VERSIONSTATUS        VARCHAR2(50),
   DATASTATUS           VARCHAR2(50),
   CREATEUSER           VARCHAR2(32),
   MODIFYUSER           VARCHAR2(32),
   MODIFYTIME           DATE,
   CREATEDEPT           VARCHAR2(32),
   CREATEDATE           DATE                 default SYSDATE,
   VALIDDATE            DATE,
   SECRETLEVEL          VARCHAR2(50),
   DATAORIGIN           VARCHAR2(50),
   FLBM                 VARCHAR2(64),
   FLMC                 VARCHAR2(64),
   WLBH                 VARCHAR2(64),
   WLMC                 VARCHAR2(64),
   XH                   VARCHAR2(128),
   XHGG                 VARCHAR2(128),
   JSTJ                 VARCHAR2(512),
   JKGC                 VARCHAR2(64),
   BMCL                 VARCHAR2(64),
   SCCJ                 VARCHAR2(64),
   ZT                   VARCHAR2(64),
   TSSM                 VARCHAR2(512),
   JLDW                 VARCHAR2(64),
   SJBBH                VARCHAR2(64),
   constraint PK_刀具主数据 primary key (ID)
         USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
     STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
     PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
     BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
     TABLESPACE "USERS"  ENABLE,
   constraint AK_KEY_1_刀具主数据 unique (ID)
         USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
     STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
     PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
     BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
     TABLESPACE "USERS"  ENABLE
)
SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"
/

comment on column CIDPPUB.刀具主数据.FLBM is
'刀具分类'
/

comment on column CIDPPUB.刀具主数据.FLMC is
'分类名称'
/

comment on column CIDPPUB.刀具主数据.WLBH is
'物料编号'
/

comment on column CIDPPUB.刀具主数据.WLMC is
'物料名称'
/

comment on column CIDPPUB.刀具主数据.XH is
'型号'
/

comment on column CIDPPUB.刀具主数据.XHGG is
'型号规格'
/

comment on column CIDPPUB.刀具主数据.JSTJ is
'技术条件'
/

comment on column CIDPPUB.刀具主数据.JKGC is
'进口/国产'
/

comment on column CIDPPUB.刀具主数据.BMCL is
'表面处理'
/

comment on column CIDPPUB.刀具主数据.SCCJ is
'生产厂家'
/

comment on column CIDPPUB.刀具主数据.ZT is
'状态'
/

comment on column CIDPPUB.刀具主数据.TSSM is
'特殊说明'
/

comment on column CIDPPUB.刀具主数据.JLDW is
'计量单位'
/

comment on column CIDPPUB.刀具主数据.SJBBH is
'设计版本号'
/

/*==============================================================*/
/* Table: 半成品                                                   */
/*==============================================================*/
create table 半成品 
(
   ID                   NUMBER               not null,
   WLBH                 VARCHAR2(128 BYTE),
   更新时间                 TIMESTAMP,
   创建时间                 TIMESTAMP,
   更新用户                 VARCHAR2(50 BYTE),
   创建用户                 VARCHAR2(50 BYTE),
   constraint PK_半成品 primary key (ID)
)
/

/*==============================================================*/
/* Table: 半成品主数据                                                */
/*==============================================================*/
create table CIDPPUB.半成品主数据 
(
   ID                   VARCHAR2(32)         not null,
   DATAID               VARCHAR2(32),
   VERSION              VARCHAR2(50),
   VERSIONSTATUS        VARCHAR2(50),
   DATASTATUS           VARCHAR2(50),
   CREATEUSER           VARCHAR2(32),
   MODIFYUSER           VARCHAR2(32),
   MODIFYTIME           DATE,
   CREATEDEPT           VARCHAR2(32),
   CREATEDATE           DATE                 default SYSDATE,
   VALIDDATE            DATE,
   SECRETLEVEL          VARCHAR2(50),
   DATAORIGIN           VARCHAR2(50),
   FLBM                 VARCHAR2(128),
   WLBH                 VARCHAR2(128),
   MC                   VARCHAR2(128),
   DH                   VARCHAR2(128),
   TH                   VARCHAR2(128),
   CPLB                 VARCHAR2(128),
   C                    VARCHAR2(128),
   K                    VARCHAR2(128),
   G                    VARCHAR2(128),
   DYFW                 VARCHAR2(128),
   GNMS                 VARCHAR2(128),
   WLMS                 VARCHAR2(256),
   EISBE                VARCHAR2(64),
   EKGRP                VARCHAR2(32),
   KTGRM                VARCHAR2(32),
   VERPR                NUMBER(12,2),
   STPRS                NUMBER(12,2),
   BWTTY                VARCHAR2(32),
   BKLAS                VARCHAR2(32),
   XYSART               VARCHAR2(32),
   XJZART               VARCHAR2(32),
   WQCART               VARCHAR2(32),
   IQCART               VARCHAR2(32),
   FEVOR                VARCHAR2(32),
   SBDKZ                VARCHAR2(32),
   LGPRO                VARCHAR2(32),
   LGFSB                VARCHAR2(32),
   BESKZ                VARCHAR2(32),
   BSTMI                VARCHAR2(64),
   DISPO                VARCHAR2(32),
   DISGR                VARCHAR2(32),
   MSTAE                VARCHAR2(32),
   SJBBH                VARCHAR2(64),
   constraint PK_半成品主数据 primary key (ID)
         USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
     TABLESPACE "USERS"  ENABLE,
   constraint AK_KEY_1_半成品主数据 unique (ID)
         USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
     TABLESPACE "USERS"  ENABLE
)
SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS"
/

comment on column CIDPPUB.半成品主数据.FLBM is
'半成品分类'
/

comment on column CIDPPUB.半成品主数据.WLBH is
'物料编号'
/

comment on column CIDPPUB.半成品主数据.MC is
'物料名称'
/

comment on column CIDPPUB.半成品主数据.DH is
'代号'
/

comment on column CIDPPUB.半成品主数据.TH is
'图号'
/

comment on column CIDPPUB.半成品主数据.CPLB is
'产品类别'
/

comment on column CIDPPUB.半成品主数据.C is
'长（mm）'
/

comment on column CIDPPUB.半成品主数据.K is
'宽（mm）'
/

comment on column CIDPPUB.半成品主数据.G is
'高（mm）'
/

comment on column CIDPPUB.半成品主数据.DYFW is
'工作电压范围（V）'
/

comment on column CIDPPUB.半成品主数据.GNMS is
'主要功能描述'
/

comment on column CIDPPUB.半成品主数据.WLMS is
'物料描述'
/

comment on column CIDPPUB.半成品主数据.EISBE is
'安全库存'
/

comment on column CIDPPUB.半成品主数据.EKGRP is
'采购组'
/

comment on column CIDPPUB.半成品主数据.KTGRM is
'科目设置组'
/

comment on column CIDPPUB.半成品主数据.VERPR is
'移动平均价'
/

comment on column CIDPPUB.半成品主数据.STPRS is
'标准价格'
/

comment on column CIDPPUB.半成品主数据.BWTTY is
'评估类别'
/

comment on column CIDPPUB.半成品主数据.BKLAS is
'评估类'
/

comment on column CIDPPUB.半成品主数据.XYSART is
'激活下厂验收检验'
/

comment on column CIDPPUB.半成品主数据.XJZART is
'激活下厂监制检验'
/

comment on column CIDPPUB.半成品主数据.WQCART is
'激活超期复检'
/

comment on column CIDPPUB.半成品主数据.IQCART is
'激活入厂检验'
/

comment on column CIDPPUB.半成品主数据.FEVOR is
'生产管理员'
/

comment on column CIDPPUB.半成品主数据.SBDKZ is
'独立/集中'
/

comment on column CIDPPUB.半成品主数据.LGPRO is
'生产仓储地点'
/

comment on column CIDPPUB.半成品主数据.LGFSB is
'外部采购库存地点'
/

comment on column CIDPPUB.半成品主数据.BESKZ is
'采购类型'
/

comment on column CIDPPUB.半成品主数据.BSTMI is
'最小批量大小'
/

comment on column CIDPPUB.半成品主数据.DISPO is
'MRP控制者'
/

comment on column CIDPPUB.半成品主数据.DISGR is
'MRP组'
/

comment on column CIDPPUB.半成品主数据.MSTAE is
'物料状态'
/

/*==============================================================*/
/* Table: 复合材料                                                  */
/*==============================================================*/
create table 复合材料 
(
   ID                   NUMBER               not null,
   WLBH                 VARCHAR2(128 BYTE),
   更新时间                 TIMESTAMP,
   创建时间                 TIMESTAMP,
   更新用户                 VARCHAR2(50 BYTE),
   创建用户                 VARCHAR2(50 BYTE),
   constraint PK_复合材料 primary key (ID)
)
/

/*==============================================================*/
/* Table: 复合材料主数据                                               */
/*==============================================================*/
create table CIDPPUB.复合材料主数据 
(
   ID                   VARCHAR2(32)         not null,
   DATAID               VARCHAR2(32),
   VERSION              VARCHAR2(50),
   VERSIONSTATUS        VARCHAR2(50),
   DATASTATUS           VARCHAR2(50),
   CREATEUSER           VARCHAR2(32),
   MODIFYUSER           VARCHAR2(32),
   MODIFYTIME           DATE,
   CREATEDEPT           VARCHAR2(32),
   CREATEDATE           DATE                 default SYSDATE,
   VALIDDATE            DATE,
   SECRETLEVEL          VARCHAR2(50),
   DATAORIGIN           VARCHAR2(50),
   WLBH                 VARCHAR2(64),
   FLBM                 VARCHAR2(64),
   FLMC                 VARCHAR2(64),
   XH                   VARCHAR2(128),
   XHGG                 VARCHAR2(128),
   JLDW                 VARCHAR2(64),
   GCJK                 VARCHAR2(64),
   CYBZPZ               VARCHAR2(128),
   TSSM                 VARCHAR2(512),
   JSTJ                 VARCHAR2(512),
   ZYTS                 VARCHAR2(64),
   PH                   VARCHAR2(64),
   ZT                   VARCHAR2(64),
   JD                   VARCHAR2(64),
   CLLB                 VARCHAR2(64),
   CLZLTZ               VARCHAR2(64),
   PCBCL                VARCHAR2(64),
   PCBBZ                VARCHAR2(64),
   PCBSX                VARCHAR2(64),
   SFZYTSY              VARCHAR2(64),
   CLZL                 VARCHAR2(64),
   WLMS                 VARCHAR2(256),
   KTGRM                VARCHAR2(32),
   VERPR                NUMBER(12,2),
   STPRS                NUMBER(12,2),
   BWTTY                VARCHAR2(32),
   BKLAS                VARCHAR2(32),
   XYSART               VARCHAR2(32),
   XJZART               VARCHAR2(32),
   WQCART               VARCHAR2(32),
   IQCART               VARCHAR2(32),
   FEVOR                VARCHAR2(32),
   SBDKZ                VARCHAR2(32),
   LGPRO                VARCHAR2(32),
   LGFSB                VARCHAR2(32),
   BESKZ                VARCHAR2(32),
   BSTMI                VARCHAR2(64),
   DISPO                VARCHAR2(32),
   DISGR                VARCHAR2(32),
   MSTAE                VARCHAR2(32),
   EKGRP                VARCHAR2(32),
   EISBE                VARCHAR2(64),
   LSWLBM               VARCHAR2(64),
   JTWZBM               VARCHAR2(128),
   JGDW                 VARCHAR2(64),
   WGJHDHRQ             VARCHAR2(64),
   MC                   VARCHAR2(64),
   SJBBH                VARCHAR2(64),
   constraint PK_复合材料主数据 primary key (ID)
         USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
     TABLESPACE "USERS"  ENABLE,
   constraint AK_KEY_1_复合材料主数据 unique (ID)
         USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
     TABLESPACE "USERS"  ENABLE
)
SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS"
/

comment on column CIDPPUB.复合材料主数据.WLBH is
'物料编号'
/

comment on column CIDPPUB.复合材料主数据.FLBM is
'复合材料分类'
/

comment on column CIDPPUB.复合材料主数据.FLMC is
'分类名称'
/

comment on column CIDPPUB.复合材料主数据.XH is
'型号'
/

comment on column CIDPPUB.复合材料主数据.XHGG is
'型号规格'
/

comment on column CIDPPUB.复合材料主数据.JLDW is
'计量单位'
/

comment on column CIDPPUB.复合材料主数据.GCJK is
'国产/进口'
/

comment on column CIDPPUB.复合材料主数据.CYBZPZ is
'采用标准/品种'
/

comment on column CIDPPUB.复合材料主数据.TSSM is
'特殊说明'
/

comment on column CIDPPUB.复合材料主数据.JSTJ is
'技术条件'
/

comment on column CIDPPUB.复合材料主数据.ZYTS is
'专用/特殊'
/

comment on column CIDPPUB.复合材料主数据.PH is
'牌号'
/

comment on column CIDPPUB.复合材料主数据.ZT is
'状态'
/

comment on column CIDPPUB.复合材料主数据.JD is
'精度'
/

comment on column CIDPPUB.复合材料主数据.CLLB is
'材料类别'
/

comment on column CIDPPUB.复合材料主数据.CLZLTZ is
'材料质量特征/等级'
/

comment on column CIDPPUB.复合材料主数据.PCBCL is
'PCB材料'
/

comment on column CIDPPUB.复合材料主数据.PCBBZ is
'PCB标准'
/

comment on column CIDPPUB.复合材料主数据.PCBSX is
'PCB属性'
/

comment on column CIDPPUB.复合材料主数据.SFZYTSY is
'是否为优选专特物资（TRUE/FALSE）'
/

comment on column CIDPPUB.复合材料主数据.CLZL is
'材料种类'
/

comment on column CIDPPUB.复合材料主数据.WLMS is
'物料描述'
/

comment on column CIDPPUB.复合材料主数据.KTGRM is
'科目设置组'
/

comment on column CIDPPUB.复合材料主数据.VERPR is
'移动平均价'
/

comment on column CIDPPUB.复合材料主数据.STPRS is
'标准价格'
/

comment on column CIDPPUB.复合材料主数据.BWTTY is
'评估类别'
/

comment on column CIDPPUB.复合材料主数据.BKLAS is
'评估类'
/

comment on column CIDPPUB.复合材料主数据.XYSART is
'激活下厂验收检验'
/

comment on column CIDPPUB.复合材料主数据.XJZART is
'激活下厂监制检验'
/

comment on column CIDPPUB.复合材料主数据.WQCART is
'激活超期复检'
/

comment on column CIDPPUB.复合材料主数据.IQCART is
'激活入厂检验'
/

comment on column CIDPPUB.复合材料主数据.FEVOR is
'生产管理员'
/

comment on column CIDPPUB.复合材料主数据.SBDKZ is
'独立/集中'
/

comment on column CIDPPUB.复合材料主数据.LGPRO is
'生产仓储地点'
/

comment on column CIDPPUB.复合材料主数据.LGFSB is
'外部采购库存地点'
/

comment on column CIDPPUB.复合材料主数据.BESKZ is
'采购类型'
/

comment on column CIDPPUB.复合材料主数据.BSTMI is
'最小批量大小'
/

comment on column CIDPPUB.复合材料主数据.DISPO is
'MRP控制者'
/

comment on column CIDPPUB.复合材料主数据.DISGR is
'MRP组'
/

comment on column CIDPPUB.复合材料主数据.MSTAE is
'物料状态'
/

comment on column CIDPPUB.复合材料主数据.EKGRP is
'采购组'
/

comment on column CIDPPUB.复合材料主数据.EISBE is
'安全库存'
/

comment on column CIDPPUB.复合材料主数据.LSWLBM is
'历史物料编码'
/

comment on column CIDPPUB.复合材料主数据.JTWZBM is
'集团物资编码'
/

comment on column CIDPPUB.复合材料主数据.JGDW is
'价格单位'
/

comment on column CIDPPUB.复合材料主数据.WGJHDHRQ is
'外购计划到货周期'
/

comment on column CIDPPUB.复合材料主数据.MC is
'物料名称'
/

comment on column CIDPPUB.复合材料主数据.SJBBH is
'设计版本号'
/

/*==============================================================*/
/* Table: 工具                                                    */
/*==============================================================*/
create table 工具 
(
   ID                   NUMBER               not null,
   WLBH                 VARCHAR2(128 BYTE),
   更新时间                 TIMESTAMP,
   创建时间                 TIMESTAMP,
   更新用户                 VARCHAR2(50 BYTE),
   创建用户                 VARCHAR2(50 BYTE),
   constraint PK_工具 primary key (ID)
)
/

/*==============================================================*/
/* Table: 工具主数据                                                 */
/*==============================================================*/
create table CIDPPUB.工具主数据 
(
   ID                   VARCHAR2(32)         not null,
   DATAID               VARCHAR2(32),
   VERSION              VARCHAR2(50),
   VERSIONSTATUS        VARCHAR2(50),
   DATASTATUS           VARCHAR2(50),
   CREATEUSER           VARCHAR2(32),
   MODIFYUSER           VARCHAR2(32),
   MODIFYTIME           DATE,
   CREATEDEPT           VARCHAR2(32),
   CREATEDATE           DATE                 default SYSDATE,
   VALIDDATE            DATE,
   SECRETLEVEL          VARCHAR2(50),
   DATAORIGIN           VARCHAR2(50),
   FLBM                 VARCHAR2(64),
   FLMC                 VARCHAR2(64),
   WLBH                 VARCHAR2(64),
   WLMC                 VARCHAR2(128),
   XHGG                 VARCHAR2(128),
   JLDW                 VARCHAR2(64),
   JSTJ                 VARCHAR2(512),
   JKGC                 VARCHAR2(64),
   SCCJ                 VARCHAR2(128),
   TSSM                 VARCHAR2(512),
   SJBBH                VARCHAR2(64),
   constraint PK_工具主数据 primary key (ID)
         USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
     STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
     PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
     BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
     TABLESPACE "USERS"  ENABLE,
   constraint AK_KEY_1_工具主数据 unique (ID)
         USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
     STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
     PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
     BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
     TABLESPACE "USERS"  ENABLE
)
SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"
/

comment on column CIDPPUB.工具主数据.FLBM is
'工具分类'
/

comment on column CIDPPUB.工具主数据.FLMC is
'分类名称'
/

comment on column CIDPPUB.工具主数据.WLBH is
'物料编号'
/

comment on column CIDPPUB.工具主数据.WLMC is
'物料名称'
/

comment on column CIDPPUB.工具主数据.XHGG is
'型号规格'
/

comment on column CIDPPUB.工具主数据.JLDW is
'计量单位'
/

comment on column CIDPPUB.工具主数据.JSTJ is
'技术条件'
/

comment on column CIDPPUB.工具主数据.JKGC is
'进口/国产'
/

comment on column CIDPPUB.工具主数据.SCCJ is
'生产厂家'
/

comment on column CIDPPUB.工具主数据.TSSM is
'特殊说明'
/

comment on column CIDPPUB.工具主数据.SJBBH is
'设计版本号'
/

/*==============================================================*/
/* Table: 工单                                                    */
/*==============================================================*/
create table 工单 
(
   ID                   NUMBER               not null,
   订单_ID                NUMBER,
   工单号                  VARCHAR2(50 BYTE),
   子工单号                 VARCHAR2(50 BYTE),
   订单下发日期               TIMESTAMP,
   工单下发日期               TIMESTAMP,
   工单投产日期               TIMESTAMP,
   订单开始日期               TIMESTAMP,
   订单完成日期               TIMESTAMP,
   实际完成日期               TIMESTAMP,
   工单状态                 NUMBER,
   下发状态                 NUMBER,
   WBS号                 VARCHAR2(50 BYTE),
   典试                   VARCHAR2(50 BYTE),
   是否入库                 NUMBER,
   生产订单类型               VARCHAR2(50 BYTE),
   生产订单类型名称             VARCHAR2(50 BYTE),
   物料号                  NUMBER,
   物料名称                 VARCHAR2(50 BYTE),
   描述                   VARCHAR2(255 BYTE),
   生产数量                 NUMBER,
   完成数量                 NUMBER,
   报废数量                 NUMBER,
   生产调度员                VARCHAR2(50 BYTE),
   生产调度员名称              VARCHAR2(50 BYTE),
   更新时间                 TIMESTAMP,
   创建时间                 TIMESTAMP,
   更新用户                 VARCHAR2(50 BYTE),
   创建用户                 VARCHAR2(50 BYTE),
   备注                   VARCHAR2(255 BYTE),
   优先级                  NUMBER,
   constraint PK_工单 primary key (ID)
)
/

/*==============================================================*/
/* Table: 工单ERP工艺表                                              */
/*==============================================================*/
create table 工单ERP工艺表 
(
   ID                   NUMBER               not null,
   工单_ID                NUMBER,
   工序号                  VARCHAR2(50 BYTE),
   工序描述                 VARCHAR2(255 BYTE),
   工作中心                 VARCHAR2(50 BYTE),
   工作中心描述               VARCHAR2(255 BYTE),
   控制码                  VARCHAR2(50 BYTE),
   准备工时                 NUMBER,
   准备工时单位               VARCHAR2(50 BYTE),
   制造费用                 NUMBER,
   制造费用单位               VARCHAR2(50 BYTE),
   物料编码                 NUMBER,
   数量                   NUMBER,
   单位                   VARCHAR2(50 BYTE),
   更新时间                 TIMESTAMP,
   创建时间                 TIMESTAMP,
   更新用户                 VARCHAR2(50 BYTE),
   创建用户                 VARCHAR2(50 BYTE),
   constraint PK_工单ERP工艺表 primary key (ID)
)
/

/*==============================================================*/
/* Table: 工序信息                                                  */
/*==============================================================*/
create table 工序信息 
(
   ID                   NUMBER               not null,
   BOP_ID               NUMBER,
   "WorkCenter_ID"      VARCHAR(32),
   工序编码                 VARCHAR2(64 BYTE),
   工序名称                 VARCHAR2(64 BYTE),
   工序顺序                 NUMBER,
   工序属性                 VARCHAR2(64 BYTE),
   是否前工序                NUMBER,
   是否关键工序               NUMBER,
   是否质检工序               NUMBER,
   是否报工工序               NUMBER,
   备注                   VARCHAR2(255 BYTE),
   更新时间                 TIMESTAMP,
   创建时间                 TIMESTAMP,
   更新用户                 VARCHAR2(64 BYTE),
   创建用户                 VARCHAR2(64 BYTE),
   constraint PK_工序信息 primary key (ID)
)
/

/*==============================================================*/
/* Table: 工序参数                                                  */
/*==============================================================*/
create table 工序参数 
(
   ID                   NUMBER               not null,
   工序信息_ID              NUMBER,
   参数名称                 VARCHAR2(50 BYTE),
   参考值                  NUMBER,
   参考值单位                VARCHAR2(50 BYTE),
   上公差                  NUMBER,
   下公差                  NUMBER,
   上下公差单位               VARCHAR2(50 BYTE),
   是否记录                 NUMBER,
   备注                   VARCHAR2(255 BYTE),
   更新时间                 TIMESTAMP,
   创建时间                 TIMESTAMP,
   更新用户                 VARCHAR2(50 BYTE),
   创建用户                 VARCHAR2(50 BYTE),
   constraint PK_工序参数 primary key (ID)
)
/

/*==============================================================*/
/* Table: 工序工作中心                                                */
/*==============================================================*/
create table 工序工作中心 
(
   ID                   NUMBER               not null,
   工作中心编码               NUMBER,
   工作中心名称               CHAR(10),
   ERP工作中心编码            CHAR(10),
   备注                   VARCHAR2(255 BYTE),
   更新时间                 TIMESTAMP,
   创建时间                 TIMESTAMP,
   更新用户                 VARCHAR2(50 BYTE),
   创建用户                 VARCHAR2(50 BYTE),
   constraint PK_工序工作中心 primary key (ID)
)
/

/*==============================================================*/
/* Table: 工序工时                                                  */
/*==============================================================*/
create table 工序工时 
(
   ID                   NUMBER               not null,
   工序信息_ID              NUMBER,
   准备工时                 NUMBER,
   单件工时                 NUMBER,
   备注                   VARCHAR2(255 BYTE),
   更新时间                 TIMESTAMP,
   创建时间                 TIMESTAMP,
   更新用户                 VARCHAR2(50 BYTE),
   创建用户                 VARCHAR2(50 BYTE),
   constraint PK_工序工时 primary key (ID)
)
/

/*==============================================================*/
/* Table: 工序工装，刀具，量具，辅具                                         */
/*==============================================================*/
create table 工序工装，刀具，量具，辅具 
(
   ID                   NUMBER               not null,
   工序信息_ID              NUMBER,
   工刀量辅类型               NUMBER,
   工刀量辅_ID              NUMBER,
   工刀量辅名称               VARCHAR2(50 BYTE),
   数量                   NUMBER,
   型号                   VARCHAR2(50 BYTE),
   规格                   VARCHAR2(50 BYTE),
   计量单位                 VARCHAR2(50 BYTE),
   备注                   VARCHAR2(255 BYTE),
   更新时间                 TIMESTAMP,
   创建时间                 TIMESTAMP,
   更新用户                 VARCHAR2(50 BYTE),
   创建用户                 VARCHAR2(50 BYTE),
   constraint PK_工序工装，刀具，量具，辅具 primary key (ID)
)
/

/*==============================================================*/
/* Table: 工序文件                                                  */
/*==============================================================*/
create table 工序文件 
(
   ID                   NUMBER               not null,
   工序信息_ID              NUMBER,
   文件名称                 VARCHAR2(50 BYTE),
   文件路径                 VARCHAR2(255 BYTE),
   是否关联文件               NUMBER,
   备注                   VARCHAR2(255 BYTE),
   更新时间                 TIMESTAMP,
   创建时间                 TIMESTAMP,
   更新用户                 VARCHAR2(50 BYTE),
   创建用户                 VARCHAR2(50 BYTE),
   constraint PK_工序文件 primary key (ID)
)
/

/*==============================================================*/
/* Table: 工序物料                                                  */
/*==============================================================*/
create table 工序物料 
(
   ID                   NUMBER               not null,
   工序信息_ID              NUMBER,
   物料_ID                NUMBER,
   物料名称                 VARCHAR2(64 BYTE),
   物料版本                 VARCHAR2(64 BYTE),
   是否关键料                NUMBER,
   是否批次料                NUMBER,
   是否辅料                 NUMBER,
   单位用量                 NUMBER,
   单位                   VARCHAR2(64 BYTE),
   属性1                  VARCHAR2(64 BYTE),
   属性2                  VARCHAR2(64 BYTE),
   属性3                  VARCHAR2(64 BYTE),
   备注                   VARCHAR2(255 BYTE),
   更新时间                 TIMESTAMP,
   创建时间                 TIMESTAMP,
   更新用户                 VARCHAR2(50 BYTE),
   创建用户                 VARCHAR2(50 BYTE),
   BOP_ID               NUMBER,
   constraint PK_工序物料 primary key (ID)
)
/

/*==============================================================*/
/* Table: 工序计划表                                                 */
/*==============================================================*/
create table 工序计划表 
(
   ID                   NUMBER               not null,
   工单_ID                NUMBER,
   工艺_ID                NUMBER,
   工序号                  VARCHAR2(50 BYTE),
   工种_ID                NUMBER,
   班组_ID                NUMBER,
   操作人_ID               NUMBER,
   设备_ID                NUMBER,
   工序完工时间               TIMESTAMP,
   工序状态                 NUMBER,
   备注                   VARCHAR2(255 BYTE),
   更新时间                 TIMESTAMP,
   创建时间                 TIMESTAMP,
   更新用户                 VARCHAR2(50 BYTE),
   创建用户                 VARCHAR2(50 BYTE),
   constraint PK_工序计划表 primary key (ID)
)
/

/*==============================================================*/
/* Table: 工序设备                                                  */
/*==============================================================*/
create table 工序设备 
(
   ID                   NUMBER               not null,
   工序信息_ID              NUMBER,
   设备类型编码               NUMBER,
   是否关键设备               CHAR(10),
   设备_ID                CHAR(10),
   备注                   VARCHAR2(255 BYTE),
   更新时间                 TIMESTAMP,
   创建时间                 TIMESTAMP,
   更新用户                 VARCHAR2(50 BYTE),
   创建用户                 VARCHAR2(50 BYTE),
   constraint PK_工序设备 primary key (ID)
)
/

/*==============================================================*/
/* Table: 工步信息                                                  */
/*==============================================================*/
create table 工步信息 
(
   ID                   NUMBER               not null,
   工序_ID                NUMBER,
   "Step_ID"            NUMBER,
   "Step_Name"          VARCHAR2(64 BYTE),
   "Step_attribute"     VARCHAR2(64 BYTE),
   发布时间                 TIMESTAMP,
   发布者                  VARCHAR2(64 BYTE),
   备注                   VARCHAR2(255 BYTE),
   更新时间                 TIMESTAMP,
   创建时间                 TIMESTAMP,
   更新用户                 VARCHAR2(64 BYTE),
   创建用户                 VARCHAR2(64 BYTE),
   constraint PK_工步信息 primary key (ID)
)
/

/*==============================================================*/
/* Table: 工种                                                    */
/*==============================================================*/
create table 工种 
(
   ID                   NUMBER               not null,
   工种名称                 VARCHAR(50),
   ERP工种                VARCHAR(50),
   备注                   VARCHAR(255),
   更新时间                 TIMESTAMP,
   创建时间                 TIMESTAMP,
   更新用户                 VARCHAR2(50 BYTE),
   创建用户                 VARCHAR2(50 BYTE),
   constraint PK_工种 primary key (ID)
)
/

/*==============================================================*/
/* Table: 工装                                                    */
/*==============================================================*/
create table 工装 
(
   ID                   NUMBER               not null,
   WLBH                 VARCHAR2(128 BYTE),
   更新时间                 TIMESTAMP,
   创建时间                 TIMESTAMP,
   更新用户                 VARCHAR2(50 BYTE),
   创建用户                 VARCHAR2(50 BYTE),
   constraint PK_工装 primary key (ID)
)
/

/*==============================================================*/
/* Table: 工装主数据                                                 */
/*==============================================================*/
create table CIDPPUB.工装主数据 
(
   ID                   VARCHAR2(32)         not null,
   DATAID               VARCHAR2(32),
   VERSION              VARCHAR2(50),
   VERSIONSTATUS        VARCHAR2(50),
   DATASTATUS           VARCHAR2(50),
   CREATEUSER           VARCHAR2(32),
   MODIFYUSER           VARCHAR2(32),
   MODIFYTIME           DATE,
   CREATEDEPT           VARCHAR2(32),
   CREATEDATE           DATE                 default SYSDATE,
   VALIDDATE            DATE,
   SECRETLEVEL          VARCHAR2(50),
   DATAORIGIN           VARCHAR2(50),
   FLBM                 VARCHAR2(64),
   FLMC                 VARCHAR2(64),
   WLBH                 VARCHAR2(64),
   WLMC                 VARCHAR2(128),
   XHGG                 VARCHAR2(128),
   JLDW                 VARCHAR2(64),
   JSTJ                 VARCHAR2(512),
   JKGC                 VARCHAR2(64),
   SCCJ                 VARCHAR2(128),
   ZT                   VARCHAR2(64),
   WLMS                 VARCHAR2(256),
   BWTTY                VARCHAR2(32),
   BKLAS                VARCHAR2(32),
   FEVOR                VARCHAR2(32),
   SBDKZ                VARCHAR2(32),
   LGPRO                VARCHAR2(32),
   KTGRM                VARCHAR2(32),
   MSTAE                VARCHAR2(32),
   XYSART               VARCHAR2(32),
   XJZART               VARCHAR2(32),
   WQCART               VARCHAR2(32),
   IQCART               VARCHAR2(32),
   BESKZ                VARCHAR2(32),
   DISPO                VARCHAR2(32),
   DISGR                VARCHAR2(32),
   DZEIT                VARCHAR2(64),
   SJBBH                VARCHAR2(64),
   constraint PK_工装主数据 primary key (ID)
         USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
     TABLESPACE "USERS"  ENABLE,
   constraint AK_KEY_1_工装主数据 unique (ID)
         USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
     TABLESPACE "USERS"  ENABLE
)
SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS"
/

comment on column CIDPPUB.工装主数据.FLBM is
'工装分类'
/

comment on column CIDPPUB.工装主数据.FLMC is
'分类名称'
/

comment on column CIDPPUB.工装主数据.WLBH is
'物料编号'
/

comment on column CIDPPUB.工装主数据.WLMC is
'物料名称'
/

comment on column CIDPPUB.工装主数据.XHGG is
'规格型号（图号）'
/

comment on column CIDPPUB.工装主数据.JLDW is
'计量单位'
/

comment on column CIDPPUB.工装主数据.JSTJ is
'技术条件'
/

comment on column CIDPPUB.工装主数据.JKGC is
'进口/国产'
/

comment on column CIDPPUB.工装主数据.SCCJ is
'生产厂家'
/

comment on column CIDPPUB.工装主数据.ZT is
'特殊说明'
/

comment on column CIDPPUB.工装主数据.WLMS is
'物料描述'
/

comment on column CIDPPUB.工装主数据.BWTTY is
'评估类别'
/

comment on column CIDPPUB.工装主数据.BKLAS is
'评估类'
/

comment on column CIDPPUB.工装主数据.FEVOR is
'生产管理员'
/

comment on column CIDPPUB.工装主数据.SBDKZ is
'独立/集中'
/

comment on column CIDPPUB.工装主数据.LGPRO is
'生产仓储地点'
/

comment on column CIDPPUB.工装主数据.KTGRM is
'科目设置组'
/

comment on column CIDPPUB.工装主数据.MSTAE is
'物料状态'
/

comment on column CIDPPUB.工装主数据.XYSART is
'激活下厂验收检验'
/

comment on column CIDPPUB.工装主数据.XJZART is
'激活下厂监制检验'
/

comment on column CIDPPUB.工装主数据.WQCART is
'激活超期复检'
/

comment on column CIDPPUB.工装主数据.IQCART is
'激活入厂检验'
/

comment on column CIDPPUB.工装主数据.BESKZ is
'采购类型'
/

comment on column CIDPPUB.工装主数据.DISPO is
'MRP控制者'
/

comment on column CIDPPUB.工装主数据.DISGR is
'MRP组'
/

comment on column CIDPPUB.工装主数据.DZEIT is
'自制生产'
/

comment on column CIDPPUB.工装主数据.SJBBH is
'设计版本号'
/

/*==============================================================*/
/* Table: 库位                                                    */
/*==============================================================*/
create table 库位 
(
   ID                   NUMBER               not null,
   库房_ID                NUMBER,
   柜号                   VARCHAR2(50 BYTE),
   层数                   NUMBER,
   备注                   VARCHAR2(255 BYTE),
   更新时间                 TIMESTAMP,
   创建时间                 TIMESTAMP,
   更新用户                 VARCHAR2(50 BYTE),
   创建用户                 VARCHAR2(50 BYTE),
   constraint PK_库位 primary key (ID)
)
/

/*==============================================================*/
/* Table: 库存                                                    */
/*==============================================================*/
create table 库存 
(
   ID                   NUMBER               not null,
   库位_ID                NUMBER,
   主数据类型                NUMBER,
   刀具_ID                NUMBER,
   量具_ID                NUMBER,
   工具_ID                NUMBER,
   工装_ID                NUMBER,
   非金属材料_ID             NUMBER,
   半成品_ID               NUMBER,
   元器件_ID               NUMBER,
   标准紧固件_ID             NUMBER,
   金属材料_ID              NUMBER,
   复合材料_ID              NUMBER,
   机电配套件_ID             NUMBER,
   仪器仪表_ID              NUMBER,
   产品_ID                NUMBER,
   数量                   NUMBER,
   最低库存数量               NUMBER,
   备注                   VARCHAR2(255 BYTE),
   更新时间                 TIMESTAMP,
   创建时间                 TIMESTAMP,
   更新用户                 VARCHAR2(50 BYTE),
   创建用户                 VARCHAR2(50 BYTE),
   constraint PK_库存 primary key (ID)
)
/

/*==============================================================*/
/* Table: 库房                                                    */
/*==============================================================*/
create table 库房 
(
   ID                   NUMBER               not null,
   库房名称                 VARCHAR2(50 BYTE),
   库房归属                 NUMBER,
   备注                   VARCHAR2(255 BYTE),
   更新时间                 TIMESTAMP,
   创建时间                 TIMESTAMP,
   更新用户                 VARCHAR2(50 BYTE),
   创建用户                 VARCHAR2(50 BYTE),
   constraint PK_库房 primary key (ID)
)
/

/*==============================================================*/
/* Table: 归还记录                                                  */
/*==============================================================*/
create table 归还记录 
(
   ID                   NUMBER               not null,
   领用记录_ID              NUMBER,
   员工_ID                NUMBER,
   物料_ID                NUMBER,
   数量                   NUMBER,
   归还时间                 TIMESTAMP,
   备注                   VARCHAR2(255 BYTE),
   更新时间                 TIMESTAMP,
   创建时间                 TIMESTAMP,
   更新用户                 VARCHAR2(50 BYTE),
   创建用户                 VARCHAR2(50 BYTE),
   constraint PK_归还记录 primary key (ID)
)
/

/*==============================================================*/
/* Table: 机电配套主数据                                               */
/*==============================================================*/
create table CIDPPUB.机电配套主数据 
(
   ID                   VARCHAR2(32)         not null,
   DATAID               VARCHAR2(32),
   VERSION              VARCHAR2(50),
   VERSIONSTATUS        VARCHAR2(50),
   DATASTATUS           VARCHAR2(50),
   CREATEUSER           VARCHAR2(32),
   MODIFYUSER           VARCHAR2(32),
   MODIFYTIME           DATE,
   CREATEDEPT           VARCHAR2(32),
   CREATEDATE           DATE                 default SYSDATE,
   VALIDDATE            DATE,
   SECRETLEVEL          VARCHAR2(50),
   DATAORIGIN           VARCHAR2(50),
   FLBM                 VARCHAR2(64),
   FLMC                 VARCHAR2(64),
   WLBH                 VARCHAR2(64),
   WLMC                 VARCHAR2(128),
   XHGG                 VARCHAR2(128),
   SCCJ                 VARCHAR2(128),
   JLDW                 VARCHAR2(64),
   CCGG                 VARCHAR2(64),
   BS                   VARCHAR2(64),
   WX                   VARCHAR2(64),
   ZL                   VARCHAR2(64),
   ZDB                  VARCHAR2(64),
   DESCLJ               VARCHAR2(64),
   JJ                   VARCHAR2(64),
   PS                   VARCHAR2(64),
   SR                   VARCHAR2(64),
   SC                   VARCHAR2(64),
   JKLX                 VARCHAR2(64),
   JKSL                 VARCHAR2(64),
   DYFW                 VARCHAR2(64),
   DLFW                 VARCHAR2(64),
   PLFW                 VARCHAR2(64),
   GLFW                 VARCHAR2(64),
   ZSFW                 VARCHAR2(64),
   RL                   VARCHAR2(64),
   WLMS                 VARCHAR2(256),
   KTGRM                VARCHAR2(32),
   VERPR                NUMBER(12,2),
   STPRS                NUMBER(12,2),
   BWTTY                VARCHAR2(32),
   BKLAS                VARCHAR2(32),
   XYSART               VARCHAR2(32),
   XJZART               VARCHAR2(32),
   WQCART               VARCHAR2(32),
   IQCART               VARCHAR2(32),
   FEVOR                VARCHAR2(32),
   SBDKZ                VARCHAR2(32),
   LGPRO                VARCHAR2(32),
   LGFSB                VARCHAR2(32),
   BESKZ                VARCHAR2(32),
   BSTMI                VARCHAR2(64),
   DISPO                VARCHAR2(32),
   DISGR                VARCHAR2(32),
   MSTAE                VARCHAR2(32),
   EKGRP                VARCHAR2(32),
   EISBE                VARCHAR2(64),
   H8_REFOUTPUT         VARCHAR2(256),
   H8_INSERTLOSS        VARCHAR2(256),
   H8_CPU               VARCHAR2(256),
   H8_ENCAPSULATION     VARCHAR2(256),
   H8_VENDER            VARCHAR2(256),
   H8_VOLTAGE           VARCHAR2(256),
   H8_POWERRANGE        VARCHAR2(256),
   H8_WORKINGVOLTAGE    VARCHAR2(256),
   H8_FIGURE            VARCHAR2(256),
   H8_INPUTVOLTAGE      VARCHAR2(256),
   H8_MEMORY            VARCHAR2(256),
   H8_NOISEFACTOR       VARCHAR2(256),
   H8_INPUT             VARCHAR2(256),
   H8_FILLSTYLE         VARCHAR2(256),
   H8_MIXINGGAIN        VARCHAR2(256),
   H8_CODETYPE          VARCHAR2(256),
   H8_POWERDISSIPATION  VARCHAR2(256),
   H8_SKELETONFORM      VARCHAR2(256),
   H8_LFREQUENCYRN      VARCHAR2(256),
   H8_DRIVERATIO        VARCHAR2(256),
   H8_RATEDCURRENT      VARCHAR2(256),
   H8_COMPRESSIONPOINT1DB VARCHAR2(256),
   H8_FRERANGE          VARCHAR2(256),
   H8_OUTPUT            VARCHAR2(256),
   H8_RANGEOFATTENUATION VARCHAR2(256),
   H8_FRESTEP           VARCHAR2(256),
   H8_POWER             VARCHAR2(256),
   H8_CAPACITY          VARCHAR2(256),
   H8_DIMENSIONS        VARCHAR2(256),
   H8_HFREQUENCYRN      VARCHAR2(256),
   H8_ANTENNAFORM       VARCHAR2(256),
   H8_RESOLUTIONACCURACY VARCHAR2(256),
   H8_FOCUS             VARCHAR2(256),
   H8_FUNCTIONALDESC    VARCHAR2(256),
   H8_LOCATEMODE        VARCHAR2(256),
   H8_VOLTAGERANGE      VARCHAR2(256),
   H8_SPACING           VARCHAR2(256),
   H8_CTRLTYPE          VARCHAR2(256),
   H8_GAINING           VARCHAR2(256),
   H8_EXTRAFUNCTION     VARCHAR2(256),
   H8_NUMBEROFROWS      VARCHAR2(256),
   H8_POLARIZATIONMODE  VARCHAR2(256),
   H8_SAMPLINGRATE      VARCHAR2(256),
   H8_OUTPUTVOLTAGE     VARCHAR2(256),
   H8_PRECISION         VARCHAR2(256),
   H8_HARDDISK          VARCHAR2(256),
   H8_ROUTPUTTORQUE     VARCHAR2(256),
   H8_RP                VARCHAR2(256),
   H8_STABILITY         VARCHAR2(256),
   ZLDJ                 VARCHAR2(256),
   H8_GROUP             VARCHAR2(256),
   LSWLBM               VARCHAR2(64),
   JGDW                 VARCHAR2(64),
   WGJHDHRQ             VARCHAR2(64),
   H8_SPECIALMATERIALS  VARCHAR2(256),
   H8_SPSPECIALMATERIALS VARCHAR2(256),
   H8_ASSORTTECHPROTOCOL VARCHAR2(256),
   C                    NUMBER(12,2),
   K                    NUMBER(12,2),
   G                    NUMBER(12,2),
   SJBBH                VARCHAR2(64),
   constraint PK_机电配套主数据 primary key (ID)
         USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
     TABLESPACE "USERS"  ENABLE,
   constraint AK_KEY_1_机电配套主数据 unique (ID)
         USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
     TABLESPACE "USERS"  ENABLE
)
SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS"
/

comment on column CIDPPUB.机电配套主数据.FLBM is
'机电配套分类'
/

comment on column CIDPPUB.机电配套主数据.FLMC is
'分类名称'
/

comment on column CIDPPUB.机电配套主数据.WLBH is
'物料编号'
/

comment on column CIDPPUB.机电配套主数据.WLMC is
'物料名称'
/

comment on column CIDPPUB.机电配套主数据.XHGG is
'型号规格'
/

comment on column CIDPPUB.机电配套主数据.SCCJ is
'生产厂家'
/

comment on column CIDPPUB.机电配套主数据.JLDW is
'计量单位'
/

comment on column CIDPPUB.机电配套主数据.CCGG is
'尺寸规格：长（深）、宽、高、深、直径'
/

comment on column CIDPPUB.机电配套主数据.BS is
'波速F'
/

comment on column CIDPPUB.机电配套主数据.WX is
'外形F'
/

comment on column CIDPPUB.机电配套主数据.ZL is
'重量F'
/

comment on column CIDPPUB.机电配套主数据.ZDB is
'传动比F'
/

comment on column CIDPPUB.机电配套主数据.DESCLJ is
'定额输出力矩F'
/

comment on column CIDPPUB.机电配套主数据.JJ is
'节距F'
/

comment on column CIDPPUB.机电配套主数据.PS is
'排数F'
/

comment on column CIDPPUB.机电配套主数据.SR is
'输入F'
/

comment on column CIDPPUB.机电配套主数据.SC is
'输出F'
/

comment on column CIDPPUB.机电配套主数据.JKLX is
'接口类型F'
/

comment on column CIDPPUB.机电配套主数据.JKSL is
'接口数量F'
/

comment on column CIDPPUB.机电配套主数据.DYFW is
'电压范围F'
/

comment on column CIDPPUB.机电配套主数据.DLFW is
'电流范围F'
/

comment on column CIDPPUB.机电配套主数据.PLFW is
'频率范围F'
/

comment on column CIDPPUB.机电配套主数据.GLFW is
'功率范围F'
/

comment on column CIDPPUB.机电配套主数据.ZSFW is
'转速范围F'
/

comment on column CIDPPUB.机电配套主数据.RL is
'容量F'
/

comment on column CIDPPUB.机电配套主数据.WLMS is
'物料描述'
/

comment on column CIDPPUB.机电配套主数据.KTGRM is
'科目设置组'
/

comment on column CIDPPUB.机电配套主数据.VERPR is
'移动平均价'
/

comment on column CIDPPUB.机电配套主数据.STPRS is
'标准价格'
/

comment on column CIDPPUB.机电配套主数据.BWTTY is
'评估类别'
/

comment on column CIDPPUB.机电配套主数据.BKLAS is
'评估类'
/

comment on column CIDPPUB.机电配套主数据.XYSART is
'激活下厂验收检验'
/

comment on column CIDPPUB.机电配套主数据.XJZART is
'激活下厂监制检验'
/

comment on column CIDPPUB.机电配套主数据.WQCART is
'激活超期复检'
/

comment on column CIDPPUB.机电配套主数据.IQCART is
'激活入厂检验'
/

comment on column CIDPPUB.机电配套主数据.FEVOR is
'生产管理员'
/

comment on column CIDPPUB.机电配套主数据.SBDKZ is
'独立/集中'
/

comment on column CIDPPUB.机电配套主数据.LGPRO is
'生产仓储地点'
/

comment on column CIDPPUB.机电配套主数据.LGFSB is
'外部采购库存地点'
/

comment on column CIDPPUB.机电配套主数据.BESKZ is
'采购类型'
/

comment on column CIDPPUB.机电配套主数据.BSTMI is
'最小批量大小'
/

comment on column CIDPPUB.机电配套主数据.DISPO is
'MRP控制者'
/

comment on column CIDPPUB.机电配套主数据.DISGR is
'MRP组'
/

comment on column CIDPPUB.机电配套主数据.MSTAE is
'物料状态'
/

comment on column CIDPPUB.机电配套主数据.EKGRP is
'采购组'
/

comment on column CIDPPUB.机电配套主数据.EISBE is
'安全库存'
/

comment on column CIDPPUB.机电配套主数据.H8_REFOUTPUT is
'制冷量'
/

comment on column CIDPPUB.机电配套主数据.H8_INSERTLOSS is
'插入损耗'
/

comment on column CIDPPUB.机电配套主数据.H8_CPU is
'CPU'
/

comment on column CIDPPUB.机电配套主数据.H8_ENCAPSULATION is
'封装'
/

comment on column CIDPPUB.机电配套主数据.H8_VENDER is
'生产厂家S'
/

comment on column CIDPPUB.机电配套主数据.H8_VOLTAGE is
'电压'
/

comment on column CIDPPUB.机电配套主数据.H8_POWERRANGE is
'功率范围'
/

comment on column CIDPPUB.机电配套主数据.H8_WORKINGVOLTAGE is
'工作电压'
/

comment on column CIDPPUB.机电配套主数据.H8_FIGURE is
'外形'
/

comment on column CIDPPUB.机电配套主数据.H8_INPUTVOLTAGE is
'输入电压'
/

comment on column CIDPPUB.机电配套主数据.H8_MEMORY is
'内存'
/

comment on column CIDPPUB.机电配套主数据.H8_NOISEFACTOR is
'噪声系数'
/

comment on column CIDPPUB.机电配套主数据.H8_INPUT is
'输入'
/

comment on column CIDPPUB.机电配套主数据.H8_FILLSTYLE is
'填充方式'
/

comment on column CIDPPUB.机电配套主数据.H8_MIXINGGAIN is
'混频增益'
/

comment on column CIDPPUB.机电配套主数据.H8_CODETYPE is
'编解码方式'
/

comment on column CIDPPUB.机电配套主数据.H8_POWERDISSIPATION is
'功耗'
/

comment on column CIDPPUB.机电配套主数据.H8_SKELETONFORM is
'骨架形式'
/

comment on column CIDPPUB.机电配套主数据.H8_LFREQUENCYRN is
'低频路数'
/

comment on column CIDPPUB.机电配套主数据.H8_DRIVERATIO is
'传动比'
/

comment on column CIDPPUB.机电配套主数据.H8_RATEDCURRENT is
'工作额定电流'
/

comment on column CIDPPUB.机电配套主数据.H8_COMPRESSIONPOINT1DB is
'1dB压缩点'
/

comment on column CIDPPUB.机电配套主数据.H8_FRERANGE is
'频率范围'
/

comment on column CIDPPUB.机电配套主数据.H8_OUTPUT is
'输出'
/

comment on column CIDPPUB.机电配套主数据.H8_RANGEOFATTENUATION is
'衰减范围'
/

comment on column CIDPPUB.机电配套主数据.H8_FRESTEP is
'频率步进'
/

comment on column CIDPPUB.机电配套主数据.H8_POWER is
'功率'
/

comment on column CIDPPUB.机电配套主数据.H8_CAPACITY is
'容量(G)'
/

comment on column CIDPPUB.机电配套主数据.H8_DIMENSIONS is
'尺寸规格'
/

comment on column CIDPPUB.机电配套主数据.H8_HFREQUENCYRN is
'高频路数'
/

comment on column CIDPPUB.机电配套主数据.H8_ANTENNAFORM is
'天线形式'
/

comment on column CIDPPUB.机电配套主数据.H8_RESOLUTIONACCURACY is
'分辨精度'
/

comment on column CIDPPUB.机电配套主数据.H8_FOCUS is
'焦距'
/

comment on column CIDPPUB.机电配套主数据.H8_FUNCTIONALDESC is
'功能描述'
/

comment on column CIDPPUB.机电配套主数据.H8_LOCATEMODE is
'定位方式'
/

comment on column CIDPPUB.机电配套主数据.H8_VOLTAGERANGE is
'电压范围'
/

comment on column CIDPPUB.机电配套主数据.H8_SPACING is
'节距'
/

comment on column CIDPPUB.机电配套主数据.H8_CTRLTYPE is
'控制方式'
/

comment on column CIDPPUB.机电配套主数据.H8_GAINING is
'增益'
/

comment on column CIDPPUB.机电配套主数据.H8_EXTRAFUNCTION is
'扩展功能'
/

comment on column CIDPPUB.机电配套主数据.H8_NUMBEROFROWS is
'排数'
/

comment on column CIDPPUB.机电配套主数据.H8_POLARIZATIONMODE is
'极化方式'
/

comment on column CIDPPUB.机电配套主数据.H8_SAMPLINGRATE is
'采样率'
/

comment on column CIDPPUB.机电配套主数据.H8_OUTPUTVOLTAGE is
'输出电压'
/

comment on column CIDPPUB.机电配套主数据.H8_PRECISION is
'精度'
/

comment on column CIDPPUB.机电配套主数据.H8_HARDDISK is
'硬盘'
/

comment on column CIDPPUB.机电配套主数据.H8_ROUTPUTTORQUE is
'额定输出力矩'
/

comment on column CIDPPUB.机电配套主数据.H8_RP is
'分辨率'
/

comment on column CIDPPUB.机电配套主数据.H8_STABILITY is
'稳定度'
/

comment on column CIDPPUB.机电配套主数据.ZLDJ is
'质量等级'
/

comment on column CIDPPUB.机电配套主数据.H8_GROUP is
'分组'
/

comment on column CIDPPUB.机电配套主数据.LSWLBM is
'历史物料编码'
/

comment on column CIDPPUB.机电配套主数据.JGDW is
'价格单位'
/

comment on column CIDPPUB.机电配套主数据.WGJHDHRQ is
'外购计划到货周期'
/

comment on column CIDPPUB.机电配套主数据.H8_SPECIALMATERIALS is
'是否为专特物资'
/

comment on column CIDPPUB.机电配套主数据.H8_SPSPECIALMATERIALS is
'是否为优选专特物资'
/

comment on column CIDPPUB.机电配套主数据.H8_ASSORTTECHPROTOCOL is
'对应技术协议'
/

comment on column CIDPPUB.机电配套主数据.C is
'长（mm）'
/

comment on column CIDPPUB.机电配套主数据.K is
'宽（mm）'
/

comment on column CIDPPUB.机电配套主数据.G is
'高（mm）'
/

comment on column CIDPPUB.机电配套主数据.SJBBH is
'设计版本号'
/

/*==============================================================*/
/* Table: 机电配套件                                                 */
/*==============================================================*/
create table 机电配套件 
(
   ID                   NUMBER               not null,
   WLBH                 VARCHAR2(64 BYTE),
   更新时间                 TIMESTAMP,
   创建时间                 TIMESTAMP,
   更新用户                 VARCHAR2(50 BYTE),
   创建用户                 VARCHAR2(50 BYTE),
   constraint PK_机电配套件 primary key (ID)
)
/

/*==============================================================*/
/* Table: 标准件主数据                                                */
/*==============================================================*/
create table CIDPPUB.标准件主数据 
(
   ID                   VARCHAR2(32)         not null,
   DATAID               VARCHAR2(32),
   VERSION              VARCHAR2(50),
   VERSIONSTATUS        VARCHAR2(50),
   DATASTATUS           VARCHAR2(50),
   CREATEUSER           VARCHAR2(32),
   MODIFYUSER           VARCHAR2(32),
   MODIFYTIME           DATE,
   CREATEDEPT           VARCHAR2(32),
   CREATEDATE           DATE                 default SYSDATE,
   VALIDDATE            DATE,
   SECRETLEVEL          VARCHAR2(50),
   DATAORIGIN           VARCHAR2(50),
   WLBH                 VARCHAR2(64),
   FLBM                 VARCHAR2(64),
   FLMC                 VARCHAR2(64),
   XH                   VARCHAR2(128),
   XHGG                 VARCHAR2(128),
   JLDW                 VARCHAR2(64),
   GCJK                 VARCHAR2(64),
   LWGG                 VARCHAR2(128),
   LWCD                 VARCHAR2(128),
   CL                   VARCHAR2(64),
   BMCL                 VARCHAR2(64),
   QTZJ                 VARCHAR2(128),
   CPXS                 VARCHAR2(128),
   CPDJ                 VARCHAR2(128),
   RCL                  VARCHAR2(64),
   GCCD                 VARCHAR2(128),
   JXXNDJ               VARCHAR2(128),
   BNXS                 VARCHAR2(64),
   DH                   VARCHAR2(128),
   BZ                   VARCHAR2(128),
   JD                   VARCHAR2(64),
   WZ                   VARCHAR2(64),
   TSSM                 VARCHAR2(512),
   GCCC                 VARCHAR2(64),
   LXDH                 VARCHAR2(64),
   CCXLDH               VARCHAR2(64),
   WLMS                 VARCHAR2(256),
   KTGRM                VARCHAR2(32),
   VERPR                NUMBER(12,2),
   STPRS                NUMBER(12,2),
   BWTTY                VARCHAR2(32),
   BKLAS                VARCHAR2(32),
   XYSART               VARCHAR2(32),
   XJZART               VARCHAR2(32),
   WQCART               VARCHAR2(32),
   IQCART               VARCHAR2(32),
   FEVOR                VARCHAR2(32),
   SBDKZ                VARCHAR2(32),
   LGPRO                VARCHAR2(32),
   LGFSB                VARCHAR2(32),
   BESKZ                VARCHAR2(32),
   BSTMI                VARCHAR2(64),
   DISPO                VARCHAR2(32),
   DISGR                VARCHAR2(32),
   MSTAE                VARCHAR2(32),
   EKGRP                VARCHAR2(32),
   EISBE                VARCHAR2(64),
   LSWLBM               VARCHAR2(64),
   JTWZBM               VARCHAR2(128),
   JGDW                 VARCHAR2(64),
   WGJHDHRQ             VARCHAR2(64),
   MC                   VARCHAR2(64),
   SJBBH                VARCHAR2(64),
   constraint PK_标准件主数据 primary key (ID)
         USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
     STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
     PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
     BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
     TABLESPACE "USERS"  ENABLE,
   constraint AK_KEY_1_标准件主数据 unique (ID)
         USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
     STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
     PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
     BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
     TABLESPACE "USERS"  ENABLE
)
SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"
/

comment on column CIDPPUB.标准件主数据.WLBH is
'物料编号'
/

comment on column CIDPPUB.标准件主数据.FLBM is
'标准件分类'
/

comment on column CIDPPUB.标准件主数据.FLMC is
'分类名称'
/

comment on column CIDPPUB.标准件主数据.XH is
'型号'
/

comment on column CIDPPUB.标准件主数据.XHGG is
'型号规格'
/

comment on column CIDPPUB.标准件主数据.JLDW is
'计量单位'
/

comment on column CIDPPUB.标准件主数据.GCJK is
'国产/进口'
/

comment on column CIDPPUB.标准件主数据.LWGG is
'螺纹规格'
/

comment on column CIDPPUB.标准件主数据.LWCD is
'螺纹长度或杆长'
/

comment on column CIDPPUB.标准件主数据.CL is
'材料'
/

comment on column CIDPPUB.标准件主数据.BMCL is
'表面处理'
/

comment on column CIDPPUB.标准件主数据.QTZJ is
'其他直径或特性'
/

comment on column CIDPPUB.标准件主数据.CPXS is
'产品型式'
/

comment on column CIDPPUB.标准件主数据.CPDJ is
'产品等级'
/

comment on column CIDPPUB.标准件主数据.RCL is
'热处理'
/

comment on column CIDPPUB.标准件主数据.GCCD is
'公称长度或厚度'
/

comment on column CIDPPUB.标准件主数据.JXXNDJ is
'机械性能等级、强度或硬度'
/

comment on column CIDPPUB.标准件主数据.BNXS is
'扳拧型式'
/

comment on column CIDPPUB.标准件主数据.DH is
'代号'
/

comment on column CIDPPUB.标准件主数据.BZ is
'标准'
/

comment on column CIDPPUB.标准件主数据.JD is
'精度'
/

comment on column CIDPPUB.标准件主数据.WZ is
'尾缀'
/

comment on column CIDPPUB.标准件主数据.TSSM is
'特殊说明'
/

comment on column CIDPPUB.标准件主数据.GCCC is
'公称尺寸'
/

comment on column CIDPPUB.标准件主数据.LXDH is
'类型代号'
/

comment on column CIDPPUB.标准件主数据.CCXLDH is
'尺寸系列代号'
/

comment on column CIDPPUB.标准件主数据.WLMS is
'物料描述'
/

comment on column CIDPPUB.标准件主数据.KTGRM is
'科目设置组'
/

comment on column CIDPPUB.标准件主数据.VERPR is
'移动平均价'
/

comment on column CIDPPUB.标准件主数据.STPRS is
'标准价格'
/

comment on column CIDPPUB.标准件主数据.BWTTY is
'评估类别'
/

comment on column CIDPPUB.标准件主数据.BKLAS is
'评估类'
/

comment on column CIDPPUB.标准件主数据.XYSART is
'激活下厂验收检验'
/

comment on column CIDPPUB.标准件主数据.XJZART is
'激活下厂监制检验'
/

comment on column CIDPPUB.标准件主数据.WQCART is
'激活超期复检'
/

comment on column CIDPPUB.标准件主数据.IQCART is
'激活入厂检验'
/

comment on column CIDPPUB.标准件主数据.FEVOR is
'生产管理员'
/

comment on column CIDPPUB.标准件主数据.SBDKZ is
'独立/集中'
/

comment on column CIDPPUB.标准件主数据.LGPRO is
'生产仓储地点'
/

comment on column CIDPPUB.标准件主数据.LGFSB is
'外部采购库存地点'
/

comment on column CIDPPUB.标准件主数据.BESKZ is
'采购类型'
/

comment on column CIDPPUB.标准件主数据.BSTMI is
'最小批量大小'
/

comment on column CIDPPUB.标准件主数据.DISPO is
'MRP控制者'
/

comment on column CIDPPUB.标准件主数据.DISGR is
'MRP组'
/

comment on column CIDPPUB.标准件主数据.MSTAE is
'物料状态'
/

comment on column CIDPPUB.标准件主数据.EKGRP is
'采购组'
/

comment on column CIDPPUB.标准件主数据.EISBE is
'安全库存'
/

comment on column CIDPPUB.标准件主数据.LSWLBM is
'历史物料编码'
/

comment on column CIDPPUB.标准件主数据.JTWZBM is
'集团物资编码'
/

comment on column CIDPPUB.标准件主数据.JGDW is
'价格单位'
/

comment on column CIDPPUB.标准件主数据.WGJHDHRQ is
'外购计划到货周期'
/

comment on column CIDPPUB.标准件主数据.MC is
'物料名称'
/

comment on column CIDPPUB.标准件主数据.SJBBH is
'设计版本号'
/

/*==============================================================*/
/* Table: 标准紧固件                                                 */
/*==============================================================*/
create table 标准紧固件 
(
   ID                   NUMBER               not null,
   WLBH                 VARCHAR2(128 BYTE),
   更新时间                 TIMESTAMP,
   创建时间                 TIMESTAMP,
   更新用户                 VARCHAR2(50 BYTE),
   创建用户                 VARCHAR2(50 BYTE),
   constraint PK_标准紧固件 primary key (ID)
)
/

/*==============================================================*/
/* Table: 班组                                                    */
/*==============================================================*/
create table 班组 
(
   ID                   NUMBER               not null,
   班组名称                 VARCHAR2(50 BYTE),
   组织_ID                NUMBER,
   班组长ID                NUMBER,
   备注                   VARCHAR2(255 BYTE),
   更新时间                 TIMESTAMP,
   创建时间                 TIMESTAMP,
   更新用户                 VARCHAR2(50 BYTE),
   创建用户                 VARCHAR2(50 BYTE),
   constraint PK_班组 primary key (ID)
)
/

/*==============================================================*/
/* Table: 班组与工种关系表                                              */
/*==============================================================*/
create table 班组与工种关系表 
(
   ID                   NUMBER               not null,
   班组_ID                NUMBER,
   工种_ID                NUMBER,
   更新时间                 TIMESTAMP,
   创建时间                 TIMESTAMP,
   更新用户                 VARCHAR2(50 BYTE),
   创建用户                 VARCHAR2(50 BYTE),
   constraint PK_班组与工种关系表 primary key (ID)
)
/

/*==============================================================*/
/* Table: 班组与设备关系表                                              */
/*==============================================================*/
create table 班组与设备关系表 
(
   ID                   NUMBER               not null,
   设备_ID                NUMBER,
   班组_ID                NUMBER,
   更新时间                 TIMESTAMP,
   创建时间                 TIMESTAMP,
   更新用户                 VARCHAR2(50 BYTE),
   创建用户                 VARCHAR2(50 BYTE),
   constraint PK_班组与设备关系表 primary key (ID)
)
/

/*==============================================================*/
/* Table: 生产厂商主数据                                               */
/*==============================================================*/
create table CIDPPUB.生产厂商主数据 
(
   ID                   VARCHAR2(32)         not null,
   DATAID               VARCHAR2(32),
   VERSION              VARCHAR2(50),
   VERSIONSTATUS        VARCHAR2(50),
   DATASTATUS           VARCHAR2(50),
   CREATEUSER           VARCHAR2(32),
   MODIFYUSER           VARCHAR2(32),
   MODIFYTIME           DATE,
   CREATEDEPT           VARCHAR2(32),
   CREATEDATE           DATE                 default SYSDATE,
   VALIDDATE            DATE,
   SECRETLEVEL          VARCHAR2(50),
   DATAORIGIN           VARCHAR2(50),
   RDCPBM               VARCHAR2(32),
   SCCSMC               VARCHAR2(128),
   YY                   VARCHAR2(32),
   "BY"                 VARCHAR2(32),
   JT                   VARCHAR2(32),
   CN                   VARCHAR2(32),
   constraint PK_生产厂商主数据 primary key (ID)
         USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
     STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
     PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
     BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
     TABLESPACE "USERS"  ENABLE,
   constraint AK_KEY_1_生产厂商主数据 unique (ID)
         USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
     STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
     PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
     BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
     TABLESPACE "USERS"  ENABLE
)
SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"
/

comment on column CIDPPUB.生产厂商主数据.RDCPBM is
'认定产品编码'
/

comment on column CIDPPUB.生产厂商主数据.SCCSMC is
'生产厂商名称'
/

comment on column CIDPPUB.生产厂商主数据.YY is
'是否一院合格供应商'
/

comment on column CIDPPUB.生产厂商主数据."BY" is
'是否八院合格供应商'
/

comment on column CIDPPUB.生产厂商主数据.JT is
'是否集团合格供应商'
/

comment on column CIDPPUB.生产厂商主数据.CN is
'是否厂内合格供应商'
/

/*==============================================================*/
/* Table: 组织                                                    */
/*==============================================================*/
create table 组织 
(
   ID                   NUMBER               not null,
   车间名称                 VARCHAR(30),
   备注                   VARCHAR(255),
   更新时间                 TIMESTAMP,
   创建时间                 TIMESTAMP,
   更新用户                 VARCHAR2(50 BYTE),
   创建用户                 VARCHAR2(50 BYTE),
   constraint PK_组织 primary key (ID)
)
/

/*==============================================================*/
/* Table: 组织主数据                                                 */
/*==============================================================*/
create table CIDPPUB.组织主数据 
(
   ID                   VARCHAR2(32)         not null,
   DATAID               VARCHAR2(32),
   VERSION              VARCHAR2(50),
   VERSIONSTATUS        VARCHAR2(50),
   DATASTATUS           VARCHAR2(50),
   CREATEUSER           VARCHAR2(32),
   MODIFYUSER           VARCHAR2(32),
   MODIFYTIME           DATE,
   CREATEDEPT           VARCHAR2(32),
   CREATEDATE           DATE                 default SYSDATE,
   VALIDDATE            DATE,
   SECRETLEVEL          VARCHAR2(50),
   DATAORIGIN           VARCHAR2(50),
   BMBM                 VARCHAR2(64),
   BMMC                 VARCHAR2(64),
   BMBS                 VARCHAR2(64),
   SJBMBM               VARCHAR2(64),
   SJBMMC               VARCHAR2(64),
   BMJC                 VARCHAR2(64),
   constraint PK_组织主数据 primary key (ID)
         USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
     STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
     PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
     BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
     TABLESPACE "USERS"  ENABLE,
   constraint AK_KEY_1_组织主数据 unique (ID)
         USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
     STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
     PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
     BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
     TABLESPACE "USERS"  ENABLE
)
SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"
/

comment on column CIDPPUB.组织主数据.BMBM is
'部门编码'
/

comment on column CIDPPUB.组织主数据.BMMC is
'部门名称'
/

comment on column CIDPPUB.组织主数据.BMBS is
'部门标识'
/

comment on column CIDPPUB.组织主数据.SJBMBM is
'上级部门编码'
/

comment on column CIDPPUB.组织主数据.SJBMMC is
'上级部门名称'
/

comment on column CIDPPUB.组织主数据.BMJC is
'部门简称'
/

/*==============================================================*/
/* Table: 维护设置                                                  */
/*==============================================================*/
create table 维护设置 
(
   ID                   NUMBER               not null,
   设备_ID                NUMBER,
   保养类型                 NUMBER,
   初始维护日期               TIMESTAMP,
   最近维护日期               TIMESTAMP,
   维护周期                 NUMBER,
   保养项目                 VARCHAR2(250 BYTE),
   保养内容                 VARCHAR2(250 BYTE),
   保养部位                 VARCHAR2(250 BYTE),
   备注                   VARCHAR2(250 BYTE),
   更新时间                 TIMESTAMP,
   创建时间                 TIMESTAMP,
   更新用户                 VARCHAR2(50 BYTE),
   创建用户                 VARCHAR2(50 BYTE),
   constraint PK_维护设置 primary key (ID)
)
/

/*==============================================================*/
/* Table: 设备                                                    */
/*==============================================================*/
create table 设备 
(
   ID                   NUMBER               not null,
   SBBM                 VARCHAR2(64 BYTE),
   设备状态                 NUMBER,
   备注                   VARCHAR(255),
   更新时间                 TIMESTAMP,
   创建时间                 TIMESTAMP,
   更新用户                 VARCHAR2(50 BYTE),
   创建用户                 VARCHAR2(50 BYTE),
   constraint PK_设备 primary key (ID)
)
/

/*==============================================================*/
/* Table: 设备主数据                                                 */
/*==============================================================*/
create table CIDPPUB.设备主数据 
(
   ID                   VARCHAR2(32)         not null,
   DATAID               VARCHAR2(32),
   VERSION              VARCHAR2(50),
   VERSIONSTATUS        VARCHAR2(50),
   DATASTATUS           VARCHAR2(50),
   CREATEUSER           VARCHAR2(32),
   MODIFYUSER           VARCHAR2(32),
   MODIFYTIME           DATE,
   CREATEDEPT           VARCHAR2(32),
   CREATEDATE           DATE                 default SYSDATE,
   VALIDDATE            DATE,
   SECRETLEVEL          VARCHAR2(50),
   DATAORIGIN           VARCHAR2(50),
   FLBM                 VARCHAR2(64),
   SBFL                 VARCHAR2(64),
   SBBM                 VARCHAR2(64),
   LSBM                 VARCHAR2(64),
   SBMC                 VARCHAR2(128),
   XH                   VARCHAR2(128),
   GG                   VARCHAR2(128),
   JDDJ                 VARCHAR2(256),
   SCCJ                 VARCHAR2(128),
   CCBH                 VARCHAR2(128),
   CCSJ                 VARCHAR2(64),
   QYSJ                 VARCHAR2(64),
   YZ                   NUMBER(12,2),
   JLDW                 VARCHAR2(32),
   TS                   VARCHAR2(32),
   ZJRL                 VARCHAR2(64),
   SRDY                 VARCHAR2(32),
   SYBM                 VARCHAR2(64),
   GLFL                 VARCHAR2(64),
   GLZT                 VARCHAR2(64),
   ZCYT                 VARCHAR2(64),
   ZJLY                 VARCHAR2(64),
   BZ                   VARCHAR2(512),
   CCSJN                DATE,
   QYSJN                DATE,
   SFDZ                 VARCHAR2(16),
   EQUI_ZZBFRQ          DATE,
   EQUI_ZZEDGL          VARCHAR2(128),
   EQUI_ZZYPXLH         VARCHAR2(128),
   EQUI_ZZFWBH          VARCHAR2(128),
   EQUI_ZZCPH           VARCHAR2(64),
   EQUI_ZZLXFS          VARCHAR2(128),
   EQUI_ZZFJD           VARCHAR2(32),
   EQUI_ZZTZSB          VARCHAR2(32),
   EQUI_ZZGJSB          VARCHAR2(32),
   EQUI_ZZSBMJ          VARCHAR2(32),
   EQUI_ZZJK            VARCHAR2(32),
   ILOA_KOKRS           VARCHAR2(32),
   EQUI_BEGRU           VARCHAR2(32),
   ILOA_BEBER           VARCHAR2(64),
   EQUI_ANSDT           DATE,
   EQUI_HERLD           VARCHAR2(64),
   EQUZ_DATAB           DATE,
   EQUI_ZZSX            VARCHAR2(32),
   MGANR                VARCHAR2(64),
   PRICE                NUMBER(12,2),
   PZ                   VARCHAR2(512),
   SDATE                DATE,
   SJBBH                VARCHAR2(64),
   constraint PK_设备主数据 primary key (ID)
         USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
     STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
     PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
     BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
     TABLESPACE "USERS"  ENABLE,
   constraint AK_KEY_1_设备主数据 unique (ID)
         USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
     STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
     PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
     BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
     TABLESPACE "USERS"  ENABLE
)
SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"
/

comment on column CIDPPUB.设备主数据.FLBM is
'分类编码'
/

comment on column CIDPPUB.设备主数据.SBFL is
'设备分类'
/

comment on column CIDPPUB.设备主数据.SBBM is
'设备编码'
/

comment on column CIDPPUB.设备主数据.LSBM is
'历史编码'
/

comment on column CIDPPUB.设备主数据.SBMC is
'设备名称'
/

comment on column CIDPPUB.设备主数据.XH is
'型号'
/

comment on column CIDPPUB.设备主数据.GG is
'规格'
/

comment on column CIDPPUB.设备主数据.JDDJ is
'精度等级'
/

comment on column CIDPPUB.设备主数据.SCCJ is
'生产厂家'
/

comment on column CIDPPUB.设备主数据.CCBH is
'出厂编号'
/

comment on column CIDPPUB.设备主数据.CCSJ is
'出厂时间（）'
/

comment on column CIDPPUB.设备主数据.QYSJ is
'启用时间（）'
/

comment on column CIDPPUB.设备主数据.YZ is
'原值'
/

comment on column CIDPPUB.设备主数据.JLDW is
'计量单位'
/

comment on column CIDPPUB.设备主数据.TS is
'台数'
/

comment on column CIDPPUB.设备主数据.ZJRL is
'装机容量'
/

comment on column CIDPPUB.设备主数据.SRDY is
'输入电压'
/

comment on column CIDPPUB.设备主数据.SYBM is
'使用部门'
/

comment on column CIDPPUB.设备主数据.GLFL is
'管理分类'
/

comment on column CIDPPUB.设备主数据.GLZT is
'管理状态'
/

comment on column CIDPPUB.设备主数据.ZCYT is
'资产用途'
/

comment on column CIDPPUB.设备主数据.ZJLY is
'资金来源'
/

comment on column CIDPPUB.设备主数据.BZ is
'备注'
/

comment on column CIDPPUB.设备主数据.CCSJN is
'出厂时间'
/

comment on column CIDPPUB.设备主数据.QYSJN is
'启用时间'
/

comment on column CIDPPUB.设备主数据.SFDZ is
'是否低值设备'
/

comment on column CIDPPUB.设备主数据.EQUI_ZZBFRQ is
'报废日期'
/

comment on column CIDPPUB.设备主数据.EQUI_ZZEDGL is
'额定功率(KW)'
/

comment on column CIDPPUB.设备主数据.EQUI_ZZYPXLH is
'硬盘序列号'
/

comment on column CIDPPUB.设备主数据.EQUI_ZZFWBH is
'房屋编号'
/

comment on column CIDPPUB.设备主数据.EQUI_ZZCPH is
'车牌号'
/

comment on column CIDPPUB.设备主数据.EQUI_ZZLXFS is
'厂家联系方式'
/

comment on column CIDPPUB.设备主数据.EQUI_ZZFJD is
'是否防静电设施'
/

comment on column CIDPPUB.设备主数据.EQUI_ZZTZSB is
'是否特种设备'
/

comment on column CIDPPUB.设备主数据.EQUI_ZZGJSB is
'是否军工关键设备'
/

comment on column CIDPPUB.设备主数据.EQUI_ZZSBMJ is
'密级'
/

comment on column CIDPPUB.设备主数据.EQUI_ZZJK is
'是否进口'
/

comment on column CIDPPUB.设备主数据.ILOA_KOKRS is
'成本中心'
/

comment on column CIDPPUB.设备主数据.EQUI_BEGRU is
'授权组'
/

comment on column CIDPPUB.设备主数据.ILOA_BEBER is
'工厂区域'
/

comment on column CIDPPUB.设备主数据.EQUI_ANSDT is
'购置日期'
/

comment on column CIDPPUB.设备主数据.EQUI_HERLD is
'制造国别'
/

comment on column CIDPPUB.设备主数据.EQUZ_DATAB is
'开始生效日期'
/

comment on column CIDPPUB.设备主数据.EQUI_ZZSX is
'属性'
/

comment on column CIDPPUB.设备主数据.MGANR is
'采购申请人'
/

comment on column CIDPPUB.设备主数据.PRICE is
'预估价'
/

comment on column CIDPPUB.设备主数据.PZ is
'配置'
/

comment on column CIDPPUB.设备主数据.SDATE is
'申请日期'
/

comment on column CIDPPUB.设备主数据.SJBBH is
'设计版本号'
/

/*==============================================================*/
/* Table: 量具                                                    */
/*==============================================================*/
create table 量具 
(
   ID                   NUMBER               not null,
   WLBH                 VARCHAR2(128 BYTE),
   更新时间                 TIMESTAMP,
   创建时间                 TIMESTAMP,
   更新用户                 VARCHAR2(50 BYTE),
   创建用户                 VARCHAR2(50 BYTE),
   constraint PK_量具 primary key (ID)
)
/

/*==============================================================*/
/* Table: 量具主数据                                                 */
/*==============================================================*/
create table CIDPPUB.量具主数据 
(
   ID                   VARCHAR2(32)         not null,
   DATAID               VARCHAR2(32),
   VERSION              VARCHAR2(50),
   VERSIONSTATUS        VARCHAR2(50),
   DATASTATUS           VARCHAR2(50),
   CREATEUSER           VARCHAR2(32),
   MODIFYUSER           VARCHAR2(32),
   MODIFYTIME           DATE,
   CREATEDEPT           VARCHAR2(32),
   CREATEDATE           DATE                 default SYSDATE,
   VALIDDATE            DATE,
   SECRETLEVEL          VARCHAR2(50),
   DATAORIGIN           VARCHAR2(50),
   FLBM                 VARCHAR2(64),
   FLMC                 VARCHAR2(64),
   WLBH                 VARCHAR2(64),
   WLMC                 VARCHAR2(128),
   GG                   VARCHAR2(128),
   JLDW                 VARCHAR2(64),
   JSTJ                 VARCHAR2(512),
   JKGC                 VARCHAR2(64),
   SCCJ                 VARCHAR2(128),
   TSSM                 VARCHAR2(512),
   XH                   VARCHAR2(128),
   SJBBH                VARCHAR2(64),
   constraint PK_量具主数据 primary key (ID)
         USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
     STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
     PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
     BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
     TABLESPACE "USERS"  ENABLE,
   constraint AK_KEY_1_量具主数据 unique (ID)
         USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
     STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
     PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
     BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
     TABLESPACE "USERS"  ENABLE
)
SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"
/

comment on column CIDPPUB.量具主数据.FLBM is
'量具分类'
/

comment on column CIDPPUB.量具主数据.FLMC is
'分类名称'
/

comment on column CIDPPUB.量具主数据.WLBH is
'物料编号'
/

comment on column CIDPPUB.量具主数据.WLMC is
'物料名称'
/

comment on column CIDPPUB.量具主数据.GG is
'规格'
/

comment on column CIDPPUB.量具主数据.JLDW is
'计量单位'
/

comment on column CIDPPUB.量具主数据.JSTJ is
'技术条件'
/

comment on column CIDPPUB.量具主数据.JKGC is
'进口/国产'
/

comment on column CIDPPUB.量具主数据.SCCJ is
'生产厂家'
/

comment on column CIDPPUB.量具主数据.TSSM is
'特殊说明'
/

comment on column CIDPPUB.量具主数据.XH is
'型号'
/

comment on column CIDPPUB.量具主数据.SJBBH is
'设计版本号'
/

/*==============================================================*/
/* Table: 金属材料                                                  */
/*==============================================================*/
create table 金属材料 
(
   ID                   NUMBER               not null,
   WLBH                 VARCHAR2(128 BYTE),
   更新时间                 TIMESTAMP,
   创建时间                 TIMESTAMP,
   更新用户                 VARCHAR2(50 BYTE),
   创建用户                 VARCHAR2(50 BYTE),
   constraint PK_金属材料 primary key (ID)
)
/

/*==============================================================*/
/* Table: 金属材料主数据                                               */
/*==============================================================*/
create table CIDPPUB.金属材料主数据 
(
   ID                   VARCHAR2(32)         not null,
   DATAID               VARCHAR2(32),
   VERSION              VARCHAR2(50),
   VERSIONSTATUS        VARCHAR2(50),
   DATASTATUS           VARCHAR2(50),
   CREATEUSER           VARCHAR2(32),
   MODIFYUSER           VARCHAR2(32),
   MODIFYTIME           DATE,
   CREATEDEPT           VARCHAR2(32),
   CREATEDATE           DATE                 default SYSDATE,
   VALIDDATE            DATE,
   SECRETLEVEL          VARCHAR2(50),
   DATAORIGIN           VARCHAR2(50),
   WLBH                 VARCHAR2(64),
   FLBM                 VARCHAR2(64),
   FLMC                 VARCHAR2(64),
   XH                   VARCHAR2(128),
   XHGG                 VARCHAR2(128),
   JLDW                 VARCHAR2(64),
   GCJK                 VARCHAR2(64),
   CYBZPZ               VARCHAR2(128),
   GYZT                 VARCHAR2(64),
   TSSM                 VARCHAR2(512),
   PH                   VARCHAR2(64),
   ZT                   VARCHAR2(64),
   JD                   VARCHAR2(64),
   JSTJ                 VARCHAR2(512),
   ZYTS                 VARCHAR2(64),
   CLLB                 VARCHAR2(64),
   CLZLTZ               VARCHAR2(64),
   PCBCL                VARCHAR2(64),
   PCBBZ                VARCHAR2(64),
   PCBSX                VARCHAR2(64),
   SFZYTSY              VARCHAR2(64),
   CLZL                 VARCHAR2(64),
   WLMS                 VARCHAR2(256),
   KTGRM                VARCHAR2(32),
   VERPR                NUMBER(12,2),
   STPRS                NUMBER(12,2),
   BWTTY                VARCHAR2(32),
   BKLAS                VARCHAR2(32),
   XYSART               VARCHAR2(32),
   XJZART               VARCHAR2(32),
   WQCART               VARCHAR2(32),
   IQCART               VARCHAR2(32),
   FEVOR                VARCHAR2(32),
   SBDKZ                VARCHAR2(32),
   LGPRO                VARCHAR2(32),
   LGFSB                VARCHAR2(32),
   BESKZ                VARCHAR2(32),
   BSTMI                VARCHAR2(64),
   DISPO                VARCHAR2(32),
   DISGR                VARCHAR2(32),
   MSTAE                VARCHAR2(32),
   EKGRP                VARCHAR2(32),
   EISBE                VARCHAR2(64),
   LSWLBM               VARCHAR2(64),
   JTWZBM               VARCHAR2(128),
   JGDW                 VARCHAR2(64),
   WGJHDHRQ             VARCHAR2(64),
   MC                   VARCHAR2(64),
   SJBBH                VARCHAR2(64),
   constraint PK_金属材料主数据 primary key (ID)
         USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
     STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
     PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
     BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
     TABLESPACE "USERS"  ENABLE,
   constraint AK_KEY_1_金属材料主数据 unique (ID)
         USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
     STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
     PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
     BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
     TABLESPACE "USERS"  ENABLE
)
SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"
/

comment on column CIDPPUB.金属材料主数据.WLBH is
'物料编号'
/

comment on column CIDPPUB.金属材料主数据.FLBM is
'金属材料分类'
/

comment on column CIDPPUB.金属材料主数据.FLMC is
'分类名称'
/

comment on column CIDPPUB.金属材料主数据.XH is
'型号'
/

comment on column CIDPPUB.金属材料主数据.XHGG is
'型号规格'
/

comment on column CIDPPUB.金属材料主数据.JLDW is
'计量单位'
/

comment on column CIDPPUB.金属材料主数据.GCJK is
'国产/进口'
/

comment on column CIDPPUB.金属材料主数据.CYBZPZ is
'采用标准/品种'
/

comment on column CIDPPUB.金属材料主数据.GYZT is
'供应状态'
/

comment on column CIDPPUB.金属材料主数据.TSSM is
'特殊说明'
/

comment on column CIDPPUB.金属材料主数据.PH is
'牌号'
/

comment on column CIDPPUB.金属材料主数据.ZT is
'状态'
/

comment on column CIDPPUB.金属材料主数据.JD is
'精度'
/

comment on column CIDPPUB.金属材料主数据.JSTJ is
'技术条件'
/

comment on column CIDPPUB.金属材料主数据.ZYTS is
'专用/特殊'
/

comment on column CIDPPUB.金属材料主数据.CLLB is
'材料类别'
/

comment on column CIDPPUB.金属材料主数据.CLZLTZ is
'材料质量特征/等级'
/

comment on column CIDPPUB.金属材料主数据.PCBCL is
'PCB材料'
/

comment on column CIDPPUB.金属材料主数据.PCBBZ is
'PCB标准'
/

comment on column CIDPPUB.金属材料主数据.PCBSX is
'PCB属性'
/

comment on column CIDPPUB.金属材料主数据.SFZYTSY is
'是否为优选专特物资（TRUE/FALSE）'
/

comment on column CIDPPUB.金属材料主数据.CLZL is
'材料种类'
/

comment on column CIDPPUB.金属材料主数据.WLMS is
'物料描述'
/

comment on column CIDPPUB.金属材料主数据.KTGRM is
'科目设置组'
/

comment on column CIDPPUB.金属材料主数据.VERPR is
'移动平均价'
/

comment on column CIDPPUB.金属材料主数据.STPRS is
'标准价格'
/

comment on column CIDPPUB.金属材料主数据.BWTTY is
'评估类别'
/

comment on column CIDPPUB.金属材料主数据.BKLAS is
'评估类'
/

comment on column CIDPPUB.金属材料主数据.XYSART is
'激活下厂验收检验'
/

comment on column CIDPPUB.金属材料主数据.XJZART is
'激活下厂监制检验'
/

comment on column CIDPPUB.金属材料主数据.WQCART is
'激活超期复检'
/

comment on column CIDPPUB.金属材料主数据.IQCART is
'激活入厂检验'
/

comment on column CIDPPUB.金属材料主数据.FEVOR is
'生产管理员'
/

comment on column CIDPPUB.金属材料主数据.SBDKZ is
'独立/集中'
/

comment on column CIDPPUB.金属材料主数据.LGPRO is
'生产仓储地点'
/

comment on column CIDPPUB.金属材料主数据.LGFSB is
'外部采购库存地点'
/

comment on column CIDPPUB.金属材料主数据.BESKZ is
'采购类型'
/

comment on column CIDPPUB.金属材料主数据.BSTMI is
'最小批量大小'
/

comment on column CIDPPUB.金属材料主数据.DISPO is
'MRP控制者'
/

comment on column CIDPPUB.金属材料主数据.DISGR is
'MRP组'
/

comment on column CIDPPUB.金属材料主数据.MSTAE is
'物料状态'
/

comment on column CIDPPUB.金属材料主数据.EKGRP is
'采购组'
/

comment on column CIDPPUB.金属材料主数据.EISBE is
'安全库存'
/

comment on column CIDPPUB.金属材料主数据.LSWLBM is
'历史物料编码'
/

comment on column CIDPPUB.金属材料主数据.JTWZBM is
'集团物资编码'
/

comment on column CIDPPUB.金属材料主数据.JGDW is
'价格单位'
/

comment on column CIDPPUB.金属材料主数据.WGJHDHRQ is
'外购计划到货周期'
/

comment on column CIDPPUB.金属材料主数据.MC is
'物料名称'
/

comment on column CIDPPUB.金属材料主数据.SJBBH is
'设计版本号'
/

/*==============================================================*/
/* Table: 非金属材料                                                 */
/*==============================================================*/
create table 非金属材料 
(
   ID                   NUMBER               not null,
   WLBH                 VARCHAR2(128 BYTE),
   更新时间                 TIMESTAMP,
   创建时间                 TIMESTAMP,
   更新用户                 VARCHAR2(50 BYTE),
   创建用户                 VARCHAR2(50 BYTE),
   constraint PK_非金属材料 primary key (ID)
)
/

/*==============================================================*/
/* Table: 非金属材料主数据                                              */
/*==============================================================*/
create table CIDPPUB.非金属材料主数据 
(
   ID                   VARCHAR2(32)         not null,
   DATAID               VARCHAR2(32),
   VERSION              VARCHAR2(50),
   VERSIONSTATUS        VARCHAR2(50),
   DATASTATUS           VARCHAR2(50),
   CREATEUSER           VARCHAR2(32),
   MODIFYUSER           VARCHAR2(32),
   MODIFYTIME           DATE,
   CREATEDEPT           VARCHAR2(32),
   CREATEDATE           DATE                 default SYSDATE,
   VALIDDATE            DATE,
   SECRETLEVEL          VARCHAR2(50),
   DATAORIGIN           VARCHAR2(50),
   WLBH                 VARCHAR2(64),
   FLBM                 VARCHAR2(64),
   FLMC                 VARCHAR2(64),
   XH                   VARCHAR2(128),
   XHGG                 VARCHAR2(128),
   JLDW                 VARCHAR2(64),
   GCJK                 VARCHAR2(64),
   CYBZPZ               VARCHAR2(128),
   TSSM                 VARCHAR2(512),
   PH                   VARCHAR2(64),
   ZT                   VARCHAR2(64),
   JD                   VARCHAR2(64),
   JSTJ                 VARCHAR2(512),
   ZYTS                 VARCHAR2(64),
   CLLB                 VARCHAR2(64),
   CLZLTZ               VARCHAR2(64),
   PCBCL                VARCHAR2(64),
   PCBBZ                VARCHAR2(64),
   PCBSX                VARCHAR2(64),
   SFZYTSY              VARCHAR2(64),
   CLZL                 VARCHAR2(64),
   WLMS                 VARCHAR2(256),
   KTGRM                VARCHAR2(32),
   VERPR                NUMBER(12,2),
   STPRS                NUMBER(12,2),
   BWTTY                VARCHAR2(32),
   BKLAS                VARCHAR2(32),
   XYSART               VARCHAR2(32),
   XJZART               VARCHAR2(32),
   WQCART               VARCHAR2(32),
   IQCART               VARCHAR2(32),
   FEVOR                VARCHAR2(32),
   SBDKZ                VARCHAR2(32),
   LGPRO                VARCHAR2(32),
   LGFSB                VARCHAR2(32),
   BESKZ                VARCHAR2(32),
   BSTMI                VARCHAR2(64),
   DISPO                VARCHAR2(32),
   DISGR                VARCHAR2(32),
   MSTAE                VARCHAR2(32),
   EKGRP                VARCHAR2(32),
   EISBE                VARCHAR2(64),
   LSWLBM               VARCHAR2(64),
   JTWZBM               VARCHAR2(128),
   JGDW                 VARCHAR2(64),
   WGJHDHRQ             VARCHAR2(64),
   MC                   VARCHAR2(64),
   SJBBH                VARCHAR2(64),
   constraint PK_非金属材料主数据 primary key (ID)
         USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
     TABLESPACE "USERS"  ENABLE,
   constraint AK_KEY_1_非金属材料主数据 unique (ID)
         USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
     TABLESPACE "USERS"  ENABLE
)
SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS"
/

comment on column CIDPPUB.非金属材料主数据.WLBH is
'物料编号'
/

comment on column CIDPPUB.非金属材料主数据.FLBM is
'非金属分类'
/

comment on column CIDPPUB.非金属材料主数据.FLMC is
'分类名称'
/

comment on column CIDPPUB.非金属材料主数据.XH is
'型号'
/

comment on column CIDPPUB.非金属材料主数据.XHGG is
'型号规格'
/

comment on column CIDPPUB.非金属材料主数据.JLDW is
'计量单位'
/

comment on column CIDPPUB.非金属材料主数据.GCJK is
'国产/进口'
/

comment on column CIDPPUB.非金属材料主数据.CYBZPZ is
'采用标准/品种'
/

comment on column CIDPPUB.非金属材料主数据.TSSM is
'特殊说明'
/

comment on column CIDPPUB.非金属材料主数据.PH is
'牌号'
/

comment on column CIDPPUB.非金属材料主数据.ZT is
'状态'
/

comment on column CIDPPUB.非金属材料主数据.JD is
'精度'
/

comment on column CIDPPUB.非金属材料主数据.JSTJ is
'技术条件'
/

comment on column CIDPPUB.非金属材料主数据.ZYTS is
'专用/特殊'
/

comment on column CIDPPUB.非金属材料主数据.CLLB is
'材料类别'
/

comment on column CIDPPUB.非金属材料主数据.CLZLTZ is
'材料质量特征/等级'
/

comment on column CIDPPUB.非金属材料主数据.PCBCL is
'PCB材料'
/

comment on column CIDPPUB.非金属材料主数据.PCBBZ is
'PCB标准'
/

comment on column CIDPPUB.非金属材料主数据.PCBSX is
'PCB属性'
/

comment on column CIDPPUB.非金属材料主数据.SFZYTSY is
'是否为优选专特物资（TRUE/FALSE）'
/

comment on column CIDPPUB.非金属材料主数据.CLZL is
'材料种类'
/

comment on column CIDPPUB.非金属材料主数据.WLMS is
'物料描述'
/

comment on column CIDPPUB.非金属材料主数据.KTGRM is
'科目设置组'
/

comment on column CIDPPUB.非金属材料主数据.VERPR is
'移动平均价'
/

comment on column CIDPPUB.非金属材料主数据.STPRS is
'标准价格'
/

comment on column CIDPPUB.非金属材料主数据.BWTTY is
'评估类别'
/

comment on column CIDPPUB.非金属材料主数据.BKLAS is
'评估类'
/

comment on column CIDPPUB.非金属材料主数据.XYSART is
'激活下厂验收检验'
/

comment on column CIDPPUB.非金属材料主数据.XJZART is
'激活下厂监制检验'
/

comment on column CIDPPUB.非金属材料主数据.WQCART is
'激活超期复检'
/

comment on column CIDPPUB.非金属材料主数据.IQCART is
'激活入厂检验'
/

comment on column CIDPPUB.非金属材料主数据.FEVOR is
'生产管理员'
/

comment on column CIDPPUB.非金属材料主数据.SBDKZ is
'独立/集中'
/

comment on column CIDPPUB.非金属材料主数据.LGPRO is
'生产仓储地点'
/

comment on column CIDPPUB.非金属材料主数据.LGFSB is
'外部采购库存地点'
/

comment on column CIDPPUB.非金属材料主数据.BESKZ is
'采购类型'
/

comment on column CIDPPUB.非金属材料主数据.BSTMI is
'最小批量大小'
/

comment on column CIDPPUB.非金属材料主数据.DISPO is
'MRP控制者'
/

comment on column CIDPPUB.非金属材料主数据.DISGR is
'MRP组'
/

comment on column CIDPPUB.非金属材料主数据.MSTAE is
'物料状态'
/

comment on column CIDPPUB.非金属材料主数据.EKGRP is
'采购组'
/

comment on column CIDPPUB.非金属材料主数据.EISBE is
'安全库存'
/

comment on column CIDPPUB.非金属材料主数据.LSWLBM is
'历史物料编码'
/

comment on column CIDPPUB.非金属材料主数据.JTWZBM is
'集团物资编码'
/

comment on column CIDPPUB.非金属材料主数据.JGDW is
'价格单位'
/

comment on column CIDPPUB.非金属材料主数据.WGJHDHRQ is
'外购计划到货周期'
/

comment on column CIDPPUB.非金属材料主数据.MC is
'物料名称'
/

comment on column CIDPPUB.非金属材料主数据.SJBBH is
'设计版本号'
/

/*==============================================================*/
/* Table: 领用记录                                                  */
/*==============================================================*/
create table 领用记录 
(
   ID                   NUMBER               not null,
   员工_ID                NUMBER,
   主数据类型                NUMBER,
   物料_ID                NUMBER,
   数量                   NUMBER,
   库存_ID                NUMBER,
   领取时间                 TIMESTAMP,
   是否归还完标志位             NUMBER,
   备注                   VARCHAR2(255 BYTE),
   更新时间                 TIMESTAMP,
   创建时间                 TIMESTAMP,
   更新用户                 VARCHAR2(50 BYTE),
   创建用户                 VARCHAR2(50 BYTE),
   constraint PK_领用记录 primary key (ID)
)
/

alter table E_MATERIAL
   add constraint FK_E_MATERI_REFERENCE_E_ORDER foreign key (ORDER_ID)
      references E_ORDER (ID)
/

alter table E_ORDER_CHANGE
   add constraint FK_E_ORDER__REFERENCE_E_ORDER foreign key (ORDER_ID)
      references E_ORDER (ID)
/

alter table "Product_SN"
   add constraint FK_PRODUCT__REFERENCE_WIP foreign key (WIP_ID)
      references WIP (ID)
/

alter table WIP
   add constraint FK_WIP_REFERENCE_工单 foreign key ()
      references 工单 (ID)
/

alter table WIP
   add constraint FK_WIP_REFERENCE_工序信息 foreign key (CODE_TEST)
      references 工序信息 (ID)
/

alter table WIP
   add constraint FK_WIP_REFERENCE_工序物料 foreign key ()
      references 工序物料 (ID)
/

alter table 人员与工种关系表
   add constraint FK_人员与工种关系表_REFERENCE_工种 foreign key (工种_ID)
      references 工种 (ID)
/

alter table 人员与工种关系表
   add constraint FK_人员与工种关系表_REFERENCE_人员 foreign key (人员_ID)
      references 人员 (ID)
/

alter table 人员与设备关系表
   add constraint FK_人员与设备关系表_REFERENCE_设备 foreign key (设备_ID)
      references 设备 (ID)
/

alter table 人员与设备关系表
   add constraint FK_人员与设备关系表_REFERENCE_人员 foreign key (人员_ID)
      references 人员 (ID)
/

alter table 工单
   add constraint FK_工单_REFERENCE_E_ORDER foreign key (订单_ID)
      references E_ORDER (ID)
/

alter table 工单ERP工艺表
   add constraint FK_工单ERP工艺表_REFERENCE_工单 foreign key (工单_ID)
      references 工单 (ID)
/

alter table 工序信息
   add constraint FK_工序信息_REFERENCE_BOP foreign key (BOP_ID)
      references BOP (ID)
/

alter table 工序信息
   add constraint FK_工序信息_REFERENCE_工序工作中心 foreign key (工序编码)
      references 工序工作中心 (ID)
/

alter table 工序参数
   add constraint FK_工序参数_REFERENCE_工序信息 foreign key (工序信息_ID)
      references 工序信息 (ID)
/

alter table 工序工时
   add constraint FK_工序工时_REFERENCE_工序信息 foreign key (工序信息_ID)
      references 工序信息 (ID)
/

alter table 工序工装，刀具，量具，辅具
   add constraint FK_工序工装，刀具，_REFERENCE_工序信息 foreign key (工序信息_ID)
      references 工序信息 (ID)
/

alter table 工序文件
   add constraint FK_工序文件_REFERENCE_工序信息 foreign key (工序信息_ID)
      references 工序信息 (ID)
/

alter table 工序物料
   add constraint FK_工序物料_REFERENCE_工序信息 foreign key (工序信息_ID)
      references 工序信息 (ID)
/

alter table 工序计划表
   add constraint FK_工序计划表_REFERENCE_工单 foreign key (工单_ID)
      references 工单 (ID)
/

alter table 工序计划表
   add constraint FK_工序计划表_REFERENCE_工种 foreign key (工种_ID)
      references 工种 (ID)
/

alter table 工序计划表
   add constraint FK_工序计划表_REFERENCE_班组 foreign key (班组_ID)
      references 班组 (ID)
/

alter table 工序计划表
   add constraint FK_工序计划表_REFERENCE_人员 foreign key (操作人_ID)
      references 人员 (ID)
/

alter table 工序计划表
   add constraint FK_工序计划表_REFERENCE_设备 foreign key (设备_ID)
      references 设备 (ID)
/

alter table 工序设备
   add constraint FK_工序设备_REFERENCE_工序信息 foreign key (工序信息_ID)
      references 工序信息 (ID)
/

alter table 工步信息
   add constraint FK_工步信息_REFERENCE_工序信息 foreign key (工序_ID)
      references 工序信息 (ID)
/

alter table 库位
   add constraint FK_库位_REFERENCE_库房 foreign key (库房_ID)
      references 库房 (ID)
/

alter table 库存
   add constraint FK_库存_REFERENCE_库位 foreign key (库位_ID)
      references 库位 (ID)
/

alter table 库存
   add constraint FK_库存_REFERENCE_半成品 foreign key (半成品_ID)
      references 半成品 (ID)
/

alter table 库存
   add constraint FK_库存_REFERENCE_元器件 foreign key (元器件_ID)
      references 元器件 (ID)
/

alter table 库存
   add constraint FK_库存_REFERENCE_产品 foreign key (产品_ID)
      references 产品 (ID)
/

alter table 库存
   add constraint FK_库存_REFERENCE_标准紧固件 foreign key (标准紧固件_ID)
      references 标准紧固件 (ID)
/

alter table 库存
   add constraint FK_库存_REFERENCE_金属材料 foreign key (金属材料_ID)
      references 金属材料 (ID)
/

alter table 库存
   add constraint FK_库存_REFERENCE_非金属材料 foreign key (非金属材料_ID)
      references 非金属材料 (ID)
/

alter table 库存
   add constraint FK_库存_REFERENCE_复合材料 foreign key (复合材料_ID)
      references 复合材料 (ID)
/

alter table 库存
   add constraint FK_库存_REFERENCE_机电配套件 foreign key (机电配套件_ID)
      references 机电配套件 (ID)
/

alter table 库存
   add constraint FK_库存_REFERENCE_仪器仪表 foreign key (仪器仪表_ID)
      references 仪器仪表 (ID)
/

alter table 库存
   add constraint FK_库存_REFERENCE_刀具 foreign key (刀具_ID)
      references 刀具 (ID)
/

alter table 库存
   add constraint FK_库存_REFERENCE_量具 foreign key (量具_ID)
      references 量具 (ID)
/

alter table 库存
   add constraint FK_库存_REFERENCE_工具 foreign key (工具_ID)
      references 工具 (ID)
/

alter table 库存
   add constraint FK_库存_REFERENCE_工装 foreign key (工装_ID)
      references 工装 (ID)
/

alter table 班组
   add constraint FK_班组_REFERENCE_组织 foreign key (组织_ID)
      references 组织 (ID)
/

alter table 班组
   add constraint FK_班组_REFERENCE_人员 foreign key (班组长ID)
      references 人员 (ID)
/

alter table 班组与工种关系表
   add constraint FK_班组与工种关系表_REFERENCE_班组 foreign key (班组_ID)
      references 班组 (ID)
/

alter table 班组与工种关系表
   add constraint FK_班组与工种关系表_REFERENCE_工种 foreign key (工种_ID)
      references 工种 (ID)
/

alter table 班组与设备关系表
   add constraint FK_班组与设备关系表_REFERENCE_设备 foreign key (设备_ID)
      references 设备 (ID)
/

alter table 班组与设备关系表
   add constraint FK_班组与设备关系表_REFERENCE_班组 foreign key (班组_ID)
      references 班组 (ID)
/

alter table 维护设置
   add constraint FK_维护设置_REFERENCE_设备 foreign key (设备_ID)
      references 设备 (ID)
/


create or replace trigger "CompoundDeleteTrigger_material"
for delete on E_MATERIAL compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger "CompoundInsertTrigger_material"
for insert on E_MATERIAL compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger "CompoundUpdateTrigger_material"
for update on E_MATERIAL compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create trigger "tib_material" before insert
on E_MATERIAL for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin
    --  Column "ID" uses sequence MATERIAL_SEQUE
    select MATERIAL_SEQUE.NEXTVAL INTO :new.ID from dual;

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create or replace trigger "CompoundDeleteTrigger_order"
for delete on E_ORDER compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger "CompoundInsertTrigger_order"
for insert on E_ORDER compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger "CompoundUpdateTrigger_order"
for update on E_ORDER compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create trigger "tib_order" before insert
on E_ORDER for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin
    --  Column "ID" uses sequence ORDER_SEQUE
    select ORDER_SEQUE.NEXTVAL INTO :new.ID from dual;

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create or replace trigger "CompoundDeleteTrigger_order_ch"
for delete on E_ORDER_CHANGE compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger "CompoundInsertTrigger_order_ch"
for insert on E_ORDER_CHANGE compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger "CompoundUpdateTrigger_order_ch"
for update on E_ORDER_CHANGE compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create trigger "tib_order_change" before insert
on E_ORDER_CHANGE for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin
    --  Column "ID" uses sequence ORDER_CHANGE_SEQUE
    select ORDER_CHANGE_SEQUE.NEXTVAL INTO :new.ID from dual;

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create or replace trigger "CompoundDeleteTrigger_upcoming"
for delete on P_UPCOMING compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger "CompoundInsertTrigger_upcoming"
for insert on P_UPCOMING compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger "CompoundUpdateTrigger_upcoming"
for update on P_UPCOMING compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create trigger "tib_upcoming" before insert
on P_UPCOMING for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin
    --  Column "ID" uses sequence SQUE_UPCOMING
    select SQUE_UPCOMING.NEXTVAL INTO :new.ID from dual;

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create or replace trigger "CompoundDeleteTrigger_order"
for delete on "Product_SN" compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger "CompoundInsertTrigger_order"
for insert on "Product_SN" compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger "CompoundUpdateTrigger_order"
for update on "Product_SN" compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create trigger "tib_order" before insert
on "Product_SN" for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin
    --  Column "ID" uses sequence ORDER_SEQUE
    select ORDER_SEQUE.NEXTVAL INTO :new.ID from dual;

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create or replace trigger "CompoundDeleteTrigger_order"
for delete on WIP compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger "CompoundInsertTrigger_order"
for insert on WIP compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger "CompoundUpdateTrigger_order"
for update on WIP compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create trigger "tib_order" before insert
on WIP for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/

