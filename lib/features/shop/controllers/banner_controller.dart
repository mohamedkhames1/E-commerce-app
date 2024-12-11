import 'package:get/get.dart';
import 'package:t_store/data/repositories/categores/banner_repositories.dart';
import 'package:t_store/features/shop/models/banner/banner_model.dart';
import 'package:t_store/utils/popups/loaders.dart';

class BannerController extends GetxController {
  final isLoading = false.obs;
  final bannerRepository = Get.put(BannerRepository());
  RxList<BannerModel> banners = <BannerModel>[].obs;
  int caruntpage = 0;
  void changepage(int index) {
    caruntpage = index;
    update();
  }

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  Future<void> fetchBanners() async {
    try {
      isLoading.value = true;
      final banner = await bannerRepository.getBanners();
      banners.assignAll(banner);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oops!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
