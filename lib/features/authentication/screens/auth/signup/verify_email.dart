import 'package:flutter/material.dart';
import 'package:t_store/data/repositories/authentication/repositories_authenticatio.dart';

import 'widgets/verify_emial_body.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key, this.email});
  final String? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () => AuthenticationRepoditry.instance.logOut()),
        ],
      ),
      body: SafeArea(
        child: VerifyEmailBody(
          email: email,
        ),
      ),
    );
  }
}
