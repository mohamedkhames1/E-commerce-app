import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/app_bar/app_bar.dart';
import 'package:t_store/common/auth/widgets/home_background.dart';
import 'package:t_store/common/list_title/setting_menu_title.dart';
import 'package:t_store/common/list_title/user_profile_title.dart';
import 'package:t_store/common/text/section_headline.dart';
import 'package:t_store/data/repositories/authentication/repositories_authenticatio.dart';
import 'package:t_store/features/personalization/screens/address/user_address_screen.dart';
import 'package:t_store/features/personalization/screens/profile/profile.dart';
import 'package:t_store/features/shop/screens/order/order.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class SettingBody extends StatelessWidget {
  const SettingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: HomeBackGround(
        topPadding: .27,
        child: Column(
          children: [
            TAppBar(
              title: Text(
                'Account',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .apply(color: TColors.white),
              ),
            ),
            const SizedBox(
              height: TSizes.defaultSpace / 2,
            ),
            TUserProfileTitle(
              onpressing: () => Get.to(() => const Profile()),
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TSectionHeadline(
                    title: 'Account Settings',
                    showtextbutton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  SettingMenuTitle(
                    icon: Iconsax.safe_home,
                    title: 'My Addresses',
                    subTitle: 'Set shopping delivery address',
                    ontap: () => Get.to(() => const UserAddressScreens()),
                  ),
                  SettingMenuTitle(
                    icon: Iconsax.shopping_cart,
                    title: 'My Cart',
                    subTitle: 'Add ,remove products and move to checkout ',
                    ontap: () {},
                  ),
                  SettingMenuTitle(
                    icon: Iconsax.bag_tick,
                    title: 'My Orders',
                    subTitle: 'in-progress and Completed Orders',
                    ontap: () => Get.to(() => const OrderScreen()),
                  ),
                  SettingMenuTitle(
                    icon: Iconsax.bank,
                    title: 'Bank Account',
                    subTitle: 'Withdraw balance to registered bank account',
                    ontap: () {},
                  ),
                  SettingMenuTitle(
                    icon: Iconsax.discount_shape,
                    title: 'My Coupons',
                    subTitle: 'List of all the discounted coupons',
                    ontap: () {},
                  ),
                  SettingMenuTitle(
                    icon: Iconsax.notification,
                    title: 'Notifications',
                    subTitle: 'Set ony kind of notification message',
                    ontap: () {},
                  ),
                  SettingMenuTitle(
                    icon: Iconsax.security_card,
                    title: 'Account Privacy',
                    subTitle: 'Manage data usage and connected accounts',
                    ontap: () {},
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const TSectionHeadline(
                    title: 'App Settings',
                    showtextbutton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  SettingMenuTitle(
                    icon: Iconsax.document_upload,
                    title: 'Load Data',
                    subTitle: 'Upload Data To Your Cloud Firebase',
                    ontap: () {},
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  SettingMenuTitle(
                    icon: Iconsax.location,
                    title: 'GoLocation',
                    subTitle: 'Set recommendation based on location',
                    trailing: Switch(
                      onChanged: (value) {},
                      value: true,
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  SettingMenuTitle(
                    icon: Iconsax.security_user,
                    title: 'Safe mode',
                    subTitle: 'Search result is safe for all ages',
                    trailing: Switch(
                      onChanged: (value) {},
                      value: false,
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  SettingMenuTitle(
                    icon: Iconsax.image,
                    title: 'HD Imgae Quality',
                    subTitle: 'Set image quality to seen',
                    trailing: Switch(
                      onChanged: (value) {},
                      value: false,
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () =>
                          AuthenticationRepoditry.instance.logOut(),
                      child: const Text('Logout'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
