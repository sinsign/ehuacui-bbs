/**
*--- start---增加主键----v_1.0.1
*/

ALTER TABLE `tb_role_permission` ADD COLUMN `id` INT NOT NULL AUTO_INCREMENT FIRST,
 ADD PRIMARY KEY (`id`);

ALTER TABLE `tb_user_role` ADD COLUMN `id` INT NOT NULL AUTO_INCREMENT FIRST,
 ADD PRIMARY KEY (`id`);

/**
*--- end---增加主键----v_1.0.1
*/


/**
*--- start---修改字段名称----v_1.0.2
*/

ALTER TABLE `tb_notification`
CHANGE COLUMN `read` `is_read` TINYINT (1) NOT NULL COMMENT '是否已读：0默认 1已读' AFTER `id`;

ALTER TABLE `tb_topic`
CHANGE COLUMN `view` `view_count` INT (11) NOT NULL COMMENT '1置顶 0默认' AFTER `last_reply_author`,
CHANGE COLUMN `top` `is_top` TINYINT (1) NOT NULL COMMENT '1置顶 0默认' AFTER `author`,
CHANGE COLUMN `good` `is_good` TINYINT (1) NOT NULL COMMENT '1精华 0默认' AFTER `is_top`;

/**
*--- end---修改字段名称----v_1.0.2
*/

/**
*--- start---重建权限信息----v_1.0.3
*/
-- ----------------------------
-- Table structure for tb_permission
-- ----------------------------
DROP TABLE IF EXISTS `tb_permission`;
CREATE TABLE `tb_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL DEFAULT '' COMMENT '权限名称',
  `url` varchar(255) DEFAULT NULL COMMENT '授权路径',
  `description` varchar(255) NOT NULL COMMENT '权限描述',
  `pid` int(11) NOT NULL COMMENT '父节点0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tb_permission
-- ----------------------------
INSERT INTO `tb_permission` VALUES ('55', 'section', '', '板块节点', '0');
INSERT INTO `tb_permission` VALUES ('56', 'system', '', '系统设置', '0');
INSERT INTO `tb_permission` VALUES ('57', 'topic', '', '话题节点', '0');
INSERT INTO `tb_permission` VALUES ('58', 'reply', '', '回复节点', '0');
INSERT INTO `tb_permission` VALUES ('59', 'system:users', '/manage/users', '用户列表', '56');
INSERT INTO `tb_permission` VALUES ('60', 'system:roles', '/manage/roles', '角色列表', '56');
INSERT INTO `tb_permission` VALUES ('61', 'system:permissions', '/manage/permissions', '权限列表', '56');
INSERT INTO `tb_permission` VALUES ('62', 'system:user:role', '/manage/user-role', '用户角色关联', '56');
INSERT INTO `tb_permission` VALUES ('63', 'system:role:permission', '/manage/role-permission', '角色权限关联', '56');
INSERT INTO `tb_permission` VALUES ('64', 'system:add:permission', '/manage/add-permission', '添加权限', '56');
INSERT INTO `tb_permission` VALUES ('65', 'system:edit:permission', '/manage/edit-permission', '编辑权限', '56');
INSERT INTO `tb_permission` VALUES ('66', 'system:add:role', '/manage/add-role', '添加角色', '56');
INSERT INTO `tb_permission` VALUES ('68', 'system:delete:user', '/manage/delete-user', '删除用户', '56');
INSERT INTO `tb_permission` VALUES ('69', 'system:delete:role', '/manage/delete-role', '删除角色', '56');
INSERT INTO `tb_permission` VALUES ('70', 'system:delete:permission', '/manage/delete-permission', '删除权限', '56');
INSERT INTO `tb_permission` VALUES ('71', 'topic:delete', '/topic/delete', '删除话题', '57');
INSERT INTO `tb_permission` VALUES ('73', 'reply:delete', '/reply/delete', '删除回复', '58');
INSERT INTO `tb_permission` VALUES ('74', 'reply:edit', '/reply/edit', '编辑回复', '58');
INSERT INTO `tb_permission` VALUES ('75', 'topic:edit', '/topic/edit', '话题编辑', '57');
INSERT INTO `tb_permission` VALUES ('76', 'topic:append:edit', '/topic/append-edit', '追加编辑', '57');
INSERT INTO `tb_permission` VALUES ('77', 'topic:top', '/topic/top', '话题置顶', '57');
INSERT INTO `tb_permission` VALUES ('78', 'topic:good', '/topic/good', '话题加精', '57');
INSERT INTO `tb_permission` VALUES ('79', 'system:clear:cache', '/clear', '删除所有缓存', '56');
INSERT INTO `tb_permission` VALUES ('80', 'system:user:block', '/manage/user-block', '禁用用户', '56');
INSERT INTO `tb_permission` VALUES ('81', 'section:list', '/section/list', '板块列表', '55');
INSERT INTO `tb_permission` VALUES ('82', 'section:change:show:status', '/section/change-show-status', '改变板块显示状态', '55');
INSERT INTO `tb_permission` VALUES ('83', 'section:delete', '/section/delete', '删除板块', '55');
INSERT INTO `tb_permission` VALUES ('84', 'section:add', '/section/add', '添加板块', '55');
INSERT INTO `tb_permission` VALUES ('85', 'section:edit', '/section/edit', '编辑板块', '55');
INSERT INTO `tb_permission` VALUES ('86', 'reply:list', '/reply/list', '回复列表', '58');
INSERT INTO `tb_permission` VALUES ('87', 'system:solr', '/solr', '索引所有话题(慎用)', '56');
INSERT INTO `tb_permission` VALUES ('88', 'system:delete:all:index', '/delete-all-index', '删除所有索引', '56');

-- ----------------------------
-- Table structure for tb_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `tb_role_permission`;
CREATE TABLE `tb_role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_role_permission` (`rid`),
  KEY `fk_permission_role` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tb_role_permission
-- ----------------------------
INSERT INTO `tb_role_permission` VALUES ('1', '2', '71');
INSERT INTO `tb_role_permission` VALUES ('2', '2', '75');
INSERT INTO `tb_role_permission` VALUES ('3', '2', '76');
INSERT INTO `tb_role_permission` VALUES ('4', '2', '77');
INSERT INTO `tb_role_permission` VALUES ('5', '2', '78');
INSERT INTO `tb_role_permission` VALUES ('6', '2', '73');
INSERT INTO `tb_role_permission` VALUES ('7', '2', '74');
INSERT INTO `tb_role_permission` VALUES ('8', '1', '59');
INSERT INTO `tb_role_permission` VALUES ('9', '1', '60');
INSERT INTO `tb_role_permission` VALUES ('10', '1', '61');
INSERT INTO `tb_role_permission` VALUES ('11', '1', '62');
INSERT INTO `tb_role_permission` VALUES ('12', '1', '63');
INSERT INTO `tb_role_permission` VALUES ('13', '1', '64');
INSERT INTO `tb_role_permission` VALUES ('14', '1', '65');
INSERT INTO `tb_role_permission` VALUES ('15', '1', '66');
INSERT INTO `tb_role_permission` VALUES ('17', '1', '68');
INSERT INTO `tb_role_permission` VALUES ('18', '1', '69');
INSERT INTO `tb_role_permission` VALUES ('19', '1', '70');
INSERT INTO `tb_role_permission` VALUES ('20', '1', '79');
INSERT INTO `tb_role_permission` VALUES ('21', '1', '87');
INSERT INTO `tb_role_permission` VALUES ('22', '1', '88');
INSERT INTO `tb_role_permission` VALUES ('23', '1', '89');
INSERT INTO `tb_role_permission` VALUES ('24', '1', '71');
INSERT INTO `tb_role_permission` VALUES ('25', '1', '75');
INSERT INTO `tb_role_permission` VALUES ('26', '1', '76');
INSERT INTO `tb_role_permission` VALUES ('27', '1', '77');
INSERT INTO `tb_role_permission` VALUES ('28', '1', '78');
INSERT INTO `tb_role_permission` VALUES ('29', '1', '73');
INSERT INTO `tb_role_permission` VALUES ('30', '1', '74');
INSERT INTO `tb_role_permission` VALUES ('31', '1', '86');
INSERT INTO `tb_role_permission` VALUES ('32', '1', '81');
INSERT INTO `tb_role_permission` VALUES ('33', '1', '82');
INSERT INTO `tb_role_permission` VALUES ('34', '1', '83');
INSERT INTO `tb_role_permission` VALUES ('35', '1', '84');
INSERT INTO `tb_role_permission` VALUES ('36', '1', '85');

/**
*--- end---重建权限信息----v_1.0.3
*/

