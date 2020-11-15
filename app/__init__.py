from flask import Flask
from flask_bootstrap import Bootstrap
from flask_moment import Moment
from flask_login import LoginManager
from config import config

bootstrap = Bootstrap()
moment = Moment()

login_manager = LoginManager()
# 登陆认证的处理视图
login_manager.login_view = 'auth.login'
# 登陆提示信息
login_manager.login_message = '你还未登录哦！'
login_manager.login_message_category = 'alert-warning'


def create_app(config_name):
    app = Flask(__name__)
    app.config.from_object(config[config_name])
    config[config_name].init_app(app)
    bootstrap.init_app(app)
    moment.init_app(app)
    login_manager.init_app(app)

    from .main import main as main_blueprint
    app.register_blueprint(main_blueprint)
    from .auth import auth as auth_blueprint
    app.register_blueprint(auth_blueprint, url_prefix='/auth')

    return app
