import 'package:placement_reminders/features/dashboard/views/screens/login_registration/login.dart';
import 'package:placement_reminders/features/dashboard/views/screens/login_registration/registration.dart';
import 'package:placement_reminders/features/dashboard/views/screens/splashscreen.dart';

import '../../features/dashboard/views/screens/add_company/add_company_screen.dart';
import '../../features/dashboard/views/screens/company_list/company_list_screen.dart';
import '../../features/dashboard/views/screens/dashboard_screen.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

/// contains all configuration pages
class AppPages {
  /// when the app is opened, this page will be the first to be shown
  static const initial = Routes.dashboard;

  static final routes = [
    GetPage(
      name: _Paths.dashboard,
      page: () => const DashboardScreen(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.SplashScreen,
      page: () => const SplashScreen(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.LoginPage,
      page: () => const LoginPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.AddCompanyScreen,
      page: () => const AddCompanyScreen(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.CompanyListScreen,
      page: () => const CompanyListScreen(),
      binding: DashboardBinding(),
    ),
  ];
}
