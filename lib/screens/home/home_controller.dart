import 'package:get/get.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void loadData() async {
    // simulate loading
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
  }
}
