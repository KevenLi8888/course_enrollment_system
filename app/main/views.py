from flask import render_template, redirect, flash, url_for, request, session
from flask_login import login_required, current_user
from . import main
from .forms import *
from ..db import dal

courseLists = []
studentLists = [{'id': 2018022, 'name': 'keven', 'school': 'cs', 'grade': 2018, 'email': '@email'},
                {'id': 2018023, 'name': 'keven', 'school': 'cs', 'grade': 2018, 'email': '@email'},
                {'id': 2018024, 'name': 'keven', 'school': 'cs', 'grade': 2018, 'email': '@email'},
                {'id': 2018025, 'name': 'keven', 'school': 'cs', 'grade': 2018, 'email': '@email'}]
# teacherLists = [{'id': 2018022, 'name': 'keven', 'school': 'cs', 'title': 'teach', 'email': '@email'},
#                 {'id': 2018023, 'name': 'keven', 'school': 'cs', 'title': 'teach', 'email': '@email'},
#                 {'id': 2018024, 'name': 'keven', 'school': 'cs', 'title': 'teach', 'email': '@email'},
#                 {'id': 2018025, 'name': 'keven', 'school': 'cs', 'title': 'teach', 'email': '@email'}]
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
week_list = ['一', '二', '三', '四', '五', '六', '日']


# 主页
@main.route('/', methods=['GET', 'POST'])
def index():
    return render_template('home.html')


# 选课
@main.route('/select', methods=['GET', 'POST'])
@login_required
def select():
    if len(request.args):
        # TODO:数据库添加课程
        print(request.args['courseId'])

        flash('xxx课程选课成功')
        return redirect(url_for('main.select'))
    return render_template('select.html', courseLists=courseLists, courseTable=courseTable)


# 退课
@main.route('/quit', methods=['GET', 'POST'])
@login_required
def quit():
    if len(request.args):
        # TODO:数据库删除课程
        print(request.args['courseId'])
        flash('xxx课程退课成功')
        return redirect(url_for('main.quit'))
    return render_template('quit.html', courseLists=courseLists, courseTable=courseTable)


# 老师课程
@main.route('/teach', methods=['GET', 'POST'])
@login_required
def teach():
    return render_template('teach.html', courseLists=courseLists, courseTable=courseTable)


# 学生花名册
@main.route('/student', methods=['GET', 'POST'])
@login_required
def student():
    if len(request.args):
        print(request.args['courseId'])
        return redirect(url_for('main.student'))
    return render_template('student.html', studentLists=studentLists)


# 课程信息
@main.route('/courseInfo', methods=['GET', 'POST'])
@login_required
def courseInfo():
    form = SearchForm()

    # 删除课程
    if len(request.args):
        # TODO:数据库删除课程
        print(request.args['courseId'])
        flash('xxx课程删除成功')
        return redirect(url_for('main.courseInfo'))

    # 课程列表
    sql = "select class_id, class_name, class_credit, class_room, class_capacity, " \
          "class_start_week, class_end_week, class_current_enroll_count from class_info;"
    rows = dal.SQLHelper.fetch_all(sql)
    print(rows)
    courseLists = []
    for row in rows:
        course = {'id': row[0], 'name': row[1], 'credit': row[2], 'room': row[3], 'capacity': row[4],
                  'current': row[7], 'week': "{}-{}".format(row[5], row[6]), 'teacher': [], 'time': []}
        sql = "select tchr_name from class_info ci " \
              "join teach_record tr on ci.class_id = tr.class_id " \
              "join teacher_list tl on tr.tchr_id = tl.tchr_id " \
              "where ci.class_id={!r};".format(row[0])
        teachers = dal.SQLHelper.fetch_all(sql)
        for teacher in teachers:
            course['teacher'].append(teacher[0])

        sql = "select class_time from class_info ci " \
              "join time_record tr on ci.class_id = tr.class_id " \
              "where ci.class_id = {!r};".format(row[0])
        times = dal.SQLHelper.fetch_all(sql)
        print("result:")
        print(times)
        for time in times:
            course['time'].append(
                "星期{} {}-{}".format(week_list[time[0] // 6], 2 * (time[0] % 6) + 1, 2 * (time[0] % 6 + 1)))
        courseLists.append(course)
    return render_template('courseInfo.html', courseLists=courseLists, form=form)


# 添加课程
@main.route('/courseAdd', methods=['GET', 'POST'])
@login_required
def courseAdd():
    form = CourseForm()
    sql = "select tchr_id,tchr_name from teacher_list;"
    rows = dal.SQLHelper.fetch_all(sql)
    form.teacher.choices += [(row[0], row[1]) for row in rows]
    if form.validate_on_submit():

        # 判断周数非法
        if form.start.data > form.end.data:
            flash('课程开始周数不能大于课程结束周数，请重新填写！')
            return render_template('courseAdd.html', form=form)

        # 判断课程序号冲突与
        sql = "select class_id from class_info where class_id={!r};".format(form.id.data)
        rows = dal.SQLHelper.fetch_one(sql)
        if rows is not None:
            flash('课程序号已经存在，请重新填写！')
            return render_template('courseAdd.html', form=form)

        for li in form.time.data:
            # 判断教室冲突
            sql = "select t1.class_id, class_name,class_start_week,class_end_week " \
                  "from class_info t1 " \
                  "join time_record t2 on t1.class_id = t2.class_id " \
                  "where class_time = {!r} and class_room = {!r};".format(li, form.place.data)
            rows = dal.SQLHelper.fetch_all(sql)
            print(rows)
            if rows is not None:
                for row in rows:
                    if form.end.data >= row[2] and form.start.data <= row[3]:
                        flash("与课程{}{}教室冲突".format(row[0], row[1]))
                        return render_template('courseAdd.html', form=form)

            # 判断老师时间冲突
            for tli in form.teacher.data:
                sql = "select t4.tchr_name,t1.class_id, class_name,class_start_week,class_end_week " \
                      "from class_info t1 " \
                      "join teach_record t2 on t1.class_id = t2.class_id " \
                      "join time_record t3 on t1.class_id = t3.class_id " \
                      "join teacher_list t4 on t2.tchr_id = t4.tchr_id " \
                      "where t2.tchr_id = {!r} and class_time = {!r};".format(tli, li)
                rows = dal.SQLHelper.fetch_all(sql)
                print(rows)
                if rows is not None:
                    for row in rows:
                        if form.end.data >= row[3] and form.start.data <= row[4]:
                            flash("与{}老师课程{}{}时间冲突".format(row[0], row[1], row[2]))
                            return render_template('courseAdd.html', form=form)

        # 添加到数据库
        sql = "insert into class_info(class_id, class_name, class_credit, class_room, " \
              "class_capacity, class_start_week, class_end_week,class_current_enroll_count) " \
              "values ({!r},{!r},{!r},{!r},{!r},{!r},{!r},0);".format(form.id.data, form.name.data, form.credit.data,
                                                                      form.place.data, form.capacity.data,
                                                                      form.start.data, form.end.data)
        dal.SQLHelper.modify(sql)

        for li in form.teacher.data:
            sql = "insert into teach_record(class_id,tchr_id)" \
                  "values ({!r},{!r});".format(form.id.data, li)
            dal.SQLHelper.modify(sql)

        for li in form.time.data:
            sql = "insert into time_record(class_id, class_time) " \
                  "values ({!r},{!r});".format(form.id.data, li)
            dal.SQLHelper.modify(sql)

        for li in form.school.data:
            sql = "insert into school_list(class_id, class_target_school) " \
                  "values ({!r},{!r});".format(form.id.data, li)
            dal.SQLHelper.modify(sql)

        for li in form.grade.data:
            sql = "insert into grade_list(class_id, class_target_grade)" \
                  "values ({!r},{!r});".format(form.id.data, li)
            dal.SQLHelper.modify(sql)
        flash('添加成功')
        return redirect(url_for('main.courseInfo'))
    return render_template('courseAdd.html', form=form)


# 编辑课程
@main.route('/courseEdit', methods=['GET', 'POST'])
@login_required
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
        return redirect(url_for('main.courseInfo'))
    return render_template('courseEdit.html', form=form)


# 教师信息
@main.route('/teacherInfo', methods=['GET', 'POST'])
@login_required
def teacherInfo():
    form = SearchForm()
    if 'teacherId' in request.args:
        sql = "delete from user_login_info where usr_id={0!r};".format(request.args['teacherId'])
        dal.SQLHelper.modify(sql)
        print(sql)
        print(request.args['teacherId'])
        flash('老师删除成功')
        return redirect(url_for('main.teacherInfo'))
    sql = "select t1.usr_id,t2.tchr_name,t2.tchr_school,t2.tchr_title,t2.tchr_mail,t1.usr_pwd  " \
          "from user_login_info t1 " \
          "join teacher_list t2 on t1.usr_id=t2.tchr_id;"
    teacherLists = dal.SQLHelper.fetch_all(sql)
    return render_template('teacherInfo.html', teacherLists=teacherLists, form=form)


# 添加老师
@main.route('/teacherAdd', methods=['GET', 'POST'])
@login_required
def teacherAdd():
    form = TeacherForm()
    if form.validate_on_submit():
        sql = "select usr_id from user_login_info where usr_id={!r};".format(form.id.data)
        rows = dal.SQLHelper.fetch_one(sql)
        if rows is not None:
            flash('工号已经存在，请重新填写！')
        else:
            sql = "insert into user_login_info(usr_id, usr_pwd, usr_type) values ({!r},{!r},{!r});".format(
                form.id.data, form.id.data, 1)
            dal.SQLHelper.modify(sql)
            sql = "insert into teacher_list(tchr_id, tchr_name, tchr_school, tchr_title, tchr_mail) values ({!r}," \
                  "{!r},{!r},{!r},{!r});".format(form.id.data, form.name.data, form.school.data, form.title.data,
                                                 form.email.data)
            dal.SQLHelper.modify(sql)
            flash('添加成功')
            return redirect(url_for('main.teacherInfo'))
    return render_template('teacherAdd.html', form=form)


# 编辑教师
@main.route('/teacherEdit', methods=['GET', 'POST'])
@login_required
def teacherEdit():
    form = TeacherEditForm()
    if form.validate_on_submit():
        sql = "update teacher_list " \
              "set tchr_school = {!r},tchr_title={!r},tchr_mail={!r} " \
              "where tchr_id={!r};".format(form.school.data, form.title.data, form.email.data,
                                           session['teacherId'])
        print(form.school.data, form.title.data, form.email.data, session['teacherId'])
        dal.SQLHelper.modify(sql)
        flash('修改成功')
        return redirect(url_for('main.teacherInfo'))
    if 'teacherId' in request.args:
        session['teacherId'] = request.args['teacherId']
        return redirect(url_for('main.teacherEdit'))
    if session['teacherId']:
        # 原本的数据
        sql = "select t1.usr_id,t2.tchr_name,t2.tchr_school,t2.tchr_title,t2.tchr_mail,t1.usr_pwd  " \
              "from user_login_info t1 " \
              "join teacher_list t2 on t1.usr_id=t2.tchr_id and t1.usr_id={!r};".format(session['teacherId'])
        rows = dal.SQLHelper.fetch_one(sql)
        form.id.data = rows[0]
        form.name.data = rows[1]
        form.school.data = rows[2]
        form.title.data = rows[3]
        form.email.data = rows[4]
    return render_template('teacherEdit.html', form=form)


# 学生信息
@main.route('/studentInfo', methods=['GET', 'POST'])
@login_required
def studentInfo():
    form = SearchForm()
    if 'studentId' in request.args:
        sql = "delete from user_login_info where usr_id={0!r};".format(request.args['studentId'])
        dal.SQLHelper.modify(sql)
        print(sql)
        print(request.args['studentId'])
        flash('学生删除成功')
        return redirect(url_for('main.studentInfo'))
    sql = "select t1.usr_id,t2.stu_name,t2.stu_school,t2.stu_grade,t2.stu_mail,t1.usr_pwd  " \
          "from user_login_info t1 " \
          "join student_list t2 on t1.usr_id=t2.stu_id;"
    studentLists = dal.SQLHelper.fetch_all(sql)
    return render_template('studentInfo.html', studentLists=studentLists, form=form)


# 添加学生
@main.route('/studentAdd', methods=['GET', 'POST'])
@login_required
def studentAdd():
    form = StudentForm()
    if form.validate_on_submit():
        sql = "select usr_id from user_login_info where usr_id={!r};".format(form.id.data)
        rows = dal.SQLHelper.fetch_one(sql)
        if rows is not None:
            flash('学号已经存在，请重新填写！')
        else:
            sql = "insert into user_login_info(usr_id, usr_pwd, usr_type) values ({!r},{!r},{!r});".format(
                form.id.data, form.id.data, 2)
            dal.SQLHelper.modify(sql)
            sql = "insert into student_list(stu_id, stu_name, stu_school, stu_grade, stu_mail) values ({!r}," \
                  "{!r},{!r},{!r},{!r});".format(form.id.data, form.name.data, form.school.data, form.grade.data,
                                                 form.email.data)
            dal.SQLHelper.modify(sql)
            flash('添加成功')
            return redirect(url_for('main.studentInfo'))
    return render_template('studentAdd.html', form=form)


# 编辑学生
@main.route('/studentEdit', methods=['GET', 'POST'])
@login_required
def studentEdit():
    form = StudentEditForm()
    if form.validate_on_submit():
        sql = "update student_list " \
              "set stu_school = {!r},stu_grade={!r},stu_mail={!r} " \
              "where stu_id={!r};".format(form.school.data, form.grade.data, form.email.data,
                                          session['studentId'])
        print(form.school.data, form.grade.data, form.email.data, session['studentId'])
        dal.SQLHelper.modify(sql)
        flash('修改成功')
        return redirect(url_for('main.studentInfo'))
    if 'studentId' in request.args:
        session['studentId'] = request.args['studentId']
        return redirect(url_for('main.studentEdit'))
    if session['studentId']:
        # 原本的数据
        sql = "select t1.usr_id,t2.stu_name,t2.stu_school,t2.stu_grade,t2.stu_mail,t1.usr_pwd  " \
              "from user_login_info t1 " \
              "join student_list t2 on t1.usr_id=t2.stu_id and t1.usr_id={!r};".format(session['studentId'])
        rows = dal.SQLHelper.fetch_one(sql)
        form.id.data = rows[0]
        form.name.data = rows[1]
        form.school.data = rows[2]
        form.grade.data = rows[3]
        form.email.data = rows[4]
    return render_template('studentEdit.html', form=form)

# 修改密码
# @main.route('/passwordEdit', methods=['GET', 'POST'])
# def passwordEdit():
#     form = PasswordForm()
#     if 'studentId' in request.args:
#         session['type'] = 'student'
#         session['id'] = request.args['studentId']
#     elif 'teacherId' in request.args:
#         session['type'] = 'teacher'
#         session['id'] = request.args['teacherId']
#         return redirect(url_for('main.passwordEdit'))
#     if form.validate_on_submit():
#         # TODO:提交数据库
#         flash('修改成功')
#         if session['type'] == 'student':
#             print('std')
#             print(form.password.data)
#             return redirect(url_for('main.studentInfo'))
#         elif session['type'] == 'teacher':
#             print('tec')
#             print(form.password.data)
#             return redirect(url_for('main.teacherInfo'))
#     return render_template('passwordEdit.html', form=form)
