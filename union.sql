/**
 * table: m
 *   m.a; m.b
 *
 * table: n
 *   n.a; n.c
 */


-- 内结合
select * from m, n where m.a = n.a;
select * from m inner join n on m.a = n.a;
select * from m inner join n using (a); -- 只能在具备相同字段名时使用

-- 外结合
select * from m left outer join n on m.a = n.a; -- 以表 m 为主
select * from m right outer join n on m.a = n.a; -- 以表 n 为主

/**
 * 合并查询
 * 
 * 限制： 
 * 1. 字段数量相同
 * 2. order by结尾的查询应该用()
 * 3. 查询结果字段以第一个查询语句为准
 */
select * from m where b > 100 union select * from m where b < 500;
select * from m where b > 100 union select * from n where c > 200;