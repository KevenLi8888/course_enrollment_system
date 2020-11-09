# 创建一个类，用来通过sql语句查询结果实例化对象用
class User_mod():
    def __init__(self):
        self.id = None
        self.type = None
        self.name=None

    def todict(self):
        return self.__dict__

    # 下面这4个方法是flask_login需要的4个验证方式
    def is_authenticated(self):
        return True

    def is_active(self):
        return True

    def is_anonymous(self):
        return False

    def get_id(self):
        return self.id

    # def __repr__(self):
    #     return '<User %r>' % self.username
