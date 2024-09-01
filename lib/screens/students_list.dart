import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_student_record/controller/getxControllers/student_data_controller.dart';
import 'package:getx_student_record/database/db_functions.dart';
import 'package:getx_student_record/database/db_model.dart';
import 'package:getx_student_record/screens/edit_students.dart';
import 'package:getx_student_record/screens/profile_screen.dart';

class StudentList extends StatelessWidget {
  const StudentList({super.key});

  @override
  Widget build(BuildContext context) {
    studentController.intialize();
    return Obx(() => ListView.builder(
          itemCount: studentController.studentList.length,
          itemBuilder: (context, index) {
            final student = studentController.studentList[index];

            return Card(
              color: Colors.lightBlue[50],
              margin: const EdgeInsets.all(10),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: FileImage(
                    File(student.imagex),
                  ),
                ),
                title: Text(student.name),
                subtitle: Text(
                  "Class: ${student.classname}",
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.green,
                      ),
                      onPressed: () {
                        Get.to(() => EditScreen(student: student));
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        deletestudent(context, student);
                      },
                    ),
                  ],
                ),
                onTap: () {
                  Get.to(
                    () => StudentDetails(stdetails: student),
                  );
                },
              ),
            );
          },
        ));
  }

  void deletestudent(ctx, StudentModel student) {
    Get.defaultDialog(
        title: 'Delete',
        content: const Text('Do You Want delete the list ?'),
        actions: [
          TextButton(
            onPressed: () {
              detectedYes(ctx, student);
            },
            child: const Text('Yes'),
          ),
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('No'),
          ),
        ]);
  }

  // void detectedYes(ctx, StudentModel student) {
  //   deleteStudent(student.id!);
  //   Get.snackbar(
  //     "Student Record",
  //     "Successfully Deleted",
  //     backgroundColor: Colors.redAccent,
  //     duration: const Duration(seconds: 2),
  //     snackPosition: SnackPosition.BOTTOM,
  //     isDismissible: true,
  //   );
  //   Get.back(closeOverlays: true);
  // }

  void detectedYes(ctx, StudentModel student) {
    deleteStudent(student.id!);
    ScaffoldMessenger.of(ctx).showSnackBar(
      const SnackBar(
        content: Text("Successfully Deleted"),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(10),
        backgroundColor: Colors.redAccent,
        duration: Duration(seconds: 2),
      ),
    );
    Get.back(closeOverlays: true);
  }
}
