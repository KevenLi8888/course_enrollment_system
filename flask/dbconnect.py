import pymysql

#return: 连接，游标
def get_conn():

    # 创建连接
    conn = pymysql.connect(host="127.0.0.1",
                           user="root",
                           password="",
                           db="course_enrollment_system",
                           charset="utf8mb4")
    # 创建游标
    cursor = conn.cursor()# 执行完毕返回的结果集默认以元组显示
    return conn, cursor


def close_conn(conn, cursor):
    cursor.close()
    conn.close()

def query(sql,*args):
    """
    封装通用查询
    :param sql:
    :param args:
    :return: 返回查询到的结果，((),(),)的形式
    """
    conn, cursor = get_conn()
    cursor.execute(sql,args)
    res = cursor.fetchall()
    close_conn(conn, cursor)
    return res

# TODO:以下是简单的查询模版，供参考

def get_top10():
    sql = "SELECT t.* FROM covid.totalpermillion t " \
          "ORDER BY total_per_million DESC"
    res = query(sql)
    return res

def get_gender():
    sql = "SELECT t.* FROM covid.sex t"
    res = query(sql)
    return res

def get_trend(column_name):
    sql = "SELECT date,%s FROM covid.datedata t" %(column_name)
    res = query(sql)
    return res

def get_continent():
    sql = "SELECT t.* FROM covid.continent t"
    res = query(sql)
    return res

def get_total():
    sql = "SELECT date, total_cases, total_deaths, total_recovery FROM covid.datedata t"
    res = query(sql)
    return res

def get_age():
    sql = "SELECT t.* FROM covid.age t " \
          "ORDER BY id_num DESC"
    res = query(sql)
    return res

def get_numbers():
    sql = "SELECT * FROM datedata " \
          "ORDER BY date DESC limit 1"
    res = query(sql)
    return res