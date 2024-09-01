import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_student_record/const/color.dart';
import 'package:getx_student_record/controller/getxControllers/student_data_controller.dart';
import 'package:getx_student_record/database/db_functions.dart';
import 'package:getx_student_record/screens/add_students.dart';
import 'package:getx_student_record/screens/search_screen.dart';
import 'package:getx_student_record/screens/students_list.dart';

class HomeScreeen extends StatelessWidget {
  const HomeScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    getstudentdata();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          'Students Record',
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => const SeachScreen());
              },
              icon: const Icon(
                Icons.search_rounded,
                color: Colors.black,
              ))
        ],
      ),
      // body: const Column(
      //   children: [
      //     Expanded(child: StudentList()),
      //   ],
      // ),
      body: Obx(
        () {
          if (studentController.studentList.isEmpty) {
            // Display message if no students
            return const Center(
              child: Text(
                'No students added',
                style: TextStyle(fontSize: 18),
              ),
            );
          } else {
            // Display the list of students
            return const StudentList(); // Make sure StudentList uses the controller's data
          }
        },
      ),
      floatingActionButton: Visibility(
        visible: true, // Show the add button
        child: FloatingActionButton(
          backgroundColor: primaryColor,
          shape: const CircleBorder(),
          onPressed: () {
            addstudent(context);
          },
          child: const Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }

  void addstudent(ctx) {
    Navigator.of(ctx)
        .push(MaterialPageRoute(builder: (ctx) => const AddStudentdata()));
  }
}
