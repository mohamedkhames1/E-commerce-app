import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'create_signin_buttons.dart';
import '../../../../../../common/auth/widgets/divider_sucial_acount.dart';
import 'heade_line.dart';
import 'remember_forget_password.dart';
import 'text_form_feld.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
        child: Padding(
      padding: EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          HeadLineLogin(),
          SizedBox(height: TSizes.spaceBtwSections),
          TextFormForLogin(),
          SizedBox(height: TSizes.spaceBtwItems),
          RememberAndForgetPassword(),
          SizedBox(height: TSizes.spaceBtwItems),
          SigninAndCreateButtons(),
          SizedBox(height: TSizes.spaceBtwItems),
          DividerAndSucialAcounts()
        ],
      ),
    ));
  }
}
