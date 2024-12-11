import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/auth/widgets/custom_shapes/rounded_image/rounded_image.dart';
import 'package:t_store/common/shimmer/t_shimmer_effect.dart';
import 'package:t_store/common/text/section_headline.dart';
import 'package:t_store/features/personalization/controller/user/user_controller.dart';
import 'package:t_store/features/personalization/screens/profile/widget/t_profile_menu.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'chage_name.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Obx(() {
                    final networkImage = controller.user.value.picture;
                    final image =
                        networkImage.isNotEmpty ? networkImage : TImages.user;
                    return controller.imageUploadig.value
                        ? const TShimmerEffect(
                            width: 80,
                            height: 80,
                            radius: 80,
                          )
                        : TRoundedImage(
                            isNetworkimag: networkImage.isNotEmpty,
                            imageUrl: image,
                            height: 80,
                            width: 80,
                          );
                  }),
                  TextButton(
                      onPressed: () => controller.uploadProfileImage(),
                      child: const Text('Chage Profile Picture'))
                ],
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            const Divider(),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            const TSectionHeadline(
              title: 'Profile Information ',
              showtextbutton: false,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            TProfileMenu(
              title: 'Name',
              subTitle: controller.user.value.fullName,
              onpressing: () => Get.to(() => const ChangeName()),
            ),
            TProfileMenu(
              title: 'Username',
              subTitle: controller.user.value.userName,
              onpressing: () {},
            ),
            const Divider(),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            const TSectionHeadline(
              title: 'Personal Information',
              showtextbutton: false,
            ),
            TProfileMenu(
                title: 'user ID',
                subTitle: controller.user.value.id,
                onpressing: () {},
                icon: Iconsax.copy),
            TProfileMenu(
              title: 'E-mail',
              subTitle: controller.user.value.email,
              onpressing: () {},
            ),
            TProfileMenu(
              title: 'Phone Number ',
              subTitle: controller.user.value.phoneNumber,
              onpressing: () {},
            ),
            TProfileMenu(
              title: 'Gender',
              subTitle: 'Male',
              onpressing: () {},
            ),
            TProfileMenu(
              title: 'Date of Birth',
              subTitle: '25 jun ,2002',
              onpressing: () {},
            ),
            const Divider(),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Center(
              child: TextButton(
                onPressed: () => controller.deleteAccountWaringPopos(),
                child: const Text(
                  'Close Account',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
