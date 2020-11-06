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
gradeLists = [(2016, '2016级'), (2017, '2017级'), (2018, '2018级'), (2019, '2019级'),
              (2020, '2020级')]

titleLists = [('教授', '教授'), ('副教授', '副教授'), ('讲师', '讲师'), ('研究员', '研究员'), ('副研究员', '副研究员'), ('高级实验师', '高级实验师')]

roomLists = ['A101', 'A102', 'A103', 'A104', 'A105', 'A106', 'A107', 'A108', 'A109', 'A110',
             'A201', 'A202', 'A203', 'A204', 'A205', 'A206', 'A207', 'A208', 'A209', 'A210',
             'A301', 'A302', 'A303', 'A304', 'A305', 'A306', 'A307', 'A308', 'A309', 'A310']
timeLists = [(0, '周一第1节'), (1, '周二第1节'), (2, '周三第1节'), 3, 4, 5, 6, 7,
             8, 9, 10, 11, 12, 13, 14,
             15, 16, 17, 18, 19, 20, 21,
             22, 23, 24, 25, 26, 27, 28,
             29, 30, 31, 32, 33, 34, 35,
             36]


# 课程表单


class CourseForm(FlaskForm):
    # TODO:进一步的验证函数
    id = StringField('课程序号', validators=[DataRequired()])
    name = StringField('课程名称', validators=[DataRequired()])
    credit = IntegerField('学分', validators=[DataRequired(), number_range(1, 10, '请输入正确的学分数，范围为1~10')])
    teacher = SelectMultipleField('老师',
                                  choices=[], validators=[DataRequired()],
                                  render_kw={'data-live-search': "true"})
    capacity = IntegerField('容量', validators=[DataRequired(), number_range(1, 120, '请输入正确的容量数，范围为1~120')])
    time = StringField('上课时间', validators=[DataRequired()])
    start = IntegerField('开始周数', validators=[DataRequired(), number_range(1, 20, '请输入正确的周数，范围为1~20')])
    end = IntegerField('结束周数', validators=[DataRequired(), number_range(1, 20, '请输入正确的周数，范围为1~20')])
    place = SelectField('上课地点',
                        choices=roomLists, validators=[DataRequired()],
                        render_kw={'data-live-search': "true"})
    grade = SelectMultipleField('上课年级', coerce=int,
                                choices=gradeLists, validators=[DataRequired()],
                                render_kw={'data-live-search': "true", 'data-actions-box': 'true'})
    school = SelectMultipleField('上课学院',
                                 choices=schoolLists, validators=[DataRequired()],
                                 render_kw={'data-live-search': "true", 'data-actions-box': 'true'})
    submit = SubmitField('确定')


# 教师表单
class TeacherForm(FlaskForm):
    id = StringField('工号', validators=[
        DataRequired(), Length(1, 20),
        Regexp('^[0-9]*$', 0,
               'Id must have only numbers.')])
    name = StringField('姓名', validators=[DataRequired(), Length(1, 10)])
    school = SelectField('学院',
                         choices=schoolLists, validators=[DataRequired()],
                         render_kw={'data-live-search': "true"})
    title = SelectField('职称',
                        choices=titleLists, validators=[DataRequired()],
                        render_kw={'data-live-search': "true"})
    email = StringField('邮箱', validators=[DataRequired(), Length(1, 64),
                                          Email()])
    submit = SubmitField('确定')


# 教师修改表单
class TeacherEditForm(TeacherForm):
    id = StringField('工号')
    name = StringField('姓名')


# 学生表单
class StudentForm(FlaskForm):
    # TODO:进一步的验证函数
    id = StringField('学号', validators=[DataRequired()])
    name = StringField('姓名', validators=[DataRequired()])
    school = SelectField('学院',
                         choices=schoolLists, validators=[DataRequired()],
                         render_kw={'data-live-search': "true"})
    grade = SelectField('年级',
                        choices=gradeLists, validators=[DataRequired()],
                        render_kw={'data-live-search': "true"})
    email = StringField('邮箱', validators=[DataRequired(), Length(1, 64),
                                          Email()])
    submit = SubmitField('确定')


# 学生修改表单
class StudentEditForm(StudentForm):
    id = StringField('学号')
    name = StringField('姓名')


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
