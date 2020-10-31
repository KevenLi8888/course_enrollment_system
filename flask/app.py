from flask import Flask, render_template, session, redirect, url_for, request, flash
from flask_bootstrap import Bootstrap
from flask_moment import Moment
from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField, PasswordField, BooleanField, IntegerField, DateField
from wtforms.validators import DataRequired, Length, Email, Regexp, EqualTo

app = Flask(__name__)
app.config['SECRET_KEY'] = 'hard to guess string'

bootstrap = Bootstrap(app)
moment = Moment(app)
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


# 选课
@app.route('/select', methods=['GET', 'POST'])
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
