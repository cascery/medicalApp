import 'package:get/get.dart';

class ExploreController extends GetxController {
  // This can store the search query and other states in the future
  var searchQuery = ''.obs;

  // Update the search query
  void updateSearchQuery(String query) {
    searchQuery.value = query;
  }
}
