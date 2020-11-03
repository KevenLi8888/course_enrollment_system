from flask_wtf import FlaskForm
from wtforms import *
from wtforms.validators import *


# 登录表单
class LoginForm(FlaskForm):
    id = StringField('帐号', validators=[DataRequired()])
    password = PasswordField('密码', validators=[DataRequired()])
    remember_me = BooleanField('Keep me logged in')
    submit = SubmitField('登录')
