CREATE SEQUENCE "config_info_aggr_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for config_info_beta_id_seq
-- ----------------------------
CREATE SEQUENCE "config_info_beta_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for config_info_id_seq
-- ----------------------------
CREATE SEQUENCE "config_info_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for config_info_tag_id_seq
-- ----------------------------
CREATE SEQUENCE "config_info_tag_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for config_tags_relation_id_seq
-- ----------------------------
CREATE SEQUENCE "config_tags_relation_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for group_capacity_id_seq
-- ----------------------------
CREATE SEQUENCE "group_capacity_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for his_config_info_nid_seq
-- ----------------------------
CREATE SEQUENCE "his_config_info_nid_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for tenant_capacity_id_seq
-- ----------------------------
CREATE SEQUENCE "tenant_capacity_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for tenant_info_id_seq
-- ----------------------------
CREATE SEQUENCE "tenant_info_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS "config_info";
CREATE TABLE "config_info" (
  "id" int8 NOT NULL DEFAULT nextval('config_info_id_seq'::regclass),
  "data_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "group_id" varchar(128) COLLATE "pg_catalog"."default",
  "content" text COLLATE "pg_catalog"."default" NOT NULL,
  "md5" varchar(32) COLLATE "pg_catalog"."default",
  "gmt_create" timestamp(6) NOT NULL,
  "gmt_modified" timestamp(6) NOT NULL,
  "src_user" text COLLATE "pg_catalog"."default",
  "src_ip" varchar(50) COLLATE "pg_catalog"."default",
  "app_name" varchar(128) COLLATE "pg_catalog"."default",
  "tenant_id" varchar(128) COLLATE "pg_catalog"."default",
  "c_desc" varchar(256) COLLATE "pg_catalog"."default",
  "c_use" varchar(64) COLLATE "pg_catalog"."default",
  "effect" varchar(64) COLLATE "pg_catalog"."default",
  "type" varchar(64) COLLATE "pg_catalog"."default",
  "c_schema" text COLLATE "pg_catalog"."default",
  "encrypted_data_key" text COLLATE "pg_catalog"."default" NOT NULL
)
;
COMMENT ON COLUMN "config_info"."id" IS 'id';
COMMENT ON COLUMN "config_info"."data_id" IS 'data_id';
COMMENT ON COLUMN "config_info"."content" IS 'content';
COMMENT ON COLUMN "config_info"."md5" IS 'md5';
COMMENT ON COLUMN "config_info"."gmt_create" IS '创建时间';
COMMENT ON COLUMN "config_info"."gmt_modified" IS '修改时间';
COMMENT ON COLUMN "config_info"."src_user" IS 'source user';
COMMENT ON COLUMN "config_info"."src_ip" IS 'source ip';
COMMENT ON COLUMN "config_info"."tenant_id" IS '租户字段';
COMMENT ON COLUMN "config_info"."encrypted_data_key" IS '秘钥';
COMMENT ON TABLE "config_info" IS 'config_info';

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS "config_info_aggr";
CREATE TABLE "config_info_aggr" (
  "id" int8 NOT NULL DEFAULT nextval('config_info_aggr_id_seq'::regclass),
  "data_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "group_id" varchar(128) COLLATE "pg_catalog"."default" NOT NULL,
  "datum_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "content" text COLLATE "pg_catalog"."default" NOT NULL,
  "gmt_modified" timestamp(6) NOT NULL,
  "app_name" varchar(128) COLLATE "pg_catalog"."default",
  "tenant_id" varchar(128) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "config_info_aggr"."id" IS 'id';
COMMENT ON COLUMN "config_info_aggr"."data_id" IS 'data_id';
COMMENT ON COLUMN "config_info_aggr"."group_id" IS 'group_id';
COMMENT ON COLUMN "config_info_aggr"."datum_id" IS 'datum_id';
COMMENT ON COLUMN "config_info_aggr"."content" IS '内容';
COMMENT ON COLUMN "config_info_aggr"."gmt_modified" IS '修改时间';
COMMENT ON COLUMN "config_info_aggr"."tenant_id" IS '租户字段';
COMMENT ON TABLE "config_info_aggr" IS '增加租户字段';

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS "config_info_beta";
CREATE TABLE "config_info_beta" (
  "id" int8 NOT NULL DEFAULT nextval('config_info_beta_id_seq'::regclass),
  "data_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "group_id" varchar(128) COLLATE "pg_catalog"."default" NOT NULL,
  "app_name" varchar(128) COLLATE "pg_catalog"."default",
  "content" text COLLATE "pg_catalog"."default" NOT NULL,
  "beta_ips" varchar(1024) COLLATE "pg_catalog"."default",
  "md5" varchar(32) COLLATE "pg_catalog"."default",
  "gmt_create" timestamp(6) NOT NULL,
  "gmt_modified" timestamp(6) NOT NULL,
  "src_user" text COLLATE "pg_catalog"."default",
  "src_ip" varchar(50) COLLATE "pg_catalog"."default",
  "tenant_id" varchar(128) COLLATE "pg_catalog"."default",
  "encrypted_data_key" text COLLATE "pg_catalog"."default" NOT NULL
)
;
COMMENT ON COLUMN "config_info_beta"."id" IS 'id';
COMMENT ON COLUMN "config_info_beta"."data_id" IS 'data_id';
COMMENT ON COLUMN "config_info_beta"."group_id" IS 'group_id';
COMMENT ON COLUMN "config_info_beta"."app_name" IS 'app_name';
COMMENT ON COLUMN "config_info_beta"."content" IS 'content';
COMMENT ON COLUMN "config_info_beta"."beta_ips" IS 'betaIps';
COMMENT ON COLUMN "config_info_beta"."md5" IS 'md5';
COMMENT ON COLUMN "config_info_beta"."gmt_create" IS '创建时间';
COMMENT ON COLUMN "config_info_beta"."gmt_modified" IS '修改时间';
COMMENT ON COLUMN "config_info_beta"."src_user" IS 'source user';
COMMENT ON COLUMN "config_info_beta"."src_ip" IS 'source ip';
COMMENT ON COLUMN "config_info_beta"."tenant_id" IS '租户字段';
COMMENT ON COLUMN "config_info_beta"."encrypted_data_key" IS '秘钥';
COMMENT ON TABLE "config_info_beta" IS 'config_info_beta';

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS "config_info_tag";
CREATE TABLE "config_info_tag" (
  "id" int8 NOT NULL DEFAULT nextval('config_info_tag_id_seq'::regclass),
  "data_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "group_id" varchar(128) COLLATE "pg_catalog"."default" NOT NULL,
  "tenant_id" varchar(128) COLLATE "pg_catalog"."default",
  "tag_id" varchar(128) COLLATE "pg_catalog"."default" NOT NULL,
  "app_name" varchar(128) COLLATE "pg_catalog"."default",
  "content" text COLLATE "pg_catalog"."default" NOT NULL,
  "md5" varchar(32) COLLATE "pg_catalog"."default",
  "gmt_create" timestamp(6) NOT NULL,
  "gmt_modified" timestamp(6) NOT NULL,
  "src_user" text COLLATE "pg_catalog"."default",
  "src_ip" varchar(50) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "config_info_tag"."id" IS 'id';
COMMENT ON COLUMN "config_info_tag"."data_id" IS 'data_id';
COMMENT ON COLUMN "config_info_tag"."group_id" IS 'group_id';
COMMENT ON COLUMN "config_info_tag"."tenant_id" IS 'tenant_id';
COMMENT ON COLUMN "config_info_tag"."tag_id" IS 'tag_id';
COMMENT ON COLUMN "config_info_tag"."app_name" IS 'app_name';
COMMENT ON COLUMN "config_info_tag"."content" IS 'content';
COMMENT ON COLUMN "config_info_tag"."md5" IS 'md5';
COMMENT ON COLUMN "config_info_tag"."gmt_create" IS '创建时间';
COMMENT ON COLUMN "config_info_tag"."gmt_modified" IS '修改时间';
COMMENT ON COLUMN "config_info_tag"."src_user" IS 'source user';
COMMENT ON COLUMN "config_info_tag"."src_ip" IS 'source ip';
COMMENT ON TABLE "config_info_tag" IS 'config_info_tag';

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS "config_tags_relation";
CREATE TABLE "config_tags_relation" (
  "id" int8 NOT NULL DEFAULT nextval('config_tags_relation_id_seq'::regclass),
  "tag_name" varchar(128) COLLATE "pg_catalog"."default" NOT NULL,
  "tag_type" varchar(64) COLLATE "pg_catalog"."default",
  "data_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "group_id" varchar(128) COLLATE "pg_catalog"."default" NOT NULL,
  "tenant_id" varchar(128) COLLATE "pg_catalog"."default",
  "nid" int8 NOT NULL
)
;
COMMENT ON COLUMN "config_tags_relation"."id" IS 'id';
COMMENT ON COLUMN "config_tags_relation"."tag_name" IS 'tag_name';
COMMENT ON COLUMN "config_tags_relation"."tag_type" IS 'tag_type';
COMMENT ON COLUMN "config_tags_relation"."data_id" IS 'data_id';
COMMENT ON COLUMN "config_tags_relation"."group_id" IS 'group_id';
COMMENT ON COLUMN "config_tags_relation"."tenant_id" IS 'tenant_id';
COMMENT ON TABLE "config_tags_relation" IS 'config_tag_relation';

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS "group_capacity";
CREATE TABLE "group_capacity" (
  "id" int8 NOT NULL DEFAULT nextval('group_capacity_id_seq'::regclass),
  "group_id" varchar(128) COLLATE "pg_catalog"."default" NOT NULL,
  "quota" int4 NOT NULL,
  "usage" int4 NOT NULL,
  "max_size" int4 NOT NULL,
  "max_aggr_count" int4 NOT NULL,
  "max_aggr_size" int4 NOT NULL,
  "max_history_count" int4 NOT NULL,
  "gmt_create" timestamp(6) NOT NULL,
  "gmt_modified" timestamp(6) NOT NULL
)
;
COMMENT ON COLUMN "group_capacity"."id" IS '主键ID';
COMMENT ON COLUMN "group_capacity"."group_id" IS 'Group ID，空字符表示整个集群';
COMMENT ON COLUMN "group_capacity"."quota" IS '配额，0表示使用默认值';
COMMENT ON COLUMN "group_capacity"."usage" IS '使用量';
COMMENT ON COLUMN "group_capacity"."max_size" IS '单个配置大小上限，单位为字节，0表示使用默认值';
COMMENT ON COLUMN "group_capacity"."max_aggr_count" IS '聚合子配置最大个数，，0表示使用默认值';
COMMENT ON COLUMN "group_capacity"."max_aggr_size" IS '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值';
COMMENT ON COLUMN "group_capacity"."max_history_count" IS '最大变更历史数量';
COMMENT ON COLUMN "group_capacity"."gmt_create" IS '创建时间';
COMMENT ON COLUMN "group_capacity"."gmt_modified" IS '修改时间';
COMMENT ON TABLE "group_capacity" IS '集群、各Group容量信息表';

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS "his_config_info";
CREATE TABLE "his_config_info" (
  "id" int8 NOT NULL,
  "nid" int8 NOT NULL DEFAULT nextval('his_config_info_nid_seq'::regclass),
  "data_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "group_id" varchar(128) COLLATE "pg_catalog"."default" NOT NULL,
  "app_name" varchar(128) COLLATE "pg_catalog"."default",
  "content" text COLLATE "pg_catalog"."default" NOT NULL,
  "md5" varchar(32) COLLATE "pg_catalog"."default",
  "gmt_create" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "gmt_modified" timestamp(6) NOT NULL,
  "src_user" text COLLATE "pg_catalog"."default",
  "src_ip" varchar(50) COLLATE "pg_catalog"."default",
  "op_type" char(10) COLLATE "pg_catalog"."default",
  "tenant_id" varchar(128) COLLATE "pg_catalog"."default",
  "encrypted_data_key" text COLLATE "pg_catalog"."default" NOT NULL
)
;
COMMENT ON COLUMN "his_config_info"."app_name" IS 'app_name';
COMMENT ON COLUMN "his_config_info"."tenant_id" IS '租户字段';
COMMENT ON COLUMN "his_config_info"."encrypted_data_key" IS '秘钥';
COMMENT ON TABLE "his_config_info" IS '多租户改造';

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS "permissions";
CREATE TABLE "permissions" (
  "role" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "resource" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "action" varchar(8) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS "roles";
CREATE TABLE "roles" (
  "username" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "role" varchar(50) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO "roles" VALUES ('nacos', 'ROLE_ADMIN');

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS "tenant_capacity";
CREATE TABLE "tenant_capacity" (
  "id" int8 NOT NULL DEFAULT nextval('tenant_capacity_id_seq'::regclass),
  "tenant_id" varchar(128) COLLATE "pg_catalog"."default" NOT NULL,
  "quota" int4 NOT NULL,
  "usage" int4 NOT NULL,
  "max_size" int4 NOT NULL,
  "max_aggr_count" int4 NOT NULL,
  "max_aggr_size" int4 NOT NULL,
  "max_history_count" int4 NOT NULL,
  "gmt_create" timestamp(6) NOT NULL,
  "gmt_modified" timestamp(6) NOT NULL
)
;
COMMENT ON COLUMN "tenant_capacity"."id" IS '主键ID';
COMMENT ON COLUMN "tenant_capacity"."tenant_id" IS 'Tenant ID';
COMMENT ON COLUMN "tenant_capacity"."quota" IS '配额，0表示使用默认值';
COMMENT ON COLUMN "tenant_capacity"."usage" IS '使用量';
COMMENT ON COLUMN "tenant_capacity"."max_size" IS '单个配置大小上限，单位为字节，0表示使用默认值';
COMMENT ON COLUMN "tenant_capacity"."max_aggr_count" IS '聚合子配置最大个数';
COMMENT ON COLUMN "tenant_capacity"."max_aggr_size" IS '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值';
COMMENT ON COLUMN "tenant_capacity"."max_history_count" IS '最大变更历史数量';
COMMENT ON COLUMN "tenant_capacity"."gmt_create" IS '创建时间';
COMMENT ON COLUMN "tenant_capacity"."gmt_modified" IS '修改时间';
COMMENT ON TABLE "tenant_capacity" IS '租户容量信息表';

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS "tenant_info";
CREATE TABLE "tenant_info" (
  "id" int8 NOT NULL DEFAULT nextval('tenant_info_id_seq'::regclass),
  "kp" varchar(128) COLLATE "pg_catalog"."default" NOT NULL,
  "tenant_id" varchar(128) COLLATE "pg_catalog"."default",
  "tenant_name" varchar(128) COLLATE "pg_catalog"."default",
  "tenant_desc" varchar(256) COLLATE "pg_catalog"."default",
  "create_source" varchar(32) COLLATE "pg_catalog"."default",
  "gmt_create" int8 NOT NULL,
  "gmt_modified" int8 NOT NULL
)
;
COMMENT ON COLUMN "tenant_info"."id" IS 'id';
COMMENT ON COLUMN "tenant_info"."kp" IS 'kp';
COMMENT ON COLUMN "tenant_info"."tenant_id" IS 'tenant_id';
COMMENT ON COLUMN "tenant_info"."tenant_name" IS 'tenant_name';
COMMENT ON COLUMN "tenant_info"."tenant_desc" IS 'tenant_desc';
COMMENT ON COLUMN "tenant_info"."create_source" IS 'create_source';
COMMENT ON COLUMN "tenant_info"."gmt_create" IS '创建时间';
COMMENT ON COLUMN "tenant_info"."gmt_modified" IS '修改时间';
COMMENT ON TABLE "tenant_info" IS 'tenant_info';

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS "users";
CREATE TABLE "users" (
  "username" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "password" varchar(500) COLLATE "pg_catalog"."default" NOT NULL,
  "enabled" int2 NOT NULL
)
;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO "users" VALUES ('nacos', '$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu', 1);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"config_info_aggr_id_seq"', 2, false);
SELECT setval('"config_info_beta_id_seq"', 2, false);
SELECT setval('"config_info_id_seq"', 2, false);
SELECT setval('"config_info_tag_id_seq"', 2, false);
SELECT setval('"config_tags_relation_id_seq"', 2, false);
SELECT setval('"group_capacity_id_seq"', 2, false);
SELECT setval('"his_config_info_nid_seq"', 2, false);
SELECT setval('"tenant_capacity_id_seq"', 2, false);
SELECT setval('"tenant_info_id_seq"', 34, true);

-- ----------------------------
-- Indexes structure for table config_info
-- ----------------------------
CREATE UNIQUE INDEX "idx" ON "config_info" USING btree (
  "data_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "group_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "tenant_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table config_info
-- ----------------------------
ALTER TABLE "config_info" ADD CONSTRAINT "config_info_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table config_info_aggr
-- ----------------------------
CREATE INDEX "uk_configinfoaggr_datagrouptenantdatum" ON "config_info_aggr" USING btree (
  "data_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "group_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "tenant_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "datum_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table config_info_aggr
-- ----------------------------
ALTER TABLE "config_info_aggr" ADD CONSTRAINT "config_info_aggr_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table config_info_beta
-- ----------------------------
CREATE INDEX "uk_configinfobeta_datagrouptenant" ON "config_info_beta" USING btree (
  "data_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "group_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "tenant_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table config_info_beta
-- ----------------------------
ALTER TABLE "config_info_beta" ADD CONSTRAINT "config_info_beta_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table config_info_tag
-- ----------------------------
CREATE INDEX "uk_configinfotag_datagrouptenanttag" ON "config_info_tag" USING btree (
  "data_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "group_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "tenant_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "tag_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table config_info_tag
-- ----------------------------
ALTER TABLE "config_info_tag" ADD CONSTRAINT "config_info_tag_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table config_tags_relation
-- ----------------------------
CREATE INDEX "idx_tenant_id" ON "config_tags_relation" USING btree (
  "tenant_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "uk_configtagrelation_configidtag" ON "config_tags_relation" USING btree (
  "id" "pg_catalog"."int8_ops" ASC NULLS LAST,
  "tag_name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "tag_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table config_tags_relation
-- ----------------------------
ALTER TABLE "config_tags_relation" ADD CONSTRAINT "config_tags_relation_pkey" PRIMARY KEY ("nid");

-- ----------------------------
-- Indexes structure for table group_capacity
-- ----------------------------
CREATE INDEX "uk_group_id" ON "group_capacity" USING btree (
  "group_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table group_capacity
-- ----------------------------
ALTER TABLE "group_capacity" ADD CONSTRAINT "group_capacity_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table his_config_info
-- ----------------------------
CREATE INDEX "idx_did" ON "his_config_info" USING btree (
  "data_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_gmt_create" ON "his_config_info" USING btree (
  "gmt_create" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_gmt_modified" ON "his_config_info" USING btree (
  "gmt_modified" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table his_config_info
-- ----------------------------
ALTER TABLE "his_config_info" ADD CONSTRAINT "his_config_info_pkey" PRIMARY KEY ("nid");

-- ----------------------------
-- Indexes structure for table permissions
-- ----------------------------
CREATE INDEX "uk_role_permission" ON "permissions" USING btree (
  "role" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "resource" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "action" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Indexes structure for table roles
-- ----------------------------
CREATE INDEX "idx_user_role" ON "roles" USING btree (
  "username" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "role" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Indexes structure for table tenant_capacity
-- ----------------------------
CREATE INDEX "uk_tenant_id" ON "tenant_capacity" USING btree (
  "tenant_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table tenant_capacity
-- ----------------------------
ALTER TABLE "tenant_capacity" ADD CONSTRAINT "tenant_capacity_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table tenant_info
-- ----------------------------
CREATE INDEX "idx_ti_tenant_id" ON "tenant_info" USING btree (
  "tenant_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "uk_tenant_info_kptenantid" ON "tenant_info" USING btree (
  "kp" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "tenant_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table tenant_info
-- ----------------------------
ALTER TABLE "tenant_info" ADD CONSTRAINT "tenant_info_pkey" PRIMARY KEY ("id");