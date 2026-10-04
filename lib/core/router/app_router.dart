import 'package:go_router/go_router.dart';

import '../../features/maps/presentation/pages/map_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/onboarding_page.dart';
import '../../features/auth/presentation/pages/splash_page.dart';
import '../../features/lands/presentation/pages/register_land_page.dart';
import '../../features/lands/presentation/pages/my_lands_page.dart';
import '../../features/lands/presentation/pages/land_detail_page.dart';
import '../../features/verification/presentation/pages/verification_page.dart';
import '../../features/lands/presentation/pages/land_history_page.dart';
import '../../features/transfers/presentation/pages/transfer_page.dart';
import '../../features/lands/presentation/pages/dispute_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../features/settings/presentation/pages/settings_page.dart';
import '../../features/certificate/presentation/pages/certificate_page.dart';
import '../../features/verification/presentation/pages/qr_scanner_page.dart';


class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/verification',
        builder: (context, state) {
          return const VerificationPage();
        },
      ),

      GoRoute(
        path: '/splash',
        builder: (context, state) {
          return const SplashPage();
        },
      ),

      GoRoute(
        path: '/onboarding',
        builder: (context, state) {
          return const OnboardingPage();
        },
      ),

      GoRoute(
        path: '/login',
        builder: (context, state) {
          return const LoginPage();
        },
      ),

      GoRoute(
        path: '/register',
        builder: (context, state) {
          return const RegisterPage();
        },
      ),

      GoRoute(
        path: '/home',
        builder: (context, state) {
          return const HomePage();
        },
      ),

      GoRoute(
        path: '/map',
        builder: (context, state) {
          return const MapPage();
        },
      ),

      GoRoute(
        path: '/register-land',
        builder: (context, state) {
          return const RegisterLandPage();
        },
      ),

      GoRoute(
        path: '/my-lands',
        builder: (context, state) {
          return const MyLandsPage();
        },
      ),

      GoRoute(
          path: '/land-detail',
          builder: (context, state) {
            final landId = state.extra as String? ?? 'LAND-001';

            return LandDetailPage(
              landId: landId,
            );
          },
      ),

      GoRoute(
        path: '/land-history',
        builder: (context, state) {
          final landId = state.extra as String? ?? 'LAND-001';

          return LandHistoryPage(
            landId: landId,
          );
        },
      ),

    GoRoute(
      path: '/transfer',
      builder: (context, state) {
        final landId = state.extra as String? ?? 'LAND-001';

        return TransferPage(
          landId: landId,
      );
     },
   ),

   GoRoute(
    path: '/dispute',
    builder: (context, state) {
      final landId = state.extra as String? ?? 'LAND-001';
      return DisputePage(landId: landId);
    },
  ),

  GoRoute( path: '/profile', builder: (context, state)
   { return const ProfilePage(); 
      },
    ),

    GoRoute(
      path: '/settings',
      builder: (context, state) {
        return const SettingsPage();
      },
    ),

    GoRoute(
      path: '/certificate',
      builder: (context, state) {
        final landId = state.extra as String? ?? 'LAND-001';
        return CertificatePage(landId: landId);
      },
    ),

    GoRoute(
      path: '/qr-scanner',
      builder: (context, state) {
        return const QrScannerPage();
      },
    ),
    ],
  );
}