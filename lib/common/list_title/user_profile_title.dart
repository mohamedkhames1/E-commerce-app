import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/personalization/controller/user/user_controller.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';

class TUserProfileTitle extends StatelessWidget {
  const TUserProfileTitle({
    super.key,
    this.onpressing,
  });

  final VoidCallback? onpressing;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: const Image(
        image: AssetImage(TImages.user),
      ),
      title: Text(
        controller.user.value.fullName,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: TColors.white),
      ),
      subtitle: Text(
        controller.user.value.email,
        style:
            Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),
      ),
      trailing: IconButton(
        onPressed: onpressing,
        icon: const Icon(Iconsax.edit, color: TColors.white),
      ),
    );
  }
}
