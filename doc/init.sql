CREATE TABLE sys_user (
	id INT auto_increment PRIMARY KEY,
	account VARCHAR ( 32 ) NOT NULL COMMENT '账号',
	user_name VARCHAR ( 32 ) NOT NULL COMMENT '用户名',
	password VARCHAR ( 64 ) NULL COMMENT '用户密码',
	last_login_time datetime NULL COMMENT '上一次登录时间',
	enabled TINYINT ( 1 ) DEFAULT 1 NULL COMMENT '账号是否可用。默认为1（可用）',
	account_is_expired TINYINT ( 1 ) DEFAULT 1 NULL COMMENT '是否过期。默认为1（没有过期）',
	account_is_locked TINYINT ( 1 ) DEFAULT 1 NULL COMMENT '账号是否锁定。默认为1（没有锁定）',
	credentials_is_expired TINYINT ( 1 ) DEFAULT 1 NULL COMMENT '证书（密码）是否过期。默认为1（没有过期）',
	create_time datetime NULL COMMENT '创建时间',
	update_time datetime NULL COMMENT '修改时间',
	create_user INT NULL COMMENT '创建人',
    update_user INT NULL COMMENT '修改人'
) COMMENT '用户表';

-- 用户
INSERT INTO sys_user (id, account, user_name, password, last_login_time, enabled, account_is_expired, account_is_locked, credentials_is_expired, create_time, update_time, create_user, update_user)
VALUES (1, 'user1', '用户1', '$2a$10$47lsFAUlWixWG17Ca3M/r.EPJVIb7Tv26ZaxhzqN65nXVcAhHQM4i', '2019-09-04 20:25:36', 1, 1, 1, 1, '2019-08-29 06:28:36', '2019-09-04 20:25:36', 1, 1);
INSERT INTO sys_user (id, account, user_name, password, last_login_time, enabled, account_is_expired, account_is_locked, credentials_is_expired, create_time, update_time, create_user, update_user)
VALUES (2, 'user2', '用户2', '$2a$10$uSLAeON6HWrPbPCtyqPRj.hvZfeM.tiVDZm24/gRqm4opVze1cVvC', '2019-09-05 00:07:12', 1, 1, 1, 1, '2019-08-29 06:29:24', '2019-09-05 00:07:12', 1, 2);
-- 角色
INSERT INTO sys_role (id, role_code, role_name, role_description) VALUES (1, 'admin', '管理员', '管理员，拥有所有权限');
INSERT INTO sys_role (id, role_code, role_name, role_description) VALUES (2, 'user', '普通用户', '普通用户，拥有部分权限');
-- 权限
INSERT INTO sys_permission (id, permission_code, permission_name) VALUES (1, 'create_user', '创建用户');
INSERT INTO sys_permission (id, permission_code, permission_name) VALUES (2, 'query_user', '查看用户');
INSERT INTO sys_permission (id, permission_code, permission_name) VALUES (3, 'delete_user', '删除用户');
INSERT INTO sys_permission (id, permission_code, permission_name) VALUES (4, 'modify_user', '修改用户');
-- 请求路径
INSERT INTO sys_request_path (id, url, description) VALUES (1, '/getUser', '查询用户');
-- 用户角色关联关系
INSERT INTO sys_user_role_relation (id, user_id, role_id) VALUES (1, 1, 1);
INSERT INTO sys_user_role_relation (id, user_id, role_id) VALUES (2, 2, 2);
-- 角色权限关联关系
INSERT INTO sys_role_permission_relation (id, role_id, permission_id) VALUES (1, 1, 1);
INSERT INTO sys_role_permission_relation (id, role_id, permission_id) VALUES (2, 1, 2);
INSERT INTO sys_role_permission_relation (id, role_id, permission_id) VALUES (3, 1, 3);
INSERT INTO sys_role_permission_relation (id, role_id, permission_id) VALUES (4, 1, 4);
INSERT INTO sys_role_permission_relation (id, role_id, permission_id) VALUES (5, 2, 1);
INSERT INTO sys_role_permission_relation (id, role_id, permission_id) VALUES (6, 2, 2);
-- 请求路径权限关联关系
INSERT INTO sys_request_path_permission_relation (id, url_id, permission_id) VALUES (null, 1, 2);
