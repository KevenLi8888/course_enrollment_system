from flask import Flask, render_template, session, redirect, url_for, request, flash
from flask_bootstrap import Bootstrap
from flask_moment import Moment
from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField, PasswordField, BooleanField
from wtforms.validators import DataRequired, Length, Email, Regexp, EqualTo

app = Flask(__name__)
app.config['SECRET_KEY'] = 'hard to guess string'

bootstrap = Bootstrap(app)
moment = Moment(app)
lists = [{'id': '1', 'name': 'math', 'teacher': 'you', 'time': 'Tuesday'}, {
    'id': '2', 'name': 'math', 'teacher': 'you', 'time': 'Tuesday'},
         {'id': '3', 'name': 'math', 'teacher': 'you', 'time': 'Tuesday'}, {
             'id': '4', 'name': 'math', 'teacher': 'you', 'time': 'Tuesday'}, {
             'id': '5', 'name': 'math', 'teacher': 'you', 'time': 'Tuesday'}
         ]
courses = [
    ['微积分', '', '', '', '', '', ''],
    ['微积分', '', '', '', '', '', ''],
    ['', '', '', '', '', '', ''],
    ['', '', '', '', '', '', ''],
    ['', '', '', '', '', '', ''],
    ['', '', '', '', '', '', ''],
    ['', '', '', '', '', '', ''],
    ['', '', '', '', '', '', ''],
    ['', '', '', '', '', '', ''],
    ['', '', '', '', '', '', ''],
    ['', '', '', '', '', '', ''],
    ['', '', '', '', '', '', '']
]


# 登录表单
class LoginForm(FlaskForm):
    email = StringField('Email', validators=[DataRequired(), Length(1, 64),
                                             Email()])
    password = PasswordField('Password', validators=[DataRequired()])
    remember_me = BooleanField('Keep me logged in')
    submit = SubmitField('Log In')


# 注册表单
class RegistrationForm(FlaskForm):
    email = StringField('Email', validators=[DataRequired(), Length(1, 64),
                                             Email()])
    username = StringField('Username', validators=[
        DataRequired(), Length(1, 64),
        Regexp('^[A-Za-z][A-Za-z0-9_.]*$', 0,
               'Usernames must have only letters, numbers, dots or '
               'underscores')])
    password = PasswordField('Password', validators=[
        DataRequired(), EqualTo('password2', message='Passwords must match.')])
    password2 = PasswordField('Confirm password', validators=[DataRequired()])
    submit = SubmitField('Register')


# 课表表单
class CourseForm(FlaskForm):
    email = StringField('Email', validators=[DataRequired(), Length(1, 64),
                                             Email()])
    username = StringField('Username', validators=[
        DataRequired(), Length(1, 64),
        Regexp('^[A-Za-z][A-Za-z0-9_.]*$', 0,
               'Usernames must have only letters, numbers, dots or '
               'underscores')])
    password = PasswordField('Password', validators=[
        DataRequired(), EqualTo('password2', message='Passwords must match.')])
    password2 = PasswordField('Confirm password', validators=[DataRequired()])
    submit = SubmitField('Register')


@app.errorhandler(404)
def page_not_found(e):
    return render_template('404.html'), 404


@app.errorhandler(500)
def internal_server_error(e):
    return render_template('500.html'), 500


# 主页
@app.route('/', methods=['GET', 'POST'])
def index():
    return render_template('home.html')


# 登录
@app.route('/login', methods=['GET', 'POST'])
def login():
    form = LoginForm()
    if form.validate_on_submit():
        # TODO:数据库查询
        # 如果帐号存在而且密码正确：登录帐号login_user，页面重定向

        if 1:
            return redirect(url_for('index'))
        # user = User.query.filter_by(email=form.email.data.lower()).first()
        # if user is not None and user.verify_password(form.password.data):
        #     login_user(user, form.remember_me.data)
        #     next = request.args.get('next')
        #     if next is None or not next.startswith('/'):
        #         next = url_for('main.index')
        #     return redirect(next)

        # 显示帐号或密码错误
        flash('Invalid email or password.')
    return render_template('login.html', form=form)


# 登出
@app.route('/logout')
# @login_required
def logout():
    # TODO：退出用户
    # logout_user()
    flash('You have been logged out.')
    return redirect(url_for('index'))


# 注册
@app.route('/register', methods=['GET', 'POST'])
def register():
    form = RegistrationForm()
    if form.validate_on_submit():
        # TODO:提交数据库
        # user = User(email=form.email.data.lower(),
        #             username=form.username.data,
        #             password=form.password.data)
        # db.session.add(user)
        # db.session.commit()
        flash('You can now login.')
        return redirect(url_for('login'))
    return render_template('register.html', form=form)


# 选课
@app.route('/select', methods=['GET', 'POST'])
def select():
    if len(request.args):
        # TODO:数据库添加课程
        print(request.args['courseid'])
        return redirect(url_for('select'))
    return render_template('select.html', lists=lists, courses=courses)


# 退课
@app.route('/quit', methods=['GET', 'POST'])
def quit():
    if len(request.args):
        # TODO:数据库删除课程
        print(request.args['courseid'])
        return redirect(url_for('quit'))
    return render_template('quit.html', lists=lists, courses=courses)


# 老师课程
@app.route('/teachcourese', methods=['GET', 'POST'])
def teachcourse():
    return render_template('teach_course.html', lists=lists, courses=courses)


# 课程信息
@app.route('/courseinfo', methods=['GET', 'POST'])
def courseinfo():
    return render_template('course_info.html', lists=lists)


# 学生花名册
@app.route('/coursestd', methods=['GET', 'POST'])
def coursestd():
    if len(request.args):
        print(request.args['courseid'])
        return redirect(url_for('coursestd'))
    return render_template('teach_std.html', lists=lists)


# 添加课程
@app.route('/addcourse', methods=['GET', 'POST'])
def addcourse():
    form = CourseForm()
    if form.validate_on_submit():
        # TODO:提交数据库
        # user = User(email=form.email.data.lower(),
        #             username=form.username.data,
        #             password=form.password.data)
        # db.session.add(user)
        # db.session.commit()
        flash('添加成功')
        return redirect(url_for('courseinfo'))
    return render_template('add_course.html', form=form)
