/*
 * 新建 drone 数据库
 */
DROP DATABASE if exists drone;
CREATE DATABASE drone
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;

/*
 * 添加授权用户
 */

CREATE USER '$mysql_drone_user'@'%' IDENTIFIED BY '$mysql_drone_pass';
GRANT ALL PRIVILEGES ON drone.* TO '$mysql_drone_user'@'%';

/*
 * 添加主从复制授权用户
 */
CREATE USER 'repl_user'@'%' IDENTIFIED BY 'repl_Passw0rd';

GRANT REPLICATION SLAVE ON *.* TO 'repl_user'@'%';

/*
 * 显示授权用户
 */
SELECT DISTINCT CONCAT(
  'User: ''', user, '''@''', host, ''';')
  AS query FROM mysql.user;
