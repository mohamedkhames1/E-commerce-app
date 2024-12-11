import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/app_bar/app_bar.dart';
import 'package:t_store/features/personalization/controller/update_name/update_name_controller.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/validators/validation.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameCotroller());
    return Scaffold(
      appBar: TAppBar(
        showbackarrow: true,
        title: Text(
          'Change Name',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            Text(
              'use real name for easy verification , this name will be apper in severial pages',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            Form(
                key: controller.formstate,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.firstName,
                      validator: (value) =>
                          TValidator.validateEmptyTexy('Frist name', value),
                      decoration: const InputDecoration(
                          labelText: 'Frist name',
                          prefixIcon: Icon(Iconsax.user)),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    TextFormField(
                      controller: controller.lastName,
                      validator: (value) =>
                          TValidator.validateEmptyTexy('Last name', value),
                      decoration: const InputDecoration(
                        labelText: 'Frist name',
                        prefixIcon: Icon(Iconsax.user),
                      ),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => controller.updateUserName(),
                        child: const Text('Save'),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
