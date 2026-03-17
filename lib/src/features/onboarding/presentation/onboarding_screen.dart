import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nexus_english/src/features/onboarding/presentation/onboarding_controller.dart';
import 'package:nexus_english/src/routing/app_router.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 3), () async {
      await ref
          .read(onboardingControllerProvider.notifier)
          .completeOnboarding();

      if (mounted) {
        context.goNamed(AppRoute.dashboard.name);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: _LogoWidget(),
      ),
    );
  }
}

class _LogoWidget extends StatelessWidget {
  const _LogoWidget();

  @override
  Widget build(BuildContext context) {
    // Use Image.asset for a PNG/JPG logo. Ensure the asset is declared in pubspec.yaml.
    return Image.asset(
      'assets/images/logo.png',
      width: 200,
      fit: BoxFit.fitWidth,
      semanticLabel: 'App logo',
    );
  }
}
