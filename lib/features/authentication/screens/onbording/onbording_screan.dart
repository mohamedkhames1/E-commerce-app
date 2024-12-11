import 'package:flutter/material.dart';

import 'widgets/onbording_body.dart';

class OnbordingScreen extends StatelessWidget {
  const OnbordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: OnbordingBody(),
      ),
    );
  }
}
