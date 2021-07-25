import 'package:get/get.dart';
import 'package:shop_app/app/modules/category/model/category_m.dart';
import 'package:shop_app/app/service/fireDb.dart';

class CategoryController extends GetxController {
  Rx<List<CategoryModel>> categoryList = Rx<List<CategoryModel>>([]);
  Future<List<CategoryModel>> categoryRequest() async =>
      await Future.delayed(const Duration(seconds: 3), () => categoryList.value);

  @override
  void onInit() {
    categoryList.bindStream(FireDb().categoryStream());
    super.onInit();
  }
}