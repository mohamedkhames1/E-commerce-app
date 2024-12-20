import 'package:flutter/material.dart';

import 'widgets/forget_password_body.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SafeArea(
        child: ForgetPasswordBody(),
      ),
    );
  }
}
