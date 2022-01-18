import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/add_admin.dart';
import 'package:flutter_application_1/Pages/add_course_admin.dart';
import 'package:flutter_application_1/Pages/add_course_core.dart';
import 'package:flutter_application_1/Pages/add_course_elective.dart';
import 'package:flutter_application_1/Pages/add_student.dart';
import 'package:flutter_application_1/Pages/admin_home.dart';
import 'package:flutter_application_1/Pages/list_student.dart';
import 'package:flutter_application_1/Pages/login.dart';
import 'package:flutter_application_1/Pages/manage_student.dart';
import 'package:flutter_application_1/Pages/registered_course.dart';
import 'package:flutter_application_1/Pages/student_home_page.dart';
import 'package:flutter_application_1/Pages/view_avlb_courses.dart';
import 'package:flutter_application_1/Pages/view_courses.dart';

class MyRoutes {
  static const String loginPage = "/loginPage";
  static const String adminHomePage = '/adminHomePage';
  static const String addStudent = '/addStudnet';
  static const String viewStudent = '/viewStudent';
  static const String listStudent = '/listStudent';
  static const String editStudent = '/editStudent';
  static const String addCourse = '/addCourse';
  static const String editCourse = '/editCourse';
  static const String viewCourse = '/viewCourse';
  static const String addAdmin = '/addAdmin';
  static const String studentHomePage = '/studentHomePage';
  static const String addCoreCourse = '/addCoreCourse';
  static const String addElectiveCourse = '/addElectiveCourse';
  static const String viewRegisteredCourse = '/viewRegisteredCourse';
  static const String addAvlbCourses = '/addAvlbCourses';
  static const String viewAvlbCourses = '/viewAvlbCourses';

  static final routes = <String, WidgetBuilder>{
    loginPage: (context) => const LoginPage(),
    adminHomePage: (context) => const AdmHome(),
    addStudent: (context) => const AddStudent(),
    viewStudent: (context) => const ManageStudent(),
    listStudent: (context) => const StuDet(),
    addCourse: (context) => const AddCourseAdm(),
    viewCourse: (context) => const ViewCourses(),
    addAdmin: (context) => const AddAdmin(),
    studentHomePage: (context) => const StuHome(),
    addElectiveCourse: (context) => const AddCourseElective(),
    addCoreCourse: (context) => const AddCourseCore(),
    viewRegisteredCourse: (context) => const RegisteredCourse(),
    viewAvlbCourses: (context) => const ViewAvlbCourses(),
  };
}
