import 'package:flutter/material.dart';
import 'package:nexus_english/src/features/dashboard/presentation/home_screen.dart';
import 'package:nexus_english/src/features/facility/presentation/facility_screen.dart';
import 'package:nexus_english/src/features/report/presentation/report_screen.dart';
import 'package:nexus_english/src/features/user/presentation/user_screen.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:nexus_english/src/features/authentication/data/firebase_auth_repository.dart';
import 'package:nexus_english/src/features/authentication/presentation/custom_sign_in_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:nexus_english/src/features/onboarding/data/onboarding_repository.dart';
import 'package:nexus_english/src/features/onboarding/presentation/onboarding_screen.dart';
import 'package:nexus_english/src/routing/go_router_refresh_stream.dart';
import 'package:nexus_english/src/routing/not_found_screen.dart';
import 'package:nexus_english/src/routing/scaffold_with_nested_navigation.dart';

part 'app_router.g.dart';

// private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final _facilityNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'facility');
final _userNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'user');
final _reportNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'report');

enum AppRoute {
  onboarding,
  signIn,
  dashboard,
  facility,
  user,
  report,
}

class AppPath {
  static const onboarding = '/onboarding';
  static const signIn = '/signIn';
  static const dashboard = '/dashboard';
  static const facility = '/facility';
  static const user = '/user';
  static const report = '/report';
}

@riverpod
GoRouter goRouter(Ref ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return GoRouter(
    initialLocation: AppPath.signIn,
    navigatorKey: _rootNavigatorKey,
    //debugLogDiagnostics: true,
    redirect: (context, state) {
      final onboardingRepository =
          ref.read(onboardingRepositoryProvider).requireValue;
      final didCompleteOnboarding = onboardingRepository.isOnboardingComplete();
      final path = state.uri.path;
      if (!didCompleteOnboarding) {
        // Always check state.subloc before returning a non-null route
        // https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/redirection.dart#L78
        if (path != AppPath.onboarding) {
          return AppPath.onboarding;
        }
        return null;
      }
      // region - Hide authentication feature for now, but this is how you would implement it with go_router
      // final isLoggedIn = authRepository.currentUser != null;
      // if (isLoggedIn) {
      //   if (path.startsWith(AppPath.onboarding) || path.startsWith(AppPath.signIn)) {
      //     return AppPath.dashboard;
      //   }
      // } else {
      //   if (path.startsWith(AppPath.onboarding) ||
      //       path.startsWith(AppPath.dashboard) ||
      //       path.startsWith(AppPath.facility) ||
      //       path.startsWith(AppPath.user) ||
      //       path.startsWith(AppPath.report)
      //   ) {
      //     return AppPath.signIn;
      //   }
      // }
      // endregion

      if (path.startsWith(AppPath.onboarding) ||
          path.startsWith(AppPath.signIn)) {
        return AppPath.dashboard;
      }
      return null;
    },
    refreshListenable: GoRouterRefreshStream(authRepository.authStateChanges()),
    routes: [
      GoRoute(
        path: AppPath.onboarding,
        name: AppRoute.onboarding.name,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: OnboardingScreen(),
        ),
      ),
      GoRoute(
        path: AppPath.signIn,
        name: AppRoute.signIn.name,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: CustomSignInScreen(),
        ),
      ),
      // Stateful navigation based on:
      // https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
      StatefulShellRoute.indexedStack(
        pageBuilder: (context, state, navigationShell) => NoTransitionPage(
          child: ScaffoldWithNestedNavigation(navigationShell: navigationShell),
        ),
        branches: [
          StatefulShellBranch(
            navigatorKey: _homeNavigatorKey,
            routes: [
              GoRoute(
                path: AppPath.dashboard,
                name: AppRoute.dashboard.name,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: DashboardScreen(),
                ),
                // routes: [
                //   GoRoute(
                //     path: 'add',
                //     name: AppRoute.addJob.name,
                //     parentNavigatorKey: _rootNavigatorKey,
                //     pageBuilder: (context, state) {
                //       return const MaterialPage(
                //         fullscreenDialog: true,
                //         child: EditJobScreen(),
                //       );
                //     },
                //   ),
                //   GoRoute(
                //     path: ':id',
                //     name: AppRoute.job.name,
                //     pageBuilder: (context, state) {
                //       final id = state.pathParameters['id']!;
                //       return MaterialPage(
                //         child: JobEntriesScreen(jobId: id),
                //       );
                //     },
                //     routes: [
                //       GoRoute(
                //         path: 'entries/add',
                //         name: AppRoute.addEntry.name,
                //         parentNavigatorKey: _rootNavigatorKey,
                //         pageBuilder: (context, state) {
                //           final jobId = state.pathParameters['id']!;
                //           return MaterialPage(
                //             fullscreenDialog: true,
                //             child: EntryScreen(
                //               jobId: jobId,
                //             ),
                //           );
                //         },
                //       ),
                //       GoRoute(
                //         path: 'entries/:eid',
                //         name: AppRoute.entry.name,
                //         pageBuilder: (context, state) {
                //           final jobId = state.pathParameters['id']!;
                //           final entryId = state.pathParameters['eid']!;
                //           final entry = state.extra as Entry?;
                //           return MaterialPage(
                //             child: EntryScreen(
                //               jobId: jobId,
                //               entryId: entryId,
                //               entry: entry,
                //             ),
                //           );
                //         },
                //       ),
                //       GoRoute(
                //         path: 'edit',
                //         name: AppRoute.editJob.name,
                //         pageBuilder: (context, state) {
                //           final jobId = state.pathParameters['id'];
                //           final job = state.extra as Job?;
                //           return MaterialPage(
                //             fullscreenDialog: true,
                //             child: EditJobScreen(jobId: jobId, job: job),
                //           );
                //         },
                //       ),
                //     ],
                //   ),
                // ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _facilityNavigatorKey,
            routes: [
              GoRoute(
                path: AppPath.facility,
                name: AppRoute.facility.name,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: FacilityScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _userNavigatorKey,
            routes: [
              GoRoute(
                path: AppPath.user,
                name: AppRoute.user.name,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: UserScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _reportNavigatorKey,
            routes: [
              GoRoute(
                path: AppPath.report,
                name: AppRoute.report.name,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: ReportScreen(),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
    errorPageBuilder: (context, state) => const NoTransitionPage(
      child: NotFoundScreen(),
    ),
  );
}
