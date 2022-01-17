import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utils/my_store.dart';
import 'package:flutter_application_1/splash_screen.dart';
import 'package:flutter_application_1/student_home_page.dart';
import 'package:flutter_application_1/add_admin.dart';
import 'package:flutter_application_1/admin_home.dart';
import 'package:flutter_application_1/add_course_admin.dart';
import 'package:flutter_application_1/add_course_core.dart';
import 'package:flutter_application_1/add_course_elective.dart';
import 'package:flutter_application_1/add_student.dart';
import 'package:flutter_application_1/list_student.dart';
import 'package:flutter_application_1/manage_student.dart';
import 'package:flutter_application_1/registered_course.dart';
import 'package:flutter_application_1/view_avlb_courses.dart';
import 'package:flutter_application_1/view_courses.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import 'login.dart';
import 'package:flutter_application_1/Utils/routes.dart';

void main() {
  runApp(VxState(store: MyStore(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const Splash2(),
      routes: {
        MyRoutes.loginPage: (context) => const LoginPage(),
        MyRoutes.adminHomePage: (context) => const AdmHome(),
        MyRoutes.addStudent: (context) => const AddStudent(),
        MyRoutes.viewStudent: (context) => const ManageStudent(),
        MyRoutes.listStudent: (context) => const StuDet(),
        MyRoutes.addCourse: (context) => const AddCourseAdm(),
        MyRoutes.viewCourse: (context) => const ViewCourses(),
        MyRoutes.addAdmin: (context) => const AddAdmin(),
        MyRoutes.studentHomePage: (context) => const StuHome(),
        MyRoutes.addElectiveCourse: (context) => const AddCourseElective(),
        MyRoutes.addCoreCourse: (context) => const AddCourseCore(),
        MyRoutes.viewRegisteredCourse: (context) => const RegisteredCourse(),
        MyRoutes.viewAvlbCourses: (context) => const ViewAvlbCourses(),
      },
    );
  }
}
