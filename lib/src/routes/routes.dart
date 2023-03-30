import 'package:contratado/src/ui/pages/home_page.dart';
import 'package:contratado/src/ui/pages/login_page.dart';
import 'package:contratado/src/ui/pages/registerContractors_page.dart';
import 'package:contratado/src/ui/pages/registerServiceProvider_page.dart';

var routes = {
  '/': (context) => const LoginPage(),
  '/register/contractor': (context) => const RegisterContractorPage(),
  '/resgiter/service_provider': (context) =>
      const RegisterServiceProviderPage(),
  '/home': (context) => const HomePage()
};
