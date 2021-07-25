import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shop_app/app/modules/product/model/product_m.dart';
import 'package:shop_app/app/service/fireDb.dart';

class ProductController extends GetxController {
  Rx<List<ProductModel>> productList = Rx<List<ProductModel>>([]);
  Future<List<ProductModel>> productRequest() async =>
      await Future.delayed(const Duration(seconds: 1), () => productList.value);

  @override
  void onInit() {
    productList.bindStream(FireDb().productStream());
    super.onInit();
  }
}
