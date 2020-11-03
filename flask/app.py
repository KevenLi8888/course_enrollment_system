from flask import Flask, render_template, redirect, url_for, request, flash
from flask_login import LoginManager, login_user, login_required, current_user,logout_user
from flask_bootstrap import Bootstrap
from flask_moment import Moment
from flask_wtf import FlaskForm
from wtforms import *
from wtforms.validators import *
from db import user_dal

app = Flask(__name__)

# 项目中设置flask_login
login_manager = LoginManager()
login_manager.init_app(app)
app.config['SECRET_KEY'] = '234rsdf34523rwsf'

bootstrap = Bootstrap(app)
moment = Moment(app)
schoolLists = [
    ('信息与通信工程学院', '信息与通信工程学院'),
    ('电子科学与工程学院（示范性微电子学院）', '电子科学与工程学院（示范性微电子学院）'),
    ('材料与能源学院', '材料与能源学院'),
    ('机械与电气工程学院', '机械与电气工程学院'),
    ('光电科学与工程学院', '光电科学与工程学院'),
    ('自动化工程学院', '自动化工程学院'),
    ('资源与环境学院', '资源与环境学院'),
    ('计算机科学与工程学院（网络空间安全学院）', '计算机科学与工程学院（网络空间安全学院）'),
    ('信息与软件工程学院（示范性软件学院）', '信息与软件工程学院（示范性软件学院）'),
    ('航空航天学院', '航空航天学院'),
    ('数学科学学院', '数学科学学院'),
    ('物理学院', '物理学院'),
    ('医学院', '医学院'),
    ('生命科学与技术学院', '生命科学与技术学院'),
    ('经济与管理学院', '经济与管理学院'),
    ('公共管理学院', '公共管理学院'),
    ('外国语学院', '外国语学院'),
    ('马克思主义学院', '马克思主义学院'),
    ('格拉斯哥学院', '格拉斯哥学院'),
    ('体育部', '体育部')
]
courseLists = [{'id': 1, 'name': 'math', 'credit': 1, 'teacher': 'liJin', 'current': 5, 'max': 40, 'time': 'Tuesday',
                'place': 'A110'},
               {'id': 2, 'name': 'math', 'credit': 1, 'teacher': 'liJin', 'current': 5, 'max': 40, 'time': 'Tuesday',
                'place': 'A110'},
               {'id': 3, 'name': 'math', 'credit': 1, 'teacher': 'liJin', 'current': 5, 'max': 40, 'time': 'Tuesday',
                'place': 'A110'},
               {'id': 4, 'name': 'math', 'credit': 1, 'teacher': 'liJin', 'current': 5, 'max': 40, 'time': 'Tuesday',
                'place': 'A110'},
               {'id': 5, 'name': 'math', 'credit': 1, 'teacher': 'liJin', 'current': 5, 'max': 40, 'time': 'Tuesday',
                'place': 'A110'}]
studentLists = [{'id': 2018022, 'name': 'keven', 'school': 'cs', 'grade': 2018, 'email': '@email'},
                {'id': 2018023, 'name': 'keven', 'school': 'cs', 'grade': 2018, 'email': '@email'},
                {'id': 2018024, 'name': 'keven', 'school': 'cs', 'grade': 2018, 'email': '@email'},
                {'id': 2018025, 'name': 'keven', 'school': 'cs', 'grade': 2018, 'email': '@email'}]
teacherLists = [{'id': 2018022, 'name': 'keven', 'school': 'cs', 'title': 'teach', 'email': '@email'},
                {'id': 2018023, 'name': 'keven', 'school': 'cs', 'title': 'teach', 'email': '@email'},
                {'id': 2018024, 'name': 'keven', 'school': 'cs', 'title': 'teach', 'email': '@email'},
                {'id': 2018025, 'name': 'keven', 'school': 'cs', 'title': 'teach', 'email': '@email'}]
courseTable = [
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
    id = StringField('帐号', validators=[DataRequired()])
    password = PasswordField('密码', validators=[DataRequired()])
    remember_me = BooleanField('Keep me logged in')
    submit = SubmitField('登录')


# 课程表单
class CourseForm(FlaskForm):
    # TODO:进一步的验证函数
    id = StringField('课程序号', validators=[DataRequired()])
    name = StringField('课程名称', validators=[DataRequired()])
    credit = StringField('学分', validators=[DataRequired()])
    teacher = StringField('老师', validators=[DataRequired()])
    capacity = IntegerField('容量', validators=[DataRequired()])
    time = StringField('上课时间', validators=[DataRequired()])
    place = StringField('上课地点', validators=[DataRequired()])
    # grade = StringField('上课年级', validators=[DataRequired()])
    grade = SelectMultipleField('上课年级', coerce=int,
                                choices=[(2016, '2016级'), (2017, '2017级'), (2018, '2018级'), (2019, '2019级'),
                                         (2020, '2020级')], validators=[DataRequired()])
    school = SelectMultipleField('上课学院', coerce=int,
                                 choices=schoolLists, validators=[DataRequired()])
    submit = SubmitField('确定')

    # 教师表单


class TeacherForm(FlaskForm):
    # TODO:进一步的验证函数
    id = StringField('工号', validators=[DataRequired()])
    name = StringField('姓名', validators=[DataRequired()])
    password = PasswordField('密码', validators=[
        DataRequired(), EqualTo('password2', message='Passwords must match.')])
    password2 = PasswordField('确认密码', validators=[DataRequired()])
    school = StringField('学院', validators=[DataRequired()])
    title = StringField('职称', validators=[DataRequired()])
    email = StringField('邮箱', validators=[DataRequired(), Length(1, 64),
                                          Email()])
    submit = SubmitField('添加')


# 学生表单
class StudentForm(FlaskForm):
    # TODO:进一步的验证函数
    id = StringField('学号', validators=[DataRequired()])
    name = StringField('姓名', validators=[DataRequired()])
    password = PasswordField('密码', validators=[
        DataRequired(), EqualTo('password2', message='Passwords must match.')])
    password2 = PasswordField('确认密码', validators=[DataRequired()])
    school = StringField('学院', validators=[DataRequired()])
    grade = StringField('年级', validators=[DataRequired()])
    email = StringField('邮箱', validators=[DataRequired(), Length(1, 64),
                                          Email()])
    submit = SubmitField('确定')


# 密码表单
class PasswordForm(FlaskForm):
    # TODO:进一步的验证函数
    password = PasswordField('新的密码', validators=[
        DataRequired(), EqualTo('password2', message='Passwords must match.')])
    password2 = PasswordField('确认密码', validators=[DataRequired()])
    submit = SubmitField('修改')


# 搜索表单
class SearchForm(FlaskForm):
    # TODO:进一步的验证函数
    search = StringField('搜索', validators=[DataRequired()])
    submit = SubmitField('查找')


@app.errorhandler(404)
def page_not_found(e):
    return render_template('404.html'), 404


@app.errorhandler(500)
def internal_server_error(e):
    return render_template('500.html'), 500

@app.errorhandler(401)
def internal_server_error(e):
    flash('Please login')
    return redirect(url_for('login'))

# 主页
@app.route('/', methods=['GET', 'POST'])
def index():
    return render_template('home.html')


# 登录
@app.route('/login', methods=['GET', 'POST'])
def login():
    form = LoginForm()
    if form.validate_on_submit():
        id = form.id.data
        password = form.password.data
        result = user_dal.User_Dal.login_auth(id, password)
        model = result[1]
        if result[0]['isAuth']:
            login_user(model,form.remember_me.data)
            print('登陆成功')
            print(current_user.id)  # 登录成功之后可以用current_user来取该用户的其他属性，这些属性都是sql语句查来并赋值给对象的。
            return redirect(url_for('index'))
        else:
            print('登陆失败')
            flash('Invalid id or password.')
    return render_template('login.html', form=form)


@login_manager.user_loader
def load_user(id):
    return user_dal.User_Dal.load_user_byid(id)
'''
load_user是一个flask_login的回调函数，在登陆之后，每访问一个带Login_required装饰的视图函数就要执行一次，
该函数返回一个用户对象，通过id来用sql语句查到的用户数据，然后实例化一个对象，并返回。
'''


# 登出
@app.route('/logout')
@login_required
def logout():
    # TODO：退出用户
    logout_user()
    flash('You have been logged out.')
    return redirect(url_for('index'))


# 选课
@app.route('/select', methods=['GET', 'POST'])
@login_required
def select():
    if len(request.args):
        # TODO:数据库添加课程
        print(request.args['courseId'])

        flash('xxx课程选课成功')
        return redirect(url_for('select'))
    return render_template('select.html', courseLists=courseLists, courseTable=courseTable)


# 退课
@app.route('/quit', methods=['GET', 'POST'])
def quit():
    if len(request.args):
        # TODO:数据库删除课程
        print(request.args['courseId'])
        flash('xxx课程退课成功')
        return redirect(url_for('quit'))
    return render_template('quit.html', courseLists=courseLists, courseTable=courseTable)


# 老师课程
@app.route('/teach', methods=['GET', 'POST'])
def teach():
    return render_template('teach.html', courseLists=courseLists, courseTable=courseTable)


# 学生花名册
@app.route('/student', methods=['GET', 'POST'])
def student():
    if len(request.args):
        print(request.args['courseId'])
        return redirect(url_for('student'))
    return render_template('student.html', studentLists=studentLists)


# 课程信息
@app.route('/courseInfo', methods=['GET', 'POST'])
def courseInfo():
    form = SearchForm()
    if len(request.args):
        # TODO:数据库删除课程
        print(request.args['courseId'])
        flash('xxx课程删除成功')
        return redirect(url_for('courseInfo'))
    return render_template('courseInfo.html', courseLists=courseLists, form=form)


# 添加课程
@app.route('/courseAdd', methods=['GET', 'POST'])
def courseAdd():
    form = CourseForm()
    if form.validate_on_submit():
        print(form.grade.data)  # 返回一个列表
        # TODO:提交数据库
        # user = User(email=form.email.data.lower(),
        #             username=form.username.data,
        #             password=form.password.data)
        # db.session.add(user)
        # db.session.commit()
        flash('添加成功')
        return redirect(url_for('courseInfo'))
    return render_template('courseAdd.html', form=form)


# 编辑课程
@app.route('/courseEdit', methods=['GET', 'POST'])
def courseEdit():
    form = CourseForm()
    if len(request.args):
        # TODO:数据库删除课程
        print(request.args['courseId'])
    if form.validate_on_submit():
        # TODO:提交数据库
        # user = User(email=form.email.data.lower(),
        #             username=form.username.data,
        #             password=form.password.data)
        # db.session.add(user)
        # db.session.commit()
        flash('修改成功')
        return redirect(url_for('courseInfo'))
    return render_template('courseEdit.html', form=form)


# 教师信息
@app.route('/teacherInfo', methods=['GET', 'POST'])
def teacherInfo():
    form = SearchForm()
    if len(request.args):
        # TODO:数据库删除课程
        print(request.args['teacherId'])
        flash('xx老师删除成功')
        return redirect(url_for('teacherInfo'))
    return render_template('teacherInfo.html', teacherLists=teacherLists, form=form)


# 添加老师
@app.route('/teacherAdd', methods=['GET', 'POST'])
def teacherAdd():
    form = TeacherForm()
    if form.validate_on_submit():
        # TODO:提交数据库
        # user = User(email=form.email.data.lower(),
        #             username=form.username.data,
        #             password=form.password.data)
        # db.session.add(user)
        # db.session.commit()
        flash('添加成功')
        return redirect(url_for('teacherInfo'))
    return render_template('teacherAdd.html', form=form)


# 编辑教师
@app.route('/teacherEdit', methods=['GET', 'POST'])
def teacherEdit():
    form = TeacherForm()
    if len(request.args):
        # TODO:数据库删除课程
        print(request.args['teacherId'])
    if form.validate_on_submit():
        # TODO:提交数据库
        # user = User(email=form.email.data.lower(),
        #             username=form.username.data,
        #             password=form.password.data)
        # db.session.add(user)
        # db.session.commit()
        flash('修改成功')
        return redirect(url_for('teacherInfo'))
    return render_template('teacherEdit.html', form=form)


# 学生信息
@app.route('/studentInfo', methods=['GET', 'POST'])
def studentInfo():
    form = SearchForm()
    if len(request.args):
        # TODO:数据库删除课程
        print(request.args['studentId'])
        flash('xx学生删除成功')
        return redirect(url_for('studentInfo'))
    return render_template('studentInfo.html', studentLists=studentLists, form=form)


# 添加学生
@app.route('/studentAdd', methods=['GET', 'POST'])
def studentAdd():
    form = StudentForm()
    if form.validate_on_submit():
        # TODO:提交数据库
        # user = User(email=form.email.data.lower(),
        #             username=form.username.data,
        #             password=form.password.data)
        # db.session.add(user)
        # db.session.commit()
        flash('添加成功')
        return redirect(url_for('studentInfo'))
    return render_template('studentAdd.html', form=form)


# 编辑学生
@app.route('/studentEdit', methods=['GET', 'POST'])
def studentEdit():
    form = StudentForm()
    if len(request.args):
        # TODO:数据库删除课程
        print(request.args['studentId'])
    if form.validate_on_submit():
        # TODO:提交数据库
        # user = User(email=form.email.data.lower(),
        #             username=form.username.data,
        #             password=form.password.data)
        # db.session.add(user)
        # db.session.commit()
        flash('修改成功')
        return redirect(url_for('studentInfo'))
    return render_template('studentEdit.html', form=form)

# 修改密码
# @app.route('/passwordEdit', methods=['GET', 'POST'])
# def passwordEdit():
#     form = PasswordForm()
#     if 'studentId' in request.args:
#         session['type'] = 'student'
#         session['id'] = request.args['studentId']
#     elif 'teacherId' in request.args:
#         session['type'] = 'teacher'
#         session['id'] = request.args['teacherId']
#         return redirect(url_for('passwordEdit'))
#     if form.validate_on_submit():
#         # TODO:提交数据库
#         flash('修改成功')
#         if session['type'] == 'student':
#             print('std')
#             print(form.password.data)
#             return redirect(url_for('studentInfo'))
#         elif session['type'] == 'teacher':
#             print('tec')
#             print(form.password.data)
#             return redirect(url_for('teacherInfo'))
#     return render_template('passwordEdit.html', form=form)
