import 'package:flutter/material.dart';
import 'dot_navigation.dart';
import 'next_buttun.dart';
import 'onbording_page_view.dart';
import 'onbording_skip.dart';

class OnbordingBody extends StatelessWidget {
  const OnbordingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        OnbordingPageView(),
        OnbordingSkip(),
        DotNavigation(),
        NextButtunOnbording()
      ],
    );
  }
}
