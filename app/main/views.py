import base64
import pymysql
from flask import render_template, redirect, flash, url_for, request, session
from functools import wraps
from flask_login import login_required, current_user
import operator
from . import main
from .forms import *
from ..db import dal

week_list = ['一', '二', '三', '四', '五', '六', '日']


# 教师装饰器
def teacher_required(func):
    @wraps(func)
    def wrapTeacher(*args, **kwargs):
        if current_user.type != 1:
            flash('你没有访问权限,请登录教师帐号！', 'alert-danger')
            return redirect(url_for('main.index'))
        return func(*args, **kwargs)

    return wrapTeacher


# 学生装饰器
def student_required(func):
    @wraps(func)
    def wrapStudent(*args, **kwargs):
        if current_user.type != 2:
            flash('你没有访问权限,请登录学生帐号！', 'alert-danger')
            return redirect(url_for('main.index'))
        return func(*args, **kwargs)

    return wrapStudent


# 管理员装饰器
def admin_required(func):
    @wraps(func)
    def wrapAdmin(*args, **kwargs):
        if current_user.type != 0:
            flash('你没有访问权限,请登录管理员帐号！', 'alert-danger')
            return redirect(url_for('main.index'))
        return func(*args, **kwargs)

    return wrapAdmin


# 主页
@main.route('/', methods=['GET', 'POST'])
def index():
    courseTable = [
        [[], [], [], [], [], [], []],
        [[], [], [], [], [], [], []],
        [[], [], [], [], [], [], []],
        [[], [], [], [], [], [], []],
        [[], [], [], [], [], [], []],
        [[], [], [], [], [], [], []],
        [[], [], [], [], [], [], []],
        [[], [], [], [], [], [], []],
        [[], [], [], [], [], [], []],
        [[], [], [], [], [], [], []],
        [[], [], [], [], [], [], []],
        [[], [], [], [], [], [], []]
    ]
    # 管理员
    if current_user.is_authenticated and current_user.type == 0:
        sql = "select adm_school, adm_mail, adm_avatar " \
              "from admin_list " \
              "where adm_id={!r}".format(current_user.id)
        row = dal.SQLHelper.fetch_one(sql)
        if row[2] is None:
            image = None
        else:
            image = str(base64.b64encode(row[2]))[2:-1]
        user = {'school': row[0], 'email': row[1], 'avatar': image}

        return render_template('home.html', courseTable=courseTable, user=user)

    # 教师
    if current_user.is_authenticated and current_user.type == 1:

        sql = "select class_time,class_name " \
              "from class_info ci " \
              "join teach_record ter on ci.class_id = ter.class_id " \
              "join time_record tr on ci.class_id = tr.class_id " \
              "where tchr_id={!r}".format(current_user.id)
        rows = dal.SQLHelper.fetch_all(sql)

        for row in rows:
            courseTable[2 * (row[0] % 6)][row[0] // 6].append("{}".format(row[1]))
            courseTable[2 * (row[0] % 6) + 1][row[0] // 6].append("{}".format(row[1]))

        sql = "select tchr_school, tchr_title, tchr_mail, tchr_avatar " \
              "from teacher_list " \
              "where tchr_id={!r}".format(current_user.id)
        row = dal.SQLHelper.fetch_one(sql)
        if row[3] is None:
            image = None
        else:
            image = str(base64.b64encode(row[3]))[2:-1]
        user = {'school': row[0], 'title': row[1], 'email': row[2], 'avatar': image}
        return render_template('home.html', courseTable=courseTable, user=user)

    # 学生
    if current_user.is_authenticated and current_user.type == 2:
        sql = "select class_time,class_name " \
              "from class_info ci " \
              "join enroll_record er on ci.class_id = er.class_id " \
              "join time_record tr on ci.class_id = tr.class_id " \
              "where stu_id={!r}".format(current_user.id)
        rows = dal.SQLHelper.fetch_all(sql)

        for row in rows:
            courseTable[2 * (row[0] % 6)][row[0] // 6].append("{}".format(row[1]))
            courseTable[2 * (row[0] % 6) + 1][row[0] // 6].append("{}".format(row[1]))

        sql = "select stu_school,stu_grade,stu_mail,stu_avatar " \
              "from student_list " \
              "where stu_id={!r}".format(current_user.id)
        row = dal.SQLHelper.fetch_one(sql)
        if row[3] is None:
            image = None
        else:
            image = str(base64.b64encode(row[3]))[2:-1]
        user = {'school': row[0], 'grade': row[1], 'email': row[2], 'avatar': image}
        return render_template('home.html', courseTable=courseTable, user=user)
    return render_template('home.html')


# 个人页面
@main.route('/infoPage', methods=['GET', 'POST'])
@login_required
def infoPage():
    if current_user.type == 0:  # 管理员
        sql = "select adm_school, adm_mail, adm_avatar " \
              "from admin_list " \
              "where adm_id={!r}".format(current_user.id)
        row = dal.SQLHelper.fetch_one(sql)
        if row[2] is None:
            image = None
        else:
            image = str(base64.b64encode(row[2]))[2:-1]
        user = {'school': row[0], 'email': row[1], 'avatar': image}
        return render_template('infoPage.html', user=user)
    elif current_user.type == 1:  # 老师
        sql = "select tchr_school, tchr_title, tchr_mail, tchr_avatar " \
              "from teacher_list " \
              "where tchr_id={!r}".format(current_user.id)
        row = dal.SQLHelper.fetch_one(sql)
        if row[3] is None:
            image = None
        else:
            image = str(base64.b64encode(row[3]))[2:-1]
        user = {'school': row[0], 'title': row[1], 'email': row[2], 'avatar': image}
        return render_template('infoPage.html', user=user)
    elif current_user.type == 2:  # 学生
        sql = "select stu_school,stu_grade,stu_mail,stu_avatar " \
              "from student_list " \
              "where stu_id={!r}".format(current_user.id)
        row = dal.SQLHelper.fetch_one(sql)
        if row[3] is None:
            image = None
        else:
            image = str(base64.b64encode(row[3]))[2:-1]
        user = {'school': row[0], 'grade': row[1], 'email': row[2], 'avatar': image}
        return render_template('infoPage.html', user=user)


# 个人页面编辑
@main.route('/infoEdit', methods=['GET', 'POST'])
@login_required
def infoEdit():
    if current_user.type == 0:  # 管理员
        form = AdminInfoForm()
        if form.validate_on_submit():
            # 默认数据
            form.id.data = current_user.id
            form.name.data = current_user.name
            form.school.data = session['school']

            imageBin = form.avatar.data.read()
            if imageBin is b'':
                sql = "update admin_list " \
                      "set adm_mail=%s " \
                      "where adm_id=%s"
                dal.SQLHelper.modify(sql, (form.email.data, current_user.id))
            else:
                image = imageBin
                sql = "update admin_list " \
                      "set adm_avatar=%s,adm_mail=%s " \
                      "where adm_id=%s"
                dal.SQLHelper.modify(sql, (pymysql.Binary(image), form.email.data, current_user.id))
            flash('{}的个人信息修改成功'.format(current_user.name), 'alert-info')
            return redirect(url_for('main.infoPage'))
        sql = "select adm_school, adm_mail, adm_avatar " \
              "from admin_list " \
              "where adm_id={!r}".format(current_user.id)
        row = dal.SQLHelper.fetch_one(sql)
        form.id.data = current_user.id
        form.name.data = current_user.name
        session['school'] = form.school.data = row[0]
        form.email.data = row[1]
        return render_template('infoEdit.html', form=form)
    elif current_user.type == 1:  # 老师
        form = TeacherInfoForm()
        if form.validate_on_submit():
            # 默认数据
            form.id.data = current_user.id
            form.name.data = current_user.name
            form.school.data = session['school']
            form.title.data = session['title']

            imageBin = form.avatar.data.read()
            if imageBin is b'':
                sql = "update teacher_list " \
                      "set tchr_mail=%s " \
                      "where tchr_id=%s"
                dal.SQLHelper.modify(sql, (form.email.data, current_user.id))
            else:
                image = imageBin
                sql = "update teacher_list " \
                      "set tchr_avatar=%s,tchr_mail=%s " \
                      "where tchr_id=%s"
                dal.SQLHelper.modify(sql, (pymysql.Binary(image), form.email.data, current_user.id))
            flash('{}的个人信息修改成功'.format(current_user.name), 'alert-info')
            return redirect(url_for('main.infoPage'))
        sql = "select tchr_school, tchr_title, tchr_mail, tchr_avatar " \
              "from teacher_list " \
              "where tchr_id={!r}".format(current_user.id)
        row = dal.SQLHelper.fetch_one(sql)
        form.id.data = current_user.id
        form.name.data = current_user.name
        session['school'] = form.school.data = row[0]
        session['title'] = form.title.data = row[1]
        form.email.data = row[2]
        return render_template('infoEdit.html', form=form)
    elif current_user.type == 2:  # 学生
        form = StudentInfoForm()
        if form.validate_on_submit():
            # 默认数据
            form.id.data = current_user.id
            form.name.data = current_user.name
            form.school = session['school']
            form.grade = session['grade']

            imageBin = form.avatar.data.read()
            if imageBin is b'':
                sql = "update student_list " \
                      "set stu_mail=%s " \
                      "where stu_id=%s"
                dal.SQLHelper.modify(sql, (form.email.data, current_user.id))
            else:
                image = imageBin
                sql = "update student_list " \
                      "set stu_avatar=%s,stu_mail=%s " \
                      "where stu_id=%s"
                dal.SQLHelper.modify(sql, (pymysql.Binary(image), form.email.data, current_user.id))

            flash('{}的个人信息修改成功'.format(current_user.name), 'alert-info')
            return redirect(url_for('main.infoPage'))
        sql = "select stu_school,stu_grade,stu_mail,stu_avatar " \
              "from student_list " \
              "where stu_id={!r}".format(current_user.id)
        row = dal.SQLHelper.fetch_one(sql)
        form.id.data = current_user.id
        form.name.data = current_user.name
        session['school'] = form.school.data = row[0]
        session['grade'] = form.grade.data = row[1]
        form.email.data = row[2]
        return render_template('infoEdit.html', form=form)


# 学生课程
@main.route('/study', methods=['GET', 'POST'])
@login_required
@student_required
def study():
    sql = "select ci.class_id, ci.class_name, ci.class_credit, " \
          "ci.class_room, ci.class_start_week, class_end_week " \
          "from class_info ci join enroll_record er " \
          "on ci.class_id = er.class_id " \
          "where stu_id={!r}".format(current_user.id)
    rows = dal.SQLHelper.fetch_all(sql)

    # 课程列表
    courseLists = []
    # 课程表
    courseTable = [
        [[], [], [], [], [], [], []],
        [[], [], [], [], [], [], []],
        [[], [], [], [], [], [], []],
        [[], [], [], [], [], [], []],
        [[], [], [], [], [], [], []],
        [[], [], [], [], [], [], []],
        [[], [], [], [], [], [], []],
        [[], [], [], [], [], [], []],
        [[], [], [], [], [], [], []],
        [[], [], [], [], [], [], []],
        [[], [], [], [], [], [], []],
        [[], [], [], [], [], [], []]
    ]

    for row in rows:
        course = {'id': row[0], 'name': row[1], 'credit': row[2], 'room': row[3],
                  'week': "{}-{}".format(row[4], row[5]), 'time': [], 'teacher': []}

        # 上课时间
        sql = "select class_time from class_info ci " \
              "join time_record tr on ci.class_id = tr.class_id " \
              "where ci.class_id = {!r};".format(row[0])
        times = dal.SQLHelper.fetch_all(sql)
        for time in times:
            course['time'].append(
                "星期{} {}-{}".format(week_list[time[0] // 6], 2 * (time[0] % 6) + 1, 2 * (time[0] % 6 + 1)))
            courseTable[2 * (time[0] % 6)][time[0] // 6].append(
                "{}<br>({}-{},{})".format(row[1], row[4], row[5], row[3]))
            courseTable[2 * (time[0] % 6) + 1][time[0] // 6].append(
                "{}<br>({}-{},{})".format(row[1], row[4], row[5], row[3]))

        # 上课老师
        sql = "select tchr_name from class_info ci " \
              "join teach_record tr on ci.class_id = tr.class_id " \
              "join teacher_list tl on tr.tchr_id = tl.tchr_id " \
              "where ci.class_id={!r};".format(row[0])
        teachers = dal.SQLHelper.fetch_all(sql)
        for teacher in teachers:
            course['teacher'].append(teacher[0])

        courseLists.append(course)
    print(courseTable)
    return render_template('study.html', courseLists=courseLists, courseTable=courseTable)


# 选课
@main.route('/select', methods=['GET', 'POST'])
@login_required
@student_required
def select():
    if 'courseId' in request.args:
        courseId = request.args['courseId']

        # 判断容量
        if session[courseId]['current'] == session[courseId]['capacity']:
            flash('课程人数已经达到上限，无法选课！', 'alert-danger')
            return redirect(url_for('main.select'))

        # 判断时间冲突
        sql = "select ci.class_id,class_name " \
              "from class_info ci " \
              "join time_record tr on ci.class_id = tr.class_id " \
              "join enroll_record er on ci.class_id = er.class_id " \
              "where stu_id={!r} and class_time in ({}) " \
              "and class_end_week >={!r} and class_start_week<={!r}".format(current_user.id,
                                                                            ','.join(session[courseId]['time']),
                                                                            session[courseId]['start'],
                                                                            session[courseId]['end'])
        row = dal.SQLHelper.fetch_one(sql)
        if row is not None:
            flash("与课程（{}·{}）冲突，请重新选择！".format(row[0], row[1]), 'alert-danger')
            return redirect(url_for('main.select'))

        # 添加课程
        sql = "insert into enroll_record(stu_id, class_id) " \
              "values ({!r},{!r})".format(current_user.id, courseId)
        dal.SQLHelper.modify(sql)
        print(sql)

        # 更新课程容量
        session[courseId]['current'] = session[courseId]['current'] + 1
        sql = "update class_info " \
              "set class_current_enroll_count ={!r} " \
              "where class_id={!r};".format(session[courseId]['current'], courseId)
        dal.SQLHelper.modify(sql)
        print(sql)

        flash('课程（{}·{}）选课成功'.format(courseId, session[courseId]['name']), 'alert-success')
        return redirect(url_for('main.select'))

    # courseLists begin

    sql = "select ci.class_id,class_name,class_credit," \
          "class_current_enroll_count,class_capacity,class_room," \
          "class_start_week,class_end_week " \
          "from class_info ci " \
          "join grade_list gl on ci.class_id = gl.class_id " \
          "join school_list sl on ci.class_id = sl.class_id " \
          "join student_list on stu_grade=class_target_grade " \
          "and stu_school=class_target_school " \
          "where stu_id={0!r} " \
          "and ci.class_id not in" \
          " (select class_id " \
          "from enroll_record " \
          "where stu_id={0!r})".format(current_user.id)
    rows = dal.SQLHelper.fetch_all(sql)
    # 课程列表
    courseLists = []

    for row in rows:
        session[row[0]] = \
            {'start': row[6], 'end': row[7], 'time': [], 'current': row[3], 'capacity': row[4], 'name': row[1]}
        course = {'id': row[0], 'name': row[1], 'credit': row[2], 'current': row[3], 'capacity': row[4],
                  'room': row[5], 'week': "{}-{}".format(row[6], row[7]), 'time': [], 'teacher': []}

        # 上课时间
        sql = "select class_time from class_info ci " \
              "join time_record tr on ci.class_id = tr.class_id " \
              "where ci.class_id = {!r};".format(row[0])
        times = dal.SQLHelper.fetch_all(sql)
        for time in times:
            session[row[0]]['time'].append('{0}'.format(time[0]))
            course['time'].append(
                "星期{} {}-{}".format(week_list[time[0] // 6], 2 * (time[0] % 6) + 1, 2 * (time[0] % 6 + 1)))

        # 上课老师
        sql = "select tchr_name from class_info ci " \
              "join teach_record tr on ci.class_id = tr.class_id " \
              "join teacher_list tl on tr.tchr_id = tl.tchr_id " \
              "where ci.class_id={!r};".format(row[0])
        teachers = dal.SQLHelper.fetch_all(sql)
        for teacher in teachers:
            course['teacher'].append(teacher[0])

        courseLists.append(course)

    # courseLists end

    # courseTable begin

    courseTable = [
        [[], [], [], [], [], [], []],
        [[], [], [], [], [], [], []],
        [[], [], [], [], [], [], []],
        [[], [], [], [], [], [], []],
        [[], [], [], [], [], [], []],
        [[], [], [], [], [], [], []],
        [[], [], [], [], [], [], []],
        [[], [], [], [], [], [], []],
        [[], [], [], [], [], [], []],
        [[], [], [], [], [], [], []],
        [[], [], [], [], [], [], []],
        [[], [], [], [], [], [], []]
    ]

    sql = "select class_time,class_name,class_start_week,class_end_week,class_room " \
          "from class_info ci " \
          "join enroll_record er on ci.class_id = er.class_id " \
          "join time_record tr on ci.class_id = tr.class_id " \
          "where stu_id={!r}".format(current_user.id)
    rows = dal.SQLHelper.fetch_all(sql)

    for row in rows:
        courseTable[2 * (row[0] % 6)][row[0] // 6].append("{}<br>({}-{},{})".format(row[1], row[2], row[3], row[4]))
        courseTable[2 * (row[0] % 6) + 1][row[0] // 6].append("{}<br>({}-{},{})".format(row[1], row[2], row[3], row[4]))
    # courseTable end

    return render_template('select.html', courseLists=courseLists, courseTable=courseTable)


# 退课
@main.route('/quit', methods=['GET', 'POST'])
@login_required
@student_required
def quit():
    sql = "select ci.class_id,class_name,class_credit," \
          "class_current_enroll_count,class_capacity,class_room," \
          "class_start_week,class_end_week " \
          "from class_info ci " \
          "join grade_list gl on ci.class_id = gl.class_id " \
          "join school_list sl on ci.class_id = sl.class_id " \
          "join student_list on stu_grade=class_target_grade " \
          "and stu_school=class_target_school " \
          "where stu_id={0!r} " \
          "and ci.class_id in" \
          " (select class_id " \
          "from enroll_record " \
          "where stu_id={0!r})".format(current_user.id)
    rows = dal.SQLHelper.fetch_all(sql)
    # 课程列表
    courseLists = []

    courseTable = [
        [[], [], [], [], [], [], []],
        [[], [], [], [], [], [], []],
        [[], [], [], [], [], [], []],
        [[], [], [], [], [], [], []],
        [[], [], [], [], [], [], []],
        [[], [], [], [], [], [], []],
        [[], [], [], [], [], [], []],
        [[], [], [], [], [], [], []],
        [[], [], [], [], [], [], []],
        [[], [], [], [], [], [], []],
        [[], [], [], [], [], [], []],
        [[], [], [], [], [], [], []]
    ]

    for row in rows:
        session[row[0]] = {'name': row[1]}
        course = {'id': row[0], 'name': row[1], 'credit': row[2], 'current': row[3], 'capacity': row[4],
                  'room': row[5], 'week': "{}-{}".format(row[6], row[7]), 'time': [], 'teacher': []}

        sql = "select class_time from class_info ci " \
              "join time_record tr on ci.class_id = tr.class_id " \
              "where ci.class_id = {!r};".format(row[0])
        times = dal.SQLHelper.fetch_all(sql)

        for time in times:
            course['time'].append(
                "星期{} {}-{}".format(week_list[time[0] // 6], 2 * (time[0] % 6) + 1, 2 * (time[0] % 6 + 1)))
            courseTable[2 * (time[0] % 6)][time[0] // 6].append(
                "{}<br>({}-{},{})".format(row[1], row[6], row[7], row[5]))
            courseTable[2 * (time[0] % 6) + 1][time[0] // 6].append(
                "{}<br>({}-{},{})".format(row[1], row[6], row[7], row[5]))

        # 上课老师
        sql = "select tchr_name from class_info ci " \
              "join teach_record tr on ci.class_id = tr.class_id " \
              "join teacher_list tl on tr.tchr_id = tl.tchr_id " \
              "where ci.class_id={!r};".format(row[0])
        teachers = dal.SQLHelper.fetch_all(sql)
        for teacher in teachers:
            course['teacher'].append(teacher[0])
        courseLists.append(course)
    print(courseTable)

    if 'courseId' in request.args:
        courseId = request.args['courseId']
        sql = "delete from enroll_record " \
              "where class_id={!r} and stu_id={!r}".format(courseId, current_user.id)
        dal.SQLHelper.modify(sql)
        sql = "update class_info " \
              "set class_current_enroll_count=class_current_enroll_count-1 " \
              "where class_id={!r}".format(courseId)
        dal.SQLHelper.modify(sql)
        flash('课程（{}·{}）退课成功'.format(courseId, session[courseId]['name']), 'alert-warning')
        return redirect(url_for('main.quit'))
    return render_template('quit.html', courseLists=courseLists, courseTable=courseTable)


# 学生花名册
@main.route('/student', methods=['GET', 'POST'])
@login_required
@teacher_required
def student():
    studentLists = []
    if 'courseId' in request.args:
        session['courseId'] = request.args['courseId']
        return redirect(url_for('main.student'))
    if session['courseId']:
        sql = "select sl.stu_id, stu_name, stu_school, stu_grade, stu_mail " \
              "from student_list sl " \
              "join enroll_record er on sl.stu_id = er.stu_id " \
              "where class_id={!r}".format(session['courseId'])
        studentLists = dal.SQLHelper.fetch_all(sql)
        # print(studentLists)
    return render_template('student.html', studentLists=studentLists)


# 老师课程
@main.route('/teach', methods=['GET', 'POST'])
@login_required
@teacher_required
def teach():
    sql = "select ci.class_id, ci.class_name, ci.class_credit, ci.class_current_enroll_count," \
          " ci.class_capacity, ci.class_start_week, ci.class_end_week, ci.class_room " \
          "from  class_info ci " \
          "join teach_record tr on ci.class_id = tr.class_id " \
          "where tchr_id={!r}".format(current_user.id)
    rows = dal.SQLHelper.fetch_all(sql)

    # 课程列表
    courseLists = []
    # 课程表
    courseTable = [
        [[], [], [], [], [], [], []],
        [[], [], [], [], [], [], []],
        [[], [], [], [], [], [], []],
        [[], [], [], [], [], [], []],
        [[], [], [], [], [], [], []],
        [[], [], [], [], [], [], []],
        [[], [], [], [], [], [], []],
        [[], [], [], [], [], [], []],
        [[], [], [], [], [], [], []],
        [[], [], [], [], [], [], []],
        [[], [], [], [], [], [], []],
        [[], [], [], [], [], [], []]
    ]

    for row in rows:
        course = {'id': row[0], 'name': row[1], 'credit': row[2], 'current': row[3], 'capacity': row[4],
                  'time': [], 'week': "{}-{}".format(row[5], row[6]), 'room': row[7]}
        sql = "select class_time from class_info ci " \
              "join time_record tr on ci.class_id = tr.class_id " \
              "where ci.class_id = {!r};".format(row[0])
        times = dal.SQLHelper.fetch_all(sql)
        for time in times:
            course['time'].append(
                "星期{} {}-{}".format(week_list[time[0] // 6], 2 * (time[0] % 6) + 1, 2 * (time[0] % 6 + 1)))
            courseTable[2 * (time[0] % 6)][time[0] // 6].append(
                "{}<br>({}-{},{})".format(row[1], row[5], row[6], row[7]))
            courseTable[2 * (time[0] % 6) + 1][time[0] // 6].append(
                "{}<br>({}-{},{})".format(row[1], row[5], row[6], row[7]))
        courseLists.append(course)
    # print(courseTable)

    return render_template('teach.html', courseLists=courseLists, courseTable=courseTable)


# 课程信息
@main.route('/courseInfo', methods=['GET', 'POST'])
@login_required
@admin_required
def courseInfo():
    # 删除课程
    if 'courseId' in request.args:
        courseId = request.args['courseId']
        sql = "delete from class_info " \
              "where class_id={!r}".format(courseId)
        dal.SQLHelper.modify(sql)
        # print(sql)
        flash('课程（{}·{}）删除成功'.format(courseId, session[courseId]['name']), 'alert-warning')
        return redirect(url_for('main.courseInfo'))

    # 课程列表
    sql = "select class_id, class_name, class_credit, class_room, class_capacity, " \
          "class_start_week, class_end_week, class_current_enroll_count from class_info;"
    rows = dal.SQLHelper.fetch_all(sql)
    # print(rows)
    courseLists = []
    for row in rows:
        session[row[0]] = {'name': row[1]}
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
        for time in times:
            course['time'].append(
                "星期{} {}-{}".format(week_list[time[0] // 6], 2 * (time[0] % 6) + 1, 2 * (time[0] % 6 + 1)))
        courseLists.append(course)
    return render_template('courseInfo.html', courseLists=courseLists, form=form)


# 添加课程
@main.route('/courseAdd', methods=['GET', 'POST'])
@login_required
@admin_required
def courseAdd():
    form = CourseForm()
    sql = "select tchr_id,tchr_name from teacher_list;"
    rows = dal.SQLHelper.fetch_all(sql)
    form.teacher.choices += [(row[0], row[1]) for row in rows]
    if form.validate_on_submit():

        # 判断周数非法
        if form.start.data > form.end.data:
            form.start.errors.append('课程开始周数不能大于课程结束周数')
            return render_template('courseAdd.html', form=form)

        # 判断课程序号冲突
        sql = "select class_id from class_info where class_id={!r};".format(form.id.data)
        rows = dal.SQLHelper.fetch_one(sql)
        if rows is not None:
            form.id.errors.append('课程序号已经存在')
            return render_template('courseAdd.html', form=form)

        for li in form.time.data:
            # 判断老师时间冲突
            for tli in form.teacher.data:
                sql = "select t4.tchr_name,t1.class_id, class_name,class_start_week,class_end_week " \
                      "from class_info t1 " \
                      "join teach_record t2 on t1.class_id = t2.class_id " \
                      "join time_record t3 on t1.class_id = t3.class_id " \
                      "join teacher_list t4 on t2.tchr_id = t4.tchr_id " \
                      "where t2.tchr_id = {!r} and class_time = {!r};".format(tli, li)
                rows = dal.SQLHelper.fetch_all(sql)
                # print(rows)
                if rows is not None:
                    for row in rows:
                        if form.end.data >= row[3] and form.start.data <= row[4]:
                            form.teacher.errors.append("与{}老师的课程（{}·{}）时间冲突".format(row[0], row[1], row[2]))
                            return render_template('courseAdd.html', form=form)

            # 判断教室冲突
            sql = "select t1.class_id, class_name,class_start_week,class_end_week " \
                  "from class_info t1 " \
                  "join time_record t2 on t1.class_id = t2.class_id " \
                  "where class_time = {!r} and class_room = {!r};".format(li, form.room.data)
            rows = dal.SQLHelper.fetch_all(sql)
            # print(rows)
            if rows is not None:
                for row in rows:
                    if form.end.data >= row[2] and form.start.data <= row[3]:
                        form.room.errors.append("与课程（{}·{}）教室冲突".format(row[0], row[1]))
                        return render_template('courseAdd.html', form=form)

        # 添加到数据库
        sql = "insert into class_info(class_id, class_name, class_credit, class_room, " \
              "class_capacity, class_start_week, class_end_week,class_current_enroll_count) " \
              "values ({!r},{!r},{!r},{!r},{!r},{!r},{!r},0);".format(form.id.data, form.name.data, form.credit.data,
                                                                      form.room.data, form.capacity.data,
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
        flash('课程（{}·{}）添加成功'.format(form.id.data, form.name.data), 'alert-success')
        return redirect(url_for('main.courseInfo'))
    return render_template('courseAdd.html', form=form)


# 编辑课程
@main.route('/courseEdit', methods=['GET', 'POST'])
@login_required
@admin_required
def courseEdit():
    form = CourseEditForm()
    sql = "select tchr_id,tchr_name from teacher_list;"
    rows = dal.SQLHelper.fetch_all(sql)
    form.teacher.choices += [(row[0], row[1]) for row in rows]
    if form.validate_on_submit():
        form.id.data = session['courseId']
        # 判断周数非法
        if form.start.data > form.end.data:
            form.start.errors.append('课程开始周数不能大于课程结束周数，请重新填写！')
            return render_template('courseEdit.html', form=form)

        for li in form.time.data:
            # 判断老师时间冲突
            for tli in form.teacher.data:
                sql = "select t4.tchr_name,t1.class_id, class_name,class_start_week,class_end_week " \
                      "from class_info t1 " \
                      "join teach_record t2 on t1.class_id = t2.class_id " \
                      "join time_record t3 on t1.class_id = t3.class_id " \
                      "join teacher_list t4 on t2.tchr_id = t4.tchr_id " \
                      "where t2.tchr_id = {!r} and class_time = {!r};".format(tli, li)
                rows = dal.SQLHelper.fetch_all(sql)
                # print(rows)
                if rows is not None:
                    for row in rows:
                        if row[1] == session['courseId']:
                            continue
                        if form.end.data >= row[3] and form.start.data <= row[4]:
                            form.teacher.errors.append("与{}老师的课程（{}·{}）时间冲突".format(row[0], row[1], row[2]))
                            return render_template('courseEdit.html', form=form)

            # 判断教室冲突
            sql = "select t1.class_id, class_name,class_start_week,class_end_week " \
                  "from class_info t1 " \
                  "join time_record t2 on t1.class_id = t2.class_id " \
                  "where class_time = {!r} and class_room = {!r};".format(li, form.room.data)
            rows = dal.SQLHelper.fetch_all(sql)
            # print(rows)
            if rows is not None:
                for row in rows:
                    if row[0] == session['courseId']:
                        continue
                    if form.end.data >= row[2] and form.start.data <= row[3]:
                        form.room.errors.append("与课程（{}·{}）教室冲突".format(row[0], row[1]))
                        return render_template('courseEdit.html', form=form)
        # 更新数据库
        sql = "update class_info " \
              "set class_name={!r},class_credit={!r},class_room={!r}," \
              "class_capacity={!r},class_start_week={!r},class_end_week={!r} " \
              "where class_id={!r};".format(form.name.data, form.credit.data, form.room.data,
                                            form.capacity.data, form.start.data, form.end.data,
                                            session['courseId'])
        dal.SQLHelper.modify(sql)

        # 更新老师
        if not operator.eq(session['teacher'], form.teacher.data):
            # 删除
            sql = "delete from teach_record where class_id={!r}".format(session['courseId'])
            dal.SQLHelper.modify(sql)
            # 插入
            for li in form.teacher.data:
                sql = "insert into teach_record(class_id,tchr_id)" \
                      "values ({!r},{!r});".format(session['courseId'], li)
                dal.SQLHelper.modify(sql)

        # 更新上课时间
        if not operator.eq(session['time'], form.time.data):
            # 删除
            sql = "delete from time_record where class_id={!r}".format(session['courseId'])
            dal.SQLHelper.modify(sql)
            # 插入
            for li in form.time.data:
                sql = "insert into time_record(class_id, class_time) " \
                      "values ({!r},{!r});".format(session['courseId'], li)
                dal.SQLHelper.modify(sql)

        # 更新上课学院
        if not operator.eq(session['school'], form.school.data):
            # 删除
            sql = "delete from school_list where class_id={!r}".format(session['courseId'])
            dal.SQLHelper.modify(sql)
            # 插入
            for li in form.school.data:
                sql = "insert into school_list(class_id, class_target_school) " \
                      "values ({!r},{!r});".format(session['courseId'], li)
                dal.SQLHelper.modify(sql)

        # 更新上课年级
        if not operator.eq(session['grade'], form.grade.data):
            # 删除
            sql = "delete from grade_list where class_id={!r}".format(session['courseId'])
            dal.SQLHelper.modify(sql)
            # 插入
            for li in form.grade.data:
                sql = "insert into grade_list(class_id, class_target_grade)" \
                      "values ({!r},{!r});".format(session['courseId'], li)
                dal.SQLHelper.modify(sql)

        # 更新学生选课
        if not (operator.eq(session['time'], form.time.data)
                and operator.eq(session['start'], form.start.data)
                and operator.eq(session['end'], form.end.data)
                and session['capacity'] <= form.capacity.data):
            sql = "delete  from enroll_record " \
                  "where class_id={!r}".format(session['courseId'])
            dal.SQLHelper.modify(sql)
            sql = "update class_info " \
                  "set class_current_enroll_count=0 " \
                  "where class_id={!r}".format(session['courseId'])
            dal.SQLHelper.modify(sql)

        flash('课程（{}·{}）修改成功'.format(form.id.data, form.name.data), 'alert-info')
        return redirect(url_for('main.courseInfo'))

    # 重定向
    if 'courseId' in request.args:
        session['courseId'] = request.args['courseId']
        return redirect(url_for('main.courseEdit'))

    # 原本的数据
    if session['courseId']:
        sql = "select class_name, class_credit, class_room, class_capacity, " \
              "class_start_week, class_end_week " \
              "from class_info " \
              "where class_id={!r}".format(session['courseId'])
        rows = dal.SQLHelper.fetch_one(sql)
        form.id.data = session['courseId']
        form.name.data = rows[0]
        form.credit.data = rows[1]
        form.room.data = rows[2]
        session['capacity'] = form.capacity.data = rows[3]
        session['start'] = form.start.data = rows[4]
        session['end'] = form.end.data = rows[5]
        session['teacher'] = form.teacher.data = []
        session['time'] = form.time.data = []
        session['grade'] = form.grade.data = []
        session['school'] = form.school.data = []

        # 教师
        sql = "select tr.tchr_id from class_info ci " \
              "join teach_record tr on ci.class_id = tr.class_id " \
              "join teacher_list tl on tr.tchr_id = tl.tchr_id " \
              "where ci.class_id={!r};".format(session['courseId'])
        teachers = dal.SQLHelper.fetch_all(sql)
        for teacher in teachers:
            form.teacher.data.append(teacher[0])

        # 时间
        sql = "select class_time from class_info ci " \
              "join time_record tr on ci.class_id = tr.class_id " \
              "where ci.class_id = {!r};".format(session['courseId'])
        times = dal.SQLHelper.fetch_all(sql)
        for time in times:
            form.time.data.append(time[0])

        # 学院
        sql = "select class_target_school from class_info ci " \
              "join school_list sl on ci.class_id = sl.class_id " \
              "where ci.class_id={!r};".format(session['courseId'])
        schools = dal.SQLHelper.fetch_all(sql)
        for school in schools:
            form.school.data.append(school[0])

        # 年级
        sql = "select class_target_grade from class_info ci " \
              "join grade_list gl on ci.class_id = gl.class_id " \
              "where ci.class_id = {!r}".format(session['courseId'])
        grades = dal.SQLHelper.fetch_all(sql)
        for grade in grades:
            form.grade.data.append(grade[0])

    return render_template('courseEdit.html', form=form)


# 教师信息
@main.route('/teacherInfo', methods=['GET', 'POST'])
@login_required
@admin_required
def teacherInfo():
    form = AdminPasswordForm()
    if 'teacherId' in request.args:
        teacherId = request.args['teacherId']
        sql = "select tchr_name from teacher_list where tchr_id={!r};".format(teacherId)
        row = dal.SQLHelper.fetch_one(sql)

        # 删除老师对应的课程
        sql = "select class_id from teach_record where tchr_id={!r};".format(teacherId)
        rows = dal.SQLHelper.fetch_all(sql)
        for row in rows:
            sql = "delete from class_info where class_id={!r};".format(row[0])
            dal.SQLHelper.modify(sql)

        sql = "delete from user_login_info where usr_id={0!r};".format(teacherId)
        dal.SQLHelper.modify(sql)
        flash('老师({}·{})删除成功'.format(teacherId, row[0]), 'alert-warning')

        return redirect(url_for('main.teacherInfo'))
    if form.validate_on_submit():
        if form.admin.data != current_user.password:
            print(current_user.password)
            print(form.password.data)
            session['message'] = "管理员密码错误！"
            return redirect(url_for('main.teacherInfo') + "#modal")
        else:
            # 修改数据库密码
            sql = "update user_login_info " \
                  "set usr_pwd={!r} " \
                  "where usr_id={!r};".format(form.password.data, form.id.data)
            dal.SQLHelper.modify(sql)
            sql = "select tchr_name from teacher_list where tchr_id={!r};".format(form.id.data)
            row = dal.SQLHelper.fetch_one(sql)
            flash("老师（{}·{}）密码修改成功".format(form.id.data, row[0]), 'alert-info')
            print(form.id.data)

    elif form.is_submitted():
        print(form.id.data)
        print(form.password.data)
        session['message'] = list(form.errors.values())[0][0]
        return redirect(url_for('main.teacherInfo') + "#modal")

    sql = "select t1.usr_id,t2.tchr_name,t2.tchr_school,t2.tchr_title,t2.tchr_mail,t1.usr_pwd  " \
          "from user_login_info t1 " \
          "join teacher_list t2 on t1.usr_id=t2.tchr_id;"
    teacherLists = dal.SQLHelper.fetch_all(sql)
    if 'message' in session:
        return render_template('teacherInfo.html', teacherLists=teacherLists, form=form, message=session['message'])
    else:
        return render_template('teacherInfo.html', teacherLists=teacherLists, form=form)


# 添加老师
@main.route('/teacherAdd', methods=['GET', 'POST'])
@login_required
@admin_required
def teacherAdd():
    form = TeacherForm()
    if form.validate_on_submit():
        sql = "select usr_id from user_login_info where usr_id={!r};".format(form.id.data)
        rows = dal.SQLHelper.fetch_one(sql)
        if rows is not None:
            form.id.errors.append('学工号已经存在，请重新填写！')
        else:
            sql = "insert into user_login_info(usr_id, usr_pwd, usr_type) values ({!r},{!r},{!r});".format(
                form.id.data, form.id.data, 1)
            dal.SQLHelper.modify(sql)
            sql = "insert into teacher_list(tchr_id, tchr_name, tchr_school, tchr_title, tchr_mail) values ({!r}," \
                  "{!r},{!r},{!r},{!r});".format(form.id.data, form.name.data, form.school.data, form.title.data,
                                                 form.email.data)
            dal.SQLHelper.modify(sql)
            flash('老师（{}·{}）添加成功'.format(form.id.data, form.name.data), 'alert-success')
            return redirect(url_for('main.teacherInfo'))
    return render_template('teacherAdd.html', form=form)


# 编辑教师
@main.route('/teacherEdit', methods=['GET', 'POST'])
@login_required
@admin_required
def teacherEdit():
    form = TeacherEditForm()
    if form.validate_on_submit():
        form.id.data = session['teacherId']
        sql = "update teacher_list " \
              "set tchr_school = {!r},tchr_title={!r},tchr_mail={!r} " \
              "where tchr_id={!r};".format(form.school.data, form.title.data, form.email.data,
                                           session['teacherId'])
        print(form.school.data, form.title.data, form.email.data, session['teacherId'])
        dal.SQLHelper.modify(sql)
        flash('老师（{}·{}）修改成功'.format(session['teacherId'], session['name']), 'alert-info')
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
        session['name'] = form.name.data = rows[1]
        form.school.data = rows[2]
        form.title.data = rows[3]
        form.email.data = rows[4]
    return render_template('teacherEdit.html', form=form)


# 学生信息
@main.route('/studentInfo', methods=['GET', 'POST'])
@login_required
@admin_required
def studentInfo():
    form = AdminPasswordForm()
    if 'studentId' in request.args:
        studentId = request.args['studentId']

        # 更新数据库课程容量
        sql = "select class_id from enroll_record where stu_id={!r}".format(studentId)
        rows = dal.SQLHelper.fetch_all(sql)
        for row in rows:
            sql = "update class_info " \
                  "set class_current_enroll_count=class_current_enroll_count-1 " \
                  "where class_id={!r}".format(row[0])
            dal.SQLHelper.modify(sql)

        sql = "select stu_name from student_list where stu_id={!r};".format(studentId)
        row = dal.SQLHelper.fetch_one(sql)
        sql = "delete from user_login_info where usr_id={0!r};".format(studentId)
        dal.SQLHelper.modify(sql)
        flash('学生（{}·{}）删除成功'.format(studentId, row[0]), 'alert-warning')
        return redirect(url_for('main.studentInfo'))

    if form.validate_on_submit():
        if form.admin.data != current_user.password:
            print(current_user.password)
            print(form.password.data)
            session['message'] = "管理员密码错误！"
            return redirect(url_for('main.studentInfo') + "#modal")
        else:
            # TODO:修改数据库密码
            sql = "update user_login_info " \
                  "set usr_pwd={!r} " \
                  "where usr_id={!r};".format(form.password.data, form.id.data)
            dal.SQLHelper.modify(sql)
            print(form.id.data)
            sql = "select stu_name from student_list where stu_id={!r};".format(form.id.data)
            row = dal.SQLHelper.fetch_one(sql)
            flash("学生（{}·{}）密码修改成功".format(form.id.data, row[0]), 'alert-info')

    elif form.is_submitted():
        print(form.id.data)
        print(form.password.data)
        session['message'] = list(form.errors.values())[0][0]
        return redirect(url_for('main.studentInfo') + "#modal")

    sql = "select t1.usr_id,t2.stu_name,t2.stu_school,t2.stu_grade,t2.stu_mail,t1.usr_pwd  " \
          "from user_login_info t1 " \
          "join student_list t2 on t1.usr_id=t2.stu_id;"
    studentLists = dal.SQLHelper.fetch_all(sql)

    if 'message' in session:
        return render_template('studentInfo.html', studentLists=studentLists, form=form, message=session['message'])
    else:
        return render_template('studentInfo.html', studentLists=studentLists, form=form)


# 添加学生
@main.route('/studentAdd', methods=['GET', 'POST'])
@login_required
@admin_required
def studentAdd():
    form = StudentForm()
    if form.validate_on_submit():
        sql = "select usr_id from user_login_info where usr_id={!r};".format(form.id.data)
        rows = dal.SQLHelper.fetch_one(sql)
        if rows is not None:
            form.id.errors.append('学工号已经存在，请重新填写！')
        else:
            sql = "insert into user_login_info(usr_id, usr_pwd, usr_type) values ({!r},{!r},{!r});".format(
                form.id.data, form.id.data, 2)
            dal.SQLHelper.modify(sql)
            sql = "insert into student_list(stu_id, stu_name, stu_school, stu_grade, stu_mail) values ({!r}," \
                  "{!r},{!r},{!r},{!r});".format(form.id.data, form.name.data, form.school.data, form.grade.data,
                                                 form.email.data)
            dal.SQLHelper.modify(sql)
            flash('学生（{}·{}）添加成功'.format(form.id.data, form.name.data), 'alert-success')
            return redirect(url_for('main.studentInfo'))
    return render_template('studentAdd.html', form=form)


# 编辑学生
@main.route('/studentEdit', methods=['GET', 'POST'])
@login_required
@admin_required
def studentEdit():
    form = StudentEditForm()
    if form.validate_on_submit():
        form.id.data = session['studentId']
        sql = "update student_list " \
              "set stu_school = {!r},stu_grade={!r},stu_mail={!r} " \
              "where stu_id={!r};".format(form.school.data, form.grade.data, form.email.data,
                                          session['studentId'])
        print(form.school.data, form.grade.data, form.email.data, session['studentId'])
        dal.SQLHelper.modify(sql)
        flash('学生（{}·{}）修改成功'.format(session['studentId'], session['name']), 'alert-info')
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
        session['name'] = form.name.data = rows[1]
        form.school.data = rows[2]
        form.grade.data = rows[3]
        form.email.data = rows[4]
    return render_template('studentEdit.html', form=form)


# 修改密码
@main.route('/passwordEdit', methods=['GET', 'POST'])
@login_required
def passwordEdit():
    form = PasswordForm()
    if form.validate_on_submit():
        if form.old.data != current_user.password:
            form.old.errors.append('密码错误，请重新输入！')
        else:
            # 修改数据库密码
            sql = "update user_login_info " \
                  "set usr_pwd={!r} " \
                  "where usr_id={!r};".format(form.password.data, current_user.id)
            dal.SQLHelper.modify(sql)
            # 修改current_user.password
            current_user.password = form.password.data
            flash('{}的密码修改成功'.format(current_user.name), 'alert-info')

            back = request.args.get('back')
            if back is None or not back.startswith('/'):
                back = url_for('main.index')
            return redirect(back)

            # return redirect(url_for('main.index'))
    return render_template('passwordEdit.html', form=form)


# 课程页面
@main.route('/course', methods=['GET', 'POST'])
@login_required
@admin_required
def course():
    list = {}
    if 'courseId' in request.args:
        sql = "select distinct class_info.class_id, class_credit, class_room, class_capacity, " \
              "class_current_enroll_count," \
              "class_start_week,class_end_week " \
              "from class_info " \
              "where class_info.class_id={!r}".format(request.args['courseId'])
        row = dal.SQLHelper.fetch_one(sql)
        list = {'id': row[0], 'credit': row[1], 'room': row[2], 'capacity': row[3],
                'current': row[4], 'grade': [], 'school': [], 'teacher': [], 'time': [],
                'week': "{}-{}".format(row[5], row[6])}
        sql = "select tchr_name from class_info ci " \
              "join teach_record tr on ci.class_id = tr.class_id " \
              "join teacher_list tl on tr.tchr_id = tl.tchr_id " \
              "where ci.class_id={!r};".format(row[0])
        teachers = dal.SQLHelper.fetch_all(sql)
        for teacher in teachers:
            list['teacher'].append(teacher[0])

        sql = "select class_target_school " \
              "from school_list where class_id={!r}".format(row[0])
        schools = dal.SQLHelper.fetch_all(sql)
        for school in schools:
            list['school'].append(school[0])

        sql = "select class_target_grade " \
              "from grade_list where class_id={!r}".format(row[0])
        grades = dal.SQLHelper.fetch_all(sql)
        for grade in grades:
            list['grade'].append(grade[0])

        sql = "select class_time from class_info ci " \
              "join time_record tr on ci.class_id = tr.class_id " \
              "where ci.class_id= {!r};".format(row[0])
        times = dal.SQLHelper.fetch_all(sql)
        for time in times:
            list['time'].append(
                "星期{} {}-{}".format(week_list[time[0] // 6], 2 * (time[0] % 6) + 1, 2 * (time[0] % 6 + 1)))
    return render_template('course.html', list=list)
