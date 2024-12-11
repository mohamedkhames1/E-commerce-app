import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/auth/widgets/image_text_categories/image_text_categories.dart';
import 'package:t_store/common/shimmer/t_category_shimmer.dart';
import 'package:t_store/features/shop/controllers/category_controller.dart';
import '../../sub_categores/sub_categores.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return Obx(() {
      if (controller.isLoading.value) {
        return const TCategoryShimmer();
      } else if (controller.featuredCategories.isEmpty) {
        return Center(
          child: Text(
            'There is no categories',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: Colors.white),
          ),
        );
      } else {
        return SizedBox(
          height: 84,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: controller.featuredCategories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final category = controller.featuredCategories[index];
                return TSectionImageText(
                  ontap: () => Get.to(() => const SubCategores()),
                  image: category.image,
                  title: category.name,
                );
              }),
        );
      }
    });
  }
}
