import 'package:get/get.dart';

class ReadController extends GetxController {
  var chapterId = ''.obs; // 使用.obs将变量变成响应式
  var fictionId = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  void updateValues(String chapterId, String fictionId) {
    chapterId = chapterId; // 更新值1
    fictionId = fictionId; // 更新值2
  }
}
