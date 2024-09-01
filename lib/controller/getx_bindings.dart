import 'package:get/get.dart';

import 'package:getx_student_record/controller/getxControllers/add_controller.dart';
import 'package:getx_student_record/controller/getxControllers/edit_controller.dart';
import 'package:getx_student_record/controller/getxControllers/student_data_controller.dart';

class Intailization implements Bindings {
  @override
  void dependencies() {
    Get.put<Addcontroller>(Addcontroller());
    Get.put<EditController>(EditController());
    Get.put<StudentController>(StudentController());
  }
}
