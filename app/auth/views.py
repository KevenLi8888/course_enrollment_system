from flask import render_template, redirect, flash, url_for
from flask_login import login_user, login_required, current_user, logout_user
from . import auth
from .forms import *
from .. import login_manager
from ..db import user_dal


@auth.route('/login', methods=['GET', 'POST'])
def login():
    form = LoginForm()
    if form.validate_on_submit():
        id = form.id.data
        password = form.password.data
        result = user_dal.User_Dal.login_auth(id, password)
        model = result[1]
        if result[0]['isAuth']:
            login_user(model, form.remember_me.data)
            print('登陆成功')
            print(current_user.id)  # 登录成功之后可以用current_user来取该用户的其他属性，这些属性都是sql语句查来并赋值给对象的。
            return redirect(url_for('main.index'))
        else:
            print('登陆失败')
            flash('Invalid id or password.')
    return render_template('login.html', form=form)


@login_manager.user_loader
def load_user(id):
    """
    load_user是一个flask_login的回调函数，在登陆之后，每访问一个带Login_required装饰的视图函数就要执行一次，
    该函数返回一个用户对象，通过id来用sql语句查到的用户数据，然后实例化一个对象，并返回。
    """
    return user_dal.User_Dal.load_user_byid(id)


# 登出
@auth.route('/logout')
@login_required
def logout():
    # TODO：退出用户
    logout_user()
    flash('You have been logged out.')
    return redirect(url_for('auth.login'))
