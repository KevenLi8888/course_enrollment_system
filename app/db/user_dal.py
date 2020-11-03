from .. import user_model
from ..db import user_dal
from ..db import dal


class User_Dal:
    persist = None

    # 通过用户名及密码查询用户对象
    @classmethod
    def login_auth(cls, id, password):
        print('login_auth')
        result = {'isAuth': False}
        model = user_model.User_mod()  # 实例化一个对象，将查询结果逐一添加给对象的属性
        sql = "select usr_id,usr_type  from user_login_info where usr_id='%s' and usr_pwd='%s';" % (
            id, password)
        rows = user_dal.User_Dal.query(sql)
        print('查询结果>>>', rows)
        if rows:
            result['isAuth'] = True
            model.id = rows[0]
            model.type = rows[1]
        return result, model

    # flask_login回调函数执行的，需要通过用户唯一的id找到用户对象
    @classmethod
    def load_user_byid(cls, id):
        print('load_user_byid')
        sql = "select usr_id,usr_type  from user_login_info where usr_id='%s';" % id
        model = user_model.User_mod()  # 实例化一个对象，将查询结果逐一添加给对象的属性
        rows = user_dal.User_Dal.query(sql)
        if rows:
            # result = {'isAuth': True}
            model.id = rows[0]
            model.type = rows[1]
        return model

    # 具体执行sql语句的函数
    @classmethod
    def query(cls, sql, params=None):
        result = dal.SQLHelper.fetch_one(sql, params)
        return result
