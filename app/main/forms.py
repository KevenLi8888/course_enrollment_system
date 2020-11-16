from flask_wtf import FlaskForm
from wtforms import *
from wtforms.validators import *
from flask_login import login_required, current_user

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
gradeLists = [(2016, '2016级'), (2017, '2017级'), (2018, '2018级'), (2019, '2019级'),
              (2020, '2020级')]

titleLists = [('教授', '教授'), ('副教授', '副教授'), ('讲师', '讲师'), ('研究员', '研究员'), ('副研究员', '副研究员'), ('高级实验师', '高级实验师')]

roomLists = ['A101', 'A102', 'A103', 'A104', 'A105', 'A106', 'A107', 'A108', 'A109', 'A110',
             'A201', 'A202', 'A203', 'A204', 'A205', 'A206', 'A207', 'A208', 'A209', 'A210',
             'A301', 'A302', 'A303', 'A304', 'A305', 'A306', 'A307', 'A308', 'A309', 'A310']
timeLists = [
    (0, '星期一 1-2'), (1, '星期一 3-4'), (2, '星期一 5-6'), (3, '星期一 7-8'), (4, '星期一 9-10'), (5, '星期一 11-12'),
    (6, '星期二 1-2'), (7, '星期二 3-4'), (8, '星期二 5-6'), (9, '星期二 7-8'), (10, '星期二 9-10'), (11, '星期二 11-12'),
    (12, '星期三 1-2'), (13, '星期三 3-4'), (14, '星期三 5-6'), (15, '星期三 7-8'), (16, '星期三 9-10'), (17, '星期三 11-12'),
    (18, '星期四 1-2'), (19, '星期四 3-4'), (20, '星期四 5-6'), (21, '星期四 7-8'), (22, '星期四 9-10'), (23, '星期四 11-12'),
    (24, '星期五 1-2'), (25, '星期五 3-4'), (26, '星期五 5-6'), (27, '星期五 7-8'), (28, '星期五 9-10'), (29, '星期五 11-12'),
    (30, '星期六 1-2'), (31, '星期六 3-4'), (32, '星期六 5-6'), (33, '星期六 7-8'), (34, '星期六 9-10'), (35, '星期六 11-12'),
    (36, '星期日 1-2'), (37, '星期日 3-4'), (38, '星期日 5-6'), (39, '星期日 7-8'), (40, '星期日 9-10'), (41, '星期日 11-12'),
]


# 课程表单
class CourseForm(FlaskForm):
    # TODO:进一步的验证函数
    id = StringField('课程序号', validators=[DataRequired(), Length(1, 10, message="课程序号最长10个字段")])
    name = StringField('课程名称', validators=[DataRequired(), Length(1, 10, message="课程名称最长10个字段")])
    credit = IntegerField('学分', validators=[DataRequired(), number_range(1, 10, '请输入正确的学分数，范围为1~10')])
    teacher = SelectMultipleField('上课教师',
                                  choices=[], validators=[DataRequired()],
                                  render_kw={'data-live-search': "true", 'data-max-options': '4', 'data-size': '5'})
    capacity = IntegerField('课程容量', validators=[DataRequired(), number_range(1, 120, '请输入正确的容量数，范围为1~120')])
    time = SelectMultipleField('上课时间', coerce=int,
                               choices=timeLists, validators=[DataRequired()],
                               render_kw={'data-live-search': "true", 'data-max-options': '3', 'data-size': '5'})
    start = IntegerField('开始周数', validators=[DataRequired(), number_range(1, 20, '请输入正确的周数，范围为1~20')])
    end = IntegerField('结束周数', validators=[DataRequired(), number_range(1, 20, '请输入正确的周数，范围为1~20')])
    room = SelectField('上课地点',
                       choices=roomLists, validators=[DataRequired()],
                       render_kw={'data-live-search': "true", 'data-size': '5'})
    grade = SelectMultipleField('上课年级', coerce=int,
                                choices=gradeLists, validators=[DataRequired()],
                                render_kw={'data-live-search': "true", 'data-actions-box': 'true', 'data-size': '5'})
    school = SelectMultipleField('上课学院',
                                 choices=schoolLists, validators=[DataRequired()],
                                 render_kw={'data-live-search': "true", 'data-actions-box': 'true', 'data-size': '5'})
    submit = SubmitField('确定', render_kw={'onclick': " return confirm('你确定添加课程吗？');"})

    # 课程修改


class CourseEditForm(CourseForm):
    id = StringField('课程序号')
    submit = SubmitField('确定', render_kw={'onclick': " return confirm('你确定修改课程信息吗？');"})


# 教师表单
class TeacherForm(FlaskForm):
    id = StringField('工号', validators=[
        DataRequired(), Length(1, 10, message="工号最长10个字段"),
        Regexp('^[0-9]*$', 0,
               '工号只能由数字构成')])
    name = StringField('姓名', validators=[DataRequired(), Length(1, 10, message="姓名最长10个字段")])
    school = SelectField('学院',
                         choices=schoolLists, validators=[DataRequired()],
                         render_kw={'data-live-search': "true"})
    title = SelectField('职称',
                        choices=titleLists, validators=[DataRequired()],
                        render_kw={'data-live-search': "true"})
    email = StringField('邮箱', validators=[DataRequired(), Length(1, 64),
                                          Email()])
    submit = SubmitField('确定', render_kw={'onclick': " return confirm('你确定添加教师吗？');"})


# 教师修改表单
class TeacherEditForm(TeacherForm):
    id = StringField('工号')
    name = StringField('姓名')
    submit = SubmitField('确定', render_kw={'onclick': " return confirm('你确定修改教师信息吗？');"})


# 老师个人信息表单
class TeacherInfoForm(FlaskForm):
    avatar = FileField('头像')
    id = StringField('工号')
    name = StringField('姓名')
    school = StringField('学院')
    title = StringField('职称')
    email = StringField('邮箱', validators=[DataRequired(), Length(1, 64),
                                          Email()])
    submit = SubmitField('确定', render_kw={'onclick': " return confirm('你确定修改吗？');"})


# 学生表单
class StudentForm(FlaskForm):
    # TODO:进一步的验证函数
    id = StringField('学号', validators=[
        DataRequired(), Length(1, 10, message="学号最长10个字段"),
        Regexp('^[0-9]*$', 0,
               '学号只能由数字构成')])
    name = StringField('姓名', validators=[DataRequired(), Length(1, 10, message="姓名最长10个字段")])
    school = SelectField('学院',
                         choices=schoolLists, validators=[DataRequired()],
                         render_kw={'data-live-search': "true"})
    grade = SelectField('年级',
                        choices=gradeLists, validators=[DataRequired()],
                        render_kw={'data-live-search': "true"})
    email = StringField('邮箱', validators=[DataRequired(), Length(1, 64),
                                          Email()])
    submit = SubmitField('确定', render_kw={'onclick': " return confirm('你确定添加学生吗？');"})


# 学生修改表单
class StudentEditForm(StudentForm):
    id = StringField('学号')
    name = StringField('姓名')
    submit = SubmitField('确定', render_kw={'onclick': " return confirm('你确定修改学生信息吗？');"})


# 学生个人信息表单
class StudentInfoForm(FlaskForm):
    avatar = FileField('头像')
    id = StringField('学号')
    name = StringField('姓名')
    school = StringField('学院')
    grade = StringField('年级')
    email = StringField('邮箱', validators=[DataRequired(), Length(1, 64),
                                          Email()])
    submit = SubmitField('确定', render_kw={'onclick': " return confirm('你确定修改吗？');"})


# 密码表单
class PasswordForm(FlaskForm):
    # TODO:进一步的验证函数
    old = PasswordField('旧的密码', validators=[DataRequired()])
    password = PasswordField('新的密码', validators=[
        DataRequired(), EqualTo('password2', message='Passwords must match.')])
    password2 = PasswordField('确认密码', validators=[DataRequired()])
    submit = SubmitField('修改', render_kw={'onclick': " return confirm('你确定修改吗？');"})


# 管理员修改密码表单
class AdminPasswordForm(FlaskForm):
    # TODO:进一步的验证函数
    id = HiddenField('ID', validators=[DataRequired()])
    admin = PasswordField('管理员密码', validators=[DataRequired()])
    password = PasswordField('新的密码', validators=[
        DataRequired(), EqualTo('password2', message='两次密码不一致，请重新输入')])
    password2 = PasswordField('确认密码', validators=[DataRequired()])
    submit = SubmitField('修改', render_kw={'onclick': " return confirm('你确定修改吗？');"})


# 管理员个人信息表单
class AdminInfoForm(FlaskForm):
    avatar = FileField('头像')
    id = StringField('ID')
    name = StringField('姓名')
    school = StringField('学院')
    email = StringField('邮箱', validators=[DataRequired(), Length(1, 64),
                                          Email()])
    submit = SubmitField('确定', render_kw={'onclick': " return confirm('你确定修改吗？');"})
