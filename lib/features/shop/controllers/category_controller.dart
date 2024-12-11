import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/categores/category_repositry.dart';
import 'package:t_store/features/shop/models/category/category_model.dart';
import 'package:t_store/utils/popups/loaders.dart';

class CategoryController extends GetxController {
  static CategoryController get instace => Get.find();
  final isLoading = false.obs;
  final categoryRepository = Get.put(CategoryRepositry());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;
  final db = FirebaseFirestore.instance;
  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    try {
      isLoading.value = true;
      final categories = await categoryRepository.getCategories();
      allCategories.assignAll(categories);
      featuredCategories.assignAll(allCategories
          .where((category) => category.isFeatured && category.parentId.isEmpty)
          .take(8)
          .toList());
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oops!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
