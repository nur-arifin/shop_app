import 'package:get/get.dart';
import 'package:shop_app/app/modules/banner/model/banner_m.dart';
import 'package:shop_app/app/service/fireDb.dart';

class BannerController extends GetxController {
  Rx<List<BannerModel>> bannerList = Rx<List<BannerModel>>([]);
  Future<List<BannerModel>> bannerRequest() async =>
      await Future.delayed(const Duration(seconds: 2), () => bannerList.value);

  @override
  void onInit() {
    bannerList.bindStream(FireDb().bannerStream());
    super.onInit();
  }
}
