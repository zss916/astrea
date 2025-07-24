part of 'index.dart';

class FileManagementBinding implements Bindings {
  @override
  void dependencies() => Get.put<FileManagementLogic>(FileManagementLogic());
}
