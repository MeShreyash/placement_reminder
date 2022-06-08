part of 'app_pages.dart';

/// used to switch pages
class Routes {
  static const SplashScreen = _Paths.SplashScreen;
  static const dashboard = _Paths.dashboard;
}

/// contains a list of route names.
// made separately to make it easier to manage route naming
class _Paths {
  static const dashboard = '/dashboard';
  static const SplashScreen = '/splash';
  static const LoginPage = '/login';
  static const RegistrationPage = '/registration';
  static const AddCompanyScreen = '/addcompany';
  static const CompanyListScreen = '/companylist';

  // Example :
  // static const index = '/';

  // static const product = '/product';
}
