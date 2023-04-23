import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/auth_controller.dart';
import 'package:flutter_application_1/responsive/responsive.dart';
import 'package:flutter_application_1/views/mobile/features/features.dart';
import 'package:flutter_application_1/views/web/features/features.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'common.dart';

class AuthChecker extends ConsumerWidget {
  const AuthChecker({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateChangeProvider);

    return authState.when(
        error: (e, tr) =>
            const Responsive(web: WebLandingPage(), mobile: MobileHomePage()),
        loading: (() => const SplashScreen()),
        data: (user) {
          if (user != null) {
            return const Responsive(
                web: WebLandingPage(), mobile: MobileHomePage());
          }

          return const Responsive(
              web: WebLandingPage(), mobile: MobileHomePage());
        });
  }
}
