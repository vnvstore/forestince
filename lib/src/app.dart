import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:force_update_helper/force_update_helper.dart';
import 'package:nexus_english/src/routing/app_router.dart';
import 'package:nexus_english/src/routing/app_startup.dart';
import 'package:nexus_english/src/routing/go_router_delegate_listener.dart';
import 'package:nexus_english/src/shared/utils/alert_dialogs.dart';
import 'package:nexus_english/src/shared/theme/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nexus_english/l10n/app_localizations.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  static const primaryColor = Colors.indigo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      routerConfig: goRouter,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('en'),
      builder: (_, child) {
        // * Important: Use AppStartupWidget to wrap ForceUpdateWidget otherwise you will get this error:
        // * Navigator operation requested with a context that does not include a Navigator.
        // * The context used to push or pop routes from the Navigator must be that of a widget that is a descendant of a Navigator widget.
        return AppStartupWidget(
          onLoaded: (_) => ForceUpdateWidget(
            navigatorKey: goRouter.routerDelegate.navigatorKey,
            forceUpdateClient: ForceUpdateClient(
              // * Real apps should fetch this from an API endpoint or via
              // * Firebase Remote Config
              fetchRequiredVersion: () => Future.value('2.0.0'),
              // * Example ID from this app: https://fluttertips.dev/
              // * To avoid mistakes, store the ID as an environment variable and
              // * read it with String.fromEnvironment
              iosAppStoreId: '6482293361',
            ),
            allowCancel: false,
            showForceUpdateAlert: (context, allowCancel) => showAlertDialog(
              context: context,
              title: 'App Update Required',
              content: 'Please update to continue using the app.',
              cancelActionText: allowCancel ? 'Later' : null,
              defaultActionText: 'Update Now',
            ),
            showStoreListing: (storeUrl) async {
              if (await canLaunchUrl(storeUrl)) {
                await launchUrl(
                  storeUrl,
                  // * Open app store app directly (or fallback to browser)
                  mode: LaunchMode.externalApplication,
                );
              } else {
                log('Cannot launch URL: $storeUrl');
              }
            },
            onException: (e, st) {
              log(e.toString());
            },
            child: GoRouterDelegateListener(child: child!),
          ),
        );
      },
      // Use centralized app theme
      theme: AppTheme.lightTheme(),
      // Keep system/dark theming but provide a simple dark fallback
      themeMode: ThemeMode.system,
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF3F51B5),
          brightness: Brightness.dark,
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
