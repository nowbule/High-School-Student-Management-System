/*
 Navicat Premium Dump SQL

 Source Server         : 新-阿里云
 Source Server Type    : MySQL
 Source Server Version : 80027 (8.0.27)
 Source Host           : 39.97.166.202:3306
 Source Schema         : hs_education

 Target Server Type    : MySQL
 Target Server Version : 80027 (8.0.27)
 File Encoding         : 65001

 Date: 27/01/2026 01:27:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'hs_course', '课程科目表', NULL, NULL, 'HsCourse', 'crud', 'element-ui', 'com.ruoyi.school', 'school', 'course', '课程科目', 'ruoyi', '0', '/', '{}', 'admin', '2025-12-23 02:00:29', '', '2025-12-23 02:17:18', NULL);
INSERT INTO `gen_table` VALUES (2, 'hs_schedule', '班级课程表', NULL, NULL, 'HsSchedule', 'crud', 'element-ui', 'com.ruoyi.school', 'school', 'schedule', '班级课程', 'ruoyi', '0', '/', '{}', 'admin', '2025-12-23 02:00:29', '', '2025-12-23 02:18:29', NULL);
INSERT INTO `gen_table` VALUES (5, 'homework_submission', '作业提交与成绩表', NULL, NULL, 'HomeworkSubmission', 'crud', 'element-ui', 'com.ruoyi.school', 'school', 'submission', '作业提交与成绩', 'ruoyi', '0', '/', '{}', 'admin', '2025-12-27 01:01:29', '', '2025-12-27 01:10:57', NULL);
INSERT INTO `gen_table` VALUES (6, 'homework_task', '作业发布任务表', NULL, NULL, 'HomeworkTask', 'crud', 'element-ui', 'com.ruoyi.school', 'school', 'task', '作业发布任务', 'ruoyi', '0', '/', '{}', 'admin', '2025-12-27 01:01:30', '', '2025-12-27 01:05:40', NULL);
INSERT INTO `gen_table` VALUES (7, 'sys_class', '班级信息表', NULL, NULL, 'SysClass', 'crud', 'element-ui', 'com.ruoyi.school', 'school', 'banji', '班级信息', 'ruoyi', '0', '/', '{}', 'admin', '2025-12-27 01:01:30', '', '2025-12-27 01:07:02', NULL);
INSERT INTO `gen_table` VALUES (8, 'sys_course', '课程信息表', NULL, NULL, 'SysCourse', 'crud', 'element-ui', 'com.ruoyi.school', 'school', 'course', '课程信息', 'ruoyi', '0', '/', '{}', 'admin', '2025-12-27 01:01:30', '', '2025-12-27 01:09:57', NULL);
INSERT INTO `gen_table` VALUES (9, 'hs_attendance', '学生考勤表', NULL, NULL, 'HsAttendance', 'crud', 'element-ui', 'com.ruoyi.school', 'school', 'attendance', '学生考勤', 'ruoyi', '0', '/', '{\"parentMenuId\":1061}', 'admin', '2025-12-27 23:46:21', '', '2025-12-27 23:47:16', NULL);
INSERT INTO `gen_table` VALUES (10, 'school_class_video', '班级视频表', NULL, NULL, 'SchoolClassVideo', 'crud', 'element-ui', 'com.ruoyi.school', 'school', 'video', '班级视频', 'ruoyi', '0', '/', '{\"parentMenuId\":1061}', 'admin', '2026-01-14 02:57:23', '', '2026-01-14 03:02:58', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 128 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, 1, 'course_id', '课程ID', 'bigint(20)', 'Long', 'courseId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-12-23 02:00:29', '', '2025-12-23 02:17:18');
INSERT INTO `gen_table_column` VALUES (2, 1, 'course_name', '课程名称', 'varchar(64)', 'String', 'courseName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2025-12-23 02:00:29', '', '2025-12-23 02:17:18');
INSERT INTO `gen_table_column` VALUES (3, 1, 'status', '状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 3, 'admin', '2025-12-23 02:00:29', '', '2025-12-23 02:17:18');
INSERT INTO `gen_table_column` VALUES (4, 1, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 4, 'admin', '2025-12-23 02:00:29', '', '2025-12-23 02:17:18');
INSERT INTO `gen_table_column` VALUES (5, 1, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 5, 'admin', '2025-12-23 02:00:29', '', '2025-12-23 02:17:18');
INSERT INTO `gen_table_column` VALUES (6, 1, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2025-12-23 02:00:29', '', '2025-12-23 02:17:18');
INSERT INTO `gen_table_column` VALUES (7, 1, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2025-12-23 02:00:29', '', '2025-12-23 02:17:18');
INSERT INTO `gen_table_column` VALUES (8, 1, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 8, 'admin', '2025-12-23 02:00:29', '', '2025-12-23 02:17:18');
INSERT INTO `gen_table_column` VALUES (9, 2, 'schedule_id', '课表ID', 'bigint(20)', 'Long', 'scheduleId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-12-23 02:00:29', '', '2025-12-23 02:18:29');
INSERT INTO `gen_table_column` VALUES (10, 2, 'class_id', '班级ID', 'bigint(20)', 'Long', 'classId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-12-23 02:00:29', '', '2025-12-23 02:18:29');
INSERT INTO `gen_table_column` VALUES (11, 2, 'class_name', '班级名称', 'varchar(50)', 'String', 'className', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2025-12-23 02:00:29', '', '2025-12-23 02:18:29');
INSERT INTO `gen_table_column` VALUES (12, 2, 'course_id', '科目ID', 'bigint(20)', 'Long', 'courseId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-12-23 02:00:29', '', '2025-12-23 02:18:29');
INSERT INTO `gen_table_column` VALUES (13, 2, 'course_name', '科目名称', 'varchar(64)', 'String', 'courseName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2025-12-23 02:00:29', '', '2025-12-23 02:18:29');
INSERT INTO `gen_table_column` VALUES (14, 2, 'teacher_id', '授课老师ID', 'bigint(20)', 'Long', 'teacherId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2025-12-23 02:00:29', '', '2025-12-23 02:18:29');
INSERT INTO `gen_table_column` VALUES (15, 2, 'teacher_name', '授课老师姓名', 'varchar(64)', 'String', 'teacherName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 7, 'admin', '2025-12-23 02:00:29', '', '2025-12-23 02:18:29');
INSERT INTO `gen_table_column` VALUES (16, 2, 'week_day', '星期(1-7)', 'int(1)', 'Integer', 'weekDay', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2025-12-23 02:00:29', '', '2025-12-23 02:18:29');
INSERT INTO `gen_table_column` VALUES (17, 2, 'section', '节次(1-8)', 'int(2)', 'Integer', 'section', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2025-12-23 02:00:30', '', '2025-12-23 02:18:29');
INSERT INTO `gen_table_column` VALUES (18, 2, 'time_period', '时段(0上午 1下午 2晚自习)', 'char(1)', 'String', 'timePeriod', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2025-12-23 02:00:30', '', '2025-12-23 02:18:29');
INSERT INTO `gen_table_column` VALUES (19, 2, 'classroom', '上课地点', 'varchar(100)', 'String', 'classroom', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2025-12-23 02:00:30', '', '2025-12-23 02:18:29');
INSERT INTO `gen_table_column` VALUES (20, 2, 'school_year', '学年学期(如2024-1)', 'varchar(20)', 'String', 'schoolYear', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2025-12-23 02:00:30', '', '2025-12-23 02:18:29');
INSERT INTO `gen_table_column` VALUES (21, 2, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2025-12-23 02:00:30', '', '2025-12-23 02:18:29');
INSERT INTO `gen_table_column` VALUES (22, 2, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2025-12-23 02:00:30', '', '2025-12-23 02:18:29');
INSERT INTO `gen_table_column` VALUES (23, 2, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2025-12-23 02:00:30', '', '2025-12-23 02:18:29');
INSERT INTO `gen_table_column` VALUES (24, 2, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 16, 'admin', '2025-12-23 02:00:30', '', '2025-12-23 02:18:29');
INSERT INTO `gen_table_column` VALUES (25, 2, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 17, 'admin', '2025-12-23 02:00:30', '', '2025-12-23 02:18:29');
INSERT INTO `gen_table_column` VALUES (60, 5, 'submission_id', '记录ID', 'bigint(20)', 'Long', 'submissionId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-12-27 01:01:29', '', '2025-12-27 01:10:57');
INSERT INTO `gen_table_column` VALUES (61, 5, 'task_id', '关联作业任务ID', 'bigint(20)', 'Long', 'taskId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-12-27 01:01:29', '', '2025-12-27 01:10:57');
INSERT INTO `gen_table_column` VALUES (62, 5, 'student_id', '学生ID(关联sys_user)', 'bigint(20)', 'Long', 'studentId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-12-27 01:01:29', '', '2025-12-27 01:10:57');
INSERT INTO `gen_table_column` VALUES (63, 5, 'student_name', '学生姓名(冗余字段方便统计展示)', 'varchar(64)', 'String', 'studentName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2025-12-27 01:01:29', '', '2025-12-27 01:10:57');
INSERT INTO `gen_table_column` VALUES (64, 5, 'submit_content', '提交内容', 'longtext', 'String', 'submitContent', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'editor', '', 5, 'admin', '2025-12-27 01:01:29', '', '2025-12-27 01:10:57');
INSERT INTO `gen_table_column` VALUES (65, 5, 'submit_files', '提交附件地址', 'varchar(1000)', 'String', 'submitFiles', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 6, 'admin', '2025-12-27 01:01:29', '', '2025-12-27 01:10:57');
INSERT INTO `gen_table_column` VALUES (66, 5, 'submit_time', '提交时间', 'datetime', 'Date', 'submitTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 7, 'admin', '2025-12-27 01:01:29', '', '2025-12-27 01:10:57');
INSERT INTO `gen_table_column` VALUES (67, 5, 'status', '状态（0未提交 1已提交 2已批改）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 8, 'admin', '2025-12-27 01:01:29', '', '2025-12-27 01:10:57');
INSERT INTO `gen_table_column` VALUES (68, 5, 'score', '作业得分', 'decimal(5,2)', 'BigDecimal', 'score', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2025-12-27 01:01:29', '', '2025-12-27 01:10:57');
INSERT INTO `gen_table_column` VALUES (69, 5, 'teacher_comment', '教师评语', 'varchar(1000)', 'String', 'teacherComment', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 10, 'admin', '2025-12-27 01:01:29', '', '2025-12-27 01:10:57');
INSERT INTO `gen_table_column` VALUES (70, 5, 'grade_time', '批改时间', 'datetime', 'Date', 'gradeTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 11, 'admin', '2025-12-27 01:01:29', '', '2025-12-27 01:10:57');
INSERT INTO `gen_table_column` VALUES (71, 5, 'grader_id', '批改人ID', 'bigint(20)', 'Long', 'graderId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2025-12-27 01:01:29', '', '2025-12-27 01:10:57');
INSERT INTO `gen_table_column` VALUES (72, 5, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2025-12-27 01:01:29', '', '2025-12-27 01:10:57');
INSERT INTO `gen_table_column` VALUES (73, 5, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2025-12-27 01:01:29', '', '2025-12-27 01:10:57');
INSERT INTO `gen_table_column` VALUES (74, 5, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2025-12-27 01:01:29', '', '2025-12-27 01:10:57');
INSERT INTO `gen_table_column` VALUES (75, 5, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 16, 'admin', '2025-12-27 01:01:29', '', '2025-12-27 01:10:57');
INSERT INTO `gen_table_column` VALUES (76, 5, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 17, 'admin', '2025-12-27 01:01:29', '', '2025-12-27 01:10:57');
INSERT INTO `gen_table_column` VALUES (77, 6, 'task_id', '作业任务ID', 'bigint(20)', 'Long', 'taskId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-12-27 01:01:30', '', '2025-12-27 01:05:40');
INSERT INTO `gen_table_column` VALUES (78, 6, 'task_title', '作业标题', 'varchar(255)', 'String', 'taskTitle', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-12-27 01:01:30', '', '2025-12-27 01:05:40');
INSERT INTO `gen_table_column` VALUES (79, 6, 'task_content', '作业内容/要求', 'longtext', 'String', 'taskContent', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'editor', '', 3, 'admin', '2025-12-27 01:01:30', '', '2025-12-27 01:05:40');
INSERT INTO `gen_table_column` VALUES (80, 6, 'file_urls', '附件地址(支持多个)', 'varchar(1000)', 'String', 'fileUrls', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 4, 'admin', '2025-12-27 01:01:30', '', '2025-12-27 01:05:40');
INSERT INTO `gen_table_column` VALUES (81, 6, 'course_id', '所属课程ID', 'bigint(20)', 'Long', 'courseId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-12-27 01:01:30', '', '2025-12-27 01:05:40');
INSERT INTO `gen_table_column` VALUES (82, 6, 'class_id', '目标班级ID', 'bigint(20)', 'Long', 'classId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2025-12-27 01:01:30', '', '2025-12-27 01:05:40');
INSERT INTO `gen_table_column` VALUES (83, 6, 'teacher_id', '发布教师ID(关联sys_user)', 'bigint(20)', 'Long', 'teacherId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2025-12-27 01:01:30', '', '2025-12-27 01:05:40');
INSERT INTO `gen_table_column` VALUES (84, 6, 'deadline_time', '截止时间', 'datetime', 'Date', 'deadlineTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 8, 'admin', '2025-12-27 01:01:30', '', '2025-12-27 01:05:40');
INSERT INTO `gen_table_column` VALUES (85, 6, 'status', '状态（0草稿 1已发布 2已结束）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 9, 'admin', '2025-12-27 01:01:30', '', '2025-12-27 01:05:40');
INSERT INTO `gen_table_column` VALUES (86, 6, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2025-12-27 01:01:30', '', '2025-12-27 01:05:40');
INSERT INTO `gen_table_column` VALUES (87, 6, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2025-12-27 01:01:30', '', '2025-12-27 01:05:40');
INSERT INTO `gen_table_column` VALUES (88, 6, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2025-12-27 01:01:30', '', '2025-12-27 01:05:40');
INSERT INTO `gen_table_column` VALUES (89, 6, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 13, 'admin', '2025-12-27 01:01:30', '', '2025-12-27 01:05:40');
INSERT INTO `gen_table_column` VALUES (90, 6, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 14, 'admin', '2025-12-27 01:01:30', '', '2025-12-27 01:05:40');
INSERT INTO `gen_table_column` VALUES (91, 7, 'class_id', '班级ID', 'bigint(20)', 'Long', 'classId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-12-27 01:01:30', '', '2025-12-27 01:07:02');
INSERT INTO `gen_table_column` VALUES (92, 7, 'class_name', '班级名称', 'varchar(64)', 'String', 'className', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2025-12-27 01:01:30', '', '2025-12-27 01:07:02');
INSERT INTO `gen_table_column` VALUES (93, 7, 'grade_level', '年级', 'varchar(64)', 'String', 'gradeLevel', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-12-27 01:01:30', '', '2025-12-27 01:07:02');
INSERT INTO `gen_table_column` VALUES (94, 7, 'status', '状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 4, 'admin', '2025-12-27 01:01:30', '', '2025-12-27 01:07:02');
INSERT INTO `gen_table_column` VALUES (95, 7, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 5, 'admin', '2025-12-27 01:01:30', '', '2025-12-27 01:07:02');
INSERT INTO `gen_table_column` VALUES (96, 7, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2025-12-27 01:01:30', '', '2025-12-27 01:07:02');
INSERT INTO `gen_table_column` VALUES (97, 7, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2025-12-27 01:01:30', '', '2025-12-27 01:07:02');
INSERT INTO `gen_table_column` VALUES (98, 7, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2025-12-27 01:01:30', '', '2025-12-27 01:07:02');
INSERT INTO `gen_table_column` VALUES (99, 7, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 9, 'admin', '2025-12-27 01:01:30', '', '2025-12-27 01:07:02');
INSERT INTO `gen_table_column` VALUES (100, 8, 'course_id', '课程ID', 'bigint(20)', 'Long', 'courseId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-12-27 01:01:30', '', '2025-12-27 01:09:57');
INSERT INTO `gen_table_column` VALUES (101, 8, 'course_name', '课程名称', 'varchar(64)', 'String', 'courseName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2025-12-27 01:01:30', '', '2025-12-27 01:09:57');
INSERT INTO `gen_table_column` VALUES (102, 8, 'course_code', '课程编码', 'varchar(64)', 'String', 'courseCode', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-12-27 01:01:30', '', '2025-12-27 01:09:57');
INSERT INTO `gen_table_column` VALUES (103, 8, 'status', '状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 4, 'admin', '2025-12-27 01:01:30', '', '2025-12-27 01:09:57');
INSERT INTO `gen_table_column` VALUES (104, 8, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 5, 'admin', '2025-12-27 01:01:30', '', '2025-12-27 01:09:57');
INSERT INTO `gen_table_column` VALUES (105, 8, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2025-12-27 01:01:30', '', '2025-12-27 01:09:57');
INSERT INTO `gen_table_column` VALUES (106, 8, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2025-12-27 01:01:30', '', '2025-12-27 01:09:57');
INSERT INTO `gen_table_column` VALUES (107, 8, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2025-12-27 01:01:30', '', '2025-12-27 01:09:57');
INSERT INTO `gen_table_column` VALUES (108, 8, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 9, 'admin', '2025-12-27 01:01:30', '', '2025-12-27 01:09:57');
INSERT INTO `gen_table_column` VALUES (109, 9, 'attendance_id', '考勤ID', 'bigint(20)', 'Long', 'attendanceId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-12-27 23:46:21', '', '2025-12-27 23:47:16');
INSERT INTO `gen_table_column` VALUES (110, 9, 'student_id', '学生ID(关联sys_user)', 'bigint(20)', 'Long', 'studentId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-12-27 23:46:21', '', '2025-12-27 23:47:16');
INSERT INTO `gen_table_column` VALUES (111, 9, 'student_name', '学生姓名(冗余方便查询)', 'varchar(50)', 'String', 'studentName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2025-12-27 23:46:21', '', '2025-12-27 23:47:16');
INSERT INTO `gen_table_column` VALUES (112, 9, 'attendance_date', '考勤日期', 'date', 'Date', 'attendanceDate', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2025-12-27 23:46:21', '', '2025-12-27 23:47:16');
INSERT INTO `gen_table_column` VALUES (113, 9, 'status', '状态(1正常 2迟到 3早退 4缺勤 5请假)', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 5, 'admin', '2025-12-27 23:46:21', '', '2025-12-27 23:47:16');
INSERT INTO `gen_table_column` VALUES (114, 9, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 6, 'admin', '2025-12-27 23:46:21', '', '2025-12-27 23:47:16');
INSERT INTO `gen_table_column` VALUES (115, 9, 'del_flag', '删除标志', 'char(1)', 'String', 'delFlag', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2025-12-27 23:46:21', '', '2025-12-27 23:47:16');
INSERT INTO `gen_table_column` VALUES (116, 9, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2025-12-27 23:46:21', '', '2025-12-27 23:47:16');
INSERT INTO `gen_table_column` VALUES (117, 9, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2025-12-27 23:46:21', '', '2025-12-27 23:47:16');
INSERT INTO `gen_table_column` VALUES (118, 9, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2025-12-27 23:46:21', '', '2025-12-27 23:47:16');
INSERT INTO `gen_table_column` VALUES (119, 9, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2025-12-27 23:46:21', '', '2025-12-27 23:47:16');
INSERT INTO `gen_table_column` VALUES (120, 10, 'id', '视频ID', 'bigint(20)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2026-01-14 02:57:23', '', '2026-01-14 03:02:58');
INSERT INTO `gen_table_column` VALUES (121, 10, 'title', '视频标题', 'varchar(200)', 'String', 'title', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2026-01-14 02:57:23', '', '2026-01-14 03:02:58');
INSERT INTO `gen_table_column` VALUES (122, 10, 'video_url', '视频地址', 'varchar(500)', 'String', 'videoUrl', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 3, 'admin', '2026-01-14 02:57:23', '', '2026-01-14 03:02:58');
INSERT INTO `gen_table_column` VALUES (123, 10, 'cover_url', '封面地址', 'varchar(500)', 'String', 'coverUrl', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 4, 'admin', '2026-01-14 02:57:23', '', '2026-01-14 03:02:58');
INSERT INTO `gen_table_column` VALUES (124, 10, 'description', '简介', 'varchar(500)', 'String', 'description', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 5, 'admin', '2026-01-14 02:57:23', '', '2026-01-14 03:02:58');
INSERT INTO `gen_table_column` VALUES (125, 10, 'class_id', '所属班级ID', 'bigint(20)', 'Long', 'classId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2026-01-14 02:57:23', '', '2026-01-14 03:02:58');
INSERT INTO `gen_table_column` VALUES (126, 10, 'create_by', '上传者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2026-01-14 02:57:23', '', '2026-01-14 03:02:58');
INSERT INTO `gen_table_column` VALUES (127, 10, 'create_time', '上传时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2026-01-14 02:57:23', '', '2026-01-14 03:02:58');

-- ----------------------------
-- Table structure for homework_submission
-- ----------------------------
DROP TABLE IF EXISTS `homework_submission`;
CREATE TABLE `homework_submission`  (
  `submission_id` bigint NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `task_id` bigint NOT NULL COMMENT '关联作业任务ID',
  `student_id` bigint NOT NULL COMMENT '学生ID(关联sys_user)',
  `student_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学生姓名(冗余字段方便统计展示)',
  `submit_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '提交内容',
  `submit_files` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提交附件地址',
  `submit_time` datetime NULL DEFAULT NULL COMMENT '提交时间',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0未提交 1已提交 2已批改）',
  `score` decimal(5, 2) NULL DEFAULT NULL COMMENT '作业得分',
  `teacher_comment` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教师评语',
  `grade_time` datetime NULL DEFAULT NULL COMMENT '批改时间',
  `grader_id` bigint NULL DEFAULT NULL COMMENT '批改人ID',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`submission_id`) USING BTREE,
  UNIQUE INDEX `uk_task_student`(`task_id` ASC, `student_id` ASC) USING BTREE,
  INDEX `idx_task_score`(`task_id` ASC, `score` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '作业提交与成绩表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of homework_submission
-- ----------------------------
INSERT INTO `homework_submission` VALUES (23, 17, 1004, '测试学生', '测试答案', NULL, '2026-01-27 00:38:18', '2', 80.00, NULL, NULL, NULL, '', '2026-01-27 00:38:18', '', '2026-01-27 00:38:26', NULL);

-- ----------------------------
-- Table structure for homework_task
-- ----------------------------
DROP TABLE IF EXISTS `homework_task`;
CREATE TABLE `homework_task`  (
  `task_id` bigint NOT NULL AUTO_INCREMENT COMMENT '作业任务ID',
  `task_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作业标题',
  `task_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '作业内容/要求',
  `file_urls` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件地址(支持多个)',
  `course_id` bigint NOT NULL COMMENT '所属课程ID',
  `class_id` bigint NOT NULL COMMENT '目标班级ID',
  `teacher_id` bigint NOT NULL COMMENT '发布教师ID(关联sys_user)',
  `deadline_time` datetime NOT NULL COMMENT '截止时间',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0草稿 1已发布 2已结束）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`task_id`) USING BTREE,
  INDEX `idx_course_class`(`course_id` ASC, `class_id` ASC) USING BTREE,
  INDEX `idx_teacher`(`teacher_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '作业发布任务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of homework_task
-- ----------------------------
INSERT INTO `homework_task` VALUES (17, '数学', '<p>测试工作</p>', NULL, 1, 201, 1, '2026-01-28 00:00:00', '1', '', '2026-01-27 00:35:14', '', NULL, NULL);

-- ----------------------------
-- Table structure for hs_attendance
-- ----------------------------
DROP TABLE IF EXISTS `hs_attendance`;
CREATE TABLE `hs_attendance`  (
  `attendance_id` bigint NOT NULL AUTO_INCREMENT COMMENT '考勤ID',
  `student_id` bigint NOT NULL COMMENT '学生ID(关联sys_user)',
  `student_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学生姓名(冗余方便查询)',
  `attendance_date` date NOT NULL COMMENT '考勤日期',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '状态(1正常 2迟到 3早退 4缺勤 5请假)',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`attendance_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '学生考勤表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of hs_attendance
-- ----------------------------
INSERT INTO `hs_attendance` VALUES (5, 102, '李四', '2026-01-24', '4', NULL, '0', '', '2025-12-27 23:45:21', '', '2026-01-24 14:25:52');
INSERT INTO `hs_attendance` VALUES (7, 6, 'wkk', '2025-12-27', '1', NULL, '0', '', '2025-12-28 00:13:35', '', '2026-01-01 01:08:22');
INSERT INTO `hs_attendance` VALUES (8, 7, 'wkk', '2026-01-02', '1', NULL, '0', '', '2026-01-02 01:13:42', '', '2026-01-02 01:27:17');
INSERT INTO `hs_attendance` VALUES (9, 7, 'wkk', '2026-01-17', '1', NULL, '0', '', '2026-01-17 02:47:01', '', NULL);
INSERT INTO `hs_attendance` VALUES (10, 2, '若依', '2026-01-23', '4', NULL, '0', '', '2026-01-23 16:46:29', '', NULL);
INSERT INTO `hs_attendance` VALUES (11, 7, 'wkk', '2026-01-24', '1', NULL, '0', '', '2026-01-24 10:47:05', '', NULL);
INSERT INTO `hs_attendance` VALUES (12, 6, 'wkk', '2026-01-24', '4', NULL, '0', '', '2026-01-24 14:26:29', '', NULL);
INSERT INTO `hs_attendance` VALUES (13, 1004, 'xs1', '2026-01-26', '2', NULL, '0', '', '2026-01-26 15:23:46', '', NULL);

-- ----------------------------
-- Table structure for hs_course
-- ----------------------------
DROP TABLE IF EXISTS `hs_course`;
CREATE TABLE `hs_course`  (
  `course_id` bigint NOT NULL AUTO_INCREMENT COMMENT '科目ID',
  `course_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '科目名称(如：语文、高等数学)',
  `course_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '科目编码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`course_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课程科目表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of hs_course
-- ----------------------------
INSERT INTO `hs_course` VALUES (100, 'Java程序设计', NULL, '0', 'admin', '2025-12-26 00:02:15', '', NULL, NULL);
INSERT INTO `hs_course` VALUES (101, '数据结构', NULL, '0', 'admin', '2025-12-26 00:02:15', '', NULL, NULL);
INSERT INTO `hs_course` VALUES (102, '高等数学', NULL, '0', 'admin', '2025-12-26 00:02:15', '', NULL, NULL);

-- ----------------------------
-- Table structure for hs_schedule
-- ----------------------------
DROP TABLE IF EXISTS `hs_schedule`;
CREATE TABLE `hs_schedule`  (
  `schedule_id` bigint NOT NULL AUTO_INCREMENT COMMENT '课表ID',
  `class_id` bigint NOT NULL COMMENT '班级ID',
  `class_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '班级名称',
  `course_id` bigint NOT NULL COMMENT '科目ID',
  `course_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '科目名称',
  `teacher_id` bigint NULL DEFAULT NULL COMMENT '授课老师ID',
  `teacher_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '授课老师姓名',
  `week_day` int NOT NULL COMMENT '星期(1-7)',
  `section` int NOT NULL COMMENT '节次(1-8)',
  `time_period` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '时段(0上午 1下午 2晚自习)',
  `classroom` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上课地点',
  `school_year` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学年学期(如2024-1)',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`schedule_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 403 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '班级课程表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of hs_schedule
-- ----------------------------
INSERT INTO `hs_schedule` VALUES (1, 201, '高一(1)班', 4, '物理', 1002, '数学老师1', 1, 1, '0', '教室1', '2025-2026-1', '', '2026-01-24 09:52:59', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (2, 201, '高一(1)班', 5, '化学', 1001, '班主任1', 1, 2, '0', '教室1', '2025-2026-1', '', '2026-01-24 09:52:59', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (3, 201, '高一(1)班', 6, '生物', 1002, '数学老师1', 1, 3, '0', '教室1', '2025-2026-1', '', '2026-01-24 09:52:59', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (4, 201, '高一(1)班', 7, '历史', 1001, '班主任1', 1, 4, '0', '教室1', '2025-2026-1', '', '2026-01-24 09:52:59', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (5, 201, '高一(1)班', 8, '地理', 1002, '数学老师1', 1, 5, '1', '教室1', '2025-2026-1', '', '2026-01-24 09:52:59', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (6, 201, '高一(1)班', 1, '语文', 1001, '班主任1', 1, 6, '1', '教室1', '2025-2026-1', '', '2026-01-24 09:52:59', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (7, 201, '高一(1)班', 2, '数学', 1002, '数学老师1', 1, 7, '1', '教室1', '2025-2026-1', '', '2026-01-24 09:53:00', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (8, 201, '高一(1)班', 3, '英语', 1001, '班主任1', 1, 8, '1', '教室1', '2025-2026-1', '', '2026-01-24 09:53:00', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (9, 201, '高一(1)班', 5, '化学', 1001, '班主任1', 2, 1, '0', '教室1', '2025-2026-1', '', '2026-01-24 09:53:00', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (10, 201, '高一(1)班', 6, '生物', 1002, '数学老师1', 2, 2, '0', '教室1', '2025-2026-1', '', '2026-01-24 09:53:00', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (11, 201, '高一(1)班', 7, '历史', 1001, '班主任1', 2, 3, '0', '教室1', '2025-2026-1', '', '2026-01-24 09:53:00', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (12, 201, '高一(1)班', 8, '地理', 1002, '数学老师1', 2, 4, '0', '教室1', '2025-2026-1', '', '2026-01-24 09:53:00', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (13, 201, '高一(1)班', 1, '语文', 1001, '班主任1', 2, 5, '1', '教室1', '2025-2026-1', '', '2026-01-24 09:53:00', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (14, 201, '高一(1)班', 2, '数学', 1002, '数学老师1', 2, 6, '1', '教室1', '2025-2026-1', '', '2026-01-24 09:53:00', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (15, 201, '高一(1)班', 3, '英语', 1001, '班主任1', 2, 7, '1', '教室1', '2025-2026-1', '', '2026-01-24 09:53:00', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (16, 201, '高一(1)班', 4, '物理', 1002, '数学老师1', 2, 8, '1', '教室1', '2025-2026-1', '', '2026-01-24 09:53:00', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (17, 201, '高一(1)班', 6, '生物', 1002, '数学老师1', 3, 1, '0', '教室1', '2025-2026-1', '', '2026-01-24 09:53:00', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (18, 201, '高一(1)班', 7, '历史', 1001, '班主任1', 3, 2, '0', '教室1', '2025-2026-1', '', '2026-01-24 09:53:00', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (19, 201, '高一(1)班', 8, '地理', 1002, '数学老师1', 3, 3, '0', '教室1', '2025-2026-1', '', '2026-01-24 09:53:00', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (20, 201, '高一(1)班', 1, '语文', 1001, '班主任1', 3, 4, '0', '教室1', '2025-2026-1', '', '2026-01-24 09:53:00', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (21, 201, '高一(1)班', 2, '数学', 1002, '数学老师1', 3, 5, '1', '教室1', '2025-2026-1', '', '2026-01-24 09:53:00', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (22, 201, '高一(1)班', 3, '英语', 1001, '班主任1', 3, 6, '1', '教室1', '2025-2026-1', '', '2026-01-24 09:53:00', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (23, 201, '高一(1)班', 4, '物理', 1002, '数学老师1', 3, 7, '1', '教室1', '2025-2026-1', '', '2026-01-24 09:53:00', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (24, 201, '高一(1)班', 5, '化学', 1001, '班主任1', 3, 8, '1', '教室1', '2025-2026-1', '', '2026-01-24 09:53:00', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (25, 201, '高一(1)班', 7, '历史', 1001, '班主任1', 4, 1, '0', '教室1', '2025-2026-1', '', '2026-01-24 09:53:00', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (26, 201, '高一(1)班', 8, '地理', 1002, '数学老师1', 4, 2, '0', '教室1', '2025-2026-1', '', '2026-01-24 09:53:00', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (27, 201, '高一(1)班', 1, '语文', 1001, '班主任1', 4, 3, '0', '教室1', '2025-2026-1', '', '2026-01-24 09:53:00', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (28, 201, '高一(1)班', 2, '数学', 1002, '数学老师1', 4, 4, '0', '教室1', '2025-2026-1', '', '2026-01-24 09:53:00', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (29, 201, '高一(1)班', 3, '英语', 1001, '班主任1', 4, 5, '1', '教室1', '2025-2026-1', '', '2026-01-24 09:53:00', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (30, 201, '高一(1)班', 4, '物理', 1002, '数学老师1', 4, 6, '1', '教室1', '2025-2026-1', '', '2026-01-24 09:53:00', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (31, 201, '高一(1)班', 5, '化学', 1001, '班主任1', 4, 7, '1', '教室1', '2025-2026-1', '', '2026-01-24 09:53:00', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (32, 201, '高一(1)班', 6, '生物', 1002, '数学老师1', 4, 8, '1', '教室1', '2025-2026-1', '', '2026-01-24 09:53:00', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (33, 201, '高一(1)班', 8, '地理', 1002, '数学老师1', 5, 1, '0', '教室1', '2025-2026-1', '', '2026-01-24 09:53:00', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (34, 201, '高一(1)班', 1, '语文', 1001, '班主任1', 5, 2, '0', '教室1', '2025-2026-1', '', '2026-01-24 09:53:00', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (35, 201, '高一(1)班', 2, '数学', 1002, '数学老师1', 5, 3, '0', '教室1', '2025-2026-1', '', '2026-01-24 09:53:00', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (36, 201, '高一(1)班', 3, '英语', 1001, '班主任1', 5, 4, '0', '教室1', '2025-2026-1', '', '2026-01-24 09:53:00', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (37, 201, '高一(1)班', 4, '物理', 1002, '数学老师1', 5, 5, '1', '教室1', '2025-2026-1', '', '2026-01-24 09:53:00', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (38, 201, '高一(1)班', 5, '化学', 1001, '班主任1', 5, 6, '1', '教室1', '2025-2026-1', '', '2026-01-24 09:53:00', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (39, 201, '高一(1)班', 6, '生物', 1002, '数学老师1', 5, 7, '1', '教室1', '2025-2026-1', '', '2026-01-24 09:53:00', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (40, 201, '高一(1)班', 7, '历史', 1001, '班主任1', 5, 8, '1', '教室1', '2025-2026-1', '', '2026-01-24 09:53:00', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (41, 202, '高一(2)班', 5, '化学', 1001, '班主任1', 1, 1, '0', '教室2', '2025-2026-1', '', '2026-01-24 09:53:00', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (42, 202, '高一(2)班', 6, '生物', 1002, '数学老师1', 1, 2, '0', '教室2', '2025-2026-1', '', '2026-01-24 09:53:00', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (43, 202, '高一(2)班', 7, '历史', 1001, '班主任1', 1, 3, '0', '教室2', '2025-2026-1', '', '2026-01-24 09:53:00', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (44, 202, '高一(2)班', 8, '地理', 1002, '数学老师1', 1, 4, '0', '教室2', '2025-2026-1', '', '2026-01-24 09:53:00', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (45, 202, '高一(2)班', 1, '语文', 1001, '班主任1', 1, 5, '1', '教室2', '2025-2026-1', '', '2026-01-24 09:53:00', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (46, 202, '高一(2)班', 2, '数学', 1002, '数学老师1', 1, 6, '1', '教室2', '2025-2026-1', '', '2026-01-24 09:53:00', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (47, 202, '高一(2)班', 3, '英语', 1001, '班主任1', 1, 7, '1', '教室2', '2025-2026-1', '', '2026-01-24 09:53:00', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (48, 202, '高一(2)班', 4, '物理', 1002, '数学老师1', 1, 8, '1', '教室2', '2025-2026-1', '', '2026-01-24 09:53:00', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (49, 202, '高一(2)班', 6, '生物', 1002, '数学老师1', 2, 1, '0', '教室2', '2025-2026-1', '', '2026-01-24 09:53:00', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (50, 202, '高一(2)班', 7, '历史', 1001, '班主任1', 2, 2, '0', '教室2', '2025-2026-1', '', '2026-01-24 09:53:00', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (51, 202, '高一(2)班', 8, '地理', 1002, '数学老师1', 2, 3, '0', '教室2', '2025-2026-1', '', '2026-01-24 09:53:01', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (52, 202, '高一(2)班', 1, '语文', 1001, '班主任1', 2, 4, '0', '教室2', '2025-2026-1', '', '2026-01-24 09:53:01', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (53, 202, '高一(2)班', 2, '数学', 1002, '数学老师1', 2, 5, '1', '教室2', '2025-2026-1', '', '2026-01-24 09:53:01', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (54, 202, '高一(2)班', 3, '英语', 1001, '班主任1', 2, 6, '1', '教室2', '2025-2026-1', '', '2026-01-24 09:53:01', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (55, 202, '高一(2)班', 4, '物理', 1002, '数学老师1', 2, 7, '1', '教室2', '2025-2026-1', '', '2026-01-24 09:53:01', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (56, 202, '高一(2)班', 5, '化学', 1001, '班主任1', 2, 8, '1', '教室2', '2025-2026-1', '', '2026-01-24 09:53:01', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (57, 202, '高一(2)班', 7, '历史', 1001, '班主任1', 3, 1, '0', '教室2', '2025-2026-1', '', '2026-01-24 09:53:01', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (58, 202, '高一(2)班', 8, '地理', 1002, '数学老师1', 3, 2, '0', '教室2', '2025-2026-1', '', '2026-01-24 09:53:01', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (59, 202, '高一(2)班', 1, '语文', 1001, '班主任1', 3, 3, '0', '教室2', '2025-2026-1', '', '2026-01-24 09:53:01', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (60, 202, '高一(2)班', 2, '数学', 1002, '数学老师1', 3, 4, '0', '教室2', '2025-2026-1', '', '2026-01-24 09:53:01', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (61, 202, '高一(2)班', 3, '英语', 1001, '班主任1', 3, 5, '1', '教室2', '2025-2026-1', '', '2026-01-24 09:53:01', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (62, 202, '高一(2)班', 4, '物理', 1002, '数学老师1', 3, 6, '1', '教室2', '2025-2026-1', '', '2026-01-24 09:53:01', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (63, 202, '高一(2)班', 5, '化学', 1001, '班主任1', 3, 7, '1', '教室2', '2025-2026-1', '', '2026-01-24 09:53:01', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (64, 202, '高一(2)班', 6, '生物', 1002, '数学老师1', 3, 8, '1', '教室2', '2025-2026-1', '', '2026-01-24 09:53:01', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (65, 202, '高一(2)班', 8, '地理', 1002, '数学老师1', 4, 1, '0', '教室2', '2025-2026-1', '', '2026-01-24 09:53:01', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (66, 202, '高一(2)班', 1, '语文', 1001, '班主任1', 4, 2, '0', '教室2', '2025-2026-1', '', '2026-01-24 09:53:01', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (67, 202, '高一(2)班', 2, '数学', 1002, '数学老师1', 4, 3, '0', '教室2', '2025-2026-1', '', '2026-01-24 09:53:01', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (68, 202, '高一(2)班', 3, '英语', 1001, '班主任1', 4, 4, '0', '教室2', '2025-2026-1', '', '2026-01-24 09:53:01', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (69, 202, '高一(2)班', 4, '物理', 1002, '数学老师1', 4, 5, '1', '教室2', '2025-2026-1', '', '2026-01-24 09:53:01', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (70, 202, '高一(2)班', 5, '化学', 1001, '班主任1', 4, 6, '1', '教室2', '2025-2026-1', '', '2026-01-24 09:53:01', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (71, 202, '高一(2)班', 6, '生物', 1002, '数学老师1', 4, 7, '1', '教室2', '2025-2026-1', '', '2026-01-24 09:53:01', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (72, 202, '高一(2)班', 7, '历史', 1001, '班主任1', 4, 8, '1', '教室2', '2025-2026-1', '', '2026-01-24 09:53:01', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (73, 202, '高一(2)班', 1, '语文', 1001, '班主任1', 5, 1, '0', '教室2', '2025-2026-1', '', '2026-01-24 09:53:01', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (74, 202, '高一(2)班', 2, '数学', 1002, '数学老师1', 5, 2, '0', '教室2', '2025-2026-1', '', '2026-01-24 09:53:01', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (75, 202, '高一(2)班', 3, '英语', 1001, '班主任1', 5, 3, '0', '教室2', '2025-2026-1', '', '2026-01-24 09:53:01', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (76, 202, '高一(2)班', 4, '物理', 1002, '数学老师1', 5, 4, '0', '教室2', '2025-2026-1', '', '2026-01-24 09:53:01', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (77, 202, '高一(2)班', 5, '化学', 1001, '班主任1', 5, 5, '1', '教室2', '2025-2026-1', '', '2026-01-24 09:53:01', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (78, 202, '高一(2)班', 6, '生物', 1002, '数学老师1', 5, 6, '1', '教室2', '2025-2026-1', '', '2026-01-24 09:53:01', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (79, 202, '高一(2)班', 7, '历史', 1001, '班主任1', 5, 7, '1', '教室2', '2025-2026-1', '', '2026-01-24 09:53:01', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (80, 202, '高一(2)班', 8, '地理', 1002, '数学老师1', 5, 8, '1', '教室2', '2025-2026-1', '', '2026-01-24 09:53:01', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (81, 203, '高一(3)班', 6, '生物', 1002, '数学老师1', 1, 1, '0', '教室3', '2025-2026-1', '', '2026-01-24 09:53:01', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (82, 203, '高一(3)班', 7, '历史', 1001, '班主任1', 1, 2, '0', '教室3', '2025-2026-1', '', '2026-01-24 09:53:01', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (83, 203, '高一(3)班', 8, '地理', 1002, '数学老师1', 1, 3, '0', '教室3', '2025-2026-1', '', '2026-01-24 09:53:01', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (84, 203, '高一(3)班', 1, '语文', 1001, '班主任1', 1, 4, '0', '教室3', '2025-2026-1', '', '2026-01-24 09:53:01', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (85, 203, '高一(3)班', 2, '数学', 1002, '数学老师1', 1, 5, '1', '教室3', '2025-2026-1', '', '2026-01-24 09:53:01', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (86, 203, '高一(3)班', 3, '英语', 1001, '班主任1', 1, 6, '1', '教室3', '2025-2026-1', '', '2026-01-24 09:53:01', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (87, 203, '高一(3)班', 4, '物理', 1002, '数学老师1', 1, 7, '1', '教室3', '2025-2026-1', '', '2026-01-24 09:53:01', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (88, 203, '高一(3)班', 5, '化学', 1001, '班主任1', 1, 8, '1', '教室3', '2025-2026-1', '', '2026-01-24 09:53:01', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (89, 203, '高一(3)班', 7, '历史', 1001, '班主任1', 2, 1, '0', '教室3', '2025-2026-1', '', '2026-01-24 09:53:01', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (90, 203, '高一(3)班', 8, '地理', 1002, '数学老师1', 2, 2, '0', '教室3', '2025-2026-1', '', '2026-01-24 09:53:01', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (91, 203, '高一(3)班', 1, '语文', 1001, '班主任1', 2, 3, '0', '教室3', '2025-2026-1', '', '2026-01-24 09:53:01', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (92, 203, '高一(3)班', 2, '数学', 1002, '数学老师1', 2, 4, '0', '教室3', '2025-2026-1', '', '2026-01-24 09:53:01', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (93, 203, '高一(3)班', 3, '英语', 1001, '班主任1', 2, 5, '1', '教室3', '2025-2026-1', '', '2026-01-24 09:53:01', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (94, 203, '高一(3)班', 4, '物理', 1002, '数学老师1', 2, 6, '1', '教室3', '2025-2026-1', '', '2026-01-24 09:53:01', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (95, 203, '高一(3)班', 5, '化学', 1001, '班主任1', 2, 7, '1', '教室3', '2025-2026-1', '', '2026-01-24 09:53:02', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (96, 203, '高一(3)班', 6, '生物', 1002, '数学老师1', 2, 8, '1', '教室3', '2025-2026-1', '', '2026-01-24 09:53:02', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (97, 203, '高一(3)班', 8, '地理', 1002, '数学老师1', 3, 1, '0', '教室3', '2025-2026-1', '', '2026-01-24 09:53:02', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (98, 203, '高一(3)班', 1, '语文', 1001, '班主任1', 3, 2, '0', '教室3', '2025-2026-1', '', '2026-01-24 09:53:02', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (99, 203, '高一(3)班', 2, '数学', 1002, '数学老师1', 3, 3, '0', '教室3', '2025-2026-1', '', '2026-01-24 09:53:02', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (100, 203, '高一(3)班', 3, '英语', 1001, '班主任1', 3, 4, '0', '教室3', '2025-2026-1', '', '2026-01-24 09:53:02', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (101, 203, '高一(3)班', 4, '物理', 1002, '数学老师1', 3, 5, '1', '教室3', '2025-2026-1', '', '2026-01-24 09:53:02', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (102, 203, '高一(3)班', 5, '化学', 1001, '班主任1', 3, 6, '1', '教室3', '2025-2026-1', '', '2026-01-24 09:53:02', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (103, 203, '高一(3)班', 6, '生物', 1002, '数学老师1', 3, 7, '1', '教室3', '2025-2026-1', '', '2026-01-24 09:53:02', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (104, 203, '高一(3)班', 7, '历史', 1001, '班主任1', 3, 8, '1', '教室3', '2025-2026-1', '', '2026-01-24 09:53:02', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (105, 203, '高一(3)班', 1, '语文', 1001, '班主任1', 4, 1, '0', '教室3', '2025-2026-1', '', '2026-01-24 09:53:02', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (106, 203, '高一(3)班', 2, '数学', 1002, '数学老师1', 4, 2, '0', '教室3', '2025-2026-1', '', '2026-01-24 09:53:02', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (107, 203, '高一(3)班', 3, '英语', 1001, '班主任1', 4, 3, '0', '教室3', '2025-2026-1', '', '2026-01-24 09:53:02', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (108, 203, '高一(3)班', 4, '物理', 1002, '数学老师1', 4, 4, '0', '教室3', '2025-2026-1', '', '2026-01-24 09:53:02', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (109, 203, '高一(3)班', 5, '化学', 1001, '班主任1', 4, 5, '1', '教室3', '2025-2026-1', '', '2026-01-24 09:53:02', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (110, 203, '高一(3)班', 6, '生物', 1002, '数学老师1', 4, 6, '1', '教室3', '2025-2026-1', '', '2026-01-24 09:53:02', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (111, 203, '高一(3)班', 7, '历史', 1001, '班主任1', 4, 7, '1', '教室3', '2025-2026-1', '', '2026-01-24 09:53:02', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (112, 203, '高一(3)班', 8, '地理', 1002, '数学老师1', 4, 8, '1', '教室3', '2025-2026-1', '', '2026-01-24 09:53:02', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (113, 203, '高一(3)班', 2, '数学', 1002, '数学老师1', 5, 1, '0', '教室3', '2025-2026-1', '', '2026-01-24 09:53:02', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (114, 203, '高一(3)班', 3, '英语', 1001, '班主任1', 5, 2, '0', '教室3', '2025-2026-1', '', '2026-01-24 09:53:02', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (115, 203, '高一(3)班', 4, '物理', 1002, '数学老师1', 5, 3, '0', '教室3', '2025-2026-1', '', '2026-01-24 09:53:02', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (116, 203, '高一(3)班', 5, '化学', 1001, '班主任1', 5, 4, '0', '教室3', '2025-2026-1', '', '2026-01-24 09:53:02', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (117, 203, '高一(3)班', 6, '生物', 1002, '数学老师1', 5, 5, '1', '教室3', '2025-2026-1', '', '2026-01-24 09:53:02', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (118, 203, '高一(3)班', 7, '历史', 1001, '班主任1', 5, 6, '1', '教室3', '2025-2026-1', '', '2026-01-24 09:53:02', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (119, 203, '高一(3)班', 8, '地理', 1002, '数学老师1', 5, 7, '1', '教室3', '2025-2026-1', '', '2026-01-24 09:53:02', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (120, 203, '高一(3)班', 1, '语文', 1001, '班主任1', 5, 8, '1', '教室3', '2025-2026-1', '', '2026-01-24 09:53:02', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (121, 204, '高一(4)班', 7, '历史', 1001, '班主任1', 1, 1, '0', '教室4', '2025-2026-1', '', '2026-01-24 09:53:02', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (122, 204, '高一(4)班', 8, '地理', 1002, '数学老师1', 1, 2, '0', '教室4', '2025-2026-1', '', '2026-01-24 09:53:02', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (123, 204, '高一(4)班', 1, '语文', 1001, '班主任1', 1, 3, '0', '教室4', '2025-2026-1', '', '2026-01-24 09:53:02', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (124, 204, '高一(4)班', 2, '数学', 1002, '数学老师1', 1, 4, '0', '教室4', '2025-2026-1', '', '2026-01-24 09:53:02', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (125, 204, '高一(4)班', 3, '英语', 1001, '班主任1', 1, 5, '1', '教室4', '2025-2026-1', '', '2026-01-24 09:53:02', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (126, 204, '高一(4)班', 4, '物理', 1002, '数学老师1', 1, 6, '1', '教室4', '2025-2026-1', '', '2026-01-24 09:53:02', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (127, 204, '高一(4)班', 5, '化学', 1001, '班主任1', 1, 7, '1', '教室4', '2025-2026-1', '', '2026-01-24 09:53:02', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (128, 204, '高一(4)班', 6, '生物', 1002, '数学老师1', 1, 8, '1', '教室4', '2025-2026-1', '', '2026-01-24 09:53:02', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (129, 204, '高一(4)班', 8, '地理', 1002, '数学老师1', 2, 1, '0', '教室4', '2025-2026-1', '', '2026-01-24 09:53:02', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (130, 204, '高一(4)班', 1, '语文', 1001, '班主任1', 2, 2, '0', '教室4', '2025-2026-1', '', '2026-01-24 09:53:02', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (131, 204, '高一(4)班', 2, '数学', 1002, '数学老师1', 2, 3, '0', '教室4', '2025-2026-1', '', '2026-01-24 09:53:02', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (132, 204, '高一(4)班', 3, '英语', 1001, '班主任1', 2, 4, '0', '教室4', '2025-2026-1', '', '2026-01-24 09:53:02', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (133, 204, '高一(4)班', 4, '物理', 1002, '数学老师1', 2, 5, '1', '教室4', '2025-2026-1', '', '2026-01-24 09:53:02', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (134, 204, '高一(4)班', 5, '化学', 1001, '班主任1', 2, 6, '1', '教室4', '2025-2026-1', '', '2026-01-24 09:53:02', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (135, 204, '高一(4)班', 6, '生物', 1002, '数学老师1', 2, 7, '1', '教室4', '2025-2026-1', '', '2026-01-24 09:53:02', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (136, 204, '高一(4)班', 7, '历史', 1001, '班主任1', 2, 8, '1', '教室4', '2025-2026-1', '', '2026-01-24 09:53:02', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (137, 204, '高一(4)班', 1, '语文', 1001, '班主任1', 3, 1, '0', '教室4', '2025-2026-1', '', '2026-01-24 09:53:02', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (138, 204, '高一(4)班', 2, '数学', 1002, '数学老师1', 3, 2, '0', '教室4', '2025-2026-1', '', '2026-01-24 09:53:02', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (139, 204, '高一(4)班', 3, '英语', 1001, '班主任1', 3, 3, '0', '教室4', '2025-2026-1', '', '2026-01-24 09:53:03', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (140, 204, '高一(4)班', 4, '物理', 1002, '数学老师1', 3, 4, '0', '教室4', '2025-2026-1', '', '2026-01-24 09:53:03', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (141, 204, '高一(4)班', 5, '化学', 1001, '班主任1', 3, 5, '1', '教室4', '2025-2026-1', '', '2026-01-24 09:53:03', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (142, 204, '高一(4)班', 6, '生物', 1002, '数学老师1', 3, 6, '1', '教室4', '2025-2026-1', '', '2026-01-24 09:53:03', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (143, 204, '高一(4)班', 7, '历史', 1001, '班主任1', 3, 7, '1', '教室4', '2025-2026-1', '', '2026-01-24 09:53:03', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (144, 204, '高一(4)班', 8, '地理', 1002, '数学老师1', 3, 8, '1', '教室4', '2025-2026-1', '', '2026-01-24 09:53:03', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (145, 204, '高一(4)班', 2, '数学', 1002, '数学老师1', 4, 1, '0', '教室4', '2025-2026-1', '', '2026-01-24 09:53:03', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (146, 204, '高一(4)班', 3, '英语', 1001, '班主任1', 4, 2, '0', '教室4', '2025-2026-1', '', '2026-01-24 09:53:03', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (147, 204, '高一(4)班', 4, '物理', 1002, '数学老师1', 4, 3, '0', '教室4', '2025-2026-1', '', '2026-01-24 09:53:03', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (148, 204, '高一(4)班', 5, '化学', 1001, '班主任1', 4, 4, '0', '教室4', '2025-2026-1', '', '2026-01-24 09:53:03', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (149, 204, '高一(4)班', 6, '生物', 1002, '数学老师1', 4, 5, '1', '教室4', '2025-2026-1', '', '2026-01-24 09:53:03', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (150, 204, '高一(4)班', 7, '历史', 1001, '班主任1', 4, 6, '1', '教室4', '2025-2026-1', '', '2026-01-24 09:53:03', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (151, 204, '高一(4)班', 8, '地理', 1002, '数学老师1', 4, 7, '1', '教室4', '2025-2026-1', '', '2026-01-24 09:53:03', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (152, 204, '高一(4)班', 1, '语文', 1001, '班主任1', 4, 8, '1', '教室4', '2025-2026-1', '', '2026-01-24 09:53:03', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (153, 204, '高一(4)班', 3, '英语', 1001, '班主任1', 5, 1, '0', '教室4', '2025-2026-1', '', '2026-01-24 09:53:03', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (154, 204, '高一(4)班', 4, '物理', 1002, '数学老师1', 5, 2, '0', '教室4', '2025-2026-1', '', '2026-01-24 09:53:03', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (155, 204, '高一(4)班', 5, '化学', 1001, '班主任1', 5, 3, '0', '教室4', '2025-2026-1', '', '2026-01-24 09:53:03', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (156, 204, '高一(4)班', 6, '生物', 1002, '数学老师1', 5, 4, '0', '教室4', '2025-2026-1', '', '2026-01-24 09:53:03', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (157, 204, '高一(4)班', 7, '历史', 1001, '班主任1', 5, 5, '1', '教室4', '2025-2026-1', '', '2026-01-24 09:53:03', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (158, 204, '高一(4)班', 8, '地理', 1002, '数学老师1', 5, 6, '1', '教室4', '2025-2026-1', '', '2026-01-24 09:53:03', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (159, 204, '高一(4)班', 1, '语文', 1001, '班主任1', 5, 7, '1', '教室4', '2025-2026-1', '', '2026-01-24 09:53:03', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (160, 204, '高一(4)班', 2, '数学', 1002, '数学老师1', 5, 8, '1', '教室4', '2025-2026-1', '', '2026-01-24 09:53:03', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (161, 205, '高一(5)班', 8, '地理', 1002, '数学老师1', 1, 1, '0', '教室5', '2025-2026-1', '', '2026-01-24 09:53:03', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (162, 205, '高一(5)班', 1, '语文', 1001, '班主任1', 1, 2, '0', '教室5', '2025-2026-1', '', '2026-01-24 09:53:03', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (163, 205, '高一(5)班', 2, '数学', 1002, '数学老师1', 1, 3, '0', '教室5', '2025-2026-1', '', '2026-01-24 09:53:03', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (164, 205, '高一(5)班', 3, '英语', 1001, '班主任1', 1, 4, '0', '教室5', '2025-2026-1', '', '2026-01-24 09:53:03', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (165, 205, '高一(5)班', 4, '物理', 1002, '数学老师1', 1, 5, '1', '教室5', '2025-2026-1', '', '2026-01-24 09:53:03', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (166, 205, '高一(5)班', 5, '化学', 1001, '班主任1', 1, 6, '1', '教室5', '2025-2026-1', '', '2026-01-24 09:53:03', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (167, 205, '高一(5)班', 6, '生物', 1002, '数学老师1', 1, 7, '1', '教室5', '2025-2026-1', '', '2026-01-24 09:53:03', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (168, 205, '高一(5)班', 7, '历史', 1001, '班主任1', 1, 8, '1', '教室5', '2025-2026-1', '', '2026-01-24 09:53:03', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (169, 205, '高一(5)班', 1, '语文', 1001, '班主任1', 2, 1, '0', '教室5', '2025-2026-1', '', '2026-01-24 09:53:03', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (170, 205, '高一(5)班', 2, '数学', 1002, '数学老师1', 2, 2, '0', '教室5', '2025-2026-1', '', '2026-01-24 09:53:03', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (171, 205, '高一(5)班', 3, '英语', 1001, '班主任1', 2, 3, '0', '教室5', '2025-2026-1', '', '2026-01-24 09:53:03', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (172, 205, '高一(5)班', 4, '物理', 1002, '数学老师1', 2, 4, '0', '教室5', '2025-2026-1', '', '2026-01-24 09:53:03', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (173, 205, '高一(5)班', 5, '化学', 1001, '班主任1', 2, 5, '1', '教室5', '2025-2026-1', '', '2026-01-24 09:53:03', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (174, 205, '高一(5)班', 6, '生物', 1002, '数学老师1', 2, 6, '1', '教室5', '2025-2026-1', '', '2026-01-24 09:53:03', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (175, 205, '高一(5)班', 7, '历史', 1001, '班主任1', 2, 7, '1', '教室5', '2025-2026-1', '', '2026-01-24 09:53:03', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (176, 205, '高一(5)班', 8, '地理', 1002, '数学老师1', 2, 8, '1', '教室5', '2025-2026-1', '', '2026-01-24 09:53:03', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (177, 205, '高一(5)班', 2, '数学', 1002, '数学老师1', 3, 1, '0', '教室5', '2025-2026-1', '', '2026-01-24 09:53:03', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (178, 205, '高一(5)班', 3, '英语', 1001, '班主任1', 3, 2, '0', '教室5', '2025-2026-1', '', '2026-01-24 09:53:03', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (179, 205, '高一(5)班', 4, '物理', 1002, '数学老师1', 3, 3, '0', '教室5', '2025-2026-1', '', '2026-01-24 09:53:03', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (180, 205, '高一(5)班', 5, '化学', 1001, '班主任1', 3, 4, '0', '教室5', '2025-2026-1', '', '2026-01-24 09:53:03', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (181, 205, '高一(5)班', 6, '生物', 1002, '数学老师1', 3, 5, '1', '教室5', '2025-2026-1', '', '2026-01-24 09:53:03', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (182, 205, '高一(5)班', 7, '历史', 1001, '班主任1', 3, 6, '1', '教室5', '2025-2026-1', '', '2026-01-24 09:53:03', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (183, 205, '高一(5)班', 8, '地理', 1002, '数学老师1', 3, 7, '1', '教室5', '2025-2026-1', '', '2026-01-24 09:53:04', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (184, 205, '高一(5)班', 1, '语文', 1001, '班主任1', 3, 8, '1', '教室5', '2025-2026-1', '', '2026-01-24 09:53:04', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (185, 205, '高一(5)班', 3, '英语', 1001, '班主任1', 4, 1, '0', '教室5', '2025-2026-1', '', '2026-01-24 09:53:04', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (186, 205, '高一(5)班', 4, '物理', 1002, '数学老师1', 4, 2, '0', '教室5', '2025-2026-1', '', '2026-01-24 09:53:04', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (187, 205, '高一(5)班', 5, '化学', 1001, '班主任1', 4, 3, '0', '教室5', '2025-2026-1', '', '2026-01-24 09:53:04', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (188, 205, '高一(5)班', 6, '生物', 1002, '数学老师1', 4, 4, '0', '教室5', '2025-2026-1', '', '2026-01-24 09:53:04', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (189, 205, '高一(5)班', 7, '历史', 1001, '班主任1', 4, 5, '1', '教室5', '2025-2026-1', '', '2026-01-24 09:53:04', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (190, 205, '高一(5)班', 8, '地理', 1002, '数学老师1', 4, 6, '1', '教室5', '2025-2026-1', '', '2026-01-24 09:53:04', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (191, 205, '高一(5)班', 1, '语文', 1001, '班主任1', 4, 7, '1', '教室5', '2025-2026-1', '', '2026-01-24 09:53:04', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (192, 205, '高一(5)班', 2, '数学', 1002, '数学老师1', 4, 8, '1', '教室5', '2025-2026-1', '', '2026-01-24 09:53:04', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (193, 205, '高一(5)班', 4, '物理', 1002, '数学老师1', 5, 1, '0', '教室5', '2025-2026-1', '', '2026-01-24 09:53:04', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (194, 205, '高一(5)班', 5, '化学', 1001, '班主任1', 5, 2, '0', '教室5', '2025-2026-1', '', '2026-01-24 09:53:04', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (195, 205, '高一(5)班', 6, '生物', 1002, '数学老师1', 5, 3, '0', '教室5', '2025-2026-1', '', '2026-01-24 09:53:04', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (196, 205, '高一(5)班', 7, '历史', 1001, '班主任1', 5, 4, '0', '教室5', '2025-2026-1', '', '2026-01-24 09:53:04', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (197, 205, '高一(5)班', 8, '地理', 1002, '数学老师1', 5, 5, '1', '教室5', '2025-2026-1', '', '2026-01-24 09:53:04', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (198, 205, '高一(5)班', 1, '语文', 1001, '班主任1', 5, 6, '1', '教室5', '2025-2026-1', '', '2026-01-24 09:53:04', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (199, 205, '高一(5)班', 2, '数学', 1002, '数学老师1', 5, 7, '1', '教室5', '2025-2026-1', '', '2026-01-24 09:53:04', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (200, 205, '高一(5)班', 3, '英语', 1001, '班主任1', 5, 8, '1', '教室5', '2025-2026-1', '', '2026-01-24 09:53:04', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (201, 206, '高一(6)班', 1, '语文', 1001, '班主任1', 1, 1, '0', '教室6', '2025-2026-1', '', '2026-01-24 09:53:04', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (202, 206, '高一(6)班', 2, '数学', 1002, '数学老师1', 1, 2, '0', '教室6', '2025-2026-1', '', '2026-01-24 09:53:04', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (203, 206, '高一(6)班', 3, '英语', 1001, '班主任1', 1, 3, '0', '教室6', '2025-2026-1', '', '2026-01-24 09:53:04', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (204, 206, '高一(6)班', 4, '物理', 1002, '数学老师1', 1, 4, '0', '教室6', '2025-2026-1', '', '2026-01-24 09:53:04', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (205, 206, '高一(6)班', 5, '化学', 1001, '班主任1', 1, 5, '1', '教室6', '2025-2026-1', '', '2026-01-24 09:53:04', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (206, 206, '高一(6)班', 6, '生物', 1002, '数学老师1', 1, 6, '1', '教室6', '2025-2026-1', '', '2026-01-24 09:53:04', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (207, 206, '高一(6)班', 7, '历史', 1001, '班主任1', 1, 7, '1', '教室6', '2025-2026-1', '', '2026-01-24 09:53:04', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (208, 206, '高一(6)班', 8, '地理', 1002, '数学老师1', 1, 8, '1', '教室6', '2025-2026-1', '', '2026-01-24 09:53:04', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (209, 206, '高一(6)班', 2, '数学', 1002, '数学老师1', 2, 1, '0', '教室6', '2025-2026-1', '', '2026-01-24 09:53:04', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (210, 206, '高一(6)班', 3, '英语', 1001, '班主任1', 2, 2, '0', '教室6', '2025-2026-1', '', '2026-01-24 09:53:04', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (211, 206, '高一(6)班', 4, '物理', 1002, '数学老师1', 2, 3, '0', '教室6', '2025-2026-1', '', '2026-01-24 09:53:04', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (212, 206, '高一(6)班', 5, '化学', 1001, '班主任1', 2, 4, '0', '教室6', '2025-2026-1', '', '2026-01-24 09:53:04', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (213, 206, '高一(6)班', 6, '生物', 1002, '数学老师1', 2, 5, '1', '教室6', '2025-2026-1', '', '2026-01-24 09:53:04', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (214, 206, '高一(6)班', 7, '历史', 1001, '班主任1', 2, 6, '1', '教室6', '2025-2026-1', '', '2026-01-24 09:53:04', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (215, 206, '高一(6)班', 8, '地理', 1002, '数学老师1', 2, 7, '1', '教室6', '2025-2026-1', '', '2026-01-24 09:53:04', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (216, 206, '高一(6)班', 1, '语文', 1001, '班主任1', 2, 8, '1', '教室6', '2025-2026-1', '', '2026-01-24 09:53:04', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (217, 206, '高一(6)班', 3, '英语', 1001, '班主任1', 3, 1, '0', '教室6', '2025-2026-1', '', '2026-01-24 09:53:04', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (218, 206, '高一(6)班', 4, '物理', 1002, '数学老师1', 3, 2, '0', '教室6', '2025-2026-1', '', '2026-01-24 09:53:04', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (219, 206, '高一(6)班', 5, '化学', 1001, '班主任1', 3, 3, '0', '教室6', '2025-2026-1', '', '2026-01-24 09:53:04', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (220, 206, '高一(6)班', 6, '生物', 1002, '数学老师1', 3, 4, '0', '教室6', '2025-2026-1', '', '2026-01-24 09:53:04', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (221, 206, '高一(6)班', 7, '历史', 1001, '班主任1', 3, 5, '1', '教室6', '2025-2026-1', '', '2026-01-24 09:53:04', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (222, 206, '高一(6)班', 8, '地理', 1002, '数学老师1', 3, 6, '1', '教室6', '2025-2026-1', '', '2026-01-24 09:53:04', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (223, 206, '高一(6)班', 1, '语文', 1001, '班主任1', 3, 7, '1', '教室6', '2025-2026-1', '', '2026-01-24 09:53:04', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (224, 206, '高一(6)班', 2, '数学', 1002, '数学老师1', 3, 8, '1', '教室6', '2025-2026-1', '', '2026-01-24 09:53:04', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (225, 206, '高一(6)班', 4, '物理', 1002, '数学老师1', 4, 1, '0', '教室6', '2025-2026-1', '', '2026-01-24 09:53:04', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (226, 206, '高一(6)班', 5, '化学', 1001, '班主任1', 4, 2, '0', '教室6', '2025-2026-1', '', '2026-01-24 09:53:04', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (227, 206, '高一(6)班', 6, '生物', 1002, '数学老师1', 4, 3, '0', '教室6', '2025-2026-1', '', '2026-01-24 09:53:05', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (228, 206, '高一(6)班', 7, '历史', 1001, '班主任1', 4, 4, '0', '教室6', '2025-2026-1', '', '2026-01-24 09:53:05', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (229, 206, '高一(6)班', 8, '地理', 1002, '数学老师1', 4, 5, '1', '教室6', '2025-2026-1', '', '2026-01-24 09:53:05', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (230, 206, '高一(6)班', 1, '语文', 1001, '班主任1', 4, 6, '1', '教室6', '2025-2026-1', '', '2026-01-24 09:53:05', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (231, 206, '高一(6)班', 2, '数学', 1002, '数学老师1', 4, 7, '1', '教室6', '2025-2026-1', '', '2026-01-24 09:53:05', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (232, 206, '高一(6)班', 3, '英语', 1001, '班主任1', 4, 8, '1', '教室6', '2025-2026-1', '', '2026-01-24 09:53:05', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (233, 206, '高一(6)班', 5, '化学', 1001, '班主任1', 5, 1, '0', '教室6', '2025-2026-1', '', '2026-01-24 09:53:05', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (234, 206, '高一(6)班', 6, '生物', 1002, '数学老师1', 5, 2, '0', '教室6', '2025-2026-1', '', '2026-01-24 09:53:05', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (235, 206, '高一(6)班', 7, '历史', 1001, '班主任1', 5, 3, '0', '教室6', '2025-2026-1', '', '2026-01-24 09:53:05', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (236, 206, '高一(6)班', 8, '地理', 1002, '数学老师1', 5, 4, '0', '教室6', '2025-2026-1', '', '2026-01-24 09:53:05', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (237, 206, '高一(6)班', 1, '语文', 1001, '班主任1', 5, 5, '1', '教室6', '2025-2026-1', '', '2026-01-24 09:53:05', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (238, 206, '高一(6)班', 2, '数学', 1002, '数学老师1', 5, 6, '1', '教室6', '2025-2026-1', '', '2026-01-24 09:53:05', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (239, 206, '高一(6)班', 3, '英语', 1001, '班主任1', 5, 7, '1', '教室6', '2025-2026-1', '', '2026-01-24 09:53:05', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (240, 206, '高一(6)班', 4, '物理', 1002, '数学老师1', 5, 8, '1', '教室6', '2025-2026-1', '', '2026-01-24 09:53:05', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (241, 207, '高一(7)班', 2, '数学', 1002, '数学老师1', 1, 1, '0', '教室7', '2025-2026-1', '', '2026-01-24 09:53:05', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (242, 207, '高一(7)班', 3, '英语', 1001, '班主任1', 1, 2, '0', '教室7', '2025-2026-1', '', '2026-01-24 09:53:05', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (243, 207, '高一(7)班', 4, '物理', 1002, '数学老师1', 1, 3, '0', '教室7', '2025-2026-1', '', '2026-01-24 09:53:05', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (244, 207, '高一(7)班', 5, '化学', 1001, '班主任1', 1, 4, '0', '教室7', '2025-2026-1', '', '2026-01-24 09:53:05', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (245, 207, '高一(7)班', 6, '生物', 1002, '数学老师1', 1, 5, '1', '教室7', '2025-2026-1', '', '2026-01-24 09:53:05', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (246, 207, '高一(7)班', 7, '历史', 1001, '班主任1', 1, 6, '1', '教室7', '2025-2026-1', '', '2026-01-24 09:53:05', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (247, 207, '高一(7)班', 8, '地理', 1002, '数学老师1', 1, 7, '1', '教室7', '2025-2026-1', '', '2026-01-24 09:53:05', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (248, 207, '高一(7)班', 1, '语文', 1001, '班主任1', 1, 8, '1', '教室7', '2025-2026-1', '', '2026-01-24 09:53:05', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (249, 207, '高一(7)班', 3, '英语', 1001, '班主任1', 2, 1, '0', '教室7', '2025-2026-1', '', '2026-01-24 09:53:05', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (250, 207, '高一(7)班', 4, '物理', 1002, '数学老师1', 2, 2, '0', '教室7', '2025-2026-1', '', '2026-01-24 09:53:05', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (251, 207, '高一(7)班', 5, '化学', 1001, '班主任1', 2, 3, '0', '教室7', '2025-2026-1', '', '2026-01-24 09:53:05', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (252, 207, '高一(7)班', 6, '生物', 1002, '数学老师1', 2, 4, '0', '教室7', '2025-2026-1', '', '2026-01-24 09:53:05', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (253, 207, '高一(7)班', 7, '历史', 1001, '班主任1', 2, 5, '1', '教室7', '2025-2026-1', '', '2026-01-24 09:53:05', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (254, 207, '高一(7)班', 8, '地理', 1002, '数学老师1', 2, 6, '1', '教室7', '2025-2026-1', '', '2026-01-24 09:53:05', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (255, 207, '高一(7)班', 1, '语文', 1001, '班主任1', 2, 7, '1', '教室7', '2025-2026-1', '', '2026-01-24 09:53:05', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (256, 207, '高一(7)班', 2, '数学', 1002, '数学老师1', 2, 8, '1', '教室7', '2025-2026-1', '', '2026-01-24 09:53:05', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (257, 207, '高一(7)班', 4, '物理', 1002, '数学老师1', 3, 1, '0', '教室7', '2025-2026-1', '', '2026-01-24 09:53:05', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (258, 207, '高一(7)班', 5, '化学', 1001, '班主任1', 3, 2, '0', '教室7', '2025-2026-1', '', '2026-01-24 09:53:05', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (259, 207, '高一(7)班', 6, '生物', 1002, '数学老师1', 3, 3, '0', '教室7', '2025-2026-1', '', '2026-01-24 09:53:05', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (260, 207, '高一(7)班', 7, '历史', 1001, '班主任1', 3, 4, '0', '教室7', '2025-2026-1', '', '2026-01-24 09:53:05', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (261, 207, '高一(7)班', 8, '地理', 1002, '数学老师1', 3, 5, '1', '教室7', '2025-2026-1', '', '2026-01-24 09:53:05', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (262, 207, '高一(7)班', 1, '语文', 1001, '班主任1', 3, 6, '1', '教室7', '2025-2026-1', '', '2026-01-24 09:53:05', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (263, 207, '高一(7)班', 2, '数学', 1002, '数学老师1', 3, 7, '1', '教室7', '2025-2026-1', '', '2026-01-24 09:53:05', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (264, 207, '高一(7)班', 3, '英语', 1001, '班主任1', 3, 8, '1', '教室7', '2025-2026-1', '', '2026-01-24 09:53:05', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (265, 207, '高一(7)班', 5, '化学', 1001, '班主任1', 4, 1, '0', '教室7', '2025-2026-1', '', '2026-01-24 09:53:05', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (266, 207, '高一(7)班', 6, '生物', 1002, '数学老师1', 4, 2, '0', '教室7', '2025-2026-1', '', '2026-01-24 09:53:05', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (267, 207, '高一(7)班', 7, '历史', 1001, '班主任1', 4, 3, '0', '教室7', '2025-2026-1', '', '2026-01-24 09:53:05', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (268, 207, '高一(7)班', 8, '地理', 1002, '数学老师1', 4, 4, '0', '教室7', '2025-2026-1', '', '2026-01-24 09:53:05', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (269, 207, '高一(7)班', 1, '语文', 1001, '班主任1', 4, 5, '1', '教室7', '2025-2026-1', '', '2026-01-24 09:53:05', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (270, 207, '高一(7)班', 2, '数学', 1002, '数学老师1', 4, 6, '1', '教室7', '2025-2026-1', '', '2026-01-24 09:53:05', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (271, 207, '高一(7)班', 3, '英语', 1001, '班主任1', 4, 7, '1', '教室7', '2025-2026-1', '', '2026-01-24 09:53:05', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (272, 207, '高一(7)班', 4, '物理', 1002, '数学老师1', 4, 8, '1', '教室7', '2025-2026-1', '', '2026-01-24 09:53:06', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (273, 207, '高一(7)班', 6, '生物', 1002, '数学老师1', 5, 1, '0', '教室7', '2025-2026-1', '', '2026-01-24 09:53:06', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (274, 207, '高一(7)班', 7, '历史', 1001, '班主任1', 5, 2, '0', '教室7', '2025-2026-1', '', '2026-01-24 09:53:06', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (275, 207, '高一(7)班', 8, '地理', 1002, '数学老师1', 5, 3, '0', '教室7', '2025-2026-1', '', '2026-01-24 09:53:06', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (276, 207, '高一(7)班', 1, '语文', 1001, '班主任1', 5, 4, '0', '教室7', '2025-2026-1', '', '2026-01-24 09:53:06', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (277, 207, '高一(7)班', 2, '数学', 1002, '数学老师1', 5, 5, '1', '教室7', '2025-2026-1', '', '2026-01-24 09:53:06', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (278, 207, '高一(7)班', 3, '英语', 1001, '班主任1', 5, 6, '1', '教室7', '2025-2026-1', '', '2026-01-24 09:53:06', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (279, 207, '高一(7)班', 4, '物理', 1002, '数学老师1', 5, 7, '1', '教室7', '2025-2026-1', '', '2026-01-24 09:53:06', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (280, 207, '高一(7)班', 5, '化学', 1001, '班主任1', 5, 8, '1', '教室7', '2025-2026-1', '', '2026-01-24 09:53:06', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (281, 208, '高一(8)班', 3, '英语', 1001, '班主任1', 1, 1, '0', '教室8', '2025-2026-1', '', '2026-01-24 09:53:06', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (282, 208, '高一(8)班', 4, '物理', 1002, '数学老师1', 1, 2, '0', '教室8', '2025-2026-1', '', '2026-01-24 09:53:06', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (283, 208, '高一(8)班', 5, '化学', 1001, '班主任1', 1, 3, '0', '教室8', '2025-2026-1', '', '2026-01-24 09:53:06', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (284, 208, '高一(8)班', 6, '生物', 1002, '数学老师1', 1, 4, '0', '教室8', '2025-2026-1', '', '2026-01-24 09:53:06', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (285, 208, '高一(8)班', 7, '历史', 1001, '班主任1', 1, 5, '1', '教室8', '2025-2026-1', '', '2026-01-24 09:53:06', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (286, 208, '高一(8)班', 8, '地理', 1002, '数学老师1', 1, 6, '1', '教室8', '2025-2026-1', '', '2026-01-24 09:53:06', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (287, 208, '高一(8)班', 1, '语文', 1001, '班主任1', 1, 7, '1', '教室8', '2025-2026-1', '', '2026-01-24 09:53:06', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (288, 208, '高一(8)班', 2, '数学', 1002, '数学老师1', 1, 8, '1', '教室8', '2025-2026-1', '', '2026-01-24 09:53:06', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (289, 208, '高一(8)班', 4, '物理', 1002, '数学老师1', 2, 1, '0', '教室8', '2025-2026-1', '', '2026-01-24 09:53:06', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (290, 208, '高一(8)班', 5, '化学', 1001, '班主任1', 2, 2, '0', '教室8', '2025-2026-1', '', '2026-01-24 09:53:06', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (291, 208, '高一(8)班', 6, '生物', 1002, '数学老师1', 2, 3, '0', '教室8', '2025-2026-1', '', '2026-01-24 09:53:06', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (292, 208, '高一(8)班', 7, '历史', 1001, '班主任1', 2, 4, '0', '教室8', '2025-2026-1', '', '2026-01-24 09:53:06', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (293, 208, '高一(8)班', 8, '地理', 1002, '数学老师1', 2, 5, '1', '教室8', '2025-2026-1', '', '2026-01-24 09:53:06', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (294, 208, '高一(8)班', 1, '语文', 1001, '班主任1', 2, 6, '1', '教室8', '2025-2026-1', '', '2026-01-24 09:53:06', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (295, 208, '高一(8)班', 2, '数学', 1002, '数学老师1', 2, 7, '1', '教室8', '2025-2026-1', '', '2026-01-24 09:53:06', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (296, 208, '高一(8)班', 3, '英语', 1001, '班主任1', 2, 8, '1', '教室8', '2025-2026-1', '', '2026-01-24 09:53:06', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (297, 208, '高一(8)班', 5, '化学', 1001, '班主任1', 3, 1, '0', '教室8', '2025-2026-1', '', '2026-01-24 09:53:06', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (298, 208, '高一(8)班', 6, '生物', 1002, '数学老师1', 3, 2, '0', '教室8', '2025-2026-1', '', '2026-01-24 09:53:06', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (299, 208, '高一(8)班', 7, '历史', 1001, '班主任1', 3, 3, '0', '教室8', '2025-2026-1', '', '2026-01-24 09:53:06', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (300, 208, '高一(8)班', 8, '地理', 1002, '数学老师1', 3, 4, '0', '教室8', '2025-2026-1', '', '2026-01-24 09:53:06', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (301, 208, '高一(8)班', 1, '语文', 1001, '班主任1', 3, 5, '1', '教室8', '2025-2026-1', '', '2026-01-24 09:53:06', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (302, 208, '高一(8)班', 2, '数学', 1002, '数学老师1', 3, 6, '1', '教室8', '2025-2026-1', '', '2026-01-24 09:53:06', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (303, 208, '高一(8)班', 3, '英语', 1001, '班主任1', 3, 7, '1', '教室8', '2025-2026-1', '', '2026-01-24 09:53:06', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (304, 208, '高一(8)班', 4, '物理', 1002, '数学老师1', 3, 8, '1', '教室8', '2025-2026-1', '', '2026-01-24 09:53:06', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (305, 208, '高一(8)班', 6, '生物', 1002, '数学老师1', 4, 1, '0', '教室8', '2025-2026-1', '', '2026-01-24 09:53:06', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (306, 208, '高一(8)班', 7, '历史', 1001, '班主任1', 4, 2, '0', '教室8', '2025-2026-1', '', '2026-01-24 09:53:06', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (307, 208, '高一(8)班', 8, '地理', 1002, '数学老师1', 4, 3, '0', '教室8', '2025-2026-1', '', '2026-01-24 09:53:06', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (308, 208, '高一(8)班', 1, '语文', 1001, '班主任1', 4, 4, '0', '教室8', '2025-2026-1', '', '2026-01-24 09:53:06', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (309, 208, '高一(8)班', 2, '数学', 1002, '数学老师1', 4, 5, '1', '教室8', '2025-2026-1', '', '2026-01-24 09:53:06', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (310, 208, '高一(8)班', 3, '英语', 1001, '班主任1', 4, 6, '1', '教室8', '2025-2026-1', '', '2026-01-24 09:53:06', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (311, 208, '高一(8)班', 4, '物理', 1002, '数学老师1', 4, 7, '1', '教室8', '2025-2026-1', '', '2026-01-24 09:53:06', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (312, 208, '高一(8)班', 5, '化学', 1001, '班主任1', 4, 8, '1', '教室8', '2025-2026-1', '', '2026-01-24 09:53:06', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (313, 208, '高一(8)班', 7, '历史', 1001, '班主任1', 5, 1, '0', '教室8', '2025-2026-1', '', '2026-01-24 09:53:06', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (314, 208, '高一(8)班', 8, '地理', 1002, '数学老师1', 5, 2, '0', '教室8', '2025-2026-1', '', '2026-01-24 09:53:06', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (315, 208, '高一(8)班', 1, '语文', 1001, '班主任1', 5, 3, '0', '教室8', '2025-2026-1', '', '2026-01-24 09:53:06', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (316, 208, '高一(8)班', 2, '数学', 1002, '数学老师1', 5, 4, '0', '教室8', '2025-2026-1', '', '2026-01-24 09:53:07', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (317, 208, '高一(8)班', 3, '英语', 1001, '班主任1', 5, 5, '1', '教室8', '2025-2026-1', '', '2026-01-24 09:53:07', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (318, 208, '高一(8)班', 4, '物理', 1002, '数学老师1', 5, 6, '1', '教室8', '2025-2026-1', '', '2026-01-24 09:53:07', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (319, 208, '高一(8)班', 5, '化学', 1001, '班主任1', 5, 7, '1', '教室8', '2025-2026-1', '', '2026-01-24 09:53:07', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (320, 208, '高一(8)班', 6, '生物', 1002, '数学老师1', 5, 8, '1', '教室8', '2025-2026-1', '', '2026-01-24 09:53:07', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (321, 209, '高一(9)班', 4, '物理', 1002, '数学老师1', 1, 1, '0', '教室9', '2025-2026-1', '', '2026-01-24 09:53:07', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (322, 209, '高一(9)班', 5, '化学', 1001, '班主任1', 1, 2, '0', '教室9', '2025-2026-1', '', '2026-01-24 09:53:07', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (323, 209, '高一(9)班', 6, '生物', 1002, '数学老师1', 1, 3, '0', '教室9', '2025-2026-1', '', '2026-01-24 09:53:07', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (324, 209, '高一(9)班', 7, '历史', 1001, '班主任1', 1, 4, '0', '教室9', '2025-2026-1', '', '2026-01-24 09:53:07', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (325, 209, '高一(9)班', 8, '地理', 1002, '数学老师1', 1, 5, '1', '教室9', '2025-2026-1', '', '2026-01-24 09:53:07', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (326, 209, '高一(9)班', 1, '语文', 1001, '班主任1', 1, 6, '1', '教室9', '2025-2026-1', '', '2026-01-24 09:53:07', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (327, 209, '高一(9)班', 2, '数学', 1002, '数学老师1', 1, 7, '1', '教室9', '2025-2026-1', '', '2026-01-24 09:53:07', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (328, 209, '高一(9)班', 3, '英语', 1001, '班主任1', 1, 8, '1', '教室9', '2025-2026-1', '', '2026-01-24 09:53:07', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (329, 209, '高一(9)班', 5, '化学', 1001, '班主任1', 2, 1, '0', '教室9', '2025-2026-1', '', '2026-01-24 09:53:07', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (330, 209, '高一(9)班', 6, '生物', 1002, '数学老师1', 2, 2, '0', '教室9', '2025-2026-1', '', '2026-01-24 09:53:07', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (331, 209, '高一(9)班', 7, '历史', 1001, '班主任1', 2, 3, '0', '教室9', '2025-2026-1', '', '2026-01-24 09:53:07', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (332, 209, '高一(9)班', 8, '地理', 1002, '数学老师1', 2, 4, '0', '教室9', '2025-2026-1', '', '2026-01-24 09:53:07', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (333, 209, '高一(9)班', 1, '语文', 1001, '班主任1', 2, 5, '1', '教室9', '2025-2026-1', '', '2026-01-24 09:53:07', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (334, 209, '高一(9)班', 2, '数学', 1002, '数学老师1', 2, 6, '1', '教室9', '2025-2026-1', '', '2026-01-24 09:53:07', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (335, 209, '高一(9)班', 3, '英语', 1001, '班主任1', 2, 7, '1', '教室9', '2025-2026-1', '', '2026-01-24 09:53:07', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (336, 209, '高一(9)班', 4, '物理', 1002, '数学老师1', 2, 8, '1', '教室9', '2025-2026-1', '', '2026-01-24 09:53:07', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (337, 209, '高一(9)班', 6, '生物', 1002, '数学老师1', 3, 1, '0', '教室9', '2025-2026-1', '', '2026-01-24 09:53:07', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (338, 209, '高一(9)班', 7, '历史', 1001, '班主任1', 3, 2, '0', '教室9', '2025-2026-1', '', '2026-01-24 09:53:07', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (339, 209, '高一(9)班', 8, '地理', 1002, '数学老师1', 3, 3, '0', '教室9', '2025-2026-1', '', '2026-01-24 09:53:07', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (340, 209, '高一(9)班', 1, '语文', 1001, '班主任1', 3, 4, '0', '教室9', '2025-2026-1', '', '2026-01-24 09:53:07', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (341, 209, '高一(9)班', 2, '数学', 1002, '数学老师1', 3, 5, '1', '教室9', '2025-2026-1', '', '2026-01-24 09:53:07', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (342, 209, '高一(9)班', 3, '英语', 1001, '班主任1', 3, 6, '1', '教室9', '2025-2026-1', '', '2026-01-24 09:53:07', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (343, 209, '高一(9)班', 4, '物理', 1002, '数学老师1', 3, 7, '1', '教室9', '2025-2026-1', '', '2026-01-24 09:53:07', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (344, 209, '高一(9)班', 5, '化学', 1001, '班主任1', 3, 8, '1', '教室9', '2025-2026-1', '', '2026-01-24 09:53:07', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (345, 209, '高一(9)班', 7, '历史', 1001, '班主任1', 4, 1, '0', '教室9', '2025-2026-1', '', '2026-01-24 09:53:07', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (346, 209, '高一(9)班', 8, '地理', 1002, '数学老师1', 4, 2, '0', '教室9', '2025-2026-1', '', '2026-01-24 09:53:07', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (347, 209, '高一(9)班', 1, '语文', 1001, '班主任1', 4, 3, '0', '教室9', '2025-2026-1', '', '2026-01-24 09:53:07', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (348, 209, '高一(9)班', 2, '数学', 1002, '数学老师1', 4, 4, '0', '教室9', '2025-2026-1', '', '2026-01-24 09:53:07', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (349, 209, '高一(9)班', 3, '英语', 1001, '班主任1', 4, 5, '1', '教室9', '2025-2026-1', '', '2026-01-24 09:53:07', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (350, 209, '高一(9)班', 4, '物理', 1002, '数学老师1', 4, 6, '1', '教室9', '2025-2026-1', '', '2026-01-24 09:53:07', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (351, 209, '高一(9)班', 5, '化学', 1001, '班主任1', 4, 7, '1', '教室9', '2025-2026-1', '', '2026-01-24 09:53:07', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (352, 209, '高一(9)班', 6, '生物', 1002, '数学老师1', 4, 8, '1', '教室9', '2025-2026-1', '', '2026-01-24 09:53:07', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (353, 209, '高一(9)班', 8, '地理', 1002, '数学老师1', 5, 1, '0', '教室9', '2025-2026-1', '', '2026-01-24 09:53:07', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (354, 209, '高一(9)班', 1, '语文', 1001, '班主任1', 5, 2, '0', '教室9', '2025-2026-1', '', '2026-01-24 09:53:07', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (355, 209, '高一(9)班', 2, '数学', 1002, '数学老师1', 5, 3, '0', '教室9', '2025-2026-1', '', '2026-01-24 09:53:07', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (356, 209, '高一(9)班', 3, '英语', 1001, '班主任1', 5, 4, '0', '教室9', '2025-2026-1', '', '2026-01-24 09:53:07', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (357, 209, '高一(9)班', 4, '物理', 1002, '数学老师1', 5, 5, '1', '教室9', '2025-2026-1', '', '2026-01-24 09:53:07', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (358, 209, '高一(9)班', 5, '化学', 1001, '班主任1', 5, 6, '1', '教室9', '2025-2026-1', '', '2026-01-24 09:53:07', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (359, 209, '高一(9)班', 6, '生物', 1002, '数学老师1', 5, 7, '1', '教室9', '2025-2026-1', '', '2026-01-24 09:53:07', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (360, 209, '高一(9)班', 7, '历史', 1001, '班主任1', 5, 8, '1', '教室9', '2025-2026-1', '', '2026-01-24 09:53:08', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (361, 210, '高一(10)班', 5, '化学', 1001, '班主任1', 1, 1, '0', '教室10', '2025-2026-1', '', '2026-01-24 09:53:08', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (362, 210, '高一(10)班', 6, '生物', 1002, '数学老师1', 1, 2, '0', '教室10', '2025-2026-1', '', '2026-01-24 09:53:08', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (363, 210, '高一(10)班', 7, '历史', 1001, '班主任1', 1, 3, '0', '教室10', '2025-2026-1', '', '2026-01-24 09:53:08', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (364, 210, '高一(10)班', 8, '地理', 1002, '数学老师1', 1, 4, '0', '教室10', '2025-2026-1', '', '2026-01-24 09:53:08', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (365, 210, '高一(10)班', 1, '语文', 1001, '班主任1', 1, 5, '1', '教室10', '2025-2026-1', '', '2026-01-24 09:53:08', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (366, 210, '高一(10)班', 2, '数学', 1002, '数学老师1', 1, 6, '1', '教室10', '2025-2026-1', '', '2026-01-24 09:53:08', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (367, 210, '高一(10)班', 3, '英语', 1001, '班主任1', 1, 7, '1', '教室10', '2025-2026-1', '', '2026-01-24 09:53:08', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (368, 210, '高一(10)班', 4, '物理', 1002, '数学老师1', 1, 8, '1', '教室10', '2025-2026-1', '', '2026-01-24 09:53:08', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (369, 210, '高一(10)班', 6, '生物', 1002, '数学老师1', 2, 1, '0', '教室10', '2025-2026-1', '', '2026-01-24 09:53:08', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (370, 210, '高一(10)班', 7, '历史', 1001, '班主任1', 2, 2, '0', '教室10', '2025-2026-1', '', '2026-01-24 09:53:08', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (371, 210, '高一(10)班', 8, '地理', 1002, '数学老师1', 2, 3, '0', '教室10', '2025-2026-1', '', '2026-01-24 09:53:08', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (372, 210, '高一(10)班', 1, '语文', 1001, '班主任1', 2, 4, '0', '教室10', '2025-2026-1', '', '2026-01-24 09:53:08', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (373, 210, '高一(10)班', 2, '数学', 1002, '数学老师1', 2, 5, '1', '教室10', '2025-2026-1', '', '2026-01-24 09:53:08', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (374, 210, '高一(10)班', 3, '英语', 1001, '班主任1', 2, 6, '1', '教室10', '2025-2026-1', '', '2026-01-24 09:53:08', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (375, 210, '高一(10)班', 4, '物理', 1002, '数学老师1', 2, 7, '1', '教室10', '2025-2026-1', '', '2026-01-24 09:53:08', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (376, 210, '高一(10)班', 5, '化学', 1001, '班主任1', 2, 8, '1', '教室10', '2025-2026-1', '', '2026-01-24 09:53:08', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (377, 210, '高一(10)班', 7, '历史', 1001, '班主任1', 3, 1, '0', '教室10', '2025-2026-1', '', '2026-01-24 09:53:08', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (378, 210, '高一(10)班', 8, '地理', 1002, '数学老师1', 3, 2, '0', '教室10', '2025-2026-1', '', '2026-01-24 09:53:08', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (379, 210, '高一(10)班', 1, '语文', 1001, '班主任1', 3, 3, '0', '教室10', '2025-2026-1', '', '2026-01-24 09:53:08', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (380, 210, '高一(10)班', 2, '数学', 1002, '数学老师1', 3, 4, '0', '教室10', '2025-2026-1', '', '2026-01-24 09:53:08', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (381, 210, '高一(10)班', 3, '英语', 1001, '班主任1', 3, 5, '1', '教室10', '2025-2026-1', '', '2026-01-24 09:53:08', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (382, 210, '高一(10)班', 4, '物理', 1002, '数学老师1', 3, 6, '1', '教室10', '2025-2026-1', '', '2026-01-24 09:53:08', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (383, 210, '高一(10)班', 5, '化学', 1001, '班主任1', 3, 7, '1', '教室10', '2025-2026-1', '', '2026-01-24 09:53:08', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (384, 210, '高一(10)班', 6, '生物', 1002, '数学老师1', 3, 8, '1', '教室10', '2025-2026-1', '', '2026-01-24 09:53:08', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (385, 210, '高一(10)班', 8, '地理', 1002, '数学老师1', 4, 1, '0', '教室10', '2025-2026-1', '', '2026-01-24 09:53:08', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (386, 210, '高一(10)班', 1, '语文', 1001, '班主任1', 4, 2, '0', '教室10', '2025-2026-1', '', '2026-01-24 09:53:08', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (387, 210, '高一(10)班', 2, '数学', 1002, '数学老师1', 4, 3, '0', '教室10', '2025-2026-1', '', '2026-01-24 09:53:08', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (388, 210, '高一(10)班', 3, '英语', 1001, '班主任1', 4, 4, '0', '教室10', '2025-2026-1', '', '2026-01-24 09:53:08', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (389, 210, '高一(10)班', 4, '物理', 1002, '数学老师1', 4, 5, '1', '教室10', '2025-2026-1', '', '2026-01-24 09:53:08', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (390, 210, '高一(10)班', 5, '化学', 1001, '班主任1', 4, 6, '1', '教室10', '2025-2026-1', '', '2026-01-24 09:53:08', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (391, 210, '高一(10)班', 6, '生物', 1002, '数学老师1', 4, 7, '1', '教室10', '2025-2026-1', '', '2026-01-24 09:53:08', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (392, 210, '高一(10)班', 7, '历史', 1001, '班主任1', 4, 8, '1', '教室10', '2025-2026-1', '', '2026-01-24 09:53:08', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (393, 210, '高一(10)班', 1, '语文', 1001, '班主任1', 5, 1, '0', '教室10', '2025-2026-1', '', '2026-01-24 09:53:08', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (394, 210, '高一(10)班', 2, '数学', 1002, '数学老师1', 5, 2, '0', '教室10', '2025-2026-1', '', '2026-01-24 09:53:08', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (395, 210, '高一(10)班', 3, '英语', 1001, '班主任1', 5, 3, '0', '教室10', '2025-2026-1', '', '2026-01-24 09:53:08', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (396, 210, '高一(10)班', 4, '物理', 1002, '数学老师1', 5, 4, '0', '教室10', '2025-2026-1', '', '2026-01-24 09:53:08', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (397, 210, '高一(10)班', 5, '化学', 1001, '班主任1', 5, 5, '1', '教室10', '2025-2026-1', '', '2026-01-24 09:53:08', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (398, 210, '高一(10)班', 6, '生物', 1002, '数学老师1', 5, 6, '1', '教室10', '2025-2026-1', '', '2026-01-24 09:53:08', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (399, 210, '高一(10)班', 7, '历史', 1001, '班主任1', 5, 7, '1', '教室10', '2025-2026-1', '', '2026-01-24 09:53:08', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (400, 210, '高一(10)班', 8, '地理', 1002, '数学老师1', 5, 8, '1', '教室10', '2025-2026-1', '', '2026-01-24 09:53:08', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (401, 202, '高一(2)班', 3, '英语', 1001, '班主任1', 6, 2, '0', '1实验', NULL, '', '2026-01-26 13:44:12', '', NULL, NULL);
INSERT INTO `hs_schedule` VALUES (402, 201, '高一(1)班', 3, '英语', 1001, '班主任1', 6, 1, '0', '1石油', NULL, '', '2026-01-26 13:45:30', '', NULL, NULL);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日历信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度器状态表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for school_class_teacher
-- ----------------------------
DROP TABLE IF EXISTS `school_class_teacher`;
CREATE TABLE `school_class_teacher`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `class_id` bigint NOT NULL COMMENT '班级ID',
  `teacher_id` bigint NOT NULL COMMENT '教师ID',
  `subject` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '科目',
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '2' COMMENT '类型（1班主任 2科任老师）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '班级科任老师关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of school_class_teacher
-- ----------------------------
INSERT INTO `school_class_teacher` VALUES (1, 201, 1001, '语文', '1');
INSERT INTO `school_class_teacher` VALUES (2, 201, 1001, '语文', '2');
INSERT INTO `school_class_teacher` VALUES (3, 201, 1002, '数学', '2');
INSERT INTO `school_class_teacher` VALUES (4, 202, 1001, '语文', '2');

-- ----------------------------
-- Table structure for school_class_video
-- ----------------------------
DROP TABLE IF EXISTS `school_class_video`;
CREATE TABLE `school_class_video`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '视频ID',
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '视频标题',
  `video_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '视频地址',
  `cover_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '封面地址',
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '简介',
  `class_id` bigint NULL DEFAULT NULL COMMENT '所属班级ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '上传者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '上传时间',
  `subject` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科目',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '班级视频表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of school_class_video
-- ----------------------------
INSERT INTO `school_class_video` VALUES (1, '测试', '/profile/upload/2026/01/14/倒计时(20s)_哔哩哔哩_bilibili_20260114033312A002.mp4', '/profile/upload/2026/01/14/1732253894898_20260114033302A001.jpg', '测试', 100, '', '2026-01-14 03:33:18', '语文');

-- ----------------------------
-- Table structure for sys_class
-- ----------------------------
DROP TABLE IF EXISTS `sys_class`;
CREATE TABLE `sys_class`  (
  `class_id` bigint NOT NULL AUTO_INCREMENT COMMENT '班级ID',
  `class_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '班级名称',
  `grade_level` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年级',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`class_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '班级信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_class
-- ----------------------------
INSERT INTO `sys_class` VALUES (1, '1', '2', '0', '', '2025-12-27 02:01:02', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2025-12-18 18:10:56', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2025-12-18 18:10:56', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2025-12-18 18:10:56', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2025-12-18 18:10:56', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2025-12-18 18:10:56', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2025-12-18 18:10:56', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
INSERT INTO `sys_config` VALUES (7, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '1', 'Y', 'admin', '2025-12-18 18:10:56', '', NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (8, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2025-12-18 18:10:56', '', NULL, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');

-- ----------------------------
-- Table structure for sys_course
-- ----------------------------
DROP TABLE IF EXISTS `sys_course`;
CREATE TABLE `sys_course`  (
  `course_id` bigint NOT NULL AUTO_INCREMENT COMMENT '课程ID',
  `course_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程名称',
  `course_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程编码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`course_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课程信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_course
-- ----------------------------
INSERT INTO `sys_course` VALUES (1, '数学', '1', '0', '', '2025-12-27 02:01:17', '', NULL, NULL);
INSERT INTO `sys_course` VALUES (2, '语文', '2', '0', '', '2026-01-25 00:18:24', '', NULL, NULL);
INSERT INTO `sys_course` VALUES (3, '英语', '1265', '0', '', '2026-01-26 13:29:36', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 211 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '石油中学', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-12-18 18:10:55', 'admin', '2025-12-21 23:27:08');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '高二年级', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-12-18 18:10:55', 'admin', '2026-01-24 09:54:08');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '高三年级', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-12-18 18:10:55', 'admin', '2026-01-24 09:55:10');
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '高二(1)班', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-12-18 18:10:55', 'admin', '2026-01-24 09:54:16');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '高二(2)班', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-12-18 18:10:55', 'admin', '2026-01-24 09:54:22');
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '高二(3)班', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-12-18 18:10:55', 'admin', '2026-01-24 09:54:27');
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '高二(4)班', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-12-18 18:10:55', 'admin', '2026-01-24 09:54:40');
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '高二(5)班', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-12-18 18:10:55', 'admin', '2026-01-24 09:54:48');
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '高三(1)班', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-12-18 18:10:55', 'admin', '2026-01-24 09:55:19');
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '高三(2)班', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-12-18 18:10:55', 'admin', '2026-01-24 09:55:26');
INSERT INTO `sys_dept` VALUES (110, 100, '0,100', '高一(10)班', 3, NULL, NULL, NULL, '0', '2', 'admin', '2026-01-24 09:31:30', '', NULL);
INSERT INTO `sys_dept` VALUES (200, 100, '0,100', '高一年级', 1, 'HS', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-01-24 09:52:57', '', NULL);
INSERT INTO `sys_dept` VALUES (201, 200, '0,100,200', '高一(1)班', 1, 'HS', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-01-24 09:52:57', '', NULL);
INSERT INTO `sys_dept` VALUES (202, 200, '0,100,200', '高一(2)班', 2, 'HS', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-01-24 09:52:57', '', NULL);
INSERT INTO `sys_dept` VALUES (203, 200, '0,100,200', '高一(3)班', 3, 'HS', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-01-24 09:52:57', '', NULL);
INSERT INTO `sys_dept` VALUES (204, 200, '0,100,200', '高一(4)班', 4, 'HS', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-01-24 09:52:57', '', NULL);
INSERT INTO `sys_dept` VALUES (205, 200, '0,100,200', '高一(5)班', 5, 'HS', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-01-24 09:52:57', '', NULL);
INSERT INTO `sys_dept` VALUES (206, 200, '0,100,200', '高一(6)班', 6, 'HS', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-01-24 09:52:57', '', NULL);
INSERT INTO `sys_dept` VALUES (207, 200, '0,100,200', '高一(7)班', 7, 'HS', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-01-24 09:52:57', '', NULL);
INSERT INTO `sys_dept` VALUES (208, 200, '0,100,200', '高一(8)班', 8, 'HS', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-01-24 09:52:57', '', NULL);
INSERT INTO `sys_dept` VALUES (209, 200, '0,100,200', '高一(9)班', 9, 'HS', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-01-24 09:52:57', '', NULL);
INSERT INTO `sys_dept` VALUES (210, 200, '0,100,200', '高一(10)班', 10, 'HS', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-01-24 09:52:57', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2025-12-18 18:10:56', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-12-18 18:10:56', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-12-18 18:10:56', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2025-12-18 18:10:56', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2025-12-18 18:10:56', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2025-12-18 18:10:56', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2025-12-18 18:10:56', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2025-12-18 18:10:56', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2025-12-18 18:10:56', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2025-12-18 18:10:56', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2025-12-18 18:10:56', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2025-12-18 18:10:56', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2025-12-18 18:10:56', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2025-12-18 18:10:56', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2025-12-18 18:10:56', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2025-12-18 18:10:56', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2025-12-18 18:10:56', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-12-18 18:10:56', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-12-18 18:10:56', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-12-18 18:10:56', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-12-18 18:10:56', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2025-12-18 18:10:56', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-12-18 18:10:56', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-12-18 18:10:56', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-12-18 18:10:56', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-12-18 18:10:56', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-12-18 18:10:56', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2025-12-18 18:10:56', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2025-12-18 18:10:56', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2025-12-18 18:10:56', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2025-12-18 18:10:56', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2025-12-18 18:10:56', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2025-12-18 18:10:56', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2025-12-18 18:10:56', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2025-12-18 18:10:56', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2025-12-18 18:10:56', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2025-12-18 18:10:56', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2025-12-18 18:10:56', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2025-12-18 18:10:56', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2025-12-18 18:10:56', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2025-12-18 18:10:56', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2025-12-18 18:10:56', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 462 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (1, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-18 18:42:49');
INSERT INTO `sys_logininfor` VALUES (2, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-21 20:06:06');
INSERT INTO `sys_logininfor` VALUES (3, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2025-12-21 20:13:17');
INSERT INTO `sys_logininfor` VALUES (4, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '验证码错误', '2025-12-21 20:25:06');
INSERT INTO `sys_logininfor` VALUES (5, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-21 20:25:11');
INSERT INTO `sys_logininfor` VALUES (6, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2025-12-21 20:26:49');
INSERT INTO `sys_logininfor` VALUES (7, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-21 20:26:53');
INSERT INTO `sys_logininfor` VALUES (8, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2025-12-21 20:27:42');
INSERT INTO `sys_logininfor` VALUES (9, 'ry', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-21 20:27:57');
INSERT INTO `sys_logininfor` VALUES (10, 'ry', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2025-12-21 20:28:07');
INSERT INTO `sys_logininfor` VALUES (11, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-21 20:28:18');
INSERT INTO `sys_logininfor` VALUES (12, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2025-12-21 20:31:35');
INSERT INTO `sys_logininfor` VALUES (13, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-21 20:31:42');
INSERT INTO `sys_logininfor` VALUES (14, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2025-12-21 20:32:17');
INSERT INTO `sys_logininfor` VALUES (15, 'ry', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '验证码错误', '2025-12-21 20:32:25');
INSERT INTO `sys_logininfor` VALUES (16, 'ry', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-21 20:32:30');
INSERT INTO `sys_logininfor` VALUES (17, 'ry', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2025-12-21 20:38:47');
INSERT INTO `sys_logininfor` VALUES (18, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-21 20:38:57');
INSERT INTO `sys_logininfor` VALUES (19, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2025-12-21 20:39:44');
INSERT INTO `sys_logininfor` VALUES (20, 'ry', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-21 20:39:51');
INSERT INTO `sys_logininfor` VALUES (21, 'ry', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2025-12-21 20:40:52');
INSERT INTO `sys_logininfor` VALUES (22, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-21 20:40:58');
INSERT INTO `sys_logininfor` VALUES (23, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2025-12-21 20:43:56');
INSERT INTO `sys_logininfor` VALUES (24, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-21 20:44:01');
INSERT INTO `sys_logininfor` VALUES (25, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2025-12-21 20:45:11');
INSERT INTO `sys_logininfor` VALUES (26, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-21 20:45:15');
INSERT INTO `sys_logininfor` VALUES (27, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2025-12-21 20:45:25');
INSERT INTO `sys_logininfor` VALUES (28, 'ry', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-21 20:45:36');
INSERT INTO `sys_logininfor` VALUES (29, 'ry', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2025-12-21 20:45:39');
INSERT INTO `sys_logininfor` VALUES (30, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-21 20:45:52');
INSERT INTO `sys_logininfor` VALUES (31, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2025-12-21 20:58:18');
INSERT INTO `sys_logininfor` VALUES (32, '11', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '用户不存在/密码错误', '2025-12-21 20:58:22');
INSERT INTO `sys_logininfor` VALUES (33, '11', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '验证码错误', '2025-12-21 20:58:24');
INSERT INTO `sys_logininfor` VALUES (34, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-21 20:58:50');
INSERT INTO `sys_logininfor` VALUES (35, '11', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '用户不存在/密码错误', '2025-12-21 20:59:47');
INSERT INTO `sys_logininfor` VALUES (36, '11', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '验证码错误', '2025-12-21 20:59:52');
INSERT INTO `sys_logininfor` VALUES (37, '11', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-21 21:00:02');
INSERT INTO `sys_logininfor` VALUES (38, '11', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2025-12-21 21:00:44');
INSERT INTO `sys_logininfor` VALUES (39, '11', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '用户不存在/密码错误', '2025-12-21 21:00:51');
INSERT INTO `sys_logininfor` VALUES (40, '11', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '验证码错误', '2025-12-21 21:00:56');
INSERT INTO `sys_logininfor` VALUES (41, '11', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-21 21:00:59');
INSERT INTO `sys_logininfor` VALUES (42, '11', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2025-12-21 21:01:49');
INSERT INTO `sys_logininfor` VALUES (43, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-21 22:51:25');
INSERT INTO `sys_logininfor` VALUES (44, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2025-12-21 23:31:02');
INSERT INTO `sys_logininfor` VALUES (45, 'ry', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-21 23:31:11');
INSERT INTO `sys_logininfor` VALUES (46, 'ry', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2025-12-21 23:31:23');
INSERT INTO `sys_logininfor` VALUES (47, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-21 23:31:30');
INSERT INTO `sys_logininfor` VALUES (48, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2025-12-21 23:48:01');
INSERT INTO `sys_logininfor` VALUES (49, 'ry', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '验证码错误', '2025-12-21 23:48:10');
INSERT INTO `sys_logininfor` VALUES (50, 'ry', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-21 23:48:14');
INSERT INTO `sys_logininfor` VALUES (51, 'ry', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2025-12-21 23:53:31');
INSERT INTO `sys_logininfor` VALUES (52, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-21 23:53:36');
INSERT INTO `sys_logininfor` VALUES (53, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-22 10:59:59');
INSERT INTO `sys_logininfor` VALUES (54, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2025-12-22 11:08:14');
INSERT INTO `sys_logininfor` VALUES (55, 'ry', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-22 11:08:22');
INSERT INTO `sys_logininfor` VALUES (56, 'ry', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2025-12-22 11:08:34');
INSERT INTO `sys_logininfor` VALUES (57, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '验证码错误', '2025-12-22 11:08:38');
INSERT INTO `sys_logininfor` VALUES (58, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-22 11:08:43');
INSERT INTO `sys_logininfor` VALUES (59, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2025-12-22 11:10:51');
INSERT INTO `sys_logininfor` VALUES (60, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-22 11:10:57');
INSERT INTO `sys_logininfor` VALUES (61, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2025-12-22 11:11:01');
INSERT INTO `sys_logininfor` VALUES (62, 'ry', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-22 11:11:07');
INSERT INTO `sys_logininfor` VALUES (63, 'ry', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2025-12-22 11:13:56');
INSERT INTO `sys_logininfor` VALUES (64, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-22 11:14:00');
INSERT INTO `sys_logininfor` VALUES (65, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2025-12-22 11:14:31');
INSERT INTO `sys_logininfor` VALUES (66, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-22 11:14:35');
INSERT INTO `sys_logininfor` VALUES (67, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2025-12-22 11:16:08');
INSERT INTO `sys_logininfor` VALUES (68, 'ry', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-22 11:16:15');
INSERT INTO `sys_logininfor` VALUES (69, 'ry', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2025-12-22 11:16:31');
INSERT INTO `sys_logininfor` VALUES (70, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-22 11:35:47');
INSERT INTO `sys_logininfor` VALUES (71, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2025-12-22 11:37:46');
INSERT INTO `sys_logininfor` VALUES (72, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '用户不存在/密码错误', '2025-12-22 11:37:53');
INSERT INTO `sys_logininfor` VALUES (73, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '用户不存在/密码错误', '2025-12-22 11:38:01');
INSERT INTO `sys_logininfor` VALUES (74, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-22 11:38:09');
INSERT INTO `sys_logininfor` VALUES (75, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2025-12-22 11:38:44');
INSERT INTO `sys_logininfor` VALUES (76, '学生', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '用户不存在/密码错误', '2025-12-22 11:38:53');
INSERT INTO `sys_logininfor` VALUES (77, '学生', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '验证码错误', '2025-12-22 11:38:58');
INSERT INTO `sys_logininfor` VALUES (78, '学生', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-22 11:39:03');
INSERT INTO `sys_logininfor` VALUES (79, '学生', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2025-12-22 11:39:15');
INSERT INTO `sys_logininfor` VALUES (80, '学生', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-22 18:45:38');
INSERT INTO `sys_logininfor` VALUES (81, '学生', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2025-12-22 18:45:56');
INSERT INTO `sys_logininfor` VALUES (82, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '用户不存在/密码错误', '2025-12-22 18:46:05');
INSERT INTO `sys_logininfor` VALUES (83, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '用户不存在/密码错误', '2025-12-22 18:46:13');
INSERT INTO `sys_logininfor` VALUES (84, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '用户不存在/密码错误', '2025-12-22 18:46:37');
INSERT INTO `sys_logininfor` VALUES (85, 'root', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '用户不存在/密码错误', '2025-12-22 18:46:51');
INSERT INTO `sys_logininfor` VALUES (86, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '用户不存在/密码错误', '2025-12-22 18:47:03');
INSERT INTO `sys_logininfor` VALUES (87, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '验证码错误', '2025-12-22 18:47:12');
INSERT INTO `sys_logininfor` VALUES (88, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '用户不存在/密码错误', '2025-12-22 18:47:16');
INSERT INTO `sys_logininfor` VALUES (89, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '密码输入错误5次，帐户锁定10分钟', '2025-12-22 18:49:02');
INSERT INTO `sys_logininfor` VALUES (90, 'ry', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '用户不存在/密码错误', '2025-12-22 18:49:52');
INSERT INTO `sys_logininfor` VALUES (91, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '用户不存在/密码错误', '2025-12-22 18:51:49');
INSERT INTO `sys_logininfor` VALUES (92, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '用户不存在/密码错误', '2025-12-22 18:52:07');
INSERT INTO `sys_logininfor` VALUES (93, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '用户不存在/密码错误', '2025-12-22 18:54:31');
INSERT INTO `sys_logininfor` VALUES (94, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '验证码已失效', '2025-12-22 19:00:39');
INSERT INTO `sys_logininfor` VALUES (95, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '用户不存在/密码错误', '2025-12-22 19:00:44');
INSERT INTO `sys_logininfor` VALUES (96, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '验证码错误', '2025-12-22 19:00:50');
INSERT INTO `sys_logininfor` VALUES (97, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '用户不存在/密码错误', '2025-12-22 19:00:55');
INSERT INTO `sys_logininfor` VALUES (98, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '用户不存在/密码错误', '2025-12-22 19:01:28');
INSERT INTO `sys_logininfor` VALUES (99, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-22 19:05:50');
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2025-12-22 19:06:40');
INSERT INTO `sys_logininfor` VALUES (101, 'ry', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-22 19:06:50');
INSERT INTO `sys_logininfor` VALUES (102, 'ry', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2025-12-22 19:07:08');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-22 19:07:14');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2025-12-22 19:10:26');
INSERT INTO `sys_logininfor` VALUES (105, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-22 19:10:36');
INSERT INTO `sys_logininfor` VALUES (106, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2025-12-22 19:10:45');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '验证码已失效', '2025-12-23 01:14:46');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-23 01:14:54');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '验证码错误', '2025-12-23 02:00:05');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-23 02:00:09');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-24 01:09:24');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-24 09:04:04');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-25 00:08:16');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2025-12-25 00:17:29');
INSERT INTO `sys_logininfor` VALUES (115, 'ry', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-25 00:17:40');
INSERT INTO `sys_logininfor` VALUES (116, 'ry', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2025-12-25 00:17:48');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-25 00:17:56');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2025-12-25 00:18:37');
INSERT INTO `sys_logininfor` VALUES (119, '科任老师', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-25 00:18:46');
INSERT INTO `sys_logininfor` VALUES (120, '科任老师', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2025-12-25 00:19:12');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-25 00:19:18');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2025-12-25 00:20:45');
INSERT INTO `sys_logininfor` VALUES (123, '科任老师', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-25 00:20:55');
INSERT INTO `sys_logininfor` VALUES (124, '科任老师', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2025-12-25 00:54:37');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-25 00:54:42');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-25 23:45:53');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2025-12-26 00:49:03');
INSERT INTO `sys_logininfor` VALUES (128, '学生', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-26 00:49:16');
INSERT INTO `sys_logininfor` VALUES (129, '学生', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2025-12-26 00:49:23');
INSERT INTO `sys_logininfor` VALUES (130, 'ry', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '用户不存在/密码错误', '2025-12-26 00:49:36');
INSERT INTO `sys_logininfor` VALUES (131, 'ry', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '验证码错误', '2025-12-26 00:49:40');
INSERT INTO `sys_logininfor` VALUES (132, 'ry', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-26 00:49:44');
INSERT INTO `sys_logininfor` VALUES (133, 'ry', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2025-12-26 00:49:48');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-26 00:49:54');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2025-12-26 01:01:48');
INSERT INTO `sys_logininfor` VALUES (136, '科任老师', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '用户不存在/密码错误', '2025-12-26 01:01:55');
INSERT INTO `sys_logininfor` VALUES (137, '科任老师', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-26 01:02:04');
INSERT INTO `sys_logininfor` VALUES (138, '科任老师', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2025-12-26 01:10:52');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-26 01:10:56');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-27 01:00:55');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2025-12-27 02:36:36');
INSERT INTO `sys_logininfor` VALUES (142, '科任老师', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-27 02:36:45');
INSERT INTO `sys_logininfor` VALUES (143, '科任老师', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2025-12-27 02:36:54');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-27 02:37:03');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2025-12-27 02:39:56');
INSERT INTO `sys_logininfor` VALUES (146, '科任老师', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-27 02:40:13');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-27 08:52:57');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-27 23:35:25');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-28 08:49:11');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-29 00:41:13');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-30 00:24:08');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-31 00:39:36');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2025-12-31 00:42:28');
INSERT INTO `sys_logininfor` VALUES (154, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '验证码错误', '2025-12-31 00:42:50');
INSERT INTO `sys_logininfor` VALUES (155, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-31 00:43:00');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-31 00:43:07');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2025-12-31 00:43:15');
INSERT INTO `sys_logininfor` VALUES (158, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2025-12-31 00:43:26');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '0', '登录成功', '2025-12-31 00:53:46');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '验证码错误', '2026-01-01 00:34:01');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-01 00:34:05');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2026-01-01 00:38:31');
INSERT INTO `sys_logininfor` VALUES (163, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '验证码错误', '2026-01-01 00:38:41');
INSERT INTO `sys_logininfor` VALUES (164, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-01 00:38:46');
INSERT INTO `sys_logininfor` VALUES (165, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2026-01-01 01:08:03');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-01 01:08:09');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2026-01-01 01:08:30');
INSERT INTO `sys_logininfor` VALUES (168, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '验证码错误', '2026-01-01 01:08:39');
INSERT INTO `sys_logininfor` VALUES (169, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-01 01:08:43');
INSERT INTO `sys_logininfor` VALUES (170, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2026-01-01 01:13:03');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '验证码错误', '2026-01-01 01:13:03');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-01 01:13:09');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2026-01-01 01:13:38');
INSERT INTO `sys_logininfor` VALUES (174, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-01 01:13:48');
INSERT INTO `sys_logininfor` VALUES (175, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2026-01-01 01:16:06');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-01 01:16:08');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2026-01-01 01:16:48');
INSERT INTO `sys_logininfor` VALUES (178, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-01 01:17:00');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '0', '登录成功', '2026-01-02 00:10:00');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-02 00:17:20');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2026-01-02 00:17:25');
INSERT INTO `sys_logininfor` VALUES (182, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-02 00:17:34');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-02 00:53:34');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2026-01-02 00:53:39');
INSERT INTO `sys_logininfor` VALUES (185, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-02 00:53:48');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '0', '登录成功', '2026-01-02 00:59:16');
INSERT INTO `sys_logininfor` VALUES (187, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2026-01-02 01:09:12');
INSERT INTO `sys_logininfor` VALUES (188, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-02 01:09:20');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '1', '验证码已失效', '2026-01-03 00:08:59');
INSERT INTO `sys_logininfor` VALUES (190, 'wkk', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '1', '验证码错误', '2026-01-03 00:09:11');
INSERT INTO `sys_logininfor` VALUES (191, 'wkk', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '0', '登录成功', '2026-01-03 00:09:15');
INSERT INTO `sys_logininfor` VALUES (192, 'wkk', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '0', '退出成功', '2026-01-03 00:09:45');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '0', '登录成功', '2026-01-03 00:09:52');
INSERT INTO `sys_logininfor` VALUES (194, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '验证码错误', '2026-01-03 00:11:03');
INSERT INTO `sys_logininfor` VALUES (195, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-03 00:11:07');
INSERT INTO `sys_logininfor` VALUES (196, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2026-01-03 00:39:25');
INSERT INTO `sys_logininfor` VALUES (197, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '用户不存在/密码错误', '2026-01-03 00:39:29');
INSERT INTO `sys_logininfor` VALUES (198, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-03 00:39:42');
INSERT INTO `sys_logininfor` VALUES (199, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2026-01-03 00:43:27');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '用户不存在/密码错误', '2026-01-03 00:43:33');
INSERT INTO `sys_logininfor` VALUES (201, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-03 00:43:42');
INSERT INTO `sys_logininfor` VALUES (202, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-04 00:30:02');
INSERT INTO `sys_logininfor` VALUES (203, 'admin', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '0', '登录成功', '2026-01-04 00:30:15');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-05 01:35:32');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2026-01-05 01:35:47');
INSERT INTO `sys_logininfor` VALUES (206, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-05 01:35:58');
INSERT INTO `sys_logininfor` VALUES (207, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-06 00:52:39');
INSERT INTO `sys_logininfor` VALUES (208, 'admin', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '0', '登录成功', '2026-01-06 00:54:05');
INSERT INTO `sys_logininfor` VALUES (209, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '验证码已失效', '2026-01-07 00:41:42');
INSERT INTO `sys_logininfor` VALUES (210, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-07 00:41:46');
INSERT INTO `sys_logininfor` VALUES (211, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-07 08:42:20');
INSERT INTO `sys_logininfor` VALUES (212, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-07 23:58:58');
INSERT INTO `sys_logininfor` VALUES (213, 'admin', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '1', '验证码已失效', '2026-01-07 23:59:06');
INSERT INTO `sys_logininfor` VALUES (214, 'admin', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '0', '登录成功', '2026-01-07 23:59:10');
INSERT INTO `sys_logininfor` VALUES (215, 'admin', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '0', '登录成功', '2026-01-08 08:51:24');
INSERT INTO `sys_logininfor` VALUES (216, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '验证码错误', '2026-01-08 23:01:14');
INSERT INTO `sys_logininfor` VALUES (217, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-08 23:01:19');
INSERT INTO `sys_logininfor` VALUES (218, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-08 23:58:42');
INSERT INTO `sys_logininfor` VALUES (219, 'admin', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '0', '登录成功', '2026-01-08 23:59:19');
INSERT INTO `sys_logininfor` VALUES (220, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2026-01-09 00:13:27');
INSERT INTO `sys_logininfor` VALUES (221, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-09 00:13:37');
INSERT INTO `sys_logininfor` VALUES (222, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-10 00:49:17');
INSERT INTO `sys_logininfor` VALUES (223, 'admin', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '1', '验证码已失效', '2026-01-10 00:49:19');
INSERT INTO `sys_logininfor` VALUES (224, 'admin', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '0', '登录成功', '2026-01-10 00:49:28');
INSERT INTO `sys_logininfor` VALUES (225, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-11 01:02:15');
INSERT INTO `sys_logininfor` VALUES (226, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2026-01-11 01:03:03');
INSERT INTO `sys_logininfor` VALUES (227, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-11 01:03:15');
INSERT INTO `sys_logininfor` VALUES (228, 'admin', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '0', '登录成功', '2026-01-11 01:29:42');
INSERT INTO `sys_logininfor` VALUES (229, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-12 01:08:33');
INSERT INTO `sys_logininfor` VALUES (230, 'admin', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '1', '验证码错误', '2026-01-12 01:28:28');
INSERT INTO `sys_logininfor` VALUES (231, 'admin', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '0', '登录成功', '2026-01-12 01:28:31');
INSERT INTO `sys_logininfor` VALUES (232, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-12 02:03:29');
INSERT INTO `sys_logininfor` VALUES (233, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '验证码已失效', '2026-01-13 01:40:19');
INSERT INTO `sys_logininfor` VALUES (234, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-13 01:40:22');
INSERT INTO `sys_logininfor` VALUES (235, 'admin', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '1', '验证码错误', '2026-01-13 01:41:18');
INSERT INTO `sys_logininfor` VALUES (236, 'admin', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '0', '登录成功', '2026-01-13 01:41:23');
INSERT INTO `sys_logininfor` VALUES (237, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2026-01-13 02:04:30');
INSERT INTO `sys_logininfor` VALUES (238, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '验证码错误', '2026-01-13 02:04:37');
INSERT INTO `sys_logininfor` VALUES (239, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-13 02:04:42');
INSERT INTO `sys_logininfor` VALUES (240, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '验证码已失效', '2026-01-13 02:51:00');
INSERT INTO `sys_logininfor` VALUES (241, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-13 02:51:04');
INSERT INTO `sys_logininfor` VALUES (242, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-14 02:41:42');
INSERT INTO `sys_logininfor` VALUES (243, 'admin', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '0', '登录成功', '2026-01-14 02:41:55');
INSERT INTO `sys_logininfor` VALUES (244, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '验证码错误', '2026-01-15 02:04:24');
INSERT INTO `sys_logininfor` VALUES (245, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-15 02:04:26');
INSERT INTO `sys_logininfor` VALUES (246, 'admin', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '0', '登录成功', '2026-01-15 02:04:51');
INSERT INTO `sys_logininfor` VALUES (247, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-16 02:07:09');
INSERT INTO `sys_logininfor` VALUES (248, 'admin', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '0', '登录成功', '2026-01-16 02:12:02');
INSERT INTO `sys_logininfor` VALUES (249, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-16 02:50:28');
INSERT INTO `sys_logininfor` VALUES (250, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-16 03:36:46');
INSERT INTO `sys_logininfor` VALUES (251, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-17 01:09:22');
INSERT INTO `sys_logininfor` VALUES (252, 'admin', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '0', '登录成功', '2026-01-17 01:09:33');
INSERT INTO `sys_logininfor` VALUES (253, 'admin', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '0', '登录成功', '2026-01-17 02:46:34');
INSERT INTO `sys_logininfor` VALUES (254, 'admin', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '0', '登录成功', '2026-01-17 04:03:11');
INSERT INTO `sys_logininfor` VALUES (255, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '验证码错误', '2026-01-23 15:58:01');
INSERT INTO `sys_logininfor` VALUES (256, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-23 15:58:04');
INSERT INTO `sys_logininfor` VALUES (257, 'wkk', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '0', '登录成功', '2026-01-23 15:59:02');
INSERT INTO `sys_logininfor` VALUES (258, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-23 16:07:22');
INSERT INTO `sys_logininfor` VALUES (259, 'wkk', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '0', '登录成功', '2026-01-23 16:13:21');
INSERT INTO `sys_logininfor` VALUES (260, 'wkk', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '0', '退出成功', '2026-01-23 17:29:23');
INSERT INTO `sys_logininfor` VALUES (261, '科任老师', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '0', '登录成功', '2026-01-23 17:29:30');
INSERT INTO `sys_logininfor` VALUES (262, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-24 03:25:52');
INSERT INTO `sys_logininfor` VALUES (263, 'wkk', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '0', '登录成功', '2026-01-24 03:33:27');
INSERT INTO `sys_logininfor` VALUES (264, 'wkk', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '0', '登录成功', '2026-01-24 08:09:14');
INSERT INTO `sys_logininfor` VALUES (265, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '验证码错误', '2026-01-24 08:25:39');
INSERT INTO `sys_logininfor` VALUES (266, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-24 08:25:47');
INSERT INTO `sys_logininfor` VALUES (267, 'wkk', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '0', '退出成功', '2026-01-24 08:38:51');
INSERT INTO `sys_logininfor` VALUES (268, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2026-01-24 08:39:10');
INSERT INTO `sys_logininfor` VALUES (269, 'wkk', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '0', '登录成功', '2026-01-24 08:39:52');
INSERT INTO `sys_logininfor` VALUES (270, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-24 09:10:27');
INSERT INTO `sys_logininfor` VALUES (271, 'wkk', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '0', '登录成功', '2026-01-24 10:23:52');
INSERT INTO `sys_logininfor` VALUES (272, 'wkk', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '1', '验证码错误', '2026-01-24 11:48:19');
INSERT INTO `sys_logininfor` VALUES (273, 'wkk', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '0', '登录成功', '2026-01-24 11:48:24');
INSERT INTO `sys_logininfor` VALUES (274, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-24 12:45:43');
INSERT INTO `sys_logininfor` VALUES (275, 'admin', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '1', '用户不存在/密码错误', '2026-01-24 13:13:10');
INSERT INTO `sys_logininfor` VALUES (276, 'admin', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '0', '登录成功', '2026-01-24 13:13:21');
INSERT INTO `sys_logininfor` VALUES (277, 'admin', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '登录成功', '2026-01-24 06:14:55');
INSERT INTO `sys_logininfor` VALUES (278, 'admin', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '退出成功', '2026-01-24 06:19:48');
INSERT INTO `sys_logininfor` VALUES (279, 'admin', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '登录成功', '2026-01-24 06:20:02');
INSERT INTO `sys_logininfor` VALUES (280, 'admin', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '退出成功', '2026-01-24 06:24:53');
INSERT INTO `sys_logininfor` VALUES (281, '学生', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '登录成功', '2026-01-24 06:25:00');
INSERT INTO `sys_logininfor` VALUES (282, '学生', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '退出成功', '2026-01-24 06:25:16');
INSERT INTO `sys_logininfor` VALUES (283, 'admin', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '1', '验证码错误', '2026-01-24 06:25:21');
INSERT INTO `sys_logininfor` VALUES (284, 'admin', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '登录成功', '2026-01-24 06:25:25');
INSERT INTO `sys_logininfor` VALUES (285, 'admin', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '退出成功', '2026-01-24 06:26:29');
INSERT INTO `sys_logininfor` VALUES (286, 'wkk', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '登录成功', '2026-01-24 06:26:37');
INSERT INTO `sys_logininfor` VALUES (287, 'wkk', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '退出成功', '2026-01-24 06:37:43');
INSERT INTO `sys_logininfor` VALUES (288, 'admin', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '登录成功', '2026-01-24 06:37:50');
INSERT INTO `sys_logininfor` VALUES (289, 'wkk', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '0', '登录成功', '2026-01-24 06:41:37');
INSERT INTO `sys_logininfor` VALUES (290, 'admin', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '退出成功', '2026-01-24 07:38:33');
INSERT INTO `sys_logininfor` VALUES (291, 'admin', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '登录成功', '2026-01-24 07:38:35');
INSERT INTO `sys_logininfor` VALUES (292, 'admin', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '退出成功', '2026-01-24 08:03:19');
INSERT INTO `sys_logininfor` VALUES (293, 'admin', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '登录成功', '2026-01-24 08:04:21');
INSERT INTO `sys_logininfor` VALUES (294, 'admin', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '退出成功', '2026-01-24 08:11:34');
INSERT INTO `sys_logininfor` VALUES (295, 'admin', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '登录成功', '2026-01-24 08:11:37');
INSERT INTO `sys_logininfor` VALUES (296, 'admin', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '登录成功', '2026-01-24 08:11:43');
INSERT INTO `sys_logininfor` VALUES (297, 'admin', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '退出成功', '2026-01-24 08:26:18');
INSERT INTO `sys_logininfor` VALUES (298, 'admin', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '登录成功', '2026-01-24 08:38:15');
INSERT INTO `sys_logininfor` VALUES (299, 'admin', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '退出成功', '2026-01-24 09:05:46');
INSERT INTO `sys_logininfor` VALUES (300, 'admin', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '1', '验证码已失效', '2026-01-24 09:36:56');
INSERT INTO `sys_logininfor` VALUES (301, 'admin', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '登录成功', '2026-01-24 09:37:01');
INSERT INTO `sys_logininfor` VALUES (302, 'admin', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '退出成功', '2026-01-24 10:03:20');
INSERT INTO `sys_logininfor` VALUES (303, 'admin', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '登录成功', '2026-01-24 10:03:25');
INSERT INTO `sys_logininfor` VALUES (304, 'admin', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '退出成功', '2026-01-24 10:08:15');
INSERT INTO `sys_logininfor` VALUES (305, 'wkk', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '登录成功', '2026-01-24 10:08:20');
INSERT INTO `sys_logininfor` VALUES (306, 'wkk', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '退出成功', '2026-01-24 10:13:51');
INSERT INTO `sys_logininfor` VALUES (307, 'admin', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '登录成功', '2026-01-24 10:13:55');
INSERT INTO `sys_logininfor` VALUES (308, 'wkk', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '1', '用户不存在/密码错误', '2026-01-24 10:14:25');
INSERT INTO `sys_logininfor` VALUES (309, 'wkk', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '0', '登录成功', '2026-01-24 10:14:33');
INSERT INTO `sys_logininfor` VALUES (310, 'wkk', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '0', '登录成功', '2026-01-24 15:13:22');
INSERT INTO `sys_logininfor` VALUES (311, 'admin', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '登录成功', '2026-01-24 15:36:06');
INSERT INTO `sys_logininfor` VALUES (312, 'wkk', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '0', '退出成功', '2026-01-24 15:36:37');
INSERT INTO `sys_logininfor` VALUES (313, '若以', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '1', '用户不存在/密码错误', '2026-01-24 15:36:49');
INSERT INTO `sys_logininfor` VALUES (314, '若依', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '1', '用户不存在/密码错误', '2026-01-24 15:37:07');
INSERT INTO `sys_logininfor` VALUES (315, '若依', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '1', '用户不存在/密码错误', '2026-01-24 15:37:14');
INSERT INTO `sys_logininfor` VALUES (316, '若依', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '1', '验证码错误', '2026-01-24 15:37:23');
INSERT INTO `sys_logininfor` VALUES (317, '若依', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '1', '用户不存在/密码错误', '2026-01-24 15:37:28');
INSERT INTO `sys_logininfor` VALUES (318, 'ry', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '1', '用户不存在/密码错误', '2026-01-24 15:37:51');
INSERT INTO `sys_logininfor` VALUES (319, 'ry', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '0', '登录成功', '2026-01-24 15:37:58');
INSERT INTO `sys_logininfor` VALUES (320, 'wkk', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '0', '登录成功', '2026-01-24 18:39:18');
INSERT INTO `sys_logininfor` VALUES (321, 'admin', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '登录成功', '2026-01-24 18:39:23');
INSERT INTO `sys_logininfor` VALUES (322, 'wkk', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '0', '退出成功', '2026-01-24 18:50:48');
INSERT INTO `sys_logininfor` VALUES (323, 'wkk', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '0', '登录成功', '2026-01-24 18:51:59');
INSERT INTO `sys_logininfor` VALUES (324, 'wkk', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '0', '退出成功', '2026-01-24 19:00:08');
INSERT INTO `sys_logininfor` VALUES (325, 'xs1', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '1', '用户不存在/密码错误', '2026-01-24 19:00:55');
INSERT INTO `sys_logininfor` VALUES (326, '测试学生', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '0', '登录成功', '2026-01-24 19:01:05');
INSERT INTO `sys_logininfor` VALUES (327, '测试学生', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '0', '退出成功', '2026-01-24 19:02:15');
INSERT INTO `sys_logininfor` VALUES (328, 'admin', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '0', '登录成功', '2026-01-26 05:17:29');
INSERT INTO `sys_logininfor` VALUES (329, 'admin', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '0', '退出成功', '2026-01-26 05:24:28');
INSERT INTO `sys_logininfor` VALUES (330, 'wkk', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '1', '验证码错误', '2026-01-26 05:26:58');
INSERT INTO `sys_logininfor` VALUES (331, 'wkk', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '0', '登录成功', '2026-01-26 05:27:00');
INSERT INTO `sys_logininfor` VALUES (332, 'wkk', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '0', '退出成功', '2026-01-26 05:31:21');
INSERT INTO `sys_logininfor` VALUES (333, 'admin', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '0', '登录成功', '2026-01-26 05:31:41');
INSERT INTO `sys_logininfor` VALUES (334, 'wkk', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '0', '登录成功', '2026-01-26 05:31:52');
INSERT INTO `sys_logininfor` VALUES (335, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-26 05:33:52');
INSERT INTO `sys_logininfor` VALUES (336, 'wkk', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '0', '退出成功', '2026-01-26 05:39:06');
INSERT INTO `sys_logininfor` VALUES (337, '班主任1', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '1', '用户不存在/密码错误', '2026-01-26 05:39:16');
INSERT INTO `sys_logininfor` VALUES (338, 'head1', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '0', '登录成功', '2026-01-26 05:39:28');
INSERT INTO `sys_logininfor` VALUES (339, 'head1', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '0', '退出成功', '2026-01-26 05:59:09');
INSERT INTO `sys_logininfor` VALUES (340, 'wkk', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '1', '验证码错误', '2026-01-26 05:59:19');
INSERT INTO `sys_logininfor` VALUES (341, 'wkk', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '0', '登录成功', '2026-01-26 05:59:24');
INSERT INTO `sys_logininfor` VALUES (342, 'wkk', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '0', '退出成功', '2026-01-26 06:01:23');
INSERT INTO `sys_logininfor` VALUES (343, '测试学生', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '0', '登录成功', '2026-01-26 06:01:33');
INSERT INTO `sys_logininfor` VALUES (344, '测试学生', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '0', '退出成功', '2026-01-26 06:33:58');
INSERT INTO `sys_logininfor` VALUES (345, '班主任1', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '1', '验证码已失效', '2026-01-26 06:42:03');
INSERT INTO `sys_logininfor` VALUES (346, '班主任1', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '1', '用户不存在/密码错误', '2026-01-26 06:42:08');
INSERT INTO `sys_logininfor` VALUES (347, 'head1', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '1', '验证码错误', '2026-01-26 06:42:22');
INSERT INTO `sys_logininfor` VALUES (348, 'head1', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '0', '登录成功', '2026-01-26 06:42:28');
INSERT INTO `sys_logininfor` VALUES (349, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2026-01-26 06:47:49');
INSERT INTO `sys_logininfor` VALUES (350, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '验证码错误', '2026-01-26 06:47:56');
INSERT INTO `sys_logininfor` VALUES (351, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '用户不存在/密码错误', '2026-01-26 06:48:02');
INSERT INTO `sys_logininfor` VALUES (352, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-26 06:48:10');
INSERT INTO `sys_logininfor` VALUES (353, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2026-01-26 06:49:59');
INSERT INTO `sys_logininfor` VALUES (354, 'head1', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '0', '退出成功', '2026-01-26 06:50:04');
INSERT INTO `sys_logininfor` VALUES (355, 'admin', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '0', '登录成功', '2026-01-26 06:50:09');
INSERT INTO `sys_logininfor` VALUES (356, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '验证码已失效', '2026-01-26 06:52:09');
INSERT INTO `sys_logininfor` VALUES (357, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-26 06:52:16');
INSERT INTO `sys_logininfor` VALUES (358, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2026-01-26 06:53:08');
INSERT INTO `sys_logininfor` VALUES (359, 'xs1', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '用户不存在/密码错误', '2026-01-26 06:53:20');
INSERT INTO `sys_logininfor` VALUES (360, 'xs1', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '用户不存在/密码错误', '2026-01-26 06:53:24');
INSERT INTO `sys_logininfor` VALUES (361, 'xs1', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '用户不存在/密码错误', '2026-01-26 06:53:33');
INSERT INTO `sys_logininfor` VALUES (362, 'xs1', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '用户不存在/密码错误', '2026-01-26 06:53:51');
INSERT INTO `sys_logininfor` VALUES (363, '测试学生', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-26 06:54:06');
INSERT INTO `sys_logininfor` VALUES (364, 'admin', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '0', '退出成功', '2026-01-26 06:56:51');
INSERT INTO `sys_logininfor` VALUES (365, '班主任1', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '1', '用户不存在/密码错误', '2026-01-26 06:57:04');
INSERT INTO `sys_logininfor` VALUES (366, '班主任1', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '1', '用户不存在/密码错误', '2026-01-26 06:57:12');
INSERT INTO `sys_logininfor` VALUES (367, '测试学生', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2026-01-26 06:59:48');
INSERT INTO `sys_logininfor` VALUES (368, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-26 06:59:53');
INSERT INTO `sys_logininfor` VALUES (369, 'head1', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '1', '验证码已失效', '2026-01-26 07:01:16');
INSERT INTO `sys_logininfor` VALUES (370, 'head1', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '1', '验证码错误', '2026-01-26 07:01:20');
INSERT INTO `sys_logininfor` VALUES (371, 'head1', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '0', '登录成功', '2026-01-26 07:01:25');
INSERT INTO `sys_logininfor` VALUES (372, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2026-01-26 07:08:09');
INSERT INTO `sys_logininfor` VALUES (373, '测试学生', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-26 07:08:22');
INSERT INTO `sys_logininfor` VALUES (374, '测试学生', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2026-01-26 07:09:07');
INSERT INTO `sys_logininfor` VALUES (375, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-26 07:09:21');
INSERT INTO `sys_logininfor` VALUES (376, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2026-01-26 07:10:10');
INSERT INTO `sys_logininfor` VALUES (377, '测试学生', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-26 07:10:33');
INSERT INTO `sys_logininfor` VALUES (378, '测试学生', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2026-01-26 07:21:05');
INSERT INTO `sys_logininfor` VALUES (379, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-26 07:21:10');
INSERT INTO `sys_logininfor` VALUES (380, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2026-01-26 07:26:13');
INSERT INTO `sys_logininfor` VALUES (381, '测试学生', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-26 07:26:36');
INSERT INTO `sys_logininfor` VALUES (382, '测试学生', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2026-01-26 07:27:06');
INSERT INTO `sys_logininfor` VALUES (383, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '验证码错误', '2026-01-26 07:27:14');
INSERT INTO `sys_logininfor` VALUES (384, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '用户不存在/密码错误', '2026-01-26 07:27:19');
INSERT INTO `sys_logininfor` VALUES (385, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '验证码错误', '2026-01-26 07:27:27');
INSERT INTO `sys_logininfor` VALUES (386, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '验证码错误', '2026-01-26 07:27:30');
INSERT INTO `sys_logininfor` VALUES (387, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '1', '验证码错误', '2026-01-26 07:27:37');
INSERT INTO `sys_logininfor` VALUES (388, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-26 07:27:45');
INSERT INTO `sys_logininfor` VALUES (389, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '登录成功', '2026-01-26 12:45:12');
INSERT INTO `sys_logininfor` VALUES (390, 'wkk', '127.0.0.1', '内网IP', 'Edge 143', 'Windows >=10', '0', '退出成功', '2026-01-26 12:47:12');
INSERT INTO `sys_logininfor` VALUES (391, 'admin', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '1', '验证码已失效', '2026-01-26 12:47:22');
INSERT INTO `sys_logininfor` VALUES (392, 'admin', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '0', '登录成功', '2026-01-26 12:47:26');
INSERT INTO `sys_logininfor` VALUES (393, 'admin', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '0', '退出成功', '2026-01-26 12:49:05');
INSERT INTO `sys_logininfor` VALUES (394, 'admin', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '0', '登录成功', '2026-01-26 12:49:16');
INSERT INTO `sys_logininfor` VALUES (395, 'admin', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '0', '退出成功', '2026-01-26 12:50:36');
INSERT INTO `sys_logininfor` VALUES (396, 'xs002', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '1', '用户不存在/密码错误', '2026-01-26 12:50:51');
INSERT INTO `sys_logininfor` VALUES (397, 'xs002', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '1', '用户不存在/密码错误', '2026-01-26 12:51:03');
INSERT INTO `sys_logininfor` VALUES (398, 'admin', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '0', '登录成功', '2026-01-26 12:51:19');
INSERT INTO `sys_logininfor` VALUES (399, 'admin', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '0', '退出成功', '2026-01-26 12:54:44');
INSERT INTO `sys_logininfor` VALUES (400, '语文老师', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '1', '用户不存在/密码错误', '2026-01-26 12:54:53');
INSERT INTO `sys_logininfor` VALUES (401, 'admin', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '0', '登录成功', '2026-01-26 12:55:01');
INSERT INTO `sys_logininfor` VALUES (402, 'admin', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '0', '退出成功', '2026-01-26 12:55:38');
INSERT INTO `sys_logininfor` VALUES (403, '科任老师', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '0', '登录成功', '2026-01-26 12:55:50');
INSERT INTO `sys_logininfor` VALUES (404, '科任老师', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '0', '退出成功', '2026-01-26 12:56:21');
INSERT INTO `sys_logininfor` VALUES (405, 'admin', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '0', '登录成功', '2026-01-26 12:56:26');
INSERT INTO `sys_logininfor` VALUES (406, 'admin', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '0', '退出成功', '2026-01-26 12:56:59');
INSERT INTO `sys_logininfor` VALUES (407, 'head1', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '0', '登录成功', '2026-01-26 12:57:09');
INSERT INTO `sys_logininfor` VALUES (408, 'head1', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '0', '退出成功', '2026-01-26 12:57:51');
INSERT INTO `sys_logininfor` VALUES (409, 'admin', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '0', '登录成功', '2026-01-26 12:57:57');
INSERT INTO `sys_logininfor` VALUES (410, 'admin', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '登录成功', '2026-01-26 15:24:33');
INSERT INTO `sys_logininfor` VALUES (411, 'admin', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '登录成功', '2026-01-26 15:24:53');
INSERT INTO `sys_logininfor` VALUES (412, 'admin', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '退出成功', '2026-01-26 15:24:56');
INSERT INTO `sys_logininfor` VALUES (413, 'xs1', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '1', '用户不存在/密码错误', '2026-01-26 15:25:05');
INSERT INTO `sys_logininfor` VALUES (414, 'xs1', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '1', '用户不存在/密码错误', '2026-01-26 15:25:14');
INSERT INTO `sys_logininfor` VALUES (415, 'admin', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '1', '用户不存在/密码错误', '2026-01-26 15:25:25');
INSERT INTO `sys_logininfor` VALUES (416, 'admin', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '登录成功', '2026-01-26 15:25:29');
INSERT INTO `sys_logininfor` VALUES (417, 'admin', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '退出成功', '2026-01-26 15:25:58');
INSERT INTO `sys_logininfor` VALUES (418, '测试学生', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '登录成功', '2026-01-26 15:26:06');
INSERT INTO `sys_logininfor` VALUES (419, '测试学生', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '退出成功', '2026-01-26 15:35:42');
INSERT INTO `sys_logininfor` VALUES (420, 'admin', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '登录成功', '2026-01-26 15:35:55');
INSERT INTO `sys_logininfor` VALUES (421, 'admin', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '退出成功', '2026-01-26 15:36:33');
INSERT INTO `sys_logininfor` VALUES (422, '测试学生', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '1', '验证码错误', '2026-01-26 15:36:49');
INSERT INTO `sys_logininfor` VALUES (423, '测试学生', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '登录成功', '2026-01-26 15:36:52');
INSERT INTO `sys_logininfor` VALUES (424, '测试学生', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '退出成功', '2026-01-26 15:45:38');
INSERT INTO `sys_logininfor` VALUES (425, '测试学生', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '0', '登录成功', '2026-01-26 16:00:59');
INSERT INTO `sys_logininfor` VALUES (426, 'admin', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '1', '验证码已失效', '2026-01-26 16:01:07');
INSERT INTO `sys_logininfor` VALUES (427, 'admin', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '登录成功', '2026-01-26 16:01:19');
INSERT INTO `sys_logininfor` VALUES (428, '测试学生', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '0', '退出成功', '2026-01-26 16:15:15');
INSERT INTO `sys_logininfor` VALUES (429, 'wkk', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '0', '登录成功', '2026-01-26 16:15:27');
INSERT INTO `sys_logininfor` VALUES (430, 'wkk', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '0', '退出成功', '2026-01-26 16:17:12');
INSERT INTO `sys_logininfor` VALUES (431, 'wkk', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '0', '登录成功', '2026-01-26 16:17:19');
INSERT INTO `sys_logininfor` VALUES (432, 'wkk', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '0', '退出成功', '2026-01-26 16:32:28');
INSERT INTO `sys_logininfor` VALUES (433, '测试学生', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '0', '登录成功', '2026-01-26 16:32:36');
INSERT INTO `sys_logininfor` VALUES (434, 'admin', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '退出成功', '2026-01-26 16:45:59');
INSERT INTO `sys_logininfor` VALUES (435, '班主任1', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '1', '用户不存在/密码错误', '2026-01-26 16:46:04');
INSERT INTO `sys_logininfor` VALUES (436, '班主任1', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '1', '用户不存在/密码错误', '2026-01-26 16:46:11');
INSERT INTO `sys_logininfor` VALUES (437, '班主任1', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '1', '用户不存在/密码错误', '2026-01-26 16:46:16');
INSERT INTO `sys_logininfor` VALUES (438, 'admin', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '登录成功', '2026-01-26 16:46:43');
INSERT INTO `sys_logininfor` VALUES (439, 'admin', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '退出成功', '2026-01-26 16:46:52');
INSERT INTO `sys_logininfor` VALUES (440, '科任老师', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '登录成功', '2026-01-26 16:46:59');
INSERT INTO `sys_logininfor` VALUES (441, '测试学生', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '0', '退出成功', '2026-01-26 16:54:56');
INSERT INTO `sys_logininfor` VALUES (442, '科任老师', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '退出成功', '2026-01-26 16:54:57');
INSERT INTO `sys_logininfor` VALUES (443, 'head1', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '登录成功', '2026-01-26 16:55:07');
INSERT INTO `sys_logininfor` VALUES (444, 'wkk', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '1', '验证码已失效', '2026-01-26 16:59:43');
INSERT INTO `sys_logininfor` VALUES (445, 'wkk', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '0', '登录成功', '2026-01-26 16:59:51');
INSERT INTO `sys_logininfor` VALUES (446, 'head1', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '退出成功', '2026-01-26 17:05:47');
INSERT INTO `sys_logininfor` VALUES (447, 'admin', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '登录成功', '2026-01-26 17:05:51');
INSERT INTO `sys_logininfor` VALUES (448, 'admin', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '退出成功', '2026-01-26 17:06:17');
INSERT INTO `sys_logininfor` VALUES (449, 'math_theather', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '1', '用户不存在/密码错误', '2026-01-26 17:06:39');
INSERT INTO `sys_logininfor` VALUES (450, 'math_teather', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '1', '用户不存在/密码错误', '2026-01-26 17:06:45');
INSERT INTO `sys_logininfor` VALUES (451, 'admin', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '登录成功', '2026-01-26 17:06:53');
INSERT INTO `sys_logininfor` VALUES (452, 'admin', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '退出成功', '2026-01-26 17:07:17');
INSERT INTO `sys_logininfor` VALUES (453, 'chem_teacher', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '登录成功', '2026-01-26 17:07:27');
INSERT INTO `sys_logininfor` VALUES (454, 'chem_teacher', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '退出成功', '2026-01-26 17:07:37');
INSERT INTO `sys_logininfor` VALUES (455, 'admin', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '登录成功', '2026-01-26 17:07:41');
INSERT INTO `sys_logininfor` VALUES (456, 'admin', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '退出成功', '2026-01-26 17:08:07');
INSERT INTO `sys_logininfor` VALUES (457, 'head1', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '登录成功', '2026-01-26 17:08:14');
INSERT INTO `sys_logininfor` VALUES (458, 'head1', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '退出成功', '2026-01-26 17:11:15');
INSERT INTO `sys_logininfor` VALUES (459, 'admin', '127.0.0.1', '内网IP', 'Edge 144', 'Windows >=10', '0', '登录成功', '2026-01-26 17:11:18');
INSERT INTO `sys_logininfor` VALUES (460, 'wkk', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '0', '退出成功', '2026-01-26 17:20:09');
INSERT INTO `sys_logininfor` VALUES (461, '测试学生', '127.0.0.1', '内网IP', 'Chrome 144', 'Windows10', '0', '登录成功', '2026-01-26 17:20:13');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由名称',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1143 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 7, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2025-12-18 18:10:55', 'admin', '2026-01-13 01:53:19', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 6, 'monitor', NULL, '', '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2025-12-18 18:10:55', 'admin', '2026-01-13 01:53:56', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 2, 3, 'tool', NULL, '', '', 1, 0, 'M', '1', '0', '', 'tool', 'admin', '2025-12-18 18:10:55', 'admin', '2026-01-24 03:27:18', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '管理学生档案', 1, 1, 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2025-12-18 18:10:55', 'admin', '2025-12-30 01:07:36', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色权限', 1, 2, 'role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2025-12-18 18:10:55', 'admin', '2025-12-21 23:47:19', '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 4, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2025-12-18 18:10:55', 'admin', '2025-12-21 23:34:03', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '班级信息管理', 0, 2, 'dept', 'system/dept/index', '', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2025-12-18 18:10:55', 'admin', '2026-01-13 01:52:01', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 0, 8, 'post', 'system/post/index', '', '', 1, 0, 'C', '0', '0', 'system:post:list', 'peoples', 'admin', '2025-12-18 18:10:55', 'admin', '2026-01-14 02:52:48', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '1', '0', 'system:dict:list', 'dict', 'admin', '2025-12-18 18:10:55', 'admin', '2026-01-24 03:28:57', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '', 1, 0, 'C', '1', '0', 'system:config:list', 'edit', 'admin', '2025-12-18 18:10:55', 'admin', '2026-01-24 03:29:04', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '公告信息', 0, 3, 'notice', 'system/notice/index', '', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2025-12-18 18:10:55', 'admin', '2026-01-13 01:52:12', '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2025-12-18 18:10:55', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2025-12-18 18:10:55', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', '', 1, 0, 'C', '1', '0', 'monitor:job:list', 'job', 'admin', '2025-12-18 18:10:55', 'admin', '2026-01-24 03:27:56', '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', '', 1, 0, 'C', '1', '0', 'monitor:druid:list', 'druid', 'admin', '2025-12-18 18:10:55', 'admin', '2026-01-24 03:30:37', '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2025-12-18 18:10:55', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', '', 1, 0, 'C', '1', '0', 'monitor:cache:list', 'redis', 'admin', '2025-12-18 18:10:55', 'admin', '2026-01-24 03:27:42', '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', '', 1, 0, 'C', '1', '0', 'monitor:cache:list', 'redis-list', 'admin', '2025-12-18 18:10:55', 'admin', '2026-01-24 03:27:34', '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2025-12-18 18:10:55', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2025-12-18 18:10:55', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2025-12-18 18:10:55', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2025-12-18 18:10:55', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2025-12-18 18:10:55', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1061, '班级网盘', 0, 0, 'system', NULL, NULL, '', 1, 0, 'M', '0', '0', '', 'online', 'admin', '2025-12-21 23:56:51', 'admin', '2026-01-15 02:05:46', '');
INSERT INTO `sys_menu` VALUES (1062, '课程科目', 0, 5, 'school', NULL, NULL, '', 1, 0, 'M', '0', '0', '', 'education', 'admin', '2025-12-23 02:11:14', 'admin', '2026-01-13 01:52:29', '');
INSERT INTO `sys_menu` VALUES (1063, '课程科目', 1062, 1, 'course', 'school/course/index', NULL, '', 1, 0, 'C', '0', '1', 'school:course:list', '#', 'admin', '2025-12-23 02:23:35', 'admin', '2026-01-12 01:31:36', '课程科目菜单');
INSERT INTO `sys_menu` VALUES (1064, '课程科目查询', 1063, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:course:query', '#', 'admin', '2025-12-23 02:23:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1065, '课程科目新增', 1063, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:course:add', '#', 'admin', '2025-12-23 02:23:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1066, '课程科目修改', 1063, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:course:edit', '#', 'admin', '2025-12-23 02:23:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1067, '课程科目删除', 1063, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:course:remove', '#', 'admin', '2025-12-23 02:23:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1068, '课程科目导出', 1063, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:course:export', '#', 'admin', '2025-12-23 02:23:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1069, '课表', 1062, 1, 'schedule', 'school/schedule/index', NULL, '', 1, 0, 'C', '0', '0', 'school:schedule:list', '#', 'admin', '2025-12-23 02:23:44', 'admin', '2025-12-27 01:58:08', '班级课程菜单');
INSERT INTO `sys_menu` VALUES (1070, '班级课程查询', 1069, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:schedule:query', '#', 'admin', '2025-12-23 02:23:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1071, '班级课程新增', 1069, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:schedule:add', '#', 'admin', '2025-12-23 02:23:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1072, '班级课程修改', 1069, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:schedule:edit', '#', 'admin', '2025-12-23 02:23:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1073, '班级课程删除', 1069, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:schedule:remove', '#', 'admin', '2025-12-23 02:23:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1074, '班级课程导出', 1069, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:schedule:export', '#', 'admin', '2025-12-23 02:23:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1075, '作业公告', 1087, 1, 'assignment', 'school/assignment/index', NULL, '', 1, 0, 'C', '0', '1', 'school:assignment:list', '#', 'admin', '2025-12-24 01:51:17', 'admin', '2025-12-26 00:30:29', '作业发布菜单');
INSERT INTO `sys_menu` VALUES (1076, '作业发布查询', 1075, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:assignment:query', '#', 'admin', '2025-12-24 01:51:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1077, '作业发布新增', 1075, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:assignment:add', '#', 'admin', '2025-12-24 01:51:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1078, '作业发布修改', 1075, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:assignment:edit', '#', 'admin', '2025-12-24 01:51:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1079, '作业发布删除', 1075, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:assignment:remove', '#', 'admin', '2025-12-24 01:51:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1080, '作业发布导出', 1075, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:assignment:export', '#', 'admin', '2025-12-24 01:51:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1081, '作业提交', 1087, 1, 'submission', 'school/submission/index', NULL, '', 1, 0, 'C', '0', '1', 'school:submission:list', '#', 'admin', '2025-12-24 01:51:26', 'admin', '2025-12-26 00:30:35', '作业提交成绩菜单');
INSERT INTO `sys_menu` VALUES (1082, '作业提交成绩查询', 1081, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:submission:query', '#', 'admin', '2025-12-24 01:51:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1083, '作业提交成绩新增', 1081, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:submission:add', '#', 'admin', '2025-12-24 01:51:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1084, '作业提交成绩修改', 1081, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:submission:edit', '#', 'admin', '2025-12-24 01:51:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1085, '作业提交成绩删除', 1081, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:submission:remove', '#', 'admin', '2025-12-24 01:51:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1086, '作业提交成绩导出', 1081, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:submission:export', '#', 'admin', '2025-12-24 01:51:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1087, '作业管理', 0, 11, 'grade', NULL, NULL, '', 1, 0, 'M', '0', '1', '', 'edit', 'admin', '2025-12-24 01:54:15', 'admin', '2025-12-26 00:53:06', '');
INSERT INTO `sys_menu` VALUES (1088, '作业提交成绩', 1087, 1, 'submission', 'school/submission/index', NULL, '', 1, 0, 'C', '0', '1', 'school:submission:list', '#', 'admin', '2025-12-26 00:27:49', 'admin', '2025-12-26 00:52:45', '作业提交成绩菜单');
INSERT INTO `sys_menu` VALUES (1089, '作业提交成绩查询', 1088, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:submission:query', '#', 'admin', '2025-12-26 00:27:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1090, '作业提交成绩新增', 1088, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:submission:add', '#', 'admin', '2025-12-26 00:27:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1091, '作业提交成绩修改', 1088, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:submission:edit', '#', 'admin', '2025-12-26 00:27:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1092, '作业提交成绩删除', 1088, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:submission:remove', '#', 'admin', '2025-12-26 00:27:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1093, '作业提交成绩导出', 1088, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:submission:export', '#', 'admin', '2025-12-26 00:27:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1094, '课程科目', 1087, 1, 'course', 'school/course/index', NULL, '', 1, 0, 'C', '0', '1', 'school:course:list', '#', 'admin', '2025-12-26 00:28:04', 'admin', '2025-12-26 00:52:50', '课程科目菜单');
INSERT INTO `sys_menu` VALUES (1095, '课程科目查询', 1094, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:course:query', '#', 'admin', '2025-12-26 00:28:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1096, '课程科目新增', 1094, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:course:add', '#', 'admin', '2025-12-26 00:28:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1097, '课程科目修改', 1094, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:course:edit', '#', 'admin', '2025-12-26 00:28:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1098, '课程科目删除', 1094, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:course:remove', '#', 'admin', '2025-12-26 00:28:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1099, '课程科目导出', 1094, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:course:export', '#', 'admin', '2025-12-26 00:28:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1100, '作业发布', 1087, 1, 'assignment', 'school/assignment/index', NULL, '', 1, 0, 'C', '0', '1', 'school:assignment:list', '#', 'admin', '2025-12-26 00:28:19', 'admin', '2025-12-26 00:52:56', '作业发布菜单');
INSERT INTO `sys_menu` VALUES (1101, '作业发布查询', 1100, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:assignment:query', '#', 'admin', '2025-12-26 00:28:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1102, '作业发布新增', 1100, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:assignment:add', '#', 'admin', '2025-12-26 00:28:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1103, '作业发布修改', 1100, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:assignment:edit', '#', 'admin', '2025-12-26 00:28:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1104, '作业发布删除', 1100, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:assignment:remove', '#', 'admin', '2025-12-26 00:28:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1105, '作业发布导出', 1100, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:assignment:export', '#', 'admin', '2025-12-26 00:28:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1106, '班级信息', 1130, 1, 'banji', 'school/banji/index', NULL, '', 1, 0, 'C', '0', '1', 'school:banji:list', '#', 'admin', '2025-12-27 01:13:37', 'admin', '2026-01-24 18:51:20', '班级信息菜单');
INSERT INTO `sys_menu` VALUES (1107, '班级信息查询', 1106, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:banji:query', '#', 'admin', '2025-12-27 01:13:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1108, '班级信息新增', 1106, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:banji:add', '#', 'admin', '2025-12-27 01:13:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1109, '班级信息修改', 1106, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:banji:edit', '#', 'admin', '2025-12-27 01:13:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1110, '班级信息删除', 1106, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:banji:remove', '#', 'admin', '2025-12-27 01:13:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1111, '班级信息导出', 1106, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:banji:export', '#', 'admin', '2025-12-27 01:13:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1112, '课程信息', 1130, 1, 'course', 'school/course/index', NULL, '', 1, 0, 'C', '0', '0', 'school:course:list', '#', 'admin', '2025-12-27 01:13:55', 'admin', '2026-01-24 16:17:48', '课程信息菜单');
INSERT INTO `sys_menu` VALUES (1113, '课程信息查询', 1112, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:course:query', '#', 'admin', '2025-12-27 01:13:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1114, '课程信息新增', 1112, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:course:add', '#', 'admin', '2025-12-27 01:13:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1115, '课程信息修改', 1112, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:course:edit', '#', 'admin', '2025-12-27 01:13:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1116, '课程信息删除', 1112, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:course:remove', '#', 'admin', '2025-12-27 01:13:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1117, '课程信息导出', 1112, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:course:export', '#', 'admin', '2025-12-27 01:13:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1118, '作业成绩批改', 1130, 1, 'submission', 'school/submission/index', NULL, '', 1, 0, 'C', '0', '0', 'school:submission:list', '#', 'admin', '2025-12-27 01:14:09', 'admin', '2025-12-27 23:37:45', '作业提交与成绩菜单');
INSERT INTO `sys_menu` VALUES (1119, '作业提交与成绩查询', 1118, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:submission:query', '#', 'admin', '2025-12-27 01:14:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1120, '作业提交与成绩新增', 1118, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:submission:add', '#', 'admin', '2025-12-27 01:14:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1121, '作业提交与成绩修改', 1118, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:submission:edit', '#', 'admin', '2025-12-27 01:14:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1122, '作业提交与成绩删除', 1118, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:submission:remove', '#', 'admin', '2025-12-27 01:14:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1123, '作业提交与成绩导出', 1118, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:submission:export', '#', 'admin', '2025-12-27 01:14:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1124, '作业发布提交', 1130, 1, 'task', 'school/task/index', NULL, '', 1, 0, 'C', '0', '0', 'school:task:list', '#', 'admin', '2025-12-27 01:14:20', 'admin', '2025-12-27 23:37:56', '作业发布任务菜单');
INSERT INTO `sys_menu` VALUES (1125, '作业发布任务查询', 1124, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:task:query', '#', 'admin', '2025-12-27 01:14:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1126, '作业发布任务新增', 1124, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:task:add', '#', 'admin', '2025-12-27 01:14:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1127, '作业发布任务修改', 1124, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:task:edit', '#', 'admin', '2025-12-27 01:14:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1128, '作业发布任务删除', 1124, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:task:remove', '#', 'admin', '2025-12-27 01:14:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1129, '作业发布任务导出', 1124, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:task:export', '#', 'admin', '2025-12-27 01:14:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1130, '作业信息', 0, 4, 'school', NULL, NULL, '', 1, 0, 'M', '0', '0', '', 'job', 'admin', '2025-12-27 01:38:50', 'admin', '2026-01-14 02:52:22', '');
INSERT INTO `sys_menu` VALUES (1131, '学生考勤', 0, 1, 'attendance', 'school/attendance/index', NULL, '', 1, 0, 'C', '0', '0', 'school:attendance:list', 'log', 'admin', '2025-12-27 23:48:38', 'admin', '2026-01-14 02:51:35', '学生考勤菜单');
INSERT INTO `sys_menu` VALUES (1132, '学生考勤查询', 1131, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:attendance:query', '#', 'admin', '2025-12-27 23:48:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1133, '学生考勤新增', 1131, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:attendance:add', '#', 'admin', '2025-12-27 23:48:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1134, '学生考勤修改', 1131, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:attendance:edit', '#', 'admin', '2025-12-27 23:48:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1135, '学生考勤删除', 1131, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:attendance:remove', '#', 'admin', '2025-12-27 23:48:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1136, '学生考勤导出', 1131, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:attendance:export', '#', 'admin', '2025-12-27 23:48:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1137, '班级视频', 1061, 1, 'video', 'school/video/index', NULL, '', 1, 0, 'C', '0', '0', 'school:video:list', '#', 'admin', '2026-01-14 03:04:44', '', NULL, '班级视频菜单');
INSERT INTO `sys_menu` VALUES (1138, '班级视频查询', 1137, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:video:query', '#', 'admin', '2026-01-14 03:04:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1139, '班级视频新增', 1137, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:video:add', '#', 'admin', '2026-01-14 03:04:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1140, '班级视频修改', 1137, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:video:edit', '#', 'admin', '2026-01-14 03:04:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1141, '班级视频删除', 1137, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:video:remove', '#', 'admin', '2026-01-14 03:04:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1142, '班级视频导出', 1137, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'school:video:export', '#', 'admin', '2026-01-14 03:04:44', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `class_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (6, '测试公告', '2', 0x3C703EE6B58BE8AF95E585ACE5918A3C2F703E, '0', 'admin', '2026-01-26 17:19:33', '', NULL, NULL, 201);

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 379 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-12-18 18:10:55\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-21 20:06:29', 59);
INSERT INTO `sys_oper_log` VALUES (2, '参数管理', 9, 'com.ruoyi.web.controller.system.SysConfigController.refreshCache()', 'DELETE', 1, 'admin', '研发部门', '/system/config/refreshCache', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-21 20:32:06', 14);
INSERT INTO `sys_oper_log` VALUES (3, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'ry', '测试部门', '/system/user/export', '127.0.0.1', '内网IP', '{\"deptId\":\"100\",\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-12-21 20:34:45', 1083);
INSERT INTO `sys_oper_log` VALUES (4, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":3,\"roleKey\":\"2\",\"roleName\":\"老师\",\"roleSort\":0,\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-21 20:47:19', 94);
INSERT INTO `sys_oper_log` VALUES (5, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-12-21 20:47:19\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":3,\"roleKey\":\"2\",\"roleName\":\"老师\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-21 20:47:54', 53);
INSERT INTO `sys_oper_log` VALUES (6, '角色管理', 3, 'com.ruoyi.web.controller.system.SysRoleController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/role/3', '127.0.0.1', '内网IP', '[3] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-21 20:50:24', 48);
INSERT INTO `sys_oper_log` VALUES (7, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":4,\"roleKey\":\"te\",\"roleName\":\"老师\",\"roleSort\":3,\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-21 20:52:45', 26);
INSERT INTO `sys_oper_log` VALUES (8, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"1\",\"params\":{},\"postIds\":[],\"roleIds\":[4],\"status\":\"0\",\"userId\":3,\"userName\":\"22\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-21 20:54:35', 126);
INSERT INTO `sys_oper_log` VALUES (9, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/user/3', '127.0.0.1', '内网IP', '[3] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-21 20:56:42', 27);
INSERT INTO `sys_oper_log` VALUES (10, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"nickName\":\"11\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":4,\"userName\":\"11\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-21 20:57:14', 119);
INSERT INTO `sys_oper_log` VALUES (11, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-12-21 20:57:14\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"若依科技\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"status\":\"0\"},\"deptId\":100,\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"11\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[3],\"roleIds\":[4],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":4,\"userName\":\"11\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-21 20:59:24', 53);
INSERT INTO `sys_oper_log` VALUES (12, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', '研发部门', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":4} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-21 20:59:41', 109);
INSERT INTO `sys_oper_log` VALUES (13, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/notice', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-12-18 18:10:56\",\"noticeContent\":\"<p>新版本内容11111111111111111</p>\",\"noticeId\":1,\"noticeTitle\":\"温馨提醒：2018-07-01 若依新版本发布啦\",\"noticeType\":\"2\",\"params\":{},\"remark\":\"管理员\",\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-21 23:05:15', 23);
INSERT INTO `sys_oper_log` VALUES (14, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-12-21 20:52:45\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,107,1035,1036,1037,1038,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114],\"params\":{},\"remark\":\"科任老师权限介于班主任（admin）之间\",\"roleId\":4,\"roleKey\":\"mid-admin\",\"roleName\":\"科任老师\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-21 23:13:38', 80);
INSERT INTO `sys_oper_log` VALUES (15, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-12-18 18:10:55\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,4],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通用户\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-21 23:14:03', 55);
INSERT INTO `sys_oper_log` VALUES (16, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-12-21 20:57:14\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"若依科技\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"status\":\"0\"},\"deptId\":100,\"email\":\"456@163.com\",\"loginDate\":\"2025-12-21 21:01:00\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"科任老师\",\"params\":{},\"phonenumber\":\"18598968865\",\"postIds\":[3],\"pwdUpdateDate\":\"2025-12-21 20:59:41\",\"roleIds\":[4],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":4,\"roleKey\":\"mid-admin\",\"roleName\":\"科任老师\",\"roleSort\":3,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":4,\"userName\":\"11\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-21 23:15:15', 66);
INSERT INTO `sys_oper_log` VALUES (17, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', '研发部门', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":4} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-21 23:15:40', 101);
INSERT INTO `sys_oper_log` VALUES (18, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/user/4', '127.0.0.1', '内网IP', '[4] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-21 23:15:57', 34);
INSERT INTO `sys_oper_log` VALUES (19, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"email\":\"456@qq.com\",\"nickName\":\"语文老师\",\"params\":{},\"phonenumber\":\"15862863654\",\"postIds\":[2],\"roleIds\":[4],\"sex\":\"1\",\"status\":\"0\",\"userId\":5,\"userName\":\"科任老师\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-21 23:17:06', 163);
INSERT INTO `sys_oper_log` VALUES (20, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-12-18 18:10:55\",\"flag\":false,\"params\":{},\"postCode\":\"se\",\"postId\":2,\"postName\":\"班主任\",\"postSort\":2,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-21 23:18:21', 36);
INSERT INTO `sys_oper_log` VALUES (21, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-12-18 18:10:55\",\"flag\":false,\"params\":{},\"postCode\":\"hr\",\"postId\":3,\"postName\":\"科任老师\",\"postSort\":3,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-21 23:18:47', 31);
INSERT INTO `sys_oper_log` VALUES (22, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-12-18 18:10:55\",\"flag\":false,\"params\":{},\"postCode\":\"user\",\"postId\":4,\"postName\":\"学生\",\"postSort\":4,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-21 23:19:00', 36);
INSERT INTO `sys_oper_log` VALUES (23, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-12-21 23:17:06\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"若依科技\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"status\":\"0\"},\"deptId\":100,\"email\":\"456@qq.com\",\"loginIp\":\"\",\"nickName\":\"语文老师\",\"params\":{},\"phonenumber\":\"15862863654\",\"postIds\":[3],\"roleIds\":[4],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":4,\"roleKey\":\"mid-admin\",\"roleName\":\"科任老师\",\"roleSort\":3,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":5,\"userName\":\"科任老师\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-21 23:19:17', 55);
INSERT INTO `sys_oper_log` VALUES (24, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-12-21 23:17:06\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"若依科技\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"status\":\"0\"},\"deptId\":100,\"email\":\"456@qq.com\",\"loginIp\":\"\",\"nickName\":\"语文老师\",\"params\":{},\"phonenumber\":\"15862863654\",\"postIds\":[3],\"roleIds\":[4],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":4,\"roleKey\":\"mid-admin\",\"roleName\":\"科任老师\",\"roleSort\":3,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":5,\"userName\":\"科任老师\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-21 23:19:23', 62);
INSERT INTO `sys_oper_log` VALUES (25, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,4],\"params\":{},\"roleKey\":\"admin\",\"roleName\":\"测试\",\"roleSort\":4,\"status\":\"0\"} ', '{\"msg\":\"新增角色\'测试\'失败，角色权限已存在\",\"code\":500}', 0, NULL, '2025-12-21 23:20:47', 32);
INSERT INTO `sys_oper_log` VALUES (26, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":101,\"deptName\":\"清北班\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"parentName\":\"若依科技\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-21 23:23:29', 92);
INSERT INTO `sys_oper_log` VALUES (27, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":102,\"deptName\":\"火箭班\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":100,\"parentName\":\"若依科技\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-21 23:23:58', 63);
INSERT INTO `sys_oper_log` VALUES (28, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"第一组\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"parentName\":\"清北班\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-21 23:24:39', 50);
INSERT INTO `sys_oper_log` VALUES (29, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":104,\"deptName\":\"第2组\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":101,\"parentName\":\"清北班\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-21 23:24:48', 59);
INSERT INTO `sys_oper_log` VALUES (30, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"第3组\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"parentName\":\"清北班\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-21 23:25:01', 60);
INSERT INTO `sys_oper_log` VALUES (31, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":106,\"deptName\":\"第4组\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":4,\"params\":{},\"parentId\":101,\"parentName\":\"清北班\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-21 23:25:09', 45);
INSERT INTO `sys_oper_log` VALUES (32, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":107,\"deptName\":\"第5组\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":5,\"params\":{},\"parentId\":101,\"parentName\":\"清北班\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-21 23:25:16', 56);
INSERT INTO `sys_oper_log` VALUES (33, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,102\",\"children\":[],\"deptId\":108,\"deptName\":\"第一组\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":102,\"parentName\":\"火箭班\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-21 23:26:28', 53);
INSERT INTO `sys_oper_log` VALUES (34, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,102\",\"children\":[],\"deptId\":109,\"deptName\":\"第2组\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":102,\"parentName\":\"火箭班\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-21 23:26:38', 55);
INSERT INTO `sys_oper_log` VALUES (35, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"石油中学\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-21 23:27:08', 40);
INSERT INTO `sys_oper_log` VALUES (36, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/dept/index\",\"createTime\":\"2025-12-18 18:10:55\",\"icon\":\"tree\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":103,\"menuName\":\"班级管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":1,\"path\":\"dept\",\"perms\":\"system:dept:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-21 23:28:14', 32);
INSERT INTO `sys_oper_log` VALUES (37, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/notice/index\",\"createTime\":\"2025-12-18 18:10:55\",\"icon\":\"message\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":107,\"menuName\":\"作业公告\",\"menuType\":\"C\",\"orderNum\":8,\"params\":{},\"parentId\":1,\"path\":\"notice\",\"perms\":\"system:notice:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-21 23:28:54', 22);
INSERT INTO `sys_oper_log` VALUES (38, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-12-18 18:10:55\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通用户\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-21 23:30:31', 36);
INSERT INTO `sys_oper_log` VALUES (39, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-12-18 18:10:55\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"第3组\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"ry@qq.com\",\"loginDate\":\"2025-12-21 20:45:36\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[4],\"pwdUpdateDate\":\"2025-12-18 18:10:55\",\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通用户\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-21 23:30:49', 82);
INSERT INTO `sys_oper_log` VALUES (40, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第一组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/menu/index\",\"createTime\":\"2025-12-18 18:10:55\",\"icon\":\"tree-table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":102,\"menuName\":\"菜单管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":1,\"path\":\"menu\",\"perms\":\"system:menu:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-21 23:34:03', 20);
INSERT INTO `sys_oper_log` VALUES (41, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第一组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/dept/index\",\"createTime\":\"2025-12-18 18:10:55\",\"icon\":\"tree\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":103,\"menuName\":\"班级管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":1,\"path\":\"dept\",\"perms\":\"system:dept:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-21 23:34:31', 17);
INSERT INTO `sys_oper_log` VALUES (42, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第一组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/notice/index\",\"createTime\":\"2025-12-18 18:10:55\",\"icon\":\"message\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":107,\"menuName\":\"作业公告\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":1,\"path\":\"notice\",\"perms\":\"system:notice:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-21 23:35:14', 22);
INSERT INTO `sys_oper_log` VALUES (43, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第一组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/post/index\",\"createTime\":\"2025-12-18 18:10:55\",\"icon\":\"post\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":104,\"menuName\":\"岗位管理\",\"menuType\":\"C\",\"orderNum\":8,\"params\":{},\"parentId\":1,\"path\":\"post\",\"perms\":\"system:post:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-21 23:35:29', 26);
INSERT INTO `sys_oper_log` VALUES (44, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第一组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/role/index\",\"createTime\":\"2025-12-18 18:10:55\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":101,\"menuName\":\"角色管理(权限设置)\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":1,\"path\":\"role\",\"perms\":\"system:role:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-21 23:38:52', 22);
INSERT INTO `sys_oper_log` VALUES (45, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第一组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/user/index\",\"createTime\":\"2025-12-18 18:10:55\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":100,\"menuName\":\"管理学生档案\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"user\",\"perms\":\"system:user:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-21 23:46:10', 25);
INSERT INTO `sys_oper_log` VALUES (46, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第一组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/dept/index\",\"createTime\":\"2025-12-18 18:10:55\",\"icon\":\"tree\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":103,\"menuName\":\"班级信息管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":1,\"path\":\"dept\",\"perms\":\"system:dept:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-21 23:46:26', 8);
INSERT INTO `sys_oper_log` VALUES (47, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第一组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/role/index\",\"createTime\":\"2025-12-18 18:10:55\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":101,\"menuName\":\"角色权限\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":1,\"path\":\"role\",\"perms\":\"system:role:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-21 23:47:19', 22);
INSERT INTO `sys_oper_log` VALUES (48, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '第一组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"测试\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"system\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-21 23:56:51', 31);
INSERT INTO `sys_oper_log` VALUES (49, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '第一组', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"第1组\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"parentName\":\"清北班\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-22 00:09:38', 55);
INSERT INTO `sys_oper_log` VALUES (50, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '第一组', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,102\",\"children\":[],\"deptId\":108,\"deptName\":\"第1组\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":102,\"parentName\":\"火箭班\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-22 00:09:46', 57);
INSERT INTO `sys_oper_log` VALUES (51, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '第一组', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":103,\"nickName\":\"25\",\"params\":{},\"postIds\":[4],\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userId\":6,\"userName\":\"学生\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-22 00:50:07', 163);
INSERT INTO `sys_oper_log` VALUES (52, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '第1组', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-12-22 00:50:07\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"第1组\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":103,\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"wkk\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[4],\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通用户\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":6,\"userName\":\"学生\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-22 11:37:14', 68);
INSERT INTO `sys_oper_log` VALUES (53, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', '第1组', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":6} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-22 11:38:29', 120);
INSERT INTO `sys_oper_log` VALUES (54, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', '第1组', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":2} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-22 19:06:05', 133);
INSERT INTO `sys_oper_log` VALUES (55, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', '第1组', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":5} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-22 19:06:12', 98);
INSERT INTO `sys_oper_log` VALUES (56, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', '第1组', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":6} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-22 19:06:22', 101);
INSERT INTO `sys_oper_log` VALUES (57, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '第1组', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"wkk\",\"params\":{},\"postIds\":[3],\"roleIds\":[4],\"status\":\"0\",\"userId\":7,\"userName\":\"wkk\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-22 19:09:11', 162);
INSERT INTO `sys_oper_log` VALUES (58, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '第1组', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"hs_schedule,hs_course\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-23 02:00:30', 417);
INSERT INTO `sys_oper_log` VALUES (59, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"课程科目\",\"menuType\":\"M\",\"orderNum\":10,\"params\":{},\"parentId\":1,\"path\":\"school\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-23 02:11:14', 63);
INSERT INTO `sys_oper_log` VALUES (60, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '第1组', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"course\",\"className\":\"HsCourse\",\"columns\":[{\"capJavaField\":\"CourseId\",\"columnComment\":\"课程ID\",\"columnId\":1,\"columnName\":\"course_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-23 02:00:29\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"courseId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CourseName\",\"columnComment\":\"课程名称\",\"columnId\":2,\"columnName\":\"course_name\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-23 02:00:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"courseName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Status\",\"columnComment\":\"状态（0正常 1停用）\",\"columnId\":3,\"columnName\":\"status\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-23 02:00:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"status\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":4,\"columnName\":\"create_by\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-23 02:00:29\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createBy\",\"ja', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-23 02:17:18', 137);
INSERT INTO `sys_oper_log` VALUES (61, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '第1组', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"schedule\",\"className\":\"HsSchedule\",\"columns\":[{\"capJavaField\":\"ScheduleId\",\"columnComment\":\"课表ID\",\"columnId\":9,\"columnName\":\"schedule_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-23 02:00:29\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"scheduleId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ClassId\",\"columnComment\":\"班级ID\",\"columnId\":10,\"columnName\":\"class_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-23 02:00:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"classId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ClassName\",\"columnComment\":\"班级名称\",\"columnId\":11,\"columnName\":\"class_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-23 02:00:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"className\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CourseId\",\"columnComment\":\"科目ID\",\"columnId\":12,\"columnName\":\"course_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-23 02:00:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-23 02:18:29', 110);
INSERT INTO `sys_oper_log` VALUES (62, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '第1组', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"hs_course,hs_schedule\"}', NULL, 0, NULL, '2025-12-23 02:20:03', 116);
INSERT INTO `sys_oper_log` VALUES (63, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"school/course/index\",\"createTime\":\"2025-12-23 02:23:35\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1063,\"menuName\":\"课程科目\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1062,\"path\":\"course\",\"perms\":\"school:course:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-23 02:24:54', 24);
INSERT INTO `sys_oper_log` VALUES (64, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-12-18 18:10:55\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":1062,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-23 02:25:13', 19);
INSERT INTO `sys_oper_log` VALUES (65, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-12-18 18:10:55\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":2,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-23 02:26:30', 25);
INSERT INTO `sys_oper_log` VALUES (66, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '第1组', '/system/menu/1063', '127.0.0.1', '内网IP', '1063 ', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2025-12-23 02:27:24', 15);
INSERT INTO `sys_oper_log` VALUES (67, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '第1组', '/system/menu/1063', '127.0.0.1', '内网IP', '1063 ', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2025-12-23 02:27:40', 10);
INSERT INTO `sys_oper_log` VALUES (68, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '第1组', '/system/menu/1069', '127.0.0.1', '内网IP', '1069 ', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2025-12-23 02:28:02', 10);
INSERT INTO `sys_oper_log` VALUES (69, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"school/schedule/index\",\"createTime\":\"2025-12-23 02:23:44\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1069,\"menuName\":\"班级课程\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1062,\"path\":\"schedule\",\"perms\":\"school:schedule:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-23 02:31:33', 23);
INSERT INTO `sys_oper_log` VALUES (70, '班级课程', 5, 'com.ruoyi.school.controller.HsScheduleController.export()', 'POST', 1, 'admin', '第1组', '/school/schedule/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-12-24 01:09:52', 879);
INSERT INTO `sys_oper_log` VALUES (71, '班级课程', 5, 'com.ruoyi.school.controller.HsScheduleController.export()', 'POST', 1, 'admin', '第1组', '/school/schedule/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"100\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-12-24 01:18:29', 88);
INSERT INTO `sys_oper_log` VALUES (72, '班级课程', 1, 'com.ruoyi.school.controller.HsScheduleController.add()', 'POST', 1, 'admin', '第1组', '/school/schedule', '127.0.0.1', '内网IP', '{\"classId\":2,\"classroom\":\"石油1班\",\"courseId\":3,\"courseName\":\"英语\",\"createTime\":\"2025-12-24 01:29:02\",\"params\":{},\"scheduleId\":4,\"schoolYear\":\"2025-2\",\"section\":1,\"teacherId\":2,\"timePeriod\":\"0\",\"weekDay\":4} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-24 01:29:02', 66);
INSERT INTO `sys_oper_log` VALUES (73, '班级课程', 2, 'com.ruoyi.school.controller.HsScheduleController.edit()', 'PUT', 1, 'admin', '第1组', '/school/schedule', '127.0.0.1', '内网IP', '{\"classId\":2,\"className\":\"\",\"classroom\":\"石油1班\",\"courseId\":3,\"courseName\":\"数学\",\"createBy\":\"\",\"createTime\":\"2025-12-24 01:29:03\",\"params\":{},\"scheduleId\":4,\"schoolYear\":\"2025-2\",\"section\":1,\"teacherId\":2,\"teacherName\":\"\",\"timePeriod\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2025-12-24 01:29:21\",\"weekDay\":4} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-24 01:29:21', 15);
INSERT INTO `sys_oper_log` VALUES (74, '班级课程', 2, 'com.ruoyi.school.controller.HsScheduleController.edit()', 'PUT', 1, 'admin', '第1组', '/school/schedule', '127.0.0.1', '内网IP', '{\"classId\":2,\"className\":\"\",\"classroom\":\"石油1班\",\"courseId\":3,\"courseName\":\"英语\",\"createBy\":\"\",\"createTime\":\"2025-12-24 01:29:03\",\"params\":{},\"scheduleId\":4,\"schoolYear\":\"2025-2\",\"section\":1,\"teacherId\":2,\"teacherName\":\"\",\"timePeriod\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2025-12-24 01:29:40\",\"weekDay\":4} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-24 01:29:40', 12);
INSERT INTO `sys_oper_log` VALUES (75, '班级课程', 2, 'com.ruoyi.school.controller.HsScheduleController.edit()', 'PUT', 1, 'admin', '第1组', '/school/schedule', '127.0.0.1', '内网IP', '{\"classId\":2,\"className\":\"石油1班\",\"classroom\":\"石油1班\",\"courseId\":3,\"courseName\":\"英语\",\"createBy\":\"\",\"createTime\":\"2025-12-24 01:29:03\",\"params\":{},\"scheduleId\":4,\"schoolYear\":\"2025-2\",\"section\":1,\"teacherId\":2,\"teacherName\":\"王老师\",\"timePeriod\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2025-12-24 01:31:49\",\"weekDay\":4} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-24 01:31:49', 13);
INSERT INTO `sys_oper_log` VALUES (76, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '第1组', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"hs_assignment,hs_assignment_submission\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-24 01:42:32', 501);
INSERT INTO `sys_oper_log` VALUES (77, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '第1组', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"assignment\",\"className\":\"HsAssignment\",\"columns\":[{\"capJavaField\":\"AssignmentId\",\"columnComment\":\"作业ID\",\"columnId\":26,\"columnName\":\"assignment_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-24 01:42:32\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"assignmentId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"AssignmentTitle\",\"columnComment\":\"作业标题\",\"columnId\":27,\"columnName\":\"assignment_title\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-24 01:42:32\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"assignmentTitle\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"AssignmentContent\",\"columnComment\":\"作业内容/要求\",\"columnId\":28,\"columnName\":\"assignment_content\",\"columnType\":\"varchar(1000)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-24 01:42:32\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"editor\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"assignmentContent\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CourseId\",\"columnComment\":\"所属科目ID\",\"columnId\":29,\"columnName\":\"course_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-24 01:42:32\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-24 01:47:54', 202);
INSERT INTO `sys_oper_log` VALUES (78, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '第1组', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"submission\",\"className\":\"HsAssignmentSubmission\",\"columns\":[{\"capJavaField\":\"SubId\",\"columnComment\":\"提交ID\",\"columnId\":42,\"columnName\":\"sub_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-24 01:42:32\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"subId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"AssignmentId\",\"columnComment\":\"关联作业ID\",\"columnId\":43,\"columnName\":\"assignment_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-24 01:42:32\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"assignmentId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"AssignmentTitle\",\"columnComment\":\"作业标题(冗余字段方便查询)\",\"columnId\":44,\"columnName\":\"assignment_title\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-24 01:42:32\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"assignmentTitle\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"StudentId\",\"columnComment\":\"学生ID\",\"columnId\":45,\"columnName\":\"student_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-24 01:42:32\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"is', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-24 01:49:27', 161);
INSERT INTO `sys_oper_log` VALUES (79, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '第1组', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"hs_assignment,hs_assignment_submission\"}', NULL, 0, NULL, '2025-12-24 01:50:06', 902);
INSERT INTO `sys_oper_log` VALUES (80, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"成绩管理\",\"menuType\":\"M\",\"orderNum\":11,\"params\":{},\"parentId\":1,\"path\":\"grade\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-24 01:54:15', 56);
INSERT INTO `sys_oper_log` VALUES (81, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"school/assignment/index\",\"createTime\":\"2025-12-24 01:51:17\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1075,\"menuName\":\"作业发布\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1087,\"path\":\"assignment\",\"perms\":\"school:assignment:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-24 01:54:50', 35);
INSERT INTO `sys_oper_log` VALUES (82, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"school/submission/index\",\"createTime\":\"2025-12-24 01:51:26\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1081,\"menuName\":\"作业提交成绩\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1087,\"path\":\"submission\",\"perms\":\"school:submission:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-24 01:55:03', 24);
INSERT INTO `sys_oper_log` VALUES (83, '作业提交成绩', 1, 'com.ruoyi.school.controller.HsAssignmentSubmissionController.add()', 'POST', 1, 'admin', '第1组', '/school/submission', '127.0.0.1', '内网IP', '{\"assignmentId\":11,\"assignmentTitle\":\"00\",\"classId\":2,\"createTime\":\"2025-12-24 02:10:03\",\"params\":{},\"studentId\":0,\"studentName\":\"wkk\",\"subFile\":\"/profile/upload/2025/12/24/任务书_20251224021000A001.doc\",\"subId\":2} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-24 02:10:03', 54);
INSERT INTO `sys_oper_log` VALUES (84, '作业发布', 1, 'com.ruoyi.school.controller.HsAssignmentController.add()', 'POST', 1, 'admin', '第1组', '/school/assignment', '127.0.0.1', '内网IP', '{\"assignmentContent\":\"<p>测试</p>\",\"assignmentId\":2,\"assignmentTitle\":\"测试\",\"classId\":1,\"className\":\"清北班\",\"courseId\":1,\"courseName\":\"计算机\",\"createTime\":\"2025-12-24 02:28:16\",\"params\":{},\"remark\":\"测试\",\"status\":\"0\",\"teacherId\":1,\"teacherName\":\"王开科\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-24 02:28:16', 19);
INSERT INTO `sys_oper_log` VALUES (85, '作业发布', 2, 'com.ruoyi.school.controller.HsAssignmentController.edit()', 'PUT', 1, 'admin', '第1组', '/school/assignment', '127.0.0.1', '内网IP', '{\"assignmentContent\":\"<p>测试</p>\",\"assignmentId\":2,\"assignmentTitle\":\"测试\",\"classId\":1,\"className\":\"清北班\",\"courseId\":1,\"courseName\":\"计算机\",\"createBy\":\"\",\"createTime\":\"2025-12-24 02:28:17\",\"deadline\":\"2025-12-27\",\"params\":{},\"remark\":\"测试\",\"status\":\"0\",\"teacherId\":1,\"teacherName\":\"王开科\",\"updateBy\":\"\",\"updateTime\":\"2025-12-24 02:28:27\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-24 02:28:27', 33);
INSERT INTO `sys_oper_log` VALUES (86, '作业提交成绩', 2, 'com.ruoyi.school.controller.HsAssignmentSubmissionController.edit()', 'PUT', 1, 'admin', '第1组', '/school/submission', '127.0.0.1', '内网IP', '{\"gradeTime\":\"2025-12-23\",\"params\":{},\"score\":2,\"status\":\"2\",\"subId\":2,\"updateTime\":\"2025-12-24 02:30:11\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-24 02:30:11', 12);
INSERT INTO `sys_oper_log` VALUES (87, '作业提交成绩', 1, 'com.ruoyi.school.controller.HsAssignmentSubmissionController.add()', 'POST', 1, 'admin', '第1组', '/school/submission', '127.0.0.1', '内网IP', '{\"assignmentId\":2,\"assignmentTitle\":\"测试\",\"classId\":1,\"createTime\":\"2025-12-24 02:38:49\",\"params\":{},\"status\":\"1\",\"studentId\":101,\"studentName\":\"wkk\",\"subContent\":\"123\",\"subFile\":\"/profile/upload/2025/12/24/哈尔滨石油学院论文撰写规范_20251224023842A002.doc\",\"subId\":3,\"subTime\":\"2025-12-23\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-24 02:38:49', 16);
INSERT INTO `sys_oper_log` VALUES (88, '作业提交成绩', 1, 'com.ruoyi.school.controller.HsAssignmentSubmissionController.add()', 'POST', 1, 'admin', '第1组', '/school/submission', '127.0.0.1', '内网IP', '{\"assignmentId\":2,\"assignmentTitle\":\"测试\",\"classId\":1,\"createTime\":\"2025-12-24 02:56:13\",\"params\":{},\"status\":\"1\",\"studentId\":101,\"studentName\":\"11\",\"subContent\":\"00\",\"subFile\":\"\",\"subId\":4,\"subTime\":\"2025-12-23\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-24 02:56:13', 21);
INSERT INTO `sys_oper_log` VALUES (89, '作业提交成绩', 2, 'com.ruoyi.school.controller.HsAssignmentSubmissionController.edit()', 'PUT', 1, 'admin', '第1组', '/school/submission', '127.0.0.1', '内网IP', '{\"gradeTime\":\"2025-12-23\",\"params\":{},\"score\":90,\"status\":\"2\",\"subId\":2,\"updateTime\":\"2025-12-24 03:04:57\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-24 03:04:57', 16);
INSERT INTO `sys_oper_log` VALUES (90, '作业提交成绩', 2, 'com.ruoyi.school.controller.HsAssignmentSubmissionController.edit()', 'PUT', 1, 'admin', '第1组', '/school/submission', '127.0.0.1', '内网IP', '{\"gradeTime\":\"2025-12-23\",\"params\":{},\"score\":60,\"status\":\"2\",\"subId\":3,\"updateTime\":\"2025-12-24 03:05:02\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-24 03:05:02', 12);
INSERT INTO `sys_oper_log` VALUES (91, '作业提交成绩', 2, 'com.ruoyi.school.controller.HsAssignmentSubmissionController.edit()', 'PUT', 1, 'admin', '第1组', '/school/submission', '127.0.0.1', '内网IP', '{\"gradeTime\":\"2025-12-23\",\"params\":{},\"score\":40,\"status\":\"2\",\"subId\":4,\"updateTime\":\"2025-12-24 03:05:06\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-24 03:05:06', 9);
INSERT INTO `sys_oper_log` VALUES (92, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/dept/index\",\"createTime\":\"2025-12-18 18:10:55\",\"icon\":\"tree\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":103,\"menuName\":\"班级信息管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"dept\",\"perms\":\"system:dept:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-25 00:08:37', 71);
INSERT INTO `sys_oper_log` VALUES (93, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/notice/index\",\"createTime\":\"2025-12-18 18:10:55\",\"icon\":\"message\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":107,\"menuName\":\"作业公告\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"notice\",\"perms\":\"system:notice:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-25 00:08:46', 20);
INSERT INTO `sys_oper_log` VALUES (94, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/post/index\",\"createTime\":\"2025-12-18 18:10:55\",\"icon\":\"post\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":104,\"menuName\":\"岗位管理\",\"menuType\":\"C\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"post\",\"perms\":\"system:post:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-25 00:08:54', 25);
INSERT INTO `sys_oper_log` VALUES (95, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-12-23 02:11:14\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1062,\"menuName\":\"课程科目\",\"menuType\":\"M\",\"orderNum\":10,\"params\":{},\"parentId\":0,\"path\":\"school\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-25 00:09:12', 26);
INSERT INTO `sys_oper_log` VALUES (96, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-12-24 01:54:15\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1087,\"menuName\":\"成绩管理\",\"menuType\":\"M\",\"orderNum\":11,\"params\":{},\"parentId\":0,\"path\":\"grade\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-25 00:09:17', 17);
INSERT INTO `sys_oper_log` VALUES (97, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/dept/index\",\"createTime\":\"2025-12-18 18:10:55\",\"icon\":\"tree\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":103,\"menuName\":\"班级信息管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"dept\",\"perms\":\"system:dept:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-25 00:09:22', 16);
INSERT INTO `sys_oper_log` VALUES (98, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/notice/index\",\"createTime\":\"2025-12-18 18:10:55\",\"icon\":\"message\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":107,\"menuName\":\"公告信息\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"notice\",\"perms\":\"system:notice:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-25 00:13:37', 21);
INSERT INTO `sys_oper_log` VALUES (99, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-12-24 01:54:15\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1087,\"menuName\":\"作业管理\",\"menuType\":\"M\",\"orderNum\":11,\"params\":{},\"parentId\":0,\"path\":\"grade\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-25 00:14:06', 25);
INSERT INTO `sys_oper_log` VALUES (100, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"school/assignment/index\",\"createTime\":\"2025-12-24 01:51:17\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1075,\"menuName\":\"作业公告\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1087,\"path\":\"assignment\",\"perms\":\"school:assignment:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-25 00:14:17', 21);
INSERT INTO `sys_oper_log` VALUES (101, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"school/submission/index\",\"createTime\":\"2025-12-24 01:51:26\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1081,\"menuName\":\"作业提交\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1087,\"path\":\"submission\",\"perms\":\"school:submission:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-25 00:14:32', 22);
INSERT INTO `sys_oper_log` VALUES (102, '作业提交成绩', 1, 'com.ruoyi.school.controller.HsAssignmentSubmissionController.add()', 'POST', 1, 'admin', '第1组', '/school/submission', '127.0.0.1', '内网IP', '{\"assignmentId\":2,\"assignmentTitle\":\"测试\",\"classId\":1,\"createTime\":\"2025-12-25 00:15:50\",\"params\":{},\"status\":\"1\",\"studentId\":101,\"studentName\":\"w\",\"subContent\":\"12\",\"subFile\":\"\",\"subId\":5,\"subTime\":\"2025-12-24\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-25 00:15:51', 30);
INSERT INTO `sys_oper_log` VALUES (103, '作业提交成绩', 2, 'com.ruoyi.school.controller.HsAssignmentSubmissionController.edit()', 'PUT', 1, 'admin', '第1组', '/school/submission', '127.0.0.1', '内网IP', '{\"gradeTime\":\"2025-12-24\",\"params\":{},\"score\":90,\"status\":\"2\",\"subId\":5,\"updateTime\":\"2025-12-25 00:16:18\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-25 00:16:18', 16);
INSERT INTO `sys_oper_log` VALUES (104, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '第1组', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-12-21 20:52:45\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2,100,1000,1001,1002,1003,1004,1005,1006,102,1012,1013,1014,1015,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,103,1016,1017,1018,1019,107,1035,1036,1037,1038,104,1020,1021,1022,1023,1024,1062,1063,1064,1065,1066,1067,1068,1069,1070,1071,1072,1073,1074,1087,1075,1076,1077,1078,1079,1080,1081,1082,1083,1084,1085,1086],\"params\":{},\"remark\":\"科任老师权限介于班主任（admin）之间\",\"roleId\":4,\"roleKey\":\"mid-admin\",\"roleName\":\"科任老师\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-25 00:20:41', 111);
INSERT INTO `sys_oper_log` VALUES (105, '班级课程', 3, 'com.ruoyi.school.controller.HsScheduleController.remove()', 'DELETE', 1, 'admin', '第1组', '/school/schedule/3', '127.0.0.1', '内网IP', '[3] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-26 00:11:10', 49);
INSERT INTO `sys_oper_log` VALUES (106, '班级课程', 1, 'com.ruoyi.school.controller.HsScheduleController.add()', 'POST', 1, 'admin', '第1组', '/school/schedule', '127.0.0.1', '内网IP', '{\"classId\":3,\"className\":\"3\",\"classroom\":\"石油\",\"courseId\":1,\"courseName\":\"语文\",\"createTime\":\"2025-12-26 00:16:50\",\"params\":{},\"scheduleId\":5,\"section\":2,\"teacherId\":1,\"teacherName\":\"wkk\",\"timePeriod\":\"1\",\"weekDay\":3} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-26 00:16:50', 53);
INSERT INTO `sys_oper_log` VALUES (107, '班级课程', 2, 'com.ruoyi.school.controller.HsScheduleController.edit()', 'PUT', 1, 'admin', '第1组', '/school/schedule', '127.0.0.1', '内网IP', '{\"classId\":3,\"className\":\"3\",\"classroom\":\"石油\",\"courseId\":1,\"courseName\":\"语文\",\"createBy\":\"\",\"createTime\":\"2025-12-26 00:16:50\",\"params\":{},\"scheduleId\":5,\"section\":4,\"teacherId\":1,\"teacherName\":\"wkk\",\"timePeriod\":\"1\",\"updateBy\":\"\",\"updateTime\":\"2025-12-26 00:17:30\",\"weekDay\":3} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-26 00:17:30', 12);
INSERT INTO `sys_oper_log` VALUES (108, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '第1组', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"hs_assignment,hs_assignment_submission,hs_course\"}', NULL, 0, NULL, '2025-12-26 00:25:46', 899);
INSERT INTO `sys_oper_log` VALUES (109, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"school/assignment/index\",\"createTime\":\"2025-12-24 01:51:17\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1075,\"menuName\":\"作业公告\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1087,\"path\":\"assignment\",\"perms\":\"school:assignment:list\",\"routeName\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-26 00:30:29', 31);
INSERT INTO `sys_oper_log` VALUES (110, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"school/submission/index\",\"createTime\":\"2025-12-24 01:51:26\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1081,\"menuName\":\"作业提交\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1087,\"path\":\"submission\",\"perms\":\"school:submission:list\",\"routeName\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-26 00:30:35', 19);
INSERT INTO `sys_oper_log` VALUES (111, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"school/submission/index\",\"createTime\":\"2025-12-26 00:27:49\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1088,\"menuName\":\"作业提交成绩\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1087,\"path\":\"submission\",\"perms\":\"school:submission:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-26 00:30:55', 33);
INSERT INTO `sys_oper_log` VALUES (112, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"school/course/index\",\"createTime\":\"2025-12-26 00:28:04\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1094,\"menuName\":\"课程科目\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1087,\"path\":\"course\",\"perms\":\"school:course:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-26 00:31:02', 21);
INSERT INTO `sys_oper_log` VALUES (113, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"school/assignment/index\",\"createTime\":\"2025-12-26 00:28:19\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1100,\"menuName\":\"作业发布\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1087,\"path\":\"assignment\",\"perms\":\"school:assignment:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-26 00:31:09', 21);
INSERT INTO `sys_oper_log` VALUES (114, '作业发布', 1, 'com.ruoyi.school.controller.HsAssignmentController.add()', 'POST', 1, 'admin', '第1组', '/school/assignment', '127.0.0.1', '内网IP', '{\"assignmentTitle\":\"数学作业\",\"classId\":1,\"className\":\"高一3班\",\"courseId\":100,\"courseName\":\"数学\",\"createTime\":\"2025-12-26 00:37:25\",\"deadline\":\"2025-12-31\",\"params\":{},\"teacherName\":\"wkk\"} ', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'course_name\' in \'field list\'\r\n### The error may exist in file [D:\\26毕业设计\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\school\\HsAssignmentMapper.xml]\r\n### The error may involve com.ruoyi.school.mapper.HsAssignmentMapper.insertHsAssignment-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into hs_assignment          ( assignment_title,                          course_id,             course_name,             class_id,             class_name,                          teacher_name,             deadline,                                       create_time )           values ( ?,                          ?,             ?,             ?,             ?,                          ?,             ?,                                       ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'course_name\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'course_name\' in \'field list\'', '2025-12-26 00:37:26', 28);
INSERT INTO `sys_oper_log` VALUES (115, '作业发布', 1, 'com.ruoyi.school.controller.HsAssignmentController.add()', 'POST', 1, 'admin', '第1组', '/school/assignment', '127.0.0.1', '内网IP', '{\"assignmentTitle\":\"数学作业\",\"classId\":1,\"className\":\"高一3班\",\"courseId\":100,\"courseName\":\"数学\",\"createTime\":\"2025-12-26 00:38:59\",\"deadline\":\"2025-12-31\",\"params\":{},\"teacherName\":\"wkk\"} ', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'teacher_id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\26毕业设计\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\school\\HsAssignmentMapper.xml]\r\n### The error may involve com.ruoyi.school.mapper.HsAssignmentMapper.insertHsAssignment-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into hs_assignment          ( assignment_title,                          course_id,             course_name,             class_id,             class_name,                          teacher_name,             deadline,                                       create_time )           values ( ?,                          ?,             ?,             ?,             ?,                          ?,             ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'teacher_id\' doesn\'t have a default value\n; Field \'teacher_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'teacher_id\' doesn\'t have a default value', '2025-12-26 00:38:59', 15);
INSERT INTO `sys_oper_log` VALUES (116, '作业发布', 1, 'com.ruoyi.school.controller.HsAssignmentController.add()', 'POST', 1, 'admin', '第1组', '/school/assignment', '127.0.0.1', '内网IP', '{\"assignmentTitle\":\"数学作业\",\"className\":\"高一3班\",\"courseName\":\"数学\",\"createTime\":\"2025-12-26 00:39:48\",\"deadline\":\"2025-12-30\",\"params\":{},\"teacherName\":\"wkk\"} ', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'course_id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\26毕业设计\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\school\\HsAssignmentMapper.xml]\r\n### The error may involve com.ruoyi.school.mapper.HsAssignmentMapper.insertHsAssignment-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into hs_assignment          ( assignment_title,                                       course_name,                          class_name,                          teacher_name,             deadline,                                       create_time )           values ( ?,                                       ?,                          ?,                          ?,             ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'course_id\' doesn\'t have a default value\n; Field \'course_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'course_id\' doesn\'t have a default value', '2025-12-26 00:39:48', 13);
INSERT INTO `sys_oper_log` VALUES (117, '作业发布', 1, 'com.ruoyi.school.controller.HsAssignmentController.add()', 'POST', 1, 'admin', '第1组', '/school/assignment', '127.0.0.1', '内网IP', '{\"assignmentTitle\":\"数学作业\",\"className\":\"高一3班\",\"courseName\":\"数学\",\"createTime\":\"2025-12-26 00:41:08\",\"deadline\":\"2025-12-30\",\"params\":{},\"teacherName\":\"wkk\"} ', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'teacher_id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\26毕业设计\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\school\\HsAssignmentMapper.xml]\r\n### The error may involve com.ruoyi.school.mapper.HsAssignmentMapper.insertHsAssignment-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into hs_assignment          ( assignment_title,                                       course_name,                          class_name,                          teacher_name,             deadline,                                       create_time )           values ( ?,                                       ?,                          ?,                          ?,             ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'teacher_id\' doesn\'t have a default value\n; Field \'teacher_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'teacher_id\' doesn\'t have a default value', '2025-12-26 00:41:08', 16);
INSERT INTO `sys_oper_log` VALUES (118, '作业发布', 1, 'com.ruoyi.school.controller.HsAssignmentController.add()', 'POST', 1, 'admin', '第1组', '/school/assignment', '127.0.0.1', '内网IP', '{\"assignmentId\":1,\"assignmentTitle\":\"数学作业\",\"classId\":1,\"className\":\"1班\",\"courseId\":3,\"courseName\":\"数学\",\"createTime\":\"2025-12-26 00:42:06\",\"deadline\":\"2025-12-28\",\"params\":{},\"teacherId\":1,\"teacherName\":\"wkk\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-26 00:42:06', 17);
INSERT INTO `sys_oper_log` VALUES (119, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '第1组', '/system/menu/1088', '127.0.0.1', '内网IP', '1088 ', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2025-12-26 00:52:13', 10);
INSERT INTO `sys_oper_log` VALUES (120, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '第1组', '/system/menu/1087', '127.0.0.1', '内网IP', '1087 ', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2025-12-26 00:52:28', 9);
INSERT INTO `sys_oper_log` VALUES (121, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '第1组', '/system/menu/1088', '127.0.0.1', '内网IP', '1088 ', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2025-12-26 00:52:37', 6);
INSERT INTO `sys_oper_log` VALUES (122, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"school/submission/index\",\"createTime\":\"2025-12-26 00:27:49\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1088,\"menuName\":\"作业提交成绩\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1087,\"path\":\"submission\",\"perms\":\"school:submission:list\",\"routeName\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-26 00:52:45', 25);
INSERT INTO `sys_oper_log` VALUES (123, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"school/course/index\",\"createTime\":\"2025-12-26 00:28:04\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1094,\"menuName\":\"课程科目\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1087,\"path\":\"course\",\"perms\":\"school:course:list\",\"routeName\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-26 00:52:50', 21);
INSERT INTO `sys_oper_log` VALUES (124, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"school/assignment/index\",\"createTime\":\"2025-12-26 00:28:19\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1100,\"menuName\":\"作业发布\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1087,\"path\":\"assignment\",\"perms\":\"school:assignment:list\",\"routeName\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-26 00:52:56', 29);
INSERT INTO `sys_oper_log` VALUES (125, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-12-24 01:54:15\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1087,\"menuName\":\"作业管理\",\"menuType\":\"M\",\"orderNum\":11,\"params\":{},\"parentId\":0,\"path\":\"grade\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-26 00:53:06', 22);
INSERT INTO `sys_oper_log` VALUES (126, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '第1组', '/system/menu/1087', '127.0.0.1', '内网IP', '1087 ', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2025-12-26 00:53:09', 7);
INSERT INTO `sys_oper_log` VALUES (127, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-12-18 18:10:55\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"1\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-26 00:53:34', 23);
INSERT INTO `sys_oper_log` VALUES (128, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"school/course/index\",\"createTime\":\"2025-12-23 02:23:35\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1063,\"menuName\":\"课程科目\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1062,\"path\":\"course\",\"perms\":\"school:course:list\",\"routeName\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-26 00:54:17', 24);
INSERT INTO `sys_oper_log` VALUES (129, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '第1组', '/tool/gen/4', '127.0.0.1', '内网IP', '[4] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-26 00:55:49', 55);
INSERT INTO `sys_oper_log` VALUES (130, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '第1组', '/tool/gen/3', '127.0.0.1', '内网IP', '[3] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-26 00:55:53', 14);
INSERT INTO `sys_oper_log` VALUES (131, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.edit()', 'PUT', 1, 'admin', '第1组', '/system/notice', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-12-18 18:10:56\",\"noticeContent\":\"<p>新版本内容11111111111111111</p>\",\"noticeId\":1,\"noticeTitle\":\"温馨提醒：2018-07-01 若依新版本发布啦\",\"noticeType\":\"2\",\"params\":{},\"remark\":\"管理员\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2025-12-21 23:05:15\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-26 01:11:09', 27);
INSERT INTO `sys_oper_log` VALUES (132, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '第1组', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"homework_submission,homework_task,sys_class,sys_course\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-27 01:01:30', 745);
INSERT INTO `sys_oper_log` VALUES (133, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '第1组', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"task\",\"className\":\"HomeworkTask\",\"columns\":[{\"capJavaField\":\"TaskId\",\"columnComment\":\"作业任务ID\",\"columnId\":77,\"columnName\":\"task_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-27 01:01:30\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"taskId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TaskTitle\",\"columnComment\":\"作业标题\",\"columnId\":78,\"columnName\":\"task_title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-27 01:01:30\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"taskTitle\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TaskContent\",\"columnComment\":\"作业内容/要求\",\"columnId\":79,\"columnName\":\"task_content\",\"columnType\":\"longtext\",\"createBy\":\"admin\",\"createTime\":\"2025-12-27 01:01:30\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"editor\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"taskContent\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"FileUrls\",\"columnComment\":\"附件地址(支持多个)\",\"columnId\":80,\"columnName\":\"file_urls\",\"columnType\":\"varchar(1000)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-27 01:01:30\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-27 01:05:40', 120);
INSERT INTO `sys_oper_log` VALUES (134, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '第1组', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"banji\",\"className\":\"SysClass\",\"columns\":[{\"capJavaField\":\"ClassId\",\"columnComment\":\"班级ID\",\"columnId\":91,\"columnName\":\"class_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-27 01:01:30\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"classId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ClassName\",\"columnComment\":\"班级名称\",\"columnId\":92,\"columnName\":\"class_name\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-27 01:01:30\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"className\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"GradeLevel\",\"columnComment\":\"年级\",\"columnId\":93,\"columnName\":\"grade_level\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-27 01:01:30\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"gradeLevel\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Status\",\"columnComment\":\"状态（0正常 1停用）\",\"columnId\":94,\"columnName\":\"status\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-27 01:01:30\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-27 01:07:02', 82);
INSERT INTO `sys_oper_log` VALUES (135, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '第1组', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"course\",\"className\":\"SysCourse\",\"columns\":[{\"capJavaField\":\"CourseId\",\"columnComment\":\"课程ID\",\"columnId\":100,\"columnName\":\"course_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-27 01:01:30\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"courseId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CourseName\",\"columnComment\":\"课程名称\",\"columnId\":101,\"columnName\":\"course_name\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-27 01:01:30\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"courseName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CourseCode\",\"columnComment\":\"课程编码\",\"columnId\":102,\"columnName\":\"course_code\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-27 01:01:30\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"courseCode\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Status\",\"columnComment\":\"状态（0正常 1停用）\",\"columnId\":103,\"columnName\":\"status\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-27 01:01:30\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-27 01:09:57', 72);
INSERT INTO `sys_oper_log` VALUES (136, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '第1组', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"submission\",\"className\":\"HomeworkSubmission\",\"columns\":[{\"capJavaField\":\"SubmissionId\",\"columnComment\":\"记录ID\",\"columnId\":60,\"columnName\":\"submission_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-27 01:01:29\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"submissionId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TaskId\",\"columnComment\":\"关联作业任务ID\",\"columnId\":61,\"columnName\":\"task_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-27 01:01:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"taskId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"StudentId\",\"columnComment\":\"学生ID(关联sys_user)\",\"columnId\":62,\"columnName\":\"student_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-27 01:01:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"studentId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"StudentName\",\"columnComment\":\"学生姓名(冗余字段方便统计展示)\",\"columnId\":63,\"columnName\":\"student_name\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-27 01:01:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isIns', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-27 01:10:58', 131);
INSERT INTO `sys_oper_log` VALUES (137, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '第1组', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"homework_task,sys_class,sys_course,homework_submission\"}', NULL, 0, NULL, '2025-12-27 01:11:44', 620);
INSERT INTO `sys_oper_log` VALUES (138, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"作业信息\",\"menuType\":\"M\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"school\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-27 01:38:50', 80);
INSERT INTO `sys_oper_log` VALUES (139, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"school/banji/index\",\"createTime\":\"2025-12-27 01:13:37\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1106,\"menuName\":\"班级信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1130,\"path\":\"banji\",\"perms\":\"school:banji:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-27 01:40:00', 41);
INSERT INTO `sys_oper_log` VALUES (140, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"school/course/index\",\"createTime\":\"2025-12-27 01:13:55\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1112,\"menuName\":\"课程信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1130,\"path\":\"course\",\"perms\":\"school:course:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-27 01:40:08', 29);
INSERT INTO `sys_oper_log` VALUES (141, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"school/submission/index\",\"createTime\":\"2025-12-27 01:14:09\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1118,\"menuName\":\"作业提交与成绩\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1130,\"path\":\"submission\",\"perms\":\"school:submission:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-27 01:40:14', 19);
INSERT INTO `sys_oper_log` VALUES (142, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"school/task/index\",\"createTime\":\"2025-12-27 01:14:20\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1124,\"menuName\":\"作业发布任务\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1130,\"path\":\"task\",\"perms\":\"school:task:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-27 01:40:22', 25);
INSERT INTO `sys_oper_log` VALUES (143, '班级课程', 1, 'com.ruoyi.school.controller.HsScheduleController.add()', 'POST', 1, 'admin', '第1组', '/school/schedule', '127.0.0.1', '内网IP', '{\"classId\":1,\"className\":\"3\",\"courseId\":1,\"courseName\":\"语文\",\"createTime\":\"2025-12-27 01:57:16\",\"params\":{},\"scheduleId\":6,\"section\":2,\"teacherId\":1,\"weekDay\":5} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-27 01:57:16', 68);
INSERT INTO `sys_oper_log` VALUES (144, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '第1组', '/system/menu/4', '127.0.0.1', '内网IP', '4 ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-27 01:57:34', 59);
INSERT INTO `sys_oper_log` VALUES (145, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"school/schedule/index\",\"createTime\":\"2025-12-23 02:23:44\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1069,\"menuName\":\"课表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1062,\"path\":\"schedule\",\"perms\":\"school:schedule:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-27 01:58:08', 24);
INSERT INTO `sys_oper_log` VALUES (146, '班级信息', 1, 'com.ruoyi.school.controller.SysClassController.add()', 'POST', 1, 'admin', '第1组', '/school/banji', '127.0.0.1', '内网IP', '{\"classId\":1,\"className\":\"1\",\"createTime\":\"2025-12-27 02:01:02\",\"gradeLevel\":\"2\",\"params\":{}} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-27 02:01:02', 26);
INSERT INTO `sys_oper_log` VALUES (147, '课程信息', 1, 'com.ruoyi.school.controller.SysCourseController.add()', 'POST', 1, 'admin', '第1组', '/school/course', '127.0.0.1', '内网IP', '{\"courseCode\":\"1\",\"courseId\":1,\"courseName\":\"数学\",\"createTime\":\"2025-12-27 02:01:16\",\"params\":{}} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-27 02:01:16', 15);
INSERT INTO `sys_oper_log` VALUES (148, '作业发布任务', 1, 'com.ruoyi.school.controller.HomeworkTaskController.add()', 'POST', 1, 'admin', '第1组', '/school/task', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-12-27 02:07:14\",\"deadlineTime\":\"2025-12-31\",\"params\":{},\"status\":\"0\",\"taskContent\":\"<p>1</p>\",\"taskTitle\":\"1\"} ', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'course_id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\26毕业设计\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\school\\HomeworkTaskMapper.xml]\r\n### The error may involve com.ruoyi.school.mapper.HomeworkTaskMapper.insertHomeworkTask-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into homework_task          ( task_title,             task_content,                                                                 deadline_time,             status,                          create_time )           values ( ?,             ?,                                                                 ?,             ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'course_id\' doesn\'t have a default value\n; Field \'course_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'course_id\' doesn\'t have a default value', '2025-12-27 02:07:14', 202);
INSERT INTO `sys_oper_log` VALUES (149, '作业发布任务', 1, 'com.ruoyi.school.controller.HomeworkTaskController.add()', 'POST', 1, 'admin', '第1组', '/school/task', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-12-27 02:07:34\",\"deadlineTime\":\"2025-12-30\",\"params\":{},\"status\":\"0\",\"taskContent\":\"<p>12</p>\",\"taskTitle\":\"数学\"} ', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'course_id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\26毕业设计\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\school\\HomeworkTaskMapper.xml]\r\n### The error may involve com.ruoyi.school.mapper.HomeworkTaskMapper.insertHomeworkTask-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into homework_task          ( task_title,             task_content,                                                                 deadline_time,             status,                          create_time )           values ( ?,             ?,                                                                 ?,             ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'course_id\' doesn\'t have a default value\n; Field \'course_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'course_id\' doesn\'t have a default value', '2025-12-27 02:07:35', 13);
INSERT INTO `sys_oper_log` VALUES (150, '作业发布任务', 1, 'com.ruoyi.school.controller.HomeworkTaskController.add()', 'POST', 1, 'admin', '第1组', '/school/task', '127.0.0.1', '内网IP', '{\"classId\":1,\"courseId\":1,\"createTime\":\"2025-12-27 02:12:09\",\"params\":{},\"status\":\"0\",\"taskContent\":\"<p>12</p>\",\"taskTitle\":\"数学\",\"teacherId\":1} ', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'deadline_time\' doesn\'t have a default value\r\n### The error may exist in file [D:\\26毕业设计\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\school\\HomeworkTaskMapper.xml]\r\n### The error may involve com.ruoyi.school.mapper.HomeworkTaskMapper.insertHomeworkTask-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into homework_task          ( task_title,             task_content,                          course_id,             class_id,             teacher_id,                          status,                          create_time )           values ( ?,             ?,                          ?,             ?,             ?,                          ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'deadline_time\' doesn\'t have a default value\n; Field \'deadline_time\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'deadline_time\' doesn\'t have a default value', '2025-12-27 02:12:09', 30);
INSERT INTO `sys_oper_log` VALUES (151, '作业发布任务', 1, 'com.ruoyi.school.controller.HomeworkTaskController.add()', 'POST', 1, 'admin', '第1组', '/school/task', '127.0.0.1', '内网IP', '{\"classId\":1,\"courseId\":1,\"createTime\":\"2025-12-27 02:13:09\",\"deadlineTime\":\"2025-12-30\",\"params\":{},\"status\":\"0\",\"taskContent\":\"<p>12</p>\",\"taskId\":1,\"taskTitle\":\"数学\",\"teacherId\":1} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-27 02:13:09', 1);
INSERT INTO `sys_oper_log` VALUES (152, '作业提交与成绩', 1, 'com.ruoyi.school.controller.HomeworkSubmissionController.add()', 'POST', 1, 'admin', '第1组', '/school/submission', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-12-27 02:13:48\",\"params\":{},\"submitContent\":\"<p>50</p>\",\"taskId\":1} ', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'student_id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\26毕业设计\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\school\\HomeworkSubmissionMapper.xml]\r\n### The error may involve com.ruoyi.school.mapper.HomeworkSubmissionMapper.insertHomeworkSubmission-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into homework_submission          ( task_id,                                       submit_content,                                                                                                                     create_time )           values ( ?,                                       ?,                                                                                                                     ? )\r\n### Cause: java.sql.SQLException: Field \'student_id\' doesn\'t have a default value\n; Field \'student_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'student_id\' doesn\'t have a default value', '2025-12-27 02:13:48', 21);
INSERT INTO `sys_oper_log` VALUES (153, '作业发布任务', 2, 'com.ruoyi.school.controller.HomeworkTaskController.edit()', 'PUT', 1, 'admin', '第1组', '/school/task', '127.0.0.1', '内网IP', '{\"classId\":1,\"courseId\":1,\"createBy\":\"\",\"createTime\":\"2025-12-27 02:13:10\",\"deadlineTime\":\"2025-12-30\",\"params\":{},\"status\":\"1\",\"taskContent\":\"<p>12</p>\",\"taskId\":1,\"taskTitle\":\"数学\",\"teacherId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-12-27 02:21:59\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-27 02:21:59', 56);
INSERT INTO `sys_oper_log` VALUES (154, '作业提交与成绩', 1, 'com.ruoyi.school.controller.HomeworkSubmissionController.add()', 'POST', 1, 'admin', '第1组', '/school/submission', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-12-27 02:22:05\",\"params\":{},\"status\":\"1\",\"studentId\":1,\"submissionId\":1,\"submitContent\":\"<p>22</p>\",\"submitTime\":\"2025-12-27\",\"taskId\":1} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-27 02:22:05', 33);
INSERT INTO `sys_oper_log` VALUES (155, '作业提交与成绩', 2, 'com.ruoyi.school.controller.HomeworkSubmissionController.edit()', 'PUT', 1, 'admin', '第1组', '/school/submission', '127.0.0.1', '内网IP', '{\"params\":{},\"score\":80,\"status\":\"2\",\"submissionId\":1,\"updateTime\":\"2025-12-27 02:26:26\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-27 02:26:26', 15);
INSERT INTO `sys_oper_log` VALUES (156, '作业提交与成绩', 1, 'com.ruoyi.school.controller.HomeworkSubmissionController.add()', 'POST', 1, 'admin', '第1组', '/school/submission', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-12-27 02:34:55\",\"params\":{},\"status\":\"1\",\"studentId\":1,\"studentName\":\"若依\",\"submitContent\":\"<p>123</p>\",\"submitTime\":\"2025-12-27\",\"taskId\":1} ', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1-1\' for key \'uk_task_student\'\r\n### The error may exist in file [D:\\26毕业设计\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\school\\HomeworkSubmissionMapper.xml]\r\n### The error may involve com.ruoyi.school.mapper.HomeworkSubmissionMapper.insertHomeworkSubmission-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into homework_submission          ( task_id,             student_id,             student_name,             submit_content,                          submit_time,             status,                                                                              create_time )           values ( ?,             ?,             ?,             ?,                          ?,             ?,                                                                              ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1-1\' for key \'uk_task_student\'\n; Duplicate entry \'1-1\' for key \'uk_task_student\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1-1\' for key \'uk_task_student\'', '2025-12-27 02:34:55', 113);
INSERT INTO `sys_oper_log` VALUES (157, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '第1组', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-12-21 20:52:45\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2,100,1000,1001,1002,1003,1004,1005,1006,102,1012,1013,1014,1015,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,103,1016,1017,1018,1019,107,1035,1036,1037,1038,104,1020,1021,1022,1023,1024,1130,1106,1107,1108,1109,1110,1111,1112,1113,1114,1115,1116,1117,1118,1119,1120,1121,1122,1123,1124,1125,1126,1127,1128,1129,1062,1063,1064,1065,1066,1067,1068,1069,1070,1071,1072,1073,1074],\"params\":{},\"remark\":\"科任老师权限介于班主任（admin）之间\",\"roleId\":4,\"roleKey\":\"mid-admin\",\"roleName\":\"科任老师\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-27 02:39:38', 89);
INSERT INTO `sys_oper_log` VALUES (158, '作业提交与成绩', 1, 'com.ruoyi.school.controller.HomeworkSubmissionController.add()', 'POST', 1, '科任老师', '石油中学', '/school/submission', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-12-27 02:43:49\",\"params\":{},\"status\":\"1\",\"studentId\":5,\"studentName\":\"语文老师\",\"submissionId\":3,\"submitContent\":\"<p>56</p>\",\"submitTime\":\"2025-12-27\",\"taskId\":1} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-27 02:43:49', 24);
INSERT INTO `sys_oper_log` VALUES (159, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"school/submission/index\",\"createTime\":\"2025-12-27 01:14:09\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1118,\"menuName\":\"作业成绩\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1130,\"path\":\"submission\",\"perms\":\"school:submission:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-27 23:37:11', 52);
INSERT INTO `sys_oper_log` VALUES (160, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"school/task/index\",\"createTime\":\"2025-12-27 01:14:20\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1124,\"menuName\":\"作业发布\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1130,\"path\":\"task\",\"perms\":\"school:task:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-27 23:37:21', 16);
INSERT INTO `sys_oper_log` VALUES (161, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"school/submission/index\",\"createTime\":\"2025-12-27 01:14:09\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1118,\"menuName\":\"作业成绩批改\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1130,\"path\":\"submission\",\"perms\":\"school:submission:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-27 23:37:45', 19);
INSERT INTO `sys_oper_log` VALUES (162, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"school/task/index\",\"createTime\":\"2025-12-27 01:14:20\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1124,\"menuName\":\"作业发布提交\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1130,\"path\":\"task\",\"perms\":\"school:task:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-27 23:37:56', 27);
INSERT INTO `sys_oper_log` VALUES (163, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '第1组', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"hs_attendance\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-27 23:46:21', 225);
INSERT INTO `sys_oper_log` VALUES (164, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '第1组', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"attendance\",\"className\":\"HsAttendance\",\"columns\":[{\"capJavaField\":\"AttendanceId\",\"columnComment\":\"考勤ID\",\"columnId\":109,\"columnName\":\"attendance_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-27 23:46:21\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"attendanceId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"StudentId\",\"columnComment\":\"学生ID(关联sys_user)\",\"columnId\":110,\"columnName\":\"student_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-27 23:46:21\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"studentId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"StudentName\",\"columnComment\":\"学生姓名(冗余方便查询)\",\"columnId\":111,\"columnName\":\"student_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-27 23:46:21\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"studentName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"AttendanceDate\",\"columnComment\":\"考勤日期\",\"columnId\":112,\"columnName\":\"attendance_date\",\"columnType\":\"date\",\"createBy\":\"admin\",\"createTime\":\"2025-12-27 23:46:21\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncremen', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-27 23:47:16', 112);
INSERT INTO `sys_oper_log` VALUES (165, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '第1组', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"hs_attendance\"}', NULL, 0, NULL, '2025-12-27 23:47:32', 683);
INSERT INTO `sys_oper_log` VALUES (166, '学生考勤', 1, 'com.ruoyi.school.controller.HsAttendanceController.add()', 'POST', 1, 'admin', '第1组', '/school/attendance', '127.0.0.1', '内网IP', '{\"attendanceDate\":\"2025-12-30\",\"attendanceId\":6,\"createTime\":\"2025-12-28 00:11:55\",\"params\":{},\"studentId\":1,\"studentName\":\"wkk\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-28 00:11:55', 23);
INSERT INTO `sys_oper_log` VALUES (167, '学生考勤', 3, 'com.ruoyi.school.controller.HsAttendanceController.remove()', 'DELETE', 1, 'admin', '第1组', '/school/attendance/6', '127.0.0.1', '内网IP', '[6] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-28 00:12:00', 12);
INSERT INTO `sys_oper_log` VALUES (168, '学生考勤', 1, 'com.ruoyi.school.controller.HsAttendanceController.add()', 'POST', 1, 'admin', '第1组', '/school/attendance', '127.0.0.1', '内网IP', '{\"attendanceDate\":\"2025-12-27\",\"attendanceId\":7,\"createTime\":\"2025-12-28 00:13:35\",\"params\":{},\"status\":\"2\",\"studentId\":6,\"studentName\":\"wkk\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-28 00:13:35', 12);
INSERT INTO `sys_oper_log` VALUES (169, '作业提交与成绩', 2, 'com.ruoyi.school.controller.HomeworkSubmissionController.edit()', 'PUT', 1, 'admin', '第1组', '/school/submission', '127.0.0.1', '内网IP', '{\"params\":{},\"score\":90,\"status\":\"2\",\"submissionId\":3,\"updateTime\":\"2025-12-28 00:38:59\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-28 00:38:59', 71);
INSERT INTO `sys_oper_log` VALUES (170, '作业发布任务', 1, 'com.ruoyi.school.controller.HomeworkTaskController.add()', 'POST', 1, 'admin', '第1组', '/school/task', '127.0.0.1', '内网IP', '{\"classId\":1,\"courseId\":1,\"createTime\":\"2025-12-28 00:57:28\",\"deadlineTime\":\"2025-12-30\",\"params\":{},\"status\":\"1\",\"taskContent\":\"<p>测试</p>\",\"taskId\":2,\"taskTitle\":\"语文作业\",\"teacherId\":1} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-28 00:57:29', 63);
INSERT INTO `sys_oper_log` VALUES (171, '作业提交与成绩', 1, 'com.ruoyi.school.controller.HomeworkSubmissionController.add()', 'POST', 1, 'admin', '第1组', '/school/submission', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-12-28 00:57:44\",\"params\":{},\"status\":\"1\",\"studentId\":1,\"studentName\":\"若依\",\"submissionId\":4,\"submitContent\":\"<p>测试</p>\",\"submitTime\":\"2025-12-28\",\"taskId\":2} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-28 00:57:44', 11);
INSERT INTO `sys_oper_log` VALUES (172, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"school/banji/index\",\"createTime\":\"2025-12-27 01:13:37\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1106,\"menuName\":\"班级信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1130,\"path\":\"banji\",\"perms\":\"school:banji:list\",\"routeName\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-28 00:59:16', 34);
INSERT INTO `sys_oper_log` VALUES (173, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"school/course/index\",\"createTime\":\"2025-12-27 01:13:55\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1112,\"menuName\":\"课程信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1130,\"path\":\"course\",\"perms\":\"school:course:list\",\"routeName\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-28 00:59:22', 22);
INSERT INTO `sys_oper_log` VALUES (174, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"school/attendance/index\",\"createTime\":\"2025-12-27 23:48:38\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1131,\"menuName\":\"学生考勤\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"attendance\",\"perms\":\"school:attendance:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-30 00:57:27', 93);
INSERT INTO `sys_oper_log` VALUES (175, '通知公告', 1, 'com.ruoyi.web.controller.system.SysNoticeController.add()', 'POST', 1, 'admin', '第1组', '/system/notice', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"noticeContent\":\"<p>国庆节放假10天，记得做好作业，10月7号返校</p>\",\"noticeTitle\":\"放假信息\",\"noticeType\":\"1\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-30 01:02:57', 16);
INSERT INTO `sys_oper_log` VALUES (176, '通知公告', 1, 'com.ruoyi.web.controller.system.SysNoticeController.add()', 'POST', 1, 'admin', '第1组', '/system/notice', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"noticeContent\":\"<p>本学期体育老师生病</p>\",\"noticeTitle\":\"1230体育课程调整\",\"noticeType\":\"1\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-30 01:04:15', 13);
INSERT INTO `sys_oper_log` VALUES (177, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.edit()', 'PUT', 1, 'admin', '第1组', '/system/notice', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-12-18 18:10:56\",\"noticeContent\":\"<p>新版本内容11111111111111111</p>\",\"noticeId\":1,\"noticeTitle\":\"温馨提醒：2018-07-01 若依新版本发布啦\",\"noticeType\":\"2\",\"params\":{},\"remark\":\"管理员\",\"status\":\"1\",\"updateBy\":\"admin\",\"updateTime\":\"2025-12-26 01:11:09\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-30 01:04:37', 8);
INSERT INTO `sys_oper_log` VALUES (178, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.edit()', 'PUT', 1, 'admin', '第1组', '/system/notice', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-12-18 18:10:56\",\"noticeContent\":\"<p>维护内容</p>\",\"noticeId\":2,\"noticeTitle\":\"维护通知：2018-07-01 若依系统凌晨维护\",\"noticeType\":\"1\",\"params\":{},\"remark\":\"管理员\",\"status\":\"1\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-30 01:04:47', 7);
INSERT INTO `sys_oper_log` VALUES (179, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/user/index\",\"createTime\":\"2025-12-18 18:10:55\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":100,\"menuName\":\"管理学生档案\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"user\",\"perms\":\"system:user:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-30 01:07:09', 19);
INSERT INTO `sys_oper_log` VALUES (180, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/user/index\",\"createTime\":\"2025-12-18 18:10:55\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":100,\"menuName\":\"管理学生档案\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"user\",\"perms\":\"system:user:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-30 01:07:36', 20);
INSERT INTO `sys_oper_log` VALUES (181, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '第1组', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-12-22 19:09:11\",\"delFlag\":\"0\",\"deptId\":100,\"email\":\"\",\"loginDate\":\"2025-12-22 19:10:36\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"wkk\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[4],\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":4,\"roleKey\":\"mid-admin\",\"roleName\":\"科任老师\",\"roleSort\":3,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":7,\"userName\":\"wkk\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-31 00:41:09', 147);
INSERT INTO `sys_oper_log` VALUES (182, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', '第1组', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":7} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-31 00:41:45', 100);
INSERT INTO `sys_oper_log` VALUES (183, '学生考勤', 2, 'com.ruoyi.school.controller.HsAttendanceController.edit()', 'PUT', 1, 'admin', '第1组', '/school/attendance', '127.0.0.1', '内网IP', '{\"attendanceDate\":\"2025-12-27\",\"attendanceId\":7,\"createBy\":\"\",\"createTime\":\"2025-12-28 00:13:35\",\"delFlag\":\"0\",\"params\":{},\"status\":\"1\",\"studentId\":6,\"studentName\":\"wkk\",\"updateBy\":\"\",\"updateTime\":\"2026-01-01 01:08:22\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-01 01:08:22', 27);
INSERT INTO `sys_oper_log` VALUES (184, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '第1组', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-12-18 18:10:55\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1131,1132,1133,1134,1135,1136],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通用户\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-01 01:13:34', 87);
INSERT INTO `sys_oper_log` VALUES (185, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '第1组', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-12-18 18:10:55\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[107,1131,1132,1133,1134,1135,1136,1035,1087,1075,1076,1077,1078,1079,1080,1081,1082,1083,1084,1085,1086,1088,1089,1090,1091,1092,1093,1094,1095,1096,1097,1098,1099,1100,1101,1102,1103,1104,1105],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通用户\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-01 01:16:45', 62);
INSERT INTO `sys_oper_log` VALUES (186, '作业发布任务', 1, 'com.ruoyi.school.controller.HomeworkTaskController.add()', 'POST', 1, 'admin', '第1组', '/school/task', '127.0.0.1', '内网IP', '{\"classId\":1,\"courseId\":1,\"createTime\":\"2026-01-02 00:14:45\",\"deadlineTime\":\"2026-01-10\",\"params\":{},\"status\":\"1\",\"taskContent\":\"<p>测试</p>\",\"taskId\":3,\"taskTitle\":\"测试\",\"teacherId\":1} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-02 00:14:45', 79);
INSERT INTO `sys_oper_log` VALUES (187, '作业提交与成绩', 1, 'com.ruoyi.school.controller.HomeworkSubmissionController.add()', 'POST', 1, 'admin', '第1组', '/school/submission', '127.0.0.1', '内网IP', '{\"createTime\":\"2026-01-02 00:15:23\",\"params\":{},\"status\":\"1\",\"studentId\":1,\"studentName\":\"若依\",\"submissionId\":5,\"submitContent\":\"<p><img src=\\\"/dev-api/profile/upload/2026/01/02/班级管理系统 33_20260102001519A001.png\\\"></p>\",\"submitTime\":\"2026-01-02\",\"taskId\":3} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-02 00:15:23', 32);
INSERT INTO `sys_oper_log` VALUES (188, '学生考勤', 1, 'com.ruoyi.school.controller.HsAttendanceController.add()', 'POST', 1, 'admin', '第1组', '/school/attendance', '127.0.0.1', '内网IP', '{\"attendanceDate\":\"2026-01-03\",\"attendanceId\":8,\"createTime\":\"2026-01-02 01:13:42\",\"params\":{},\"status\":\"1\",\"studentId\":7,\"studentName\":\"wkk\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-02 01:13:42', 78);
INSERT INTO `sys_oper_log` VALUES (189, '学生考勤', 3, 'com.ruoyi.school.controller.HsAttendanceController.remove()', 'DELETE', 1, 'admin', '第1组', '/school/attendance/1', '127.0.0.1', '内网IP', '[1] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-02 01:14:12', 20);
INSERT INTO `sys_oper_log` VALUES (190, '学生考勤', 3, 'com.ruoyi.school.controller.HsAttendanceController.remove()', 'DELETE', 1, 'admin', '第1组', '/school/attendance/2', '127.0.0.1', '内网IP', '[2] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-02 01:14:15', 11);
INSERT INTO `sys_oper_log` VALUES (191, '学生考勤', 3, 'com.ruoyi.school.controller.HsAttendanceController.remove()', 'DELETE', 1, 'admin', '第1组', '/school/attendance/3', '127.0.0.1', '内网IP', '[3] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-02 01:14:17', 10);
INSERT INTO `sys_oper_log` VALUES (192, '学生考勤', 3, 'com.ruoyi.school.controller.HsAttendanceController.remove()', 'DELETE', 1, 'admin', '第1组', '/school/attendance/4', '127.0.0.1', '内网IP', '[4] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-02 01:14:20', 12);
INSERT INTO `sys_oper_log` VALUES (193, '学生考勤', 2, 'com.ruoyi.school.controller.HsAttendanceController.edit()', 'PUT', 1, 'admin', '第1组', '/school/attendance', '127.0.0.1', '内网IP', '{\"attendanceDate\":\"2026-01-02\",\"attendanceId\":8,\"createBy\":\"\",\"createTime\":\"2026-01-02 01:13:42\",\"delFlag\":\"0\",\"params\":{},\"status\":\"1\",\"studentId\":7,\"studentName\":\"wkk\",\"updateBy\":\"\",\"updateTime\":\"2026-01-02 01:27:17\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-02 01:27:17', 55);
INSERT INTO `sys_oper_log` VALUES (194, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '第1组', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-12-18 18:10:55\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[107,1131,1132,1133,1134,1135,1136,1035,1130,1106,1107,1108,1109,1110,1111,1112,1113,1114,1115,1116,1117,1118,1119,1120,1121,1122,1123,1124,1125,1126,1127,1128,1129,1062,1063,1064,1065,1066,1067,1068,1069,1070,1071,1072,1073,1074,1087,1075,1076,1077,1078,1079,1080,1081,1082,1083,1084,1085,1086,1088,1089,1090,1091,1092,1093,1094,1095,1096,1097,1098,1099,1100,1101,1102,1103,1104,1105],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通用户\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-03 00:16:26', 88);
INSERT INTO `sys_oper_log` VALUES (195, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '第1组', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-12-18 18:10:55\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[107,1131,1132,1133,1134,1135,1136,1035,1130,1106,1107,1108,1109,1110,1111,1112,1113,1114,1115,1116,1117,1118,1119,1120,1121,1122,1123,1124,1125,1126,1127,1128,1129,1062,1063,1064,1065,1066,1067,1068,1069,1070,1071,1072,1073,1074,1087,1075,1076,1077,1078,1079,1080,1081,1082,1083,1084,1085,1086,1088,1089,1090,1091,1092,1093,1094,1095,1096,1097,1098,1099,1100,1101,1102,1103,1104,1105],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通用户\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-03 00:16:40', 59);
INSERT INTO `sys_oper_log` VALUES (196, '作业发布任务', 1, 'com.ruoyi.school.controller.HomeworkTaskController.add()', 'POST', 1, 'admin', '第1组', '/school/task', '127.0.0.1', '内网IP', '{\"classId\":1,\"courseId\":1,\"createTime\":\"2026-01-04 00:53:51\",\"deadlineTime\":\"2026-01-23\",\"params\":{},\"status\":\"1\",\"taskContent\":\"<p>CS</p>\",\"taskId\":4,\"taskTitle\":\"CS\",\"teacherId\":1} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-04 00:53:51', 123);
INSERT INTO `sys_oper_log` VALUES (197, '作业发布任务', 1, 'com.ruoyi.school.controller.HomeworkTaskController.add()', 'POST', 1, 'admin', '第1组', '/school/task', '127.0.0.1', '内网IP', '{\"classId\":1,\"courseId\":1,\"createTime\":\"2026-01-08 00:23:05\",\"deadlineTime\":\"2026-01-30\",\"params\":{},\"status\":\"1\",\"taskContent\":\"<p>1233</p>\",\"taskId\":5,\"taskTitle\":\"cs\",\"teacherId\":1} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-08 00:23:06', 69);
INSERT INTO `sys_oper_log` VALUES (198, '作业提交与成绩', 2, 'com.ruoyi.school.controller.HomeworkSubmissionController.edit()', 'PUT', 1, 'admin', '第1组', '/school/submission', '127.0.0.1', '内网IP', '{\"params\":{},\"score\":81,\"status\":\"2\",\"submissionId\":9,\"updateTime\":\"2026-01-08 00:25:55\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-08 00:25:55', 40);
INSERT INTO `sys_oper_log` VALUES (199, '作业提交与成绩', 3, 'com.ruoyi.school.controller.HomeworkSubmissionController.remove()', 'DELETE', 1, 'admin', '第1组', '/school/submission/6', '127.0.0.1', '内网IP', '[6] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-08 00:32:34', 26);
INSERT INTO `sys_oper_log` VALUES (200, '作业提交与成绩', 3, 'com.ruoyi.school.controller.HomeworkSubmissionController.remove()', 'DELETE', 1, 'admin', '第1组', '/school/submission/8', '127.0.0.1', '内网IP', '[8] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-08 00:32:37', 12);
INSERT INTO `sys_oper_log` VALUES (201, '作业提交与成绩', 3, 'com.ruoyi.school.controller.HomeworkSubmissionController.remove()', 'DELETE', 1, 'admin', '第1组', '/school/submission/11', '127.0.0.1', '内网IP', '[11] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-08 00:44:17', 20);
INSERT INTO `sys_oper_log` VALUES (202, '作业提交与成绩', 3, 'com.ruoyi.school.controller.HomeworkSubmissionController.remove()', 'DELETE', 1, 'admin', '第1组', '/school/submission/10', '127.0.0.1', '内网IP', '[10] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-08 00:44:20', 13);
INSERT INTO `sys_oper_log` VALUES (203, '作业提交与成绩', 3, 'com.ruoyi.school.controller.HomeworkSubmissionController.remove()', 'DELETE', 1, 'admin', '第1组', '/school/submission/12', '127.0.0.1', '内网IP', '[12] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-08 00:56:38', 38);
INSERT INTO `sys_oper_log` VALUES (204, '作业提交与成绩', 3, 'com.ruoyi.school.controller.HomeworkSubmissionController.remove()', 'DELETE', 1, 'admin', '第1组', '/school/submission/13', '127.0.0.1', '内网IP', '[13] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-08 01:11:07', 47);
INSERT INTO `sys_oper_log` VALUES (205, '作业提交与成绩', 3, 'com.ruoyi.school.controller.HomeworkSubmissionController.remove()', 'DELETE', 1, 'admin', '第1组', '/school/submission/14', '127.0.0.1', '内网IP', '[14] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-08 01:24:00', 28);
INSERT INTO `sys_oper_log` VALUES (206, '作业提交与成绩', 3, 'com.ruoyi.school.controller.HomeworkSubmissionController.remove()', 'DELETE', 1, 'admin', '第1组', '/school/submission/15', '127.0.0.1', '内网IP', '[15] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-08 01:27:31', 19);
INSERT INTO `sys_oper_log` VALUES (207, '作业提交与成绩', 3, 'com.ruoyi.school.controller.HomeworkSubmissionController.remove()', 'DELETE', 1, 'admin', '第1组', '/school/submission/9', '127.0.0.1', '内网IP', '[9] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-08 01:38:18', 23);
INSERT INTO `sys_oper_log` VALUES (208, '作业提交与成绩', 3, 'com.ruoyi.school.controller.HomeworkSubmissionController.remove()', 'DELETE', 1, 'admin', '第1组', '/school/submission/17', '127.0.0.1', '内网IP', '[17] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-08 01:48:03', 21);
INSERT INTO `sys_oper_log` VALUES (209, '作业提交与成绩', 3, 'com.ruoyi.school.controller.HomeworkSubmissionController.remove()', 'DELETE', 1, 'admin', '第1组', '/school/submission/18', '127.0.0.1', '内网IP', '[18] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-08 01:53:55', 15);
INSERT INTO `sys_oper_log` VALUES (210, '作业提交与成绩', 2, 'com.ruoyi.school.controller.HomeworkSubmissionController.edit()', 'PUT', 1, 'admin', '第1组', '/school/submission', '127.0.0.1', '内网IP', '{\"params\":{},\"score\":80,\"status\":\"2\",\"submissionId\":16,\"updateTime\":\"2026-01-08 02:12:06\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-08 02:12:06', 48);
INSERT INTO `sys_oper_log` VALUES (211, '作业提交与成绩', 2, 'com.ruoyi.school.controller.HomeworkSubmissionController.edit()', 'PUT', 1, 'admin', '第1组', '/school/submission', '127.0.0.1', '内网IP', '{\"params\":{},\"score\":50,\"status\":\"2\",\"submissionId\":16,\"updateTime\":\"2026-01-08 02:12:24\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-08 02:12:24', 14);
INSERT INTO `sys_oper_log` VALUES (212, '作业发布任务', 1, 'com.ruoyi.school.controller.HomeworkTaskController.add()', 'POST', 1, 'admin', '第1组', '/school/task', '127.0.0.1', '内网IP', '{\"classId\":1,\"courseId\":1,\"createTime\":\"2026-01-08 23:59:47\",\"deadlineTime\":\"2026-01-23\",\"params\":{},\"status\":\"1\",\"taskContent\":\"<p>12362</p>\",\"taskId\":6,\"taskTitle\":\"ces455\",\"teacherId\":1} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-08 23:59:47', 48);
INSERT INTO `sys_oper_log` VALUES (213, '班级课程', 3, 'com.ruoyi.school.controller.HsScheduleController.remove()', 'DELETE', 1, 'admin', '第1组', '/school/schedule/5', '127.0.0.1', '内网IP', '[5] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-09 00:36:16', 55);
INSERT INTO `sys_oper_log` VALUES (214, '班级课程', 3, 'com.ruoyi.school.controller.HsScheduleController.remove()', 'DELETE', 1, 'admin', '第1组', '/school/schedule/6', '127.0.0.1', '内网IP', '[6] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-09 00:36:18', 12);
INSERT INTO `sys_oper_log` VALUES (215, '班级课程', 1, 'com.ruoyi.school.controller.HsScheduleController.add()', 'POST', 1, 'admin', '第1组', '/school/schedule', '127.0.0.1', '内网IP', '{\"classId\":2,\"className\":\"石油班\",\"classroom\":\"一教学楼\",\"courseId\":1,\"courseName\":\"数学\",\"createTime\":\"2026-01-09 00:37:14\",\"params\":{},\"scheduleId\":7,\"section\":4,\"teacherId\":1,\"teacherName\":\"wkk\",\"timePeriod\":\"0\",\"weekDay\":5} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-09 00:37:14', 30);
INSERT INTO `sys_oper_log` VALUES (216, '班级课程', 1, 'com.ruoyi.school.controller.HsScheduleController.add()', 'POST', 1, 'admin', '第1组', '/school/schedule', '127.0.0.1', '内网IP', '{\"classId\":1,\"className\":\"高一八班\",\"classroom\":\"一教\",\"courseId\":1,\"courseName\":\"语文\",\"createTime\":\"2026-01-10 01:09:49\",\"params\":{},\"scheduleId\":8,\"section\":2,\"teacherId\":1,\"teacherName\":\"wkk\",\"timePeriod\":\"0\",\"weekDay\":6} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-10 01:09:49', 70);
INSERT INTO `sys_oper_log` VALUES (217, '班级课程', 1, 'com.ruoyi.school.controller.HsScheduleController.add()', 'POST', 1, 'admin', '第1组', '/school/schedule', '127.0.0.1', '内网IP', '{\"classId\":1,\"className\":\"高一2班\",\"courseId\":1,\"courseName\":\"数学\",\"createTime\":\"2026-01-10 01:20:14\",\"params\":{},\"scheduleId\":9,\"section\":2,\"teacherId\":1,\"teacherName\":\"李老师\",\"weekDay\":6} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-10 01:20:15', 12);
INSERT INTO `sys_oper_log` VALUES (218, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-12-21 23:56:51\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1061,\"menuName\":\"测试\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-12 01:28:53', 35);
INSERT INTO `sys_oper_log` VALUES (219, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"school/course/index\",\"createTime\":\"2025-12-27 01:13:55\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1112,\"menuName\":\"课程信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1130,\"path\":\"course\",\"perms\":\"school:course:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-12 01:29:15', 20);
INSERT INTO `sys_oper_log` VALUES (220, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"school/course/index\",\"createTime\":\"2025-12-27 01:13:55\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1112,\"menuName\":\"课程信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1130,\"path\":\"course\",\"perms\":\"school:course:list\",\"routeName\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-12 01:30:41', 22);
INSERT INTO `sys_oper_log` VALUES (221, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"school/course/index\",\"createTime\":\"2025-12-23 02:23:35\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1063,\"menuName\":\"课程科目\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1062,\"path\":\"course\",\"perms\":\"school:course:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-12 01:31:04', 19);
INSERT INTO `sys_oper_log` VALUES (222, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"school/course/index\",\"createTime\":\"2025-12-23 02:23:35\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1063,\"menuName\":\"课程科目\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1062,\"path\":\"course\",\"perms\":\"school:course:list\",\"routeName\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-12 01:31:36', 19);
INSERT INTO `sys_oper_log` VALUES (223, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/dept/index\",\"createTime\":\"2025-12-18 18:10:55\",\"icon\":\"tree\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":103,\"menuName\":\"班级信息管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"dept\",\"perms\":\"system:dept:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-13 01:52:01', 51);
INSERT INTO `sys_oper_log` VALUES (224, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/notice/index\",\"createTime\":\"2025-12-18 18:10:55\",\"icon\":\"message\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":107,\"menuName\":\"公告信息\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"notice\",\"perms\":\"system:notice:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-13 01:52:12', 24);
INSERT INTO `sys_oper_log` VALUES (225, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-12-27 01:38:50\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1130,\"menuName\":\"作业信息\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"school\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-13 01:52:22', 15);
INSERT INTO `sys_oper_log` VALUES (226, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-12-23 02:11:14\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1062,\"menuName\":\"课程科目\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"school\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-13 01:52:29', 20);
INSERT INTO `sys_oper_log` VALUES (227, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-12-18 18:10:55\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-13 01:52:41', 22);
INSERT INTO `sys_oper_log` VALUES (228, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-12-18 18:10:55\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-13 01:53:19', 20);
INSERT INTO `sys_oper_log` VALUES (229, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-12-18 18:10:55\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-13 01:53:49', 9);
INSERT INTO `sys_oper_log` VALUES (230, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-12-18 18:10:55\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-13 01:53:56', 22);
INSERT INTO `sys_oper_log` VALUES (231, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', '第1组', '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-12-18 18:10:55\",\"flag\":false,\"params\":{},\"postCode\":\"te\",\"postId\":3,\"postName\":\"科任老师\",\"postSort\":3,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-13 02:06:19', 52);
INSERT INTO `sys_oper_log` VALUES (232, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', '第1组', '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"123@163.com\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15888888888\",\"sex\":\"1\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-13 02:15:02', 42);
INSERT INTO `sys_oper_log` VALUES (233, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', '第1组', '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"123@163.com\",\"nickName\":\"管理员\",\"params\":{},\"phonenumber\":\"15888888888\",\"sex\":\"1\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-13 02:15:14', 28);
INSERT INTO `sys_oper_log` VALUES (234, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"school/attendance/index\",\"createTime\":\"2025-12-27 23:48:38\",\"icon\":\"log\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1131,\"menuName\":\"学生考勤\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"attendance\",\"perms\":\"school:attendance:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-14 02:51:35', 43);
INSERT INTO `sys_oper_log` VALUES (235, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-12-27 01:38:50\",\"icon\":\"time\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1130,\"menuName\":\"作业信息\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"school\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-14 02:52:01', 26);
INSERT INTO `sys_oper_log` VALUES (236, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-12-27 01:38:50\",\"icon\":\"job\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1130,\"menuName\":\"作业信息\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"school\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-14 02:52:22', 13);
INSERT INTO `sys_oper_log` VALUES (237, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/post/index\",\"createTime\":\"2025-12-18 18:10:55\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":104,\"menuName\":\"岗位管理\",\"menuType\":\"C\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"post\",\"perms\":\"system:post:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-14 02:52:48', 19);
INSERT INTO `sys_oper_log` VALUES (238, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '第1组', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"school_class_video\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-14 02:57:23', 155);
INSERT INTO `sys_oper_log` VALUES (239, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-12-21 23:56:51\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1061,\"menuName\":\"测试\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-14 03:01:51', 23);
INSERT INTO `sys_oper_log` VALUES (240, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '第1组', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"video\",\"className\":\"SchoolClassVideo\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"视频ID\",\"columnId\":120,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2026-01-14 02:57:23\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"视频标题\",\"columnId\":121,\"columnName\":\"title\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"createTime\":\"2026-01-14 02:57:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"VideoUrl\",\"columnComment\":\"视频地址\",\"columnId\":122,\"columnName\":\"video_url\",\"columnType\":\"varchar(500)\",\"createBy\":\"admin\",\"createTime\":\"2026-01-14 02:57:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"videoUrl\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CoverUrl\",\"columnComment\":\"封面地址\",\"columnId\":123,\"columnName\":\"cover_url\",\"columnType\":\"varchar(500)\",\"createBy\":\"admin\",\"createTime\":\"2026-01-14 02:57:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequi', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-14 03:02:58', 93);
INSERT INTO `sys_oper_log` VALUES (241, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '第1组', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"school_class_video\"}', NULL, 0, NULL, '2026-01-14 03:03:19', 781);
INSERT INTO `sys_oper_log` VALUES (242, '班级视频', 1, 'com.ruoyi.school.controller.SchoolClassVideoController.add()', 'POST', 1, 'admin', '第1组', '/school/video', '127.0.0.1', '内网IP', '{\"classId\":100,\"coverUrl\":\"/profile/upload/2026/01/14/1732253894898_20260114033302A001.jpg\",\"createTime\":\"2026-01-14 03:33:17\",\"description\":\"测试\",\"id\":1,\"params\":{},\"title\":\"测试\",\"videoUrl\":\"/profile/upload/2026/01/14/倒计时(20s)_哔哩哔哩_bilibili_20260114033312A002.mp4\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-14 03:33:18', 53);
INSERT INTO `sys_oper_log` VALUES (243, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-12-21 23:56:51\",\"icon\":\"online\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1061,\"menuName\":\"班级网盘\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-15 02:05:46', 33);
INSERT INTO `sys_oper_log` VALUES (244, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '第1组', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-12-18 18:10:55\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[107,1061,1137,1138,1139,1140,1141,1142,1131,1132,1133,1134,1135,1136,1035,1130,1106,1107,1108,1109,1110,1111,1112,1113,1114,1115,1116,1117,1118,1119,1120,1121,1122,1123,1124,1125,1126,1127,1128,1129,1062,1063,1064,1065,1066,1067,1068,1069,1070,1071,1072,1073,1074,1087,1075,1076,1077,1078,1079,1080,1081,1082,1083,1084,1085,1086,1088,1089,1090,1091,1092,1093,1094,1095,1096,1097,1098,1099,1100,1101,1102,1103,1104,1105],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通用户\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-15 02:33:18', 145);
INSERT INTO `sys_oper_log` VALUES (245, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '第1组', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-12-18 18:10:55\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[107,1,100,1061,1137,1138,1139,1140,1141,1142,1131,1132,1133,1134,1135,1136,1035,1130,1106,1107,1108,1109,1110,1111,1112,1113,1114,1115,1116,1117,1118,1119,1120,1121,1122,1123,1124,1125,1126,1127,1128,1129,1062,1063,1064,1065,1066,1067,1068,1069,1070,1071,1072,1073,1074,1000,1087,1075,1076,1077,1078,1079,1080,1081,1082,1083,1084,1085,1086,1088,1089,1090,1091,1092,1093,1094,1095,1096,1097,1098,1099,1100,1101,1102,1103,1104,1105],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通用户\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-15 03:01:22', 169);
INSERT INTO `sys_oper_log` VALUES (246, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '第1组', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-12-18 18:10:55\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[107,1061,1137,1138,1139,1140,1141,1142,1131,1132,1133,1134,1135,1136,1035,1130,1106,1107,1108,1109,1110,1111,1112,1113,1114,1115,1116,1117,1118,1119,1120,1121,1122,1123,1124,1125,1126,1127,1128,1129,1062,1063,1064,1065,1066,1067,1068,1069,1070,1071,1072,1073,1074,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,108,500,1039,1040,1041,501,1042,1043,1044,1045,1087,1075,1076,1077,1078,1079,1080,1081,1082,1083,1084,1085,1086,1088,1089,1090,1091,1092,1093,1094,1095,1096,1097,1098,1099,1100,1101,1102,1103,1104,1105],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通用户\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-15 03:01:41', 66);
INSERT INTO `sys_oper_log` VALUES (247, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '第1组', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-12-18 18:10:55\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[107,1061,1137,1138,1139,1140,1141,1142,1131,1132,1133,1134,1135,1136,103,1016,1017,1018,1019,1035,1130,1106,1107,1108,1109,1110,1111,1112,1113,1114,1115,1116,1117,1118,1119,1120,1121,1122,1123,1124,1125,1126,1127,1128,1129,1062,1063,1064,1065,1066,1067,1068,1069,1070,1071,1072,1073,1074,1087,1075,1076,1077,1078,1079,1080,1081,1082,1083,1084,1085,1086,1088,1089,1090,1091,1092,1093,1094,1095,1096,1097,1098,1099,1100,1101,1102,1103,1104,1105],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通用户\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-15 03:03:07', 70);
INSERT INTO `sys_oper_log` VALUES (248, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.edit()', 'PUT', 1, 'admin', '第1组', '/system/notice', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-12-18 18:10:56\",\"noticeContent\":\"<p>新版本内容11111111111111111</p>\",\"noticeId\":1,\"noticeTitle\":\"温馨提醒：测试公告\",\"noticeType\":\"2\",\"params\":{},\"remark\":\"管理员\",\"status\":\"1\",\"updateBy\":\"admin\",\"updateTime\":\"2025-12-30 01:04:37\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-16 02:12:56', 29);
INSERT INTO `sys_oper_log` VALUES (249, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.edit()', 'PUT', 1, 'admin', '第1组', '/system/notice', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-12-18 18:10:56\",\"noticeContent\":\"<p>维护内容</p>\",\"noticeId\":2,\"noticeTitle\":\"维护通知：测试\",\"noticeType\":\"1\",\"params\":{},\"remark\":\"管理员\",\"status\":\"1\",\"updateBy\":\"admin\",\"updateTime\":\"2025-12-30 01:04:47\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-16 02:13:07', 13);
INSERT INTO `sys_oper_log` VALUES (250, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'wkk', '石油中学', '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2026/01/17/c8db5fa2c7c44975ba575f7fc025df59.jpg\",\"code\":200}', 0, NULL, '2026-01-17 01:41:25', 128);
INSERT INTO `sys_oper_log` VALUES (251, '学生考勤', 1, 'com.ruoyi.school.controller.HsAttendanceController.add()', 'POST', 1, 'admin', '第1组', '/school/attendance', '127.0.0.1', '内网IP', '{\"attendanceDate\":\"2026-01-17\",\"attendanceId\":9,\"createTime\":\"2026-01-17 02:47:01\",\"params\":{},\"status\":\"1\",\"studentId\":7,\"studentName\":\"wkk\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-17 02:47:01', 25);
INSERT INTO `sys_oper_log` VALUES (252, '作业发布任务', 1, 'com.ruoyi.school.controller.HomeworkTaskController.add()', 'POST', 1, 'admin', '第1组', '/school/task', '127.0.0.1', '内网IP', '{\"classId\":1,\"courseId\":1,\"createTime\":\"2026-01-17 03:04:35\",\"deadlineTime\":\"2026-01-30\",\"params\":{},\"status\":\"1\",\"taskContent\":\"<p>测试</p>\",\"taskId\":7,\"taskTitle\":\"测试显示\",\"teacherId\":1} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-17 03:04:35', 49);
INSERT INTO `sys_oper_log` VALUES (253, '作业发布任务', 1, 'com.ruoyi.school.controller.HomeworkTaskController.add()', 'POST', 1, 'admin', '第1组', '/school/task', '127.0.0.1', '内网IP', '{\"classId\":1,\"courseId\":1,\"createTime\":\"2026-01-17 04:03:33\",\"deadlineTime\":\"2026-01-22\",\"params\":{},\"status\":\"1\",\"taskContent\":\"<p>12</p>\",\"taskId\":8,\"taskTitle\":\"csssssss\",\"teacherId\":1} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-17 04:03:33', 17);
INSERT INTO `sys_oper_log` VALUES (254, '作业提交与成绩', 2, 'com.ruoyi.school.controller.HomeworkSubmissionController.edit()', 'PUT', 1, 'admin', '第1组', '/school/submission', '127.0.0.1', '内网IP', '{\"params\":{},\"score\":96,\"status\":\"2\",\"submissionId\":3,\"updateTime\":\"2026-01-23 16:25:15\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-23 16:25:15', 37);
INSERT INTO `sys_oper_log` VALUES (255, '作业提交与成绩', 2, 'com.ruoyi.school.controller.HomeworkSubmissionController.edit()', 'PUT', 1, 'admin', '第1组', '/school/submission', '127.0.0.1', '内网IP', '{\"params\":{},\"score\":60,\"status\":\"2\",\"submissionId\":16,\"updateTime\":\"2026-01-23 16:29:40\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-23 16:29:40', 12);
INSERT INTO `sys_oper_log` VALUES (256, '作业提交与成绩', 2, 'com.ruoyi.school.controller.HomeworkSubmissionController.edit()', 'PUT', 1, 'admin', '第1组', '/school/submission', '127.0.0.1', '内网IP', '{\"params\":{},\"score\":56,\"status\":\"2\",\"submissionId\":16,\"updateTime\":\"2026-01-23 16:29:48\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-23 16:29:48', 9);
INSERT INTO `sys_oper_log` VALUES (257, '作业发布任务', 1, 'com.ruoyi.school.controller.HomeworkTaskController.add()', 'POST', 1, 'admin', '第1组', '/school/task', '127.0.0.1', '内网IP', '{\"classId\":1,\"courseId\":1,\"createTime\":\"2026-01-23 16:30:17\",\"deadlineTime\":\"2026-01-31\",\"params\":{},\"status\":\"1\",\"taskContent\":\"<p>56</p>\",\"taskId\":9,\"taskTitle\":\"ces\",\"teacherId\":1} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-23 16:30:17', 22);
INSERT INTO `sys_oper_log` VALUES (258, '作业发布任务', 1, 'com.ruoyi.school.controller.HomeworkTaskController.add()', 'POST', 1, 'admin', '第1组', '/school/task', '127.0.0.1', '内网IP', '{\"classId\":1,\"courseId\":1,\"createTime\":\"2026-01-23 16:31:13\",\"deadlineTime\":\"2026-01-30\",\"params\":{},\"status\":\"0\",\"taskContent\":\"<p>12</p>\",\"taskId\":10,\"taskTitle\":\"ces\",\"teacherId\":1} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-23 16:31:13', 10);
INSERT INTO `sys_oper_log` VALUES (259, '作业发布任务', 3, 'com.ruoyi.school.controller.HomeworkTaskController.remove()', 'DELETE', 1, 'admin', '第1组', '/school/task/10', '127.0.0.1', '内网IP', '[10] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-23 16:31:25', 19);
INSERT INTO `sys_oper_log` VALUES (260, '作业提交与成绩', 2, 'com.ruoyi.school.controller.HomeworkSubmissionController.edit()', 'PUT', 1, 'admin', '第1组', '/school/submission', '127.0.0.1', '内网IP', '{\"params\":{},\"score\":83,\"status\":\"2\",\"submissionId\":19,\"updateTime\":\"2026-01-23 16:32:35\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-23 16:32:35', 11);
INSERT INTO `sys_oper_log` VALUES (261, '学生考勤', 1, 'com.ruoyi.school.controller.HsAttendanceController.add()', 'POST', 1, 'admin', '第1组', '/school/attendance', '127.0.0.1', '内网IP', '{\"attendanceDate\":\"2026-01-23\",\"attendanceId\":10,\"createTime\":\"2026-01-23 16:46:28\",\"params\":{},\"status\":\"1\",\"studentId\":2,\"studentName\":\"若依\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-23 16:46:28', 20);
INSERT INTO `sys_oper_log` VALUES (262, '作业提交与成绩', 2, 'com.ruoyi.school.controller.HomeworkSubmissionController.edit()', 'PUT', 1, 'admin', '第1组', '/school/submission', '127.0.0.1', '内网IP', '{\"params\":{},\"score\":20,\"status\":\"2\",\"submissionId\":19,\"updateTime\":\"2026-01-23 17:07:47\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-23 17:07:47', 24);
INSERT INTO `sys_oper_log` VALUES (263, '作业提交与成绩', 2, 'com.ruoyi.school.controller.HomeworkSubmissionController.edit()', 'PUT', 1, 'admin', '第1组', '/school/submission', '127.0.0.1', '内网IP', '{\"params\":{},\"score\":86,\"status\":\"2\",\"submissionId\":19,\"updateTime\":\"2026-01-23 17:20:34\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-23 17:20:35', 11);
INSERT INTO `sys_oper_log` VALUES (264, '作业提交与成绩', 2, 'com.ruoyi.school.controller.HomeworkSubmissionController.edit()', 'PUT', 1, 'admin', '第1组', '/school/submission', '127.0.0.1', '内网IP', '{\"params\":{},\"score\":65,\"status\":\"2\",\"submissionId\":18,\"updateTime\":\"2026-01-23 17:23:16\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-23 17:23:16', 9);
INSERT INTO `sys_oper_log` VALUES (265, '作业提交与成绩', 2, 'com.ruoyi.school.controller.HomeworkSubmissionController.edit()', 'PUT', 1, 'admin', '第1组', '/school/submission', '127.0.0.1', '内网IP', '{\"params\":{},\"score\":60,\"status\":\"2\",\"submissionId\":17,\"updateTime\":\"2026-01-23 17:23:21\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-23 17:23:21', 15);
INSERT INTO `sys_oper_log` VALUES (266, '作业提交与成绩', 2, 'com.ruoyi.school.controller.HomeworkSubmissionController.edit()', 'PUT', 1, 'admin', '第1组', '/school/submission', '127.0.0.1', '内网IP', '{\"params\":{},\"score\":96,\"status\":\"2\",\"submissionId\":16,\"updateTime\":\"2026-01-23 17:24:08\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-23 17:24:08', 7);
INSERT INTO `sys_oper_log` VALUES (267, '作业提交与成绩', 2, 'com.ruoyi.school.controller.HomeworkSubmissionController.edit()', 'PUT', 1, 'admin', '第1组', '/school/submission', '127.0.0.1', '内网IP', '{\"params\":{},\"score\":97,\"status\":\"2\",\"submissionId\":17,\"updateTime\":\"2026-01-23 17:24:44\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-23 17:24:44', 11);
INSERT INTO `sys_oper_log` VALUES (268, '班级课程', 5, 'com.ruoyi.school.controller.HsScheduleController.export()', 'POST', 1, 'admin', '第1组', '/school/schedule/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"100\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2026-01-23 17:31:37', 1586);
INSERT INTO `sys_oper_log` VALUES (269, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '第1组', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-12-21 20:52:45\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2,1,1131,1132,1133,1134,1135,1136,103,1016,1017,1018,1019,107,1035,1036,1037,1038,1130,1106,1107,1108,1109,1110,1111,1112,1113,1114,1115,1116,1117,1118,1119,1120,1121,1122,1123,1124,1125,1126,1127,1128,1129,1062,1063,1064,1065,1066,1067,1068,1069,1070,1071,1072,1073,1074,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,100,1000,1001,1002,1003,1004,1005,1006,102,1012,1013,1014,1015,104,1020,1021,1022,1023,1024],\"params\":{},\"remark\":\"科任老师权限介于班主任（admin）之间\",\"roleId\":4,\"roleKey\":\"mid-admin\",\"roleName\":\"科任老师\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-23 17:32:19', 71);
INSERT INTO `sys_oper_log` VALUES (270, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-12-18 18:10:55\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":2,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-24 03:27:18', 49);
INSERT INTO `sys_oper_log` VALUES (271, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"monitor/cache/list\",\"createTime\":\"2025-12-18 18:10:55\",\"icon\":\"redis-list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":114,\"menuName\":\"缓存列表\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":2,\"path\":\"cacheList\",\"perms\":\"monitor:cache:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-24 03:27:34', 29);
INSERT INTO `sys_oper_log` VALUES (272, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"monitor/cache/index\",\"createTime\":\"2025-12-18 18:10:55\",\"icon\":\"redis\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":113,\"menuName\":\"缓存监控\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2,\"path\":\"cache\",\"perms\":\"monitor:cache:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-24 03:27:42', 21);
INSERT INTO `sys_oper_log` VALUES (273, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"monitor/job/index\",\"createTime\":\"2025-12-18 18:10:55\",\"icon\":\"job\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":110,\"menuName\":\"定时任务\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2,\"path\":\"job\",\"perms\":\"monitor:job:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-24 03:27:56', 17);
INSERT INTO `sys_oper_log` VALUES (274, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/dict/index\",\"createTime\":\"2025-12-18 18:10:55\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":105,\"menuName\":\"字典管理\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":1,\"path\":\"dict\",\"perms\":\"system:dict:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-24 03:28:57', 19);
INSERT INTO `sys_oper_log` VALUES (275, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/config/index\",\"createTime\":\"2025-12-18 18:10:55\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":106,\"menuName\":\"参数设置\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":1,\"path\":\"config\",\"perms\":\"system:config:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-24 03:29:04', 18);
INSERT INTO `sys_oper_log` VALUES (276, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '第1组', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"monitor/druid/index\",\"createTime\":\"2025-12-18 18:10:55\",\"icon\":\"druid\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":111,\"menuName\":\"数据监控\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2,\"path\":\"druid\",\"perms\":\"monitor:druid:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-24 03:30:37', 18);
INSERT INTO `sys_oper_log` VALUES (277, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.edit()', 'PUT', 1, 'admin', '第1组', '/system/notice', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-12-30 01:04:15\",\"noticeContent\":\"<p>本学期体育老师生病1</p>\",\"noticeId\":4,\"noticeTitle\":\"1230体育课程调整\",\"noticeType\":\"1\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-24 03:32:36', 12);
INSERT INTO `sys_oper_log` VALUES (278, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '第1组', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"清北二班\",\"orderNum\":3,\"params\":{},\"parentId\":100,\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-24 09:31:30', 44);
INSERT INTO `sys_oper_log` VALUES (279, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', '第1组', '/system/user/export', '127.0.0.1', '内网IP', '{\"deptId\":\"100\",\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2026-01-24 09:38:21', 279);
INSERT INTO `sys_oper_log` VALUES (280, '学生考勤', 1, 'com.ruoyi.school.controller.HsAttendanceController.add()', 'POST', 1, 'admin', '第1组', '/school/attendance', '127.0.0.1', '内网IP', '{\"attendanceDate\":\"2026-01-24\",\"attendanceId\":11,\"createTime\":\"2026-01-24 10:47:05\",\"params\":{},\"status\":\"1\",\"studentId\":7,\"studentName\":\"wkk\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-24 10:47:05', 31);
INSERT INTO `sys_oper_log` VALUES (281, '学生考勤', 2, 'com.ruoyi.school.controller.HsAttendanceController.edit()', 'PUT', 1, 'admin', '第1组', '/school/attendance', '127.0.0.1', '内网IP', '{\"attendanceDate\":\"2026-01-24\",\"attendanceId\":5,\"createBy\":\"\",\"createTime\":\"2025-12-27 23:45:21\",\"delFlag\":\"0\",\"params\":{},\"status\":\"4\",\"studentId\":102,\"studentName\":\"李四\",\"updateBy\":\"\",\"updateTime\":\"2026-01-24 14:25:52\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-24 06:25:49', 123);
INSERT INTO `sys_oper_log` VALUES (282, '学生考勤', 1, 'com.ruoyi.school.controller.HsAttendanceController.add()', 'POST', 1, 'admin', '第1组', '/school/attendance', '127.0.0.1', '内网IP', '{\"attendanceDate\":\"2026-01-24\",\"attendanceId\":12,\"createTime\":\"2026-01-24 14:26:29\",\"params\":{},\"status\":\"4\",\"studentId\":6,\"studentName\":\"wkk\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-24 06:26:26', 167);
INSERT INTO `sys_oper_log` VALUES (283, '班级视频', 2, 'com.ruoyi.school.controller.SchoolClassVideoController.edit()', 'PUT', 1, 'admin', '第1组', '/school/video', '127.0.0.1', '内网IP', '{\"classId\":100,\"coverUrl\":\"/profile/upload/2026/01/14/1732253894898_20260114033302A001.jpg\",\"createBy\":\"\",\"createTime\":\"2026-01-14 03:33:18\",\"description\":\"测试\",\"id\":1,\"params\":{},\"subject\":\"语文\",\"title\":\"测试\",\"videoUrl\":\"/profile/upload/2026/01/14/倒计时(20s)_哔哩哔哩_bilibili_20260114033312A002.mp4\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-24 07:03:47', 81);
INSERT INTO `sys_oper_log` VALUES (284, '班级科任老师', 1, 'com.ruoyi.school.controller.SchoolClassTeacherController.add()', 'POST', 1, 'admin', '第1组', '/school/classTeacher', '127.0.0.1', '内网IP', '{\"classId\":101,\"createTime\":\"2026-01-24 15:44:09\",\"id\":1,\"params\":{},\"subject\":\"语文\",\"teacherId\":5,\"type\":\"2\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-24 07:44:06', 155);
INSERT INTO `sys_oper_log` VALUES (285, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '高一(3)班', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":101,\"deptName\":\"高二年级\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"parentName\":\"石油中学\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-24 09:54:08', 279);
INSERT INTO `sys_oper_log` VALUES (286, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '高一(3)班', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"高二(1)班\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"parentName\":\"高二年级\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-24 09:54:16', 216);
INSERT INTO `sys_oper_log` VALUES (287, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '高一(3)班', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":104,\"deptName\":\"高二(2)班\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":101,\"parentName\":\"高二年级\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-24 09:54:22', 216);
INSERT INTO `sys_oper_log` VALUES (288, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '高一(3)班', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"高二(3)班\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"parentName\":\"高二年级\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-24 09:54:27', 210);
INSERT INTO `sys_oper_log` VALUES (289, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '高一(3)班', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":106,\"deptName\":\"高二(4)班\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":4,\"params\":{},\"parentId\":101,\"parentName\":\"高二年级\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-24 09:54:40', 209);
INSERT INTO `sys_oper_log` VALUES (290, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '高一(3)班', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":107,\"deptName\":\"高二(5)班\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":5,\"params\":{},\"parentId\":101,\"parentName\":\"高二年级\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-24 09:54:48', 214);
INSERT INTO `sys_oper_log` VALUES (291, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '高一(3)班', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":102,\"deptName\":\"高三年级\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":100,\"parentName\":\"石油中学\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-24 09:55:10', 261);
INSERT INTO `sys_oper_log` VALUES (292, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '高一(3)班', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,102\",\"children\":[],\"deptId\":108,\"deptName\":\"高三(1)班\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":102,\"parentName\":\"高三年级\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-24 09:55:19', 215);
INSERT INTO `sys_oper_log` VALUES (293, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '高一(3)班', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,102\",\"children\":[],\"deptId\":109,\"deptName\":\"高三(2)班\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":102,\"parentName\":\"高三年级\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-24 09:55:26', 212);
INSERT INTO `sys_oper_log` VALUES (294, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '高一(3)班', '/system/dept/110', '127.0.0.1', '内网IP', '110 ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-24 09:55:46', 112);
INSERT INTO `sys_oper_log` VALUES (295, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '高一(3)班', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2026-01-24 09:52:59\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,200\",\"children\":[],\"deptId\":201,\"deptName\":\"高一(1)班\",\"leader\":\"HS\",\"orderNum\":1,\"params\":{},\"parentId\":200,\"status\":\"0\"},\"deptId\":201,\"email\":\"\",\"loginDate\":\"2026-01-24 09:52:59\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"班主任1\",\"params\":{},\"phonenumber\":\"15888888888\",\"postIds\":[],\"pwdUpdateDate\":\"2026-01-24 09:52:59\",\"remark\":\"测试用户\",\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"3\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"head_teacher\",\"roleName\":\"班主任\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"studentCode\":\"00012\",\"userId\":1001,\"userName\":\"head1\"} ', '{\"msg\":\"修改用户\'head1\'失败，手机号码已存在\",\"code\":500}', 0, NULL, '2026-01-24 09:56:08', 57);
INSERT INTO `sys_oper_log` VALUES (296, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '高一(3)班', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2026-01-24 09:52:59\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,200\",\"children\":[],\"deptId\":201,\"deptName\":\"高一(1)班\",\"leader\":\"HS\",\"orderNum\":1,\"params\":{},\"parentId\":200,\"status\":\"0\"},\"deptId\":201,\"email\":\"\",\"loginDate\":\"2026-01-24 09:52:59\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"班主任1\",\"params\":{},\"phonenumber\":\"15888888123\",\"postIds\":[],\"pwdUpdateDate\":\"2026-01-24 09:52:59\",\"remark\":\"测试用户\",\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"3\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"head_teacher\",\"roleName\":\"班主任\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"studentCode\":\"00012\",\"updateBy\":\"admin\",\"userId\":1001,\"userName\":\"head1\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-24 09:56:13', 506);
INSERT INTO `sys_oper_log` VALUES (297, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '高一(3)班', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2026-01-24 09:52:59\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,200\",\"children\":[],\"deptId\":201,\"deptName\":\"高一(1)班\",\"leader\":\"HS\",\"orderNum\":1,\"params\":{},\"parentId\":200,\"status\":\"0\"},\"deptId\":201,\"email\":\"\",\"loginDate\":\"2026-01-24 09:52:59\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"班主任1\",\"params\":{},\"phonenumber\":\"15888888123\",\"postIds\":[],\"pwdUpdateDate\":\"2026-01-24 09:52:59\",\"remark\":\"测试用户\",\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"3\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"head_teacher\",\"roleName\":\"班主任\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"studentCode\":\"哇哇哇哇\",\"updateBy\":\"admin\",\"userId\":1001,\"userName\":\"head1\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-24 09:56:47', 327);
INSERT INTO `sys_oper_log` VALUES (298, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '高二(1)班', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-12-18 18:10:55\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"高二(3)班\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"ry@qq.com\",\"loginDate\":\"2025-12-26 00:49:45\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[4],\"pwdUpdateDate\":\"2025-12-22 19:06:05\",\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通用户\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"studentCode\":\"000232\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-24 10:03:42', 375);
INSERT INTO `sys_oper_log` VALUES (299, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '高二(1)班', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-12-22 00:50:07\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"高二(1)班\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":103,\"email\":\"\",\"loginDate\":\"2026-01-24 14:25:04\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"wkk\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[4],\"pwdUpdateDate\":\"2025-12-22 19:06:22\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通用户\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"studentCode\":\"23232\",\"updateBy\":\"admin\",\"userId\":6,\"userName\":\"学生\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-24 10:04:05', 359);
INSERT INTO `sys_oper_log` VALUES (300, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '高二(1)班', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-12-22 00:50:07\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"高二(1)班\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":103,\"email\":\"\",\"loginDate\":\"2026-01-24 14:25:04\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"wkk\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[4],\"pwdUpdateDate\":\"2025-12-22 19:06:22\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通用户\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"studentCode\":\"123\",\"updateBy\":\"admin\",\"userId\":6,\"userName\":\"学生\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-24 10:05:26', 558);
INSERT INTO `sys_oper_log` VALUES (301, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '高二(1)班', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-12-22 00:50:07\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"高二(1)班\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":103,\"email\":\"\",\"loginDate\":\"2026-01-24 14:25:04\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"wkk\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[4],\"pwdUpdateDate\":\"2025-12-22 19:06:22\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通用户\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"studentCode\":\"aa00232\",\"updateBy\":\"admin\",\"userId\":6,\"userName\":\"学生\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-24 10:07:55', 507);
INSERT INTO `sys_oper_log` VALUES (302, '作业提交与成绩', 2, 'com.ruoyi.school.controller.HomeworkSubmissionController.edit()', 'PUT', 1, 'admin', '高二(1)班', '/school/submission', '127.0.0.1', '内网IP', '{\"params\":{},\"score\":80,\"status\":\"2\",\"submissionId\":5,\"teacherComment\":\"good\",\"updateTime\":\"2026-01-24 23:36:32\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-24 15:36:32', 59);
INSERT INTO `sys_oper_log` VALUES (303, '作业提交与成绩', 2, 'com.ruoyi.school.controller.HomeworkSubmissionController.edit()', 'PUT', 1, 'admin', '高二(1)班', '/school/submission', '127.0.0.1', '内网IP', '{\"params\":{},\"score\":80,\"status\":\"2\",\"submissionId\":4,\"teacherComment\":\"11\",\"updateTime\":\"2026-01-24 23:38:24\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-24 15:38:24', 49);
INSERT INTO `sys_oper_log` VALUES (304, '作业发布任务', 1, 'com.ruoyi.school.controller.HomeworkTaskController.add()', 'POST', 1, 'admin', '高二(1)班', '/school/task', '127.0.0.1', '内网IP', '{\"classId\":1,\"courseId\":1,\"createTime\":\"2026-01-24 23:46:01\",\"deadlineTime\":\"2026-01-25\",\"params\":{},\"status\":\"1\",\"taskContent\":\"<p>1111</p>\",\"taskId\":11,\"taskTitle\":\"语文\",\"teacherId\":1} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-24 15:46:01', 210);
INSERT INTO `sys_oper_log` VALUES (305, '作业提交与成绩', 2, 'com.ruoyi.school.controller.HomeworkSubmissionController.edit()', 'PUT', 1, 'admin', '高二(1)班', '/school/submission', '127.0.0.1', '内网IP', '{\"params\":{},\"score\":80,\"status\":\"2\",\"submissionId\":20,\"updateTime\":\"2026-01-24 23:46:36\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-24 15:46:37', 59);
INSERT INTO `sys_oper_log` VALUES (306, '作业发布任务', 2, 'com.ruoyi.school.controller.HomeworkTaskController.edit()', 'PUT', 1, 'admin', '高二(1)班', '/school/task', '127.0.0.1', '内网IP', '{\"classId\":1,\"courseId\":1,\"createBy\":\"\",\"createTime\":\"2026-01-24 23:46:01\",\"deadlineTime\":\"2026-01-25\",\"params\":{},\"status\":\"1\",\"taskContent\":\"<p>1111</p>\",\"taskId\":11,\"taskTitle\":\"数学\",\"teacherId\":1,\"updateBy\":\"\",\"updateTime\":\"2026-01-24 23:47:40\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-24 15:47:41', 50);
INSERT INTO `sys_oper_log` VALUES (307, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '高二(1)班', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"school/course/index\",\"createTime\":\"2025-12-27 01:13:55\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1112,\"menuName\":\"课程信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1130,\"path\":\"course\",\"perms\":\"school:course:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-24 16:17:48', 115);
INSERT INTO `sys_oper_log` VALUES (308, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '高二(1)班', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"school/banji/index\",\"createTime\":\"2025-12-27 01:13:37\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1106,\"menuName\":\"班级信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1130,\"path\":\"banji\",\"perms\":\"school:banji:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-24 16:17:52', 86);
INSERT INTO `sys_oper_log` VALUES (309, '课程信息', 1, 'com.ruoyi.school.controller.SysCourseController.add()', 'POST', 1, 'admin', '高二(1)班', '/school/course', '127.0.0.1', '内网IP', '{\"courseCode\":\"2\",\"courseId\":2,\"courseName\":\"语文\",\"createTime\":\"2026-01-25 00:18:23\",\"params\":{}} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-24 16:18:23', 88);
INSERT INTO `sys_oper_log` VALUES (310, '作业发布任务', 2, 'com.ruoyi.school.controller.HomeworkTaskController.edit()', 'PUT', 1, 'admin', '高二(1)班', '/school/task', '127.0.0.1', '内网IP', '{\"classId\":1,\"courseId\":2,\"createBy\":\"\",\"createTime\":\"2026-01-24 23:46:01\",\"deadlineTime\":\"2026-01-25\",\"params\":{},\"status\":\"1\",\"taskContent\":\"<p>1111</p>\",\"taskId\":11,\"taskTitle\":\"语文\",\"teacherId\":1,\"updateBy\":\"\",\"updateTime\":\"2026-01-25 02:40:09\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-24 18:40:10', 58);
INSERT INTO `sys_oper_log` VALUES (311, '作业发布任务', 2, 'com.ruoyi.school.controller.HomeworkTaskController.edit()', 'PUT', 1, 'admin', '高二(1)班', '/school/task', '127.0.0.1', '内网IP', '{\"classId\":1,\"courseId\":1,\"createBy\":\"\",\"createTime\":\"2026-01-24 23:46:01\",\"deadlineTime\":\"2026-01-25\",\"params\":{},\"status\":\"1\",\"taskContent\":\"<p>1111</p>\",\"taskId\":11,\"taskTitle\":\"数学\",\"teacherId\":1,\"updateBy\":\"\",\"updateTime\":\"2026-01-25 02:47:46\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-24 18:47:47', 66);
INSERT INTO `sys_oper_log` VALUES (312, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '高二(1)班', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"school/banji/index\",\"createTime\":\"2025-12-27 01:13:37\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1106,\"menuName\":\"班级信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1130,\"path\":\"banji\",\"perms\":\"school:banji:list\",\"routeName\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-24 18:51:20', 109);
INSERT INTO `sys_oper_log` VALUES (313, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '高二(1)班', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":201,\"email\":\"1153599409@qq.com\",\"nickName\":\"xs1\",\"params\":{},\"phonenumber\":\"18735973321\",\"postIds\":[4],\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"studentCode\":\"xs002\",\"userId\":1004,\"userName\":\"测试学生\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-24 19:00:40', 503);
INSERT INTO `sys_oper_log` VALUES (314, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '高二(1)班', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"deptId\":201,\"email\":\"1153599409@qq.com\",\"nickName\":\"xs1\",\"params\":{},\"phonenumber\":\"18735973321\",\"postIds\":[4],\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"studentCode\":\"xs002\",\"userName\":\"测试学生\"} ', '{\"msg\":\"新增用户\'测试学生\'失败，登录账号已存在\",\"code\":500}', 0, NULL, '2026-01-24 19:00:41', 26);
INSERT INTO `sys_oper_log` VALUES (315, '课程信息', 1, 'com.ruoyi.school.controller.SysCourseController.add()', 'POST', 1, 'wkk', '石油中学', '/school/course', '127.0.0.1', '内网IP', '{\"courseCode\":\"1265\",\"courseId\":3,\"courseName\":\"英语\",\"createTime\":\"2026-01-26 13:29:36\",\"params\":{}} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 05:29:36', 162);
INSERT INTO `sys_oper_log` VALUES (316, '作业发布任务', 1, 'com.ruoyi.school.controller.HomeworkTaskController.add()', 'POST', 1, 'wkk', '石油中学', '/school/task', '127.0.0.1', '内网IP', '{\"classId\":1,\"courseId\":3,\"createTime\":\"2026-01-26 13:30:17\",\"deadlineTime\":\"2026-01-30\",\"params\":{},\"status\":\"1\",\"taskContent\":\"<p>1单元</p>\",\"taskId\":12,\"taskTitle\":\"英语\",\"teacherId\":7} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 05:30:17', 178);
INSERT INTO `sys_oper_log` VALUES (317, '作业提交与成绩', 2, 'com.ruoyi.school.controller.HomeworkSubmissionController.edit()', 'PUT', 1, 'admin', '高二(1)班', '/school/submission', '127.0.0.1', '内网IP', '{\"params\":{},\"score\":60,\"status\":\"2\",\"submissionId\":21,\"updateTime\":\"2026-01-26 13:35:47\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 05:35:47', 153);
INSERT INTO `sys_oper_log` VALUES (318, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', '高二(1)班', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":1001} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 05:38:56', 258);
INSERT INTO `sys_oper_log` VALUES (319, '班级课程', 1, 'com.ruoyi.school.controller.HsScheduleController.add()', 'POST', 1, 'admin', '高二(1)班', '/school/schedule', '127.0.0.1', '内网IP', '{\"classId\":202,\"className\":\"高一(2)班\",\"classroom\":\"1实验\",\"courseId\":3,\"courseName\":\"英语\",\"createTime\":\"2026-01-26 13:44:11\",\"params\":{},\"scheduleId\":401,\"section\":2,\"teacherId\":1001,\"teacherName\":\"班主任1\",\"timePeriod\":\"0\",\"weekDay\":6} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 05:44:12', 229);
INSERT INTO `sys_oper_log` VALUES (320, '班级课程', 1, 'com.ruoyi.school.controller.HsScheduleController.add()', 'POST', 1, 'admin', '高二(1)班', '/school/schedule', '127.0.0.1', '内网IP', '{\"classId\":201,\"className\":\"高一(1)班\",\"classroom\":\"1石油\",\"courseId\":3,\"courseName\":\"英语\",\"createTime\":\"2026-01-26 13:45:30\",\"params\":{},\"scheduleId\":402,\"section\":1,\"teacherId\":1001,\"teacherName\":\"班主任1\",\"timePeriod\":\"0\",\"weekDay\":6} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 05:45:30', 143);
INSERT INTO `sys_oper_log` VALUES (321, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '高二(1)班', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2026-01-24 09:52:57\",\"dataScope\":\"3\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1130,1062,1,1061,1137,1138,1139,1140,1141,1142,1131,103,1016,1017,1018,1019,107,1106,1107,1108,1109,1110,1111,1118,1119,1120,1121,1122,1123,1124,1125,1126,1127,1128,1129,1069,1070,1071,1072,1073,1074,100,1087,1075,1076,1077,1078,1079,1080,1081,1082,1083,1084,1085,1086,1088,1089,1090,1091,1092,1093,1094,1095,1096,1097,1098,1099,1100,1101,1102,1103,1104,1105],\"params\":{},\"remark\":\"班主任角色\",\"roleId\":100,\"roleKey\":\"head_teacher\",\"roleName\":\"班主任\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 05:48:55', 846);
INSERT INTO `sys_oper_log` VALUES (322, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '高二(1)班', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-12-21 20:52:45\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2,1,1131,1132,1133,1134,1135,1136,103,1016,1017,1018,1019,107,1035,1036,1037,1038,1130,1106,1107,1108,1109,1110,1111,1112,1113,1114,1115,1116,1117,1118,1119,1120,1121,1122,1123,1124,1125,1126,1127,1128,1129,1062,1063,1064,1065,1066,1067,1068,1069,1070,1071,1072,1073,1074,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,100,1000,1001,1002,1003,1004,1005,1006,102,1012,1013,1014,1015,104,1020,1021,1022,1023,1024,1087,1075,1076,1077,1078,1079,1080,1081,1082,1083,1084,1085,1086,1088,1089,1090,1091,1092,1093,1094,1095,1096,1097,1098,1099,1100,1101,1102,1103,1104,1105],\"params\":{},\"remark\":\"科任老师权限介于班主任（admin）之间\",\"roleId\":4,\"roleKey\":\"mid-admin\",\"roleName\":\"科任老师\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 05:49:32', 754);
INSERT INTO `sys_oper_log` VALUES (323, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '高二(1)班', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2026-01-24 09:52:57\",\"dataScope\":\"3\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1062,1,1061,1137,1138,1139,1140,1141,1142,1131,103,1016,1017,1018,1019,107,1130,1106,1107,1108,1109,1110,1111,1112,1113,1114,1115,1116,1117,1118,1119,1120,1121,1122,1123,1124,1125,1126,1127,1128,1129,1069,1070,1071,1072,1073,1074,100,1087,1075,1076,1077,1078,1079,1080,1081,1082,1083,1084,1085,1086,1088,1089,1090,1091,1092,1093,1094,1095,1096,1097,1098,1099,1100,1101,1102,1103,1104,1105],\"params\":{},\"remark\":\"班主任角色\",\"roleId\":100,\"roleKey\":\"head_teacher\",\"roleName\":\"班主任\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 05:50:22', 778);
INSERT INTO `sys_oper_log` VALUES (324, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '高二(1)班', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2026-01-24 09:52:57\",\"dataScope\":\"3\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,1061,1137,1138,1139,1140,1141,1142,1131,103,1016,1017,1018,1019,107,1130,1106,1107,1108,1109,1110,1111,1112,1113,1114,1115,1116,1117,1118,1119,1120,1121,1122,1123,1124,1125,1126,1127,1128,1129,100,1087,1075,1076,1077,1078,1079,1080,1081,1082,1083,1084,1085,1086,1088,1089,1090,1091,1092,1093,1094,1095,1096,1097,1098,1099,1100,1101,1102,1103,1104,1105],\"params\":{},\"remark\":\"班主任角色\",\"roleId\":100,\"roleKey\":\"head_teacher\",\"roleName\":\"班主任\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 05:52:14', 701);
INSERT INTO `sys_oper_log` VALUES (325, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '高二(1)班', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2026-01-24 09:52:57\",\"dataScope\":\"3\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,1061,1137,1138,1139,1140,1141,1142,1131,103,1016,1017,1018,1019,107,1130,1106,1107,1108,1109,1110,1111,1112,1113,1114,1115,1116,1117,1118,1119,1120,1121,1122,1123,1124,1125,1126,1127,1128,1129,100,104,1020,1021,1022,1023,1024,1087,1075,1076,1077,1078,1079,1080,1081,1082,1083,1084,1085,1086,1088,1089,1090,1091,1092,1093,1094,1095,1096,1097,1098,1099,1100,1101,1102,1103,1104,1105],\"params\":{},\"remark\":\"班主任角色\",\"roleId\":100,\"roleKey\":\"head_teacher\",\"roleName\":\"班主任\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 05:53:04', 737);
INSERT INTO `sys_oper_log` VALUES (326, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '高二(1)班', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2026-01-24 09:52:57\",\"dataScope\":\"3\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,1061,1137,1138,1139,1140,1141,1142,1131,103,1016,1017,1018,1019,107,1130,1106,1107,1108,1109,1110,1111,1112,1113,1114,1115,1116,1117,1118,1119,1120,1121,1122,1123,1124,1125,1126,1127,1128,1129,100,104,1020,1021,1022,1023,1024,1087,1075,1076,1077,1078,1079,1080,1081,1082,1083,1084,1085,1086,1088,1089,1090,1091,1092,1093,1094,1095,1096,1097,1098,1099,1100,1101,1102,1103,1104,1105],\"params\":{},\"remark\":\"班主任角色\",\"roleId\":100,\"roleKey\":\"head_teacher\",\"roleName\":\"班主任\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 05:53:05', 776);
INSERT INTO `sys_oper_log` VALUES (327, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '高二(1)班', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2026-01-24 09:52:57\",\"dataScope\":\"3\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,1061,1137,1138,1139,1140,1141,1142,1131,103,1016,1017,1018,1019,107,1130,1106,1107,1108,1109,1110,1111,1112,1113,1114,1115,1116,1117,1118,1119,1120,1121,1122,1123,1124,1125,1126,1127,1128,1129,1062,1063,1064,1065,1066,1067,1068,1069,1070,1071,1072,1073,1074,100,104,1020,1021,1022,1023,1024,1087,1075,1076,1077,1078,1079,1080,1081,1082,1083,1084,1085,1086,1088,1089,1090,1091,1092,1093,1094,1095,1096,1097,1098,1099,1100,1101,1102,1103,1104,1105],\"params\":{},\"remark\":\"班主任角色\",\"roleId\":100,\"roleKey\":\"head_teacher\",\"roleName\":\"班主任\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 05:55:46', 865);
INSERT INTO `sys_oper_log` VALUES (328, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '高二(1)班', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2026-01-24 09:52:57\",\"dataScope\":\"3\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,1061,1137,1138,1139,1140,1141,1142,1131,103,1016,1017,1018,1019,107,1130,1106,1107,1108,1109,1110,1111,1112,1113,1114,1115,1116,1117,1118,1119,1120,1121,1122,1123,1124,1125,1126,1127,1128,1129,100,104,1020,1021,1022,1023,1024,1087,1075,1076,1077,1078,1079,1080,1081,1082,1083,1084,1085,1086,1088,1089,1090,1091,1092,1093,1094,1095,1096,1097,1098,1099,1100,1101,1102,1103,1104,1105],\"params\":{},\"remark\":\"班主任角色\",\"roleId\":100,\"roleKey\":\"head_teacher\",\"roleName\":\"班主任\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 05:57:08', 808);
INSERT INTO `sys_oper_log` VALUES (329, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '高二(1)班', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2026-01-24 09:52:57\",\"dataScope\":\"3\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,1061,1137,1138,1139,1140,1141,1142,1131,103,1016,1017,1018,1019,107,1130,1106,1107,1108,1109,1110,1111,1112,1113,1114,1115,1116,1117,1118,1119,1120,1121,1122,1123,1124,1125,1126,1127,1128,1129,100,104,1020,1021,1022,1023,1024,1087,1075,1076,1077,1078,1079,1080,1081,1082,1083,1084,1085,1086,1088,1089,1090,1091,1092,1093,1094,1095,1096,1097,1098,1099,1100,1101,1102,1103,1104,1105],\"params\":{},\"remark\":\"班主任角色\",\"roleId\":100,\"roleKey\":\"head_teacher\",\"roleName\":\"班主任\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 05:57:34', 745);
INSERT INTO `sys_oper_log` VALUES (330, '作业发布任务', 1, 'com.ruoyi.school.controller.HomeworkTaskController.add()', 'POST', 1, 'admin', '高二(1)班', '/school/task', '127.0.0.1', '内网IP', '{\"classId\":1,\"courseId\":3,\"createTime\":\"2026-01-26 14:22:38\",\"deadlineTime\":\"2026-01-29\",\"params\":{},\"status\":\"0\",\"taskContent\":\"<p>2uvyhjk</p>\",\"taskId\":13,\"taskTitle\":\"英语\",\"teacherId\":1} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 06:22:38', 155);
INSERT INTO `sys_oper_log` VALUES (331, '作业发布任务', 2, 'com.ruoyi.school.controller.HomeworkTaskController.edit()', 'PUT', 1, 'admin', '高二(1)班', '/school/task', '127.0.0.1', '内网IP', '{\"classId\":1,\"courseId\":3,\"createBy\":\"\",\"createTime\":\"2026-01-26 14:22:39\",\"deadlineTime\":\"2026-01-29\",\"params\":{},\"status\":\"1\",\"taskContent\":\"<p>2uvyhjk</p>\",\"taskId\":13,\"taskTitle\":\"英语\",\"teacherId\":1,\"updateBy\":\"\",\"updateTime\":\"2026-01-26 14:22:55\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 06:22:55', 148);
INSERT INTO `sys_oper_log` VALUES (332, '作业发布任务', 1, 'com.ruoyi.school.controller.HomeworkTaskController.add()', 'POST', 1, 'head1', '高一(1)班', '/school/task', '127.0.0.1', '内网IP', '{\"classId\":1,\"courseId\":2,\"createTime\":\"2026-01-26 14:45:42\",\"deadlineTime\":\"2026-01-31\",\"params\":{},\"status\":\"1\",\"taskContent\":\"<p>ces</p>\",\"taskId\":14,\"taskTitle\":\"语文\",\"teacherId\":1001} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 06:45:42', 236);
INSERT INTO `sys_oper_log` VALUES (333, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', '高二(1)班', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":1004} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 06:53:45', 222);
INSERT INTO `sys_oper_log` VALUES (334, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', '高二(1)班', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":1001} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 07:01:04', 224);
INSERT INTO `sys_oper_log` VALUES (335, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '高二(1)班', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2026-01-24 09:52:57\",\"dataScope\":\"3\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1061,1137,1138,1139,1140,1141,1142,1131,103,1016,1017,1018,1019,107,1130,1106,1107,1108,1109,1110,1111,1112,1113,1114,1115,1116,1117,1118,1119,1120,1121,1122,1123,1124,1125,1126,1127,1128,1129,1001,104,1020,1021,1022,1023,1024,1087,1075,1076,1077,1078,1079,1080,1081,1082,1083,1084,1085,1086,1088,1089,1090,1091,1092,1093,1094,1095,1096,1097,1098,1099,1100,1101,1102,1103,1104,1105],\"params\":{},\"remark\":\"班主任角色\",\"roleId\":100,\"roleKey\":\"head_teacher\",\"roleName\":\"班主任\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 07:05:35', 854);
INSERT INTO `sys_oper_log` VALUES (336, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '高二(1)班', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2026-01-24 09:52:57\",\"dataScope\":\"3\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,1061,1137,1138,1139,1140,1141,1142,1131,103,1016,1017,1018,1019,107,1130,1106,1107,1108,1109,1110,1111,1112,1113,1114,1115,1116,1117,1118,1119,1120,1121,1122,1123,1124,1125,1126,1127,1128,1129,100,1000,1001,1002,1003,1004,1005,1006,104,1020,1021,1022,1023,1024,1087,1075,1076,1077,1078,1079,1080,1081,1082,1083,1084,1085,1086,1088,1089,1090,1091,1092,1093,1094,1095,1096,1097,1098,1099,1100,1101,1102,1103,1104,1105],\"params\":{},\"remark\":\"班主任角色\",\"roleId\":100,\"roleKey\":\"head_teacher\",\"roleName\":\"班主任\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 07:06:21', 821);
INSERT INTO `sys_oper_log` VALUES (337, '作业发布任务', 1, 'com.ruoyi.school.controller.HomeworkTaskController.add()', 'POST', 1, 'head1', '高一(1)班', '/school/task', '127.0.0.1', '内网IP', '{\"classId\":1,\"courseId\":2,\"createTime\":\"2026-01-26 15:07:36\",\"deadlineTime\":\"2026-01-31\",\"params\":{},\"status\":\"1\",\"taskContent\":\"<p>569565sakjascoojcow</p>\",\"taskId\":15,\"taskTitle\":\"语文\",\"teacherId\":1001} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 07:07:36', 143);
INSERT INTO `sys_oper_log` VALUES (338, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '高二(1)班', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2026-01-24 09:52:57\",\"dataScope\":\"3\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,1061,1137,1138,1139,1140,1141,1142,1131,1132,1133,1134,1135,1136,103,1016,1017,1018,1019,107,1130,1106,1107,1108,1109,1110,1111,1112,1113,1114,1115,1116,1117,1118,1119,1120,1121,1122,1123,1124,1125,1126,1127,1128,1129,100,1000,1001,1002,1003,1004,1005,1006,104,1020,1021,1022,1023,1024,1087,1075,1076,1077,1078,1079,1080,1081,1082,1083,1084,1085,1086,1088,1089,1090,1091,1092,1093,1094,1095,1096,1097,1098,1099,1100,1101,1102,1103,1104,1105],\"params\":{},\"remark\":\"班主任角色\",\"roleId\":100,\"roleKey\":\"head_teacher\",\"roleName\":\"班主任\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 07:23:18', 786);
INSERT INTO `sys_oper_log` VALUES (339, '学生考勤', 1, 'com.ruoyi.school.controller.HsAttendanceController.add()', 'POST', 1, 'head1', '高一(1)班', '/school/attendance', '127.0.0.1', '内网IP', '{\"attendanceDate\":\"2026-01-26\",\"attendanceId\":13,\"createTime\":\"2026-01-26 15:23:45\",\"params\":{},\"status\":\"2\",\"studentId\":1004,\"studentName\":\"xs1\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 07:23:45', 153);
INSERT INTO `sys_oper_log` VALUES (340, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '高二(1)班', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2026-01-24 09:52:57\",\"dataScope\":\"3\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,1061,1137,1138,1139,1140,1141,1142,1131,1132,1133,1134,1135,1136,103,1016,1017,1018,1019,107,1035,1036,1037,1038,1130,1106,1107,1108,1109,1110,1111,1112,1113,1114,1115,1116,1117,1118,1119,1120,1121,1122,1123,1124,1125,1126,1127,1128,1129,100,1000,1001,1002,1003,1004,1005,1006,104,1020,1021,1022,1023,1024,1087,1075,1076,1077,1078,1079,1080,1081,1082,1083,1084,1085,1086,1088,1089,1090,1091,1092,1093,1094,1095,1096,1097,1098,1099,1100,1101,1102,1103,1104,1105],\"params\":{},\"remark\":\"班主任角色\",\"roleId\":100,\"roleKey\":\"head_teacher\",\"roleName\":\"班主任\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 07:25:23', 803);
INSERT INTO `sys_oper_log` VALUES (341, '通知公告', 1, 'com.ruoyi.web.controller.system.SysNoticeController.add()', 'POST', 1, 'head1', '高一(1)班', '/system/notice', '127.0.0.1', '内网IP', '{\"createBy\":\"head1\",\"noticeContent\":\"<p>1236</p>\",\"noticeTitle\":\"测试\",\"noticeType\":\"1\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 07:26:01', 159);
INSERT INTO `sys_oper_log` VALUES (342, '作业提交与成绩', 2, 'com.ruoyi.school.controller.HomeworkSubmissionController.edit()', 'PUT', 1, 'admin', '高二(1)班', '/school/submission', '127.0.0.1', '内网IP', '{\"params\":{},\"score\":80,\"status\":\"2\",\"submissionId\":22,\"updateTime\":\"2026-01-27 00:17:05\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 16:17:05', 74);
INSERT INTO `sys_oper_log` VALUES (343, '作业发布任务', 1, 'com.ruoyi.school.controller.HomeworkTaskController.add()', 'POST', 1, 'admin', '高二(1)班', '/school/task', '127.0.0.1', '内网IP', '{\"classId\":201,\"courseId\":2,\"createTime\":\"2026-01-27 00:32:09\",\"deadlineTime\":\"2026-01-28\",\"params\":{},\"status\":\"0\",\"taskContent\":\"<p>112121212</p>\",\"taskId\":16,\"taskTitle\":\"语文\",\"teacherId\":1} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 16:32:09', 209);
INSERT INTO `sys_oper_log` VALUES (344, '作业发布任务', 3, 'com.ruoyi.school.controller.HomeworkTaskController.remove()', 'DELETE', 1, 'admin', '高二(1)班', '/school/task/1', '127.0.0.1', '内网IP', '[1] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 16:33:27', 56);
INSERT INTO `sys_oper_log` VALUES (345, '作业发布任务', 3, 'com.ruoyi.school.controller.HomeworkTaskController.remove()', 'DELETE', 1, 'admin', '高二(1)班', '/school/task/2', '127.0.0.1', '内网IP', '[2] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 16:33:30', 51);
INSERT INTO `sys_oper_log` VALUES (346, '作业发布任务', 3, 'com.ruoyi.school.controller.HomeworkTaskController.remove()', 'DELETE', 1, 'admin', '高二(1)班', '/school/task/4', '127.0.0.1', '内网IP', '[4] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 16:33:32', 51);
INSERT INTO `sys_oper_log` VALUES (347, '作业发布任务', 3, 'com.ruoyi.school.controller.HomeworkTaskController.remove()', 'DELETE', 1, 'admin', '高二(1)班', '/school/task/3', '127.0.0.1', '内网IP', '[3] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 16:33:40', 53);
INSERT INTO `sys_oper_log` VALUES (348, '作业发布任务', 3, 'com.ruoyi.school.controller.HomeworkTaskController.remove()', 'DELETE', 1, 'admin', '高二(1)班', '/school/task/5', '127.0.0.1', '内网IP', '[5] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 16:33:42', 51);
INSERT INTO `sys_oper_log` VALUES (349, '作业发布任务', 3, 'com.ruoyi.school.controller.HomeworkTaskController.remove()', 'DELETE', 1, 'admin', '高二(1)班', '/school/task/6', '127.0.0.1', '内网IP', '[6] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 16:33:44', 51);
INSERT INTO `sys_oper_log` VALUES (350, '作业发布任务', 3, 'com.ruoyi.school.controller.HomeworkTaskController.remove()', 'DELETE', 1, 'admin', '高二(1)班', '/school/task/7', '127.0.0.1', '内网IP', '[7] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 16:33:51', 54);
INSERT INTO `sys_oper_log` VALUES (351, '作业发布任务', 3, 'com.ruoyi.school.controller.HomeworkTaskController.remove()', 'DELETE', 1, 'admin', '高二(1)班', '/school/task/9', '127.0.0.1', '内网IP', '[9] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 16:33:54', 49);
INSERT INTO `sys_oper_log` VALUES (352, '作业发布任务', 3, 'com.ruoyi.school.controller.HomeworkTaskController.remove()', 'DELETE', 1, 'admin', '高二(1)班', '/school/task/12', '127.0.0.1', '内网IP', '[12] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 16:33:56', 50);
INSERT INTO `sys_oper_log` VALUES (353, '作业发布任务', 3, 'com.ruoyi.school.controller.HomeworkTaskController.remove()', 'DELETE', 1, 'admin', '高二(1)班', '/school/task/13', '127.0.0.1', '内网IP', '[13] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 16:34:05', 50);
INSERT INTO `sys_oper_log` VALUES (354, '作业发布任务', 3, 'com.ruoyi.school.controller.HomeworkTaskController.remove()', 'DELETE', 1, 'admin', '高二(1)班', '/school/task/14', '127.0.0.1', '内网IP', '[14] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 16:34:07', 50);
INSERT INTO `sys_oper_log` VALUES (355, '作业发布任务', 3, 'com.ruoyi.school.controller.HomeworkTaskController.remove()', 'DELETE', 1, 'admin', '高二(1)班', '/school/task/15', '127.0.0.1', '内网IP', '[15] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 16:34:09', 50);
INSERT INTO `sys_oper_log` VALUES (356, '作业发布任务', 3, 'com.ruoyi.school.controller.HomeworkTaskController.remove()', 'DELETE', 1, 'admin', '高二(1)班', '/school/task/8', '127.0.0.1', '内网IP', '[8] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 16:34:12', 50);
INSERT INTO `sys_oper_log` VALUES (357, '作业发布任务', 3, 'com.ruoyi.school.controller.HomeworkTaskController.remove()', 'DELETE', 1, 'admin', '高二(1)班', '/school/task/11', '127.0.0.1', '内网IP', '[11] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 16:34:13', 50);
INSERT INTO `sys_oper_log` VALUES (358, '作业发布任务', 3, 'com.ruoyi.school.controller.HomeworkTaskController.remove()', 'DELETE', 1, 'admin', '高二(1)班', '/school/task/16', '127.0.0.1', '内网IP', '[16] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 16:34:15', 49);
INSERT INTO `sys_oper_log` VALUES (359, '作业提交与成绩', 3, 'com.ruoyi.school.controller.HomeworkSubmissionController.remove()', 'DELETE', 1, 'admin', '高二(1)班', '/school/submission/22', '127.0.0.1', '内网IP', '[22] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 16:34:19', 53);
INSERT INTO `sys_oper_log` VALUES (360, '作业提交与成绩', 3, 'com.ruoyi.school.controller.HomeworkSubmissionController.remove()', 'DELETE', 1, 'admin', '高二(1)班', '/school/submission/21', '127.0.0.1', '内网IP', '[21] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 16:34:21', 50);
INSERT INTO `sys_oper_log` VALUES (361, '作业提交与成绩', 3, 'com.ruoyi.school.controller.HomeworkSubmissionController.remove()', 'DELETE', 1, 'admin', '高二(1)班', '/school/submission/20', '127.0.0.1', '内网IP', '[20] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 16:34:23', 51);
INSERT INTO `sys_oper_log` VALUES (362, '作业提交与成绩', 3, 'com.ruoyi.school.controller.HomeworkSubmissionController.remove()', 'DELETE', 1, 'admin', '高二(1)班', '/school/submission/19', '127.0.0.1', '内网IP', '[19] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 16:34:24', 51);
INSERT INTO `sys_oper_log` VALUES (363, '作业提交与成绩', 3, 'com.ruoyi.school.controller.HomeworkSubmissionController.remove()', 'DELETE', 1, 'admin', '高二(1)班', '/school/submission/16', '127.0.0.1', '内网IP', '[16] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 16:34:26', 52);
INSERT INTO `sys_oper_log` VALUES (364, '作业提交与成绩', 3, 'com.ruoyi.school.controller.HomeworkSubmissionController.remove()', 'DELETE', 1, 'admin', '高二(1)班', '/school/submission/18', '127.0.0.1', '内网IP', '[18] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 16:34:29', 50);
INSERT INTO `sys_oper_log` VALUES (365, '作业提交与成绩', 3, 'com.ruoyi.school.controller.HomeworkSubmissionController.remove()', 'DELETE', 1, 'admin', '高二(1)班', '/school/submission/17', '127.0.0.1', '内网IP', '[17] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 16:34:31', 51);
INSERT INTO `sys_oper_log` VALUES (366, '作业提交与成绩', 3, 'com.ruoyi.school.controller.HomeworkSubmissionController.remove()', 'DELETE', 1, 'admin', '高二(1)班', '/school/submission/5', '127.0.0.1', '内网IP', '[5] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 16:34:33', 49);
INSERT INTO `sys_oper_log` VALUES (367, '作业提交与成绩', 3, 'com.ruoyi.school.controller.HomeworkSubmissionController.remove()', 'DELETE', 1, 'admin', '高二(1)班', '/school/submission/4', '127.0.0.1', '内网IP', '[4] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 16:34:34', 49);
INSERT INTO `sys_oper_log` VALUES (368, '作业提交与成绩', 3, 'com.ruoyi.school.controller.HomeworkSubmissionController.remove()', 'DELETE', 1, 'admin', '高二(1)班', '/school/submission/1', '127.0.0.1', '内网IP', '[1] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 16:34:37', 52);
INSERT INTO `sys_oper_log` VALUES (369, '作业提交与成绩', 3, 'com.ruoyi.school.controller.HomeworkSubmissionController.remove()', 'DELETE', 1, 'admin', '高二(1)班', '/school/submission/3', '127.0.0.1', '内网IP', '[3] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 16:34:39', 51);
INSERT INTO `sys_oper_log` VALUES (370, '作业发布任务', 1, 'com.ruoyi.school.controller.HomeworkTaskController.add()', 'POST', 1, 'admin', '高二(1)班', '/school/task', '127.0.0.1', '内网IP', '{\"classId\":201,\"courseId\":1,\"createTime\":\"2026-01-27 00:35:13\",\"deadlineTime\":\"2026-01-28\",\"params\":{},\"status\":\"1\",\"taskContent\":\"<p>测试工作</p>\",\"taskId\":17,\"taskTitle\":\"数学\",\"teacherId\":1} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 16:35:13', 51);
INSERT INTO `sys_oper_log` VALUES (371, '作业提交与成绩', 2, 'com.ruoyi.school.controller.HomeworkSubmissionController.edit()', 'PUT', 1, 'admin', '高二(1)班', '/school/submission', '127.0.0.1', '内网IP', '{\"params\":{},\"score\":80,\"status\":\"2\",\"submissionId\":23,\"updateTime\":\"2026-01-27 00:38:26\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 16:38:26', 67);
INSERT INTO `sys_oper_log` VALUES (372, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '高二(1)班', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2026-01-24 09:52:59\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,200\",\"children\":[],\"deptId\":201,\"deptName\":\"高一(1)班\",\"leader\":\"HS\",\"orderNum\":1,\"params\":{},\"parentId\":200,\"status\":\"0\"},\"deptId\":201,\"email\":\"\",\"loginDate\":\"2026-01-27 00:55:08\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"班主任1\",\"params\":{},\"phonenumber\":\"15888888123\",\"postIds\":[3],\"pwdUpdateDate\":\"2026-01-26 07:01:04\",\"remark\":\"测试用户\",\"roleIds\":[100,4],\"roles\":[{\"admin\":false,\"dataScope\":\"3\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"head_teacher\",\"roleName\":\"班主任\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"studentCode\":\"\",\"updateBy\":\"admin\",\"userId\":1001,\"userName\":\"head1\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 17:08:00', 367);
INSERT INTO `sys_oper_log` VALUES (373, '通知公告', 1, 'com.ruoyi.web.controller.system.SysNoticeController.add()', 'POST', 1, 'admin', '高二(1)班', '/system/notice', '127.0.0.1', '内网IP', '{\"classId\":201,\"createBy\":\"admin\",\"noticeContent\":\"<p>测试公告</p>\",\"noticeTitle\":\"测试公告\",\"noticeType\":\"2\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 17:19:33', 216);
INSERT INTO `sys_oper_log` VALUES (374, '通知公告', 3, 'com.ruoyi.web.controller.system.SysNoticeController.remove()', 'DELETE', 1, 'admin', '高二(1)班', '/system/notice/1', '127.0.0.1', '内网IP', '[1] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 17:19:38', 55);
INSERT INTO `sys_oper_log` VALUES (375, '通知公告', 3, 'com.ruoyi.web.controller.system.SysNoticeController.remove()', 'DELETE', 1, 'admin', '高二(1)班', '/system/notice/2', '127.0.0.1', '内网IP', '[2] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 17:19:39', 54);
INSERT INTO `sys_oper_log` VALUES (376, '通知公告', 3, 'com.ruoyi.web.controller.system.SysNoticeController.remove()', 'DELETE', 1, 'admin', '高二(1)班', '/system/notice/3', '127.0.0.1', '内网IP', '[3] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 17:19:41', 52);
INSERT INTO `sys_oper_log` VALUES (377, '通知公告', 3, 'com.ruoyi.web.controller.system.SysNoticeController.remove()', 'DELETE', 1, 'admin', '高二(1)班', '/system/notice/4', '127.0.0.1', '内网IP', '[4] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 17:19:44', 50);
INSERT INTO `sys_oper_log` VALUES (378, '通知公告', 3, 'com.ruoyi.web.controller.system.SysNoticeController.remove()', 'DELETE', 1, 'admin', '高二(1)班', '/system/notice/5', '127.0.0.1', '内网IP', '[5] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-26 17:19:46', 52);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2025-12-18 18:10:55', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '班主任', 2, '0', 'admin', '2025-12-18 18:10:55', 'admin', '2025-12-21 23:18:21', '');
INSERT INTO `sys_post` VALUES (3, 'te', '科任老师', 3, '0', 'admin', '2025-12-18 18:10:55', 'admin', '2026-01-13 02:06:19', '');
INSERT INTO `sys_post` VALUES (4, 'user', '学生', 4, '0', 'admin', '2025-12-18 18:10:55', 'admin', '2025-12-21 23:19:00', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2025-12-18 18:10:55', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通用户', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2025-12-18 18:10:55', 'admin', '2026-01-15 03:03:07', '普通角色');
INSERT INTO `sys_role` VALUES (3, '老师', '2', 3, '1', 1, 1, '0', '2', 'admin', '2025-12-21 20:47:19', 'admin', '2025-12-21 20:47:54', NULL);
INSERT INTO `sys_role` VALUES (4, '科任老师', 'mid-admin', 3, '1', 1, 1, '0', '0', 'admin', '2025-12-21 20:52:45', 'admin', '2026-01-26 05:49:31', '科任老师权限介于班主任（admin）之间');
INSERT INTO `sys_role` VALUES (100, '班主任', 'head_teacher', 2, '3', 1, 1, '0', '0', 'admin', '2026-01-24 09:52:57', 'admin', '2026-01-26 07:25:22', '班主任角色');
INSERT INTO `sys_role` VALUES (101, '行政人员', 'school_admin', 3, '1', 1, 1, '0', '0', 'admin', '2026-01-24 09:52:58', '', NULL, '行政人员角色');
INSERT INTO `sys_role` VALUES (102, '教师', 'teacher', 4, '2', 1, 1, '0', '0', 'admin', '2026-01-24 09:52:58', '', NULL, '教师角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1061);
INSERT INTO `sys_role_menu` VALUES (2, 1062);
INSERT INTO `sys_role_menu` VALUES (2, 1063);
INSERT INTO `sys_role_menu` VALUES (2, 1064);
INSERT INTO `sys_role_menu` VALUES (2, 1065);
INSERT INTO `sys_role_menu` VALUES (2, 1066);
INSERT INTO `sys_role_menu` VALUES (2, 1067);
INSERT INTO `sys_role_menu` VALUES (2, 1068);
INSERT INTO `sys_role_menu` VALUES (2, 1069);
INSERT INTO `sys_role_menu` VALUES (2, 1070);
INSERT INTO `sys_role_menu` VALUES (2, 1071);
INSERT INTO `sys_role_menu` VALUES (2, 1072);
INSERT INTO `sys_role_menu` VALUES (2, 1073);
INSERT INTO `sys_role_menu` VALUES (2, 1074);
INSERT INTO `sys_role_menu` VALUES (2, 1075);
INSERT INTO `sys_role_menu` VALUES (2, 1076);
INSERT INTO `sys_role_menu` VALUES (2, 1077);
INSERT INTO `sys_role_menu` VALUES (2, 1078);
INSERT INTO `sys_role_menu` VALUES (2, 1079);
INSERT INTO `sys_role_menu` VALUES (2, 1080);
INSERT INTO `sys_role_menu` VALUES (2, 1081);
INSERT INTO `sys_role_menu` VALUES (2, 1082);
INSERT INTO `sys_role_menu` VALUES (2, 1083);
INSERT INTO `sys_role_menu` VALUES (2, 1084);
INSERT INTO `sys_role_menu` VALUES (2, 1085);
INSERT INTO `sys_role_menu` VALUES (2, 1086);
INSERT INTO `sys_role_menu` VALUES (2, 1087);
INSERT INTO `sys_role_menu` VALUES (2, 1088);
INSERT INTO `sys_role_menu` VALUES (2, 1089);
INSERT INTO `sys_role_menu` VALUES (2, 1090);
INSERT INTO `sys_role_menu` VALUES (2, 1091);
INSERT INTO `sys_role_menu` VALUES (2, 1092);
INSERT INTO `sys_role_menu` VALUES (2, 1093);
INSERT INTO `sys_role_menu` VALUES (2, 1094);
INSERT INTO `sys_role_menu` VALUES (2, 1095);
INSERT INTO `sys_role_menu` VALUES (2, 1096);
INSERT INTO `sys_role_menu` VALUES (2, 1097);
INSERT INTO `sys_role_menu` VALUES (2, 1098);
INSERT INTO `sys_role_menu` VALUES (2, 1099);
INSERT INTO `sys_role_menu` VALUES (2, 1100);
INSERT INTO `sys_role_menu` VALUES (2, 1101);
INSERT INTO `sys_role_menu` VALUES (2, 1102);
INSERT INTO `sys_role_menu` VALUES (2, 1103);
INSERT INTO `sys_role_menu` VALUES (2, 1104);
INSERT INTO `sys_role_menu` VALUES (2, 1105);
INSERT INTO `sys_role_menu` VALUES (2, 1106);
INSERT INTO `sys_role_menu` VALUES (2, 1107);
INSERT INTO `sys_role_menu` VALUES (2, 1108);
INSERT INTO `sys_role_menu` VALUES (2, 1109);
INSERT INTO `sys_role_menu` VALUES (2, 1110);
INSERT INTO `sys_role_menu` VALUES (2, 1111);
INSERT INTO `sys_role_menu` VALUES (2, 1112);
INSERT INTO `sys_role_menu` VALUES (2, 1113);
INSERT INTO `sys_role_menu` VALUES (2, 1114);
INSERT INTO `sys_role_menu` VALUES (2, 1115);
INSERT INTO `sys_role_menu` VALUES (2, 1116);
INSERT INTO `sys_role_menu` VALUES (2, 1117);
INSERT INTO `sys_role_menu` VALUES (2, 1118);
INSERT INTO `sys_role_menu` VALUES (2, 1119);
INSERT INTO `sys_role_menu` VALUES (2, 1120);
INSERT INTO `sys_role_menu` VALUES (2, 1121);
INSERT INTO `sys_role_menu` VALUES (2, 1122);
INSERT INTO `sys_role_menu` VALUES (2, 1123);
INSERT INTO `sys_role_menu` VALUES (2, 1124);
INSERT INTO `sys_role_menu` VALUES (2, 1125);
INSERT INTO `sys_role_menu` VALUES (2, 1126);
INSERT INTO `sys_role_menu` VALUES (2, 1127);
INSERT INTO `sys_role_menu` VALUES (2, 1128);
INSERT INTO `sys_role_menu` VALUES (2, 1129);
INSERT INTO `sys_role_menu` VALUES (2, 1130);
INSERT INTO `sys_role_menu` VALUES (2, 1131);
INSERT INTO `sys_role_menu` VALUES (2, 1132);
INSERT INTO `sys_role_menu` VALUES (2, 1133);
INSERT INTO `sys_role_menu` VALUES (2, 1134);
INSERT INTO `sys_role_menu` VALUES (2, 1135);
INSERT INTO `sys_role_menu` VALUES (2, 1136);
INSERT INTO `sys_role_menu` VALUES (2, 1137);
INSERT INTO `sys_role_menu` VALUES (2, 1138);
INSERT INTO `sys_role_menu` VALUES (2, 1139);
INSERT INTO `sys_role_menu` VALUES (2, 1140);
INSERT INTO `sys_role_menu` VALUES (2, 1141);
INSERT INTO `sys_role_menu` VALUES (2, 1142);
INSERT INTO `sys_role_menu` VALUES (4, 1);
INSERT INTO `sys_role_menu` VALUES (4, 2);
INSERT INTO `sys_role_menu` VALUES (4, 100);
INSERT INTO `sys_role_menu` VALUES (4, 102);
INSERT INTO `sys_role_menu` VALUES (4, 103);
INSERT INTO `sys_role_menu` VALUES (4, 104);
INSERT INTO `sys_role_menu` VALUES (4, 107);
INSERT INTO `sys_role_menu` VALUES (4, 109);
INSERT INTO `sys_role_menu` VALUES (4, 110);
INSERT INTO `sys_role_menu` VALUES (4, 111);
INSERT INTO `sys_role_menu` VALUES (4, 112);
INSERT INTO `sys_role_menu` VALUES (4, 113);
INSERT INTO `sys_role_menu` VALUES (4, 114);
INSERT INTO `sys_role_menu` VALUES (4, 1000);
INSERT INTO `sys_role_menu` VALUES (4, 1001);
INSERT INTO `sys_role_menu` VALUES (4, 1002);
INSERT INTO `sys_role_menu` VALUES (4, 1003);
INSERT INTO `sys_role_menu` VALUES (4, 1004);
INSERT INTO `sys_role_menu` VALUES (4, 1005);
INSERT INTO `sys_role_menu` VALUES (4, 1006);
INSERT INTO `sys_role_menu` VALUES (4, 1012);
INSERT INTO `sys_role_menu` VALUES (4, 1013);
INSERT INTO `sys_role_menu` VALUES (4, 1014);
INSERT INTO `sys_role_menu` VALUES (4, 1015);
INSERT INTO `sys_role_menu` VALUES (4, 1016);
INSERT INTO `sys_role_menu` VALUES (4, 1017);
INSERT INTO `sys_role_menu` VALUES (4, 1018);
INSERT INTO `sys_role_menu` VALUES (4, 1019);
INSERT INTO `sys_role_menu` VALUES (4, 1020);
INSERT INTO `sys_role_menu` VALUES (4, 1021);
INSERT INTO `sys_role_menu` VALUES (4, 1022);
INSERT INTO `sys_role_menu` VALUES (4, 1023);
INSERT INTO `sys_role_menu` VALUES (4, 1024);
INSERT INTO `sys_role_menu` VALUES (4, 1035);
INSERT INTO `sys_role_menu` VALUES (4, 1036);
INSERT INTO `sys_role_menu` VALUES (4, 1037);
INSERT INTO `sys_role_menu` VALUES (4, 1038);
INSERT INTO `sys_role_menu` VALUES (4, 1046);
INSERT INTO `sys_role_menu` VALUES (4, 1047);
INSERT INTO `sys_role_menu` VALUES (4, 1048);
INSERT INTO `sys_role_menu` VALUES (4, 1049);
INSERT INTO `sys_role_menu` VALUES (4, 1050);
INSERT INTO `sys_role_menu` VALUES (4, 1051);
INSERT INTO `sys_role_menu` VALUES (4, 1052);
INSERT INTO `sys_role_menu` VALUES (4, 1053);
INSERT INTO `sys_role_menu` VALUES (4, 1054);
INSERT INTO `sys_role_menu` VALUES (4, 1062);
INSERT INTO `sys_role_menu` VALUES (4, 1063);
INSERT INTO `sys_role_menu` VALUES (4, 1064);
INSERT INTO `sys_role_menu` VALUES (4, 1065);
INSERT INTO `sys_role_menu` VALUES (4, 1066);
INSERT INTO `sys_role_menu` VALUES (4, 1067);
INSERT INTO `sys_role_menu` VALUES (4, 1068);
INSERT INTO `sys_role_menu` VALUES (4, 1069);
INSERT INTO `sys_role_menu` VALUES (4, 1070);
INSERT INTO `sys_role_menu` VALUES (4, 1071);
INSERT INTO `sys_role_menu` VALUES (4, 1072);
INSERT INTO `sys_role_menu` VALUES (4, 1073);
INSERT INTO `sys_role_menu` VALUES (4, 1074);
INSERT INTO `sys_role_menu` VALUES (4, 1075);
INSERT INTO `sys_role_menu` VALUES (4, 1076);
INSERT INTO `sys_role_menu` VALUES (4, 1077);
INSERT INTO `sys_role_menu` VALUES (4, 1078);
INSERT INTO `sys_role_menu` VALUES (4, 1079);
INSERT INTO `sys_role_menu` VALUES (4, 1080);
INSERT INTO `sys_role_menu` VALUES (4, 1081);
INSERT INTO `sys_role_menu` VALUES (4, 1082);
INSERT INTO `sys_role_menu` VALUES (4, 1083);
INSERT INTO `sys_role_menu` VALUES (4, 1084);
INSERT INTO `sys_role_menu` VALUES (4, 1085);
INSERT INTO `sys_role_menu` VALUES (4, 1086);
INSERT INTO `sys_role_menu` VALUES (4, 1087);
INSERT INTO `sys_role_menu` VALUES (4, 1088);
INSERT INTO `sys_role_menu` VALUES (4, 1089);
INSERT INTO `sys_role_menu` VALUES (4, 1090);
INSERT INTO `sys_role_menu` VALUES (4, 1091);
INSERT INTO `sys_role_menu` VALUES (4, 1092);
INSERT INTO `sys_role_menu` VALUES (4, 1093);
INSERT INTO `sys_role_menu` VALUES (4, 1094);
INSERT INTO `sys_role_menu` VALUES (4, 1095);
INSERT INTO `sys_role_menu` VALUES (4, 1096);
INSERT INTO `sys_role_menu` VALUES (4, 1097);
INSERT INTO `sys_role_menu` VALUES (4, 1098);
INSERT INTO `sys_role_menu` VALUES (4, 1099);
INSERT INTO `sys_role_menu` VALUES (4, 1100);
INSERT INTO `sys_role_menu` VALUES (4, 1101);
INSERT INTO `sys_role_menu` VALUES (4, 1102);
INSERT INTO `sys_role_menu` VALUES (4, 1103);
INSERT INTO `sys_role_menu` VALUES (4, 1104);
INSERT INTO `sys_role_menu` VALUES (4, 1105);
INSERT INTO `sys_role_menu` VALUES (4, 1106);
INSERT INTO `sys_role_menu` VALUES (4, 1107);
INSERT INTO `sys_role_menu` VALUES (4, 1108);
INSERT INTO `sys_role_menu` VALUES (4, 1109);
INSERT INTO `sys_role_menu` VALUES (4, 1110);
INSERT INTO `sys_role_menu` VALUES (4, 1111);
INSERT INTO `sys_role_menu` VALUES (4, 1112);
INSERT INTO `sys_role_menu` VALUES (4, 1113);
INSERT INTO `sys_role_menu` VALUES (4, 1114);
INSERT INTO `sys_role_menu` VALUES (4, 1115);
INSERT INTO `sys_role_menu` VALUES (4, 1116);
INSERT INTO `sys_role_menu` VALUES (4, 1117);
INSERT INTO `sys_role_menu` VALUES (4, 1118);
INSERT INTO `sys_role_menu` VALUES (4, 1119);
INSERT INTO `sys_role_menu` VALUES (4, 1120);
INSERT INTO `sys_role_menu` VALUES (4, 1121);
INSERT INTO `sys_role_menu` VALUES (4, 1122);
INSERT INTO `sys_role_menu` VALUES (4, 1123);
INSERT INTO `sys_role_menu` VALUES (4, 1124);
INSERT INTO `sys_role_menu` VALUES (4, 1125);
INSERT INTO `sys_role_menu` VALUES (4, 1126);
INSERT INTO `sys_role_menu` VALUES (4, 1127);
INSERT INTO `sys_role_menu` VALUES (4, 1128);
INSERT INTO `sys_role_menu` VALUES (4, 1129);
INSERT INTO `sys_role_menu` VALUES (4, 1130);
INSERT INTO `sys_role_menu` VALUES (4, 1131);
INSERT INTO `sys_role_menu` VALUES (4, 1132);
INSERT INTO `sys_role_menu` VALUES (4, 1133);
INSERT INTO `sys_role_menu` VALUES (4, 1134);
INSERT INTO `sys_role_menu` VALUES (4, 1135);
INSERT INTO `sys_role_menu` VALUES (4, 1136);
INSERT INTO `sys_role_menu` VALUES (100, 1);
INSERT INTO `sys_role_menu` VALUES (100, 100);
INSERT INTO `sys_role_menu` VALUES (100, 103);
INSERT INTO `sys_role_menu` VALUES (100, 104);
INSERT INTO `sys_role_menu` VALUES (100, 107);
INSERT INTO `sys_role_menu` VALUES (100, 1000);
INSERT INTO `sys_role_menu` VALUES (100, 1001);
INSERT INTO `sys_role_menu` VALUES (100, 1002);
INSERT INTO `sys_role_menu` VALUES (100, 1003);
INSERT INTO `sys_role_menu` VALUES (100, 1004);
INSERT INTO `sys_role_menu` VALUES (100, 1005);
INSERT INTO `sys_role_menu` VALUES (100, 1006);
INSERT INTO `sys_role_menu` VALUES (100, 1016);
INSERT INTO `sys_role_menu` VALUES (100, 1017);
INSERT INTO `sys_role_menu` VALUES (100, 1018);
INSERT INTO `sys_role_menu` VALUES (100, 1019);
INSERT INTO `sys_role_menu` VALUES (100, 1020);
INSERT INTO `sys_role_menu` VALUES (100, 1021);
INSERT INTO `sys_role_menu` VALUES (100, 1022);
INSERT INTO `sys_role_menu` VALUES (100, 1023);
INSERT INTO `sys_role_menu` VALUES (100, 1024);
INSERT INTO `sys_role_menu` VALUES (100, 1035);
INSERT INTO `sys_role_menu` VALUES (100, 1036);
INSERT INTO `sys_role_menu` VALUES (100, 1037);
INSERT INTO `sys_role_menu` VALUES (100, 1038);
INSERT INTO `sys_role_menu` VALUES (100, 1061);
INSERT INTO `sys_role_menu` VALUES (100, 1075);
INSERT INTO `sys_role_menu` VALUES (100, 1076);
INSERT INTO `sys_role_menu` VALUES (100, 1077);
INSERT INTO `sys_role_menu` VALUES (100, 1078);
INSERT INTO `sys_role_menu` VALUES (100, 1079);
INSERT INTO `sys_role_menu` VALUES (100, 1080);
INSERT INTO `sys_role_menu` VALUES (100, 1081);
INSERT INTO `sys_role_menu` VALUES (100, 1082);
INSERT INTO `sys_role_menu` VALUES (100, 1083);
INSERT INTO `sys_role_menu` VALUES (100, 1084);
INSERT INTO `sys_role_menu` VALUES (100, 1085);
INSERT INTO `sys_role_menu` VALUES (100, 1086);
INSERT INTO `sys_role_menu` VALUES (100, 1087);
INSERT INTO `sys_role_menu` VALUES (100, 1088);
INSERT INTO `sys_role_menu` VALUES (100, 1089);
INSERT INTO `sys_role_menu` VALUES (100, 1090);
INSERT INTO `sys_role_menu` VALUES (100, 1091);
INSERT INTO `sys_role_menu` VALUES (100, 1092);
INSERT INTO `sys_role_menu` VALUES (100, 1093);
INSERT INTO `sys_role_menu` VALUES (100, 1094);
INSERT INTO `sys_role_menu` VALUES (100, 1095);
INSERT INTO `sys_role_menu` VALUES (100, 1096);
INSERT INTO `sys_role_menu` VALUES (100, 1097);
INSERT INTO `sys_role_menu` VALUES (100, 1098);
INSERT INTO `sys_role_menu` VALUES (100, 1099);
INSERT INTO `sys_role_menu` VALUES (100, 1100);
INSERT INTO `sys_role_menu` VALUES (100, 1101);
INSERT INTO `sys_role_menu` VALUES (100, 1102);
INSERT INTO `sys_role_menu` VALUES (100, 1103);
INSERT INTO `sys_role_menu` VALUES (100, 1104);
INSERT INTO `sys_role_menu` VALUES (100, 1105);
INSERT INTO `sys_role_menu` VALUES (100, 1106);
INSERT INTO `sys_role_menu` VALUES (100, 1107);
INSERT INTO `sys_role_menu` VALUES (100, 1108);
INSERT INTO `sys_role_menu` VALUES (100, 1109);
INSERT INTO `sys_role_menu` VALUES (100, 1110);
INSERT INTO `sys_role_menu` VALUES (100, 1111);
INSERT INTO `sys_role_menu` VALUES (100, 1112);
INSERT INTO `sys_role_menu` VALUES (100, 1113);
INSERT INTO `sys_role_menu` VALUES (100, 1114);
INSERT INTO `sys_role_menu` VALUES (100, 1115);
INSERT INTO `sys_role_menu` VALUES (100, 1116);
INSERT INTO `sys_role_menu` VALUES (100, 1117);
INSERT INTO `sys_role_menu` VALUES (100, 1118);
INSERT INTO `sys_role_menu` VALUES (100, 1119);
INSERT INTO `sys_role_menu` VALUES (100, 1120);
INSERT INTO `sys_role_menu` VALUES (100, 1121);
INSERT INTO `sys_role_menu` VALUES (100, 1122);
INSERT INTO `sys_role_menu` VALUES (100, 1123);
INSERT INTO `sys_role_menu` VALUES (100, 1124);
INSERT INTO `sys_role_menu` VALUES (100, 1125);
INSERT INTO `sys_role_menu` VALUES (100, 1126);
INSERT INTO `sys_role_menu` VALUES (100, 1127);
INSERT INTO `sys_role_menu` VALUES (100, 1128);
INSERT INTO `sys_role_menu` VALUES (100, 1129);
INSERT INTO `sys_role_menu` VALUES (100, 1130);
INSERT INTO `sys_role_menu` VALUES (100, 1131);
INSERT INTO `sys_role_menu` VALUES (100, 1132);
INSERT INTO `sys_role_menu` VALUES (100, 1133);
INSERT INTO `sys_role_menu` VALUES (100, 1134);
INSERT INTO `sys_role_menu` VALUES (100, 1135);
INSERT INTO `sys_role_menu` VALUES (100, 1136);
INSERT INTO `sys_role_menu` VALUES (100, 1137);
INSERT INTO `sys_role_menu` VALUES (100, 1138);
INSERT INTO `sys_role_menu` VALUES (100, 1139);
INSERT INTO `sys_role_menu` VALUES (100, 1140);
INSERT INTO `sys_role_menu` VALUES (100, 1141);
INSERT INTO `sys_role_menu` VALUES (100, 1142);
INSERT INTO `sys_role_menu` VALUES (101, 107);
INSERT INTO `sys_role_menu` VALUES (101, 1069);
INSERT INTO `sys_role_menu` VALUES (101, 1070);
INSERT INTO `sys_role_menu` VALUES (101, 1071);
INSERT INTO `sys_role_menu` VALUES (101, 1072);
INSERT INTO `sys_role_menu` VALUES (101, 1073);
INSERT INTO `sys_role_menu` VALUES (101, 1074);
INSERT INTO `sys_role_menu` VALUES (101, 1106);
INSERT INTO `sys_role_menu` VALUES (101, 1107);
INSERT INTO `sys_role_menu` VALUES (101, 1108);
INSERT INTO `sys_role_menu` VALUES (101, 1109);
INSERT INTO `sys_role_menu` VALUES (101, 1110);
INSERT INTO `sys_role_menu` VALUES (101, 1111);
INSERT INTO `sys_role_menu` VALUES (101, 1131);
INSERT INTO `sys_role_menu` VALUES (102, 1069);
INSERT INTO `sys_role_menu` VALUES (102, 1070);
INSERT INTO `sys_role_menu` VALUES (102, 1071);
INSERT INTO `sys_role_menu` VALUES (102, 1072);
INSERT INTO `sys_role_menu` VALUES (102, 1073);
INSERT INTO `sys_role_menu` VALUES (102, 1074);
INSERT INTO `sys_role_menu` VALUES (102, 1118);
INSERT INTO `sys_role_menu` VALUES (102, 1119);
INSERT INTO `sys_role_menu` VALUES (102, 1120);
INSERT INTO `sys_role_menu` VALUES (102, 1121);
INSERT INTO `sys_role_menu` VALUES (102, 1122);
INSERT INTO `sys_role_menu` VALUES (102, 1123);
INSERT INTO `sys_role_menu` VALUES (102, 1124);
INSERT INTO `sys_role_menu` VALUES (102, 1125);
INSERT INTO `sys_role_menu` VALUES (102, 1126);
INSERT INTO `sys_role_menu` VALUES (102, 1127);
INSERT INTO `sys_role_menu` VALUES (102, 1128);
INSERT INTO `sys_role_menu` VALUES (102, 1129);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `student_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '学号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '账号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime NULL DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1005 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '', '管理员', '00', '123@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2026-01-27 01:11:19', '2025-12-18 18:10:55', 'admin', '2025-12-18 18:10:55', '', '2026-01-13 02:15:14', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$bM9sOHkg1schgvk1Rl5cIOsy6kA6Q1wZDIqfk9ORGupMskMvPtqSm', '0', '0', '127.0.0.1', '2026-01-24 23:37:59', '2025-12-22 19:06:05', 'admin', '2025-12-18 18:10:55', 'admin', '2026-01-24 10:03:42', '测试员');
INSERT INTO `sys_user` VALUES (3, NULL, '22', '', '1', '00', '', '', '0', '', '$2a$10$3M2bGY3pJwocWsjds.JtGuXsbqSJksfyzIIEMvYB9aLWBets23tnG', '0', '2', '', NULL, NULL, 'admin', '2025-12-21 20:54:35', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (4, 100, '11', '', '科任老师', '00', '456@163.com', '18598968865', '0', '', '$2a$10$1V3XrcTDPM4oyT9T5ZvIU.REkD.FdV512fi0vqmI0s1ghQmQmgsKS', '0', '2', '127.0.0.1', '2025-12-21 21:01:00', '2025-12-21 23:15:40', 'admin', '2025-12-21 20:57:14', 'admin', '2025-12-21 23:15:40', NULL);
INSERT INTO `sys_user` VALUES (5, 100, '科任老师', '', '语文老师', '00', '456@qq.com', '15862863654', '1', '', '$2a$10$16SMDe2fkZ1mvR8FqM2r/Oxm6JNeI7OUh5D9.EofiKo3156qayQ3K', '0', '0', '127.0.0.1', '2026-01-27 00:47:00', '2025-12-22 19:06:12', 'admin', '2025-12-21 23:17:06', 'admin', '2025-12-22 19:06:12', NULL);
INSERT INTO `sys_user` VALUES (6, 103, '学生', 'aa00232', 'wkk', '00', '', '', '0', '', '$2a$10$Ds3jXFv.LeFkSZH94Djv8ewg2HHlCZrTxN5u0DKlCdgeQVPskNz.G', '0', '0', '127.0.0.1', '2026-01-24 14:25:04', '2025-12-22 19:06:22', 'admin', '2025-12-22 00:50:07', 'admin', '2026-01-24 10:07:55', NULL);
INSERT INTO `sys_user` VALUES (7, 100, 'wkk', '', 'wkk', '00', '', '', '0', '/profile/avatar/2026/01/17/c8db5fa2c7c44975ba575f7fc025df59.jpg', '$2a$10$FRAosIXnWAYoMZHi0vAI8eWvk4pCC61ZRllOV/22mI7JCNUaBX4RW', '0', '0', '127.0.0.1', '2026-01-27 00:59:52', '2025-12-31 00:41:45', 'admin', '2025-12-22 19:09:11', 'admin', '2026-01-17 01:41:25', NULL);
INSERT INTO `sys_user` VALUES (10, 100, 'math_teacher', '', '数学老师', '00', 'math@school.com', '13800000010', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', NULL, NULL, 'admin', '2026-01-24 08:35:42', 'admin', '2026-01-24 08:35:42', '教师');
INSERT INTO `sys_user` VALUES (11, 100, 'eng_teacher', '', '英语老师', '00', 'eng@school.com', '13800000011', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', NULL, NULL, 'admin', '2026-01-24 08:35:42', 'admin', '2026-01-24 08:35:42', '教师');
INSERT INTO `sys_user` VALUES (12, 100, 'phy_teacher', '', '物理老师', '00', 'phy@school.com', '13800000012', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', NULL, NULL, 'admin', '2026-01-24 08:35:42', 'admin', '2026-01-24 08:35:42', '教师');
INSERT INTO `sys_user` VALUES (13, 100, 'chem_teacher', '', '化学老师', '00', 'chem@school.com', '13800000013', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2026-01-27 01:07:28', NULL, 'admin', '2026-01-24 08:35:42', 'admin', '2026-01-24 08:35:42', '教师');
INSERT INTO `sys_user` VALUES (14, 100, 'bio_teacher', '', '生物老师', '00', 'bio@school.com', '13800000014', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', NULL, NULL, 'admin', '2026-01-24 08:35:42', 'admin', '2026-01-24 08:35:42', '教师');
INSERT INTO `sys_user` VALUES (15, 100, 'hist_teacher', '', '历史老师', '00', 'hist@school.com', '13800000015', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', NULL, NULL, 'admin', '2026-01-24 08:35:42', 'admin', '2026-01-24 08:35:42', '教师');
INSERT INTO `sys_user` VALUES (1001, 201, 'head1', '', '班主任1', '00', '', '15888888123', '1', '', '$2a$10$W0YXcbDcB3yU6Yfazdp9LeOdVo.798EUBmxi5upr121k2F.Gr1g6K', '0', '0', '127.0.0.1', '2026-01-27 01:08:15', '2026-01-26 07:01:04', 'admin', '2026-01-24 09:52:59', 'admin', '2026-01-26 17:08:00', '测试用户');
INSERT INTO `sys_user` VALUES (1002, 200, 'math1', '', '数学老师1', '00', '', '15888888888', '1', '', '$2a$10$7JB720yubVSZv5W8vNGkarOu8wO1Q/yGB3uYydrZ3.J6dJ.X.a', '0', '0', '127.0.0.1', '2026-01-24 09:52:59', '2026-01-24 09:52:59', 'admin', '2026-01-24 09:52:59', '', NULL, '测试用户');
INSERT INTO `sys_user` VALUES (1003, 200, 'staff1', '', '行政人员1', '00', '', '15888888888', '1', '', '$2a$10$7JB720yubVSZv5W8vNGkarOu8wO1Q/yGB3uYydrZ3.J6dJ.X.a', '0', '0', '127.0.0.1', '2026-01-24 09:52:59', '2026-01-24 09:52:59', 'admin', '2026-01-24 09:52:59', '', NULL, '测试用户');
INSERT INTO `sys_user` VALUES (1004, 201, '测试学生', 'xs002', 'xs1', '00', '1153599409@qq.com', '18735973321', '0', '', '$2a$10$SvhTYKj2INL7jKbzhKwqreLZnNKaBIpJXVZqugWLKKxTbzIOaLfZe', '0', '0', '127.0.0.1', '2026-01-27 01:20:14', '2026-01-26 06:53:45', 'admin', '2026-01-24 19:00:40', '', '2026-01-26 06:53:45', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 4);
INSERT INTO `sys_user_post` VALUES (5, 3);
INSERT INTO `sys_user_post` VALUES (6, 4);
INSERT INTO `sys_user_post` VALUES (7, 4);
INSERT INTO `sys_user_post` VALUES (1001, 3);
INSERT INTO `sys_user_post` VALUES (1004, 4);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (5, 4);
INSERT INTO `sys_user_role` VALUES (6, 2);
INSERT INTO `sys_user_role` VALUES (7, 2);
INSERT INTO `sys_user_role` VALUES (1001, 4);
INSERT INTO `sys_user_role` VALUES (1001, 100);
INSERT INTO `sys_user_role` VALUES (1002, 102);
INSERT INTO `sys_user_role` VALUES (1003, 101);
INSERT INTO `sys_user_role` VALUES (1004, 2);

SET FOREIGN_KEY_CHECKS = 1;
