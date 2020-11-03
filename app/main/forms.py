from flask_wtf import FlaskForm
from wtforms import *
from wtforms.validators import *

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
    school = SelectMultipleField('上课学院',
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
