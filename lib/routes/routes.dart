import 'package:contratado/pages/home_page.dart';
import 'package:contratado/pages/login_page.dart';
import 'package:contratado/pages/registerContractors_page.dart';
import 'package:contratado/pages/registerServiceProvider_page.dart';

var routes = {
  '/': (context) => const LoginPage(),
  '/register/contractor': (context) => const RegisterContractorPage(),
  '/resgiter/service_provider': (context) =>
      const RegisterServiceProviderPage(),
  '/Home': (context) => const HomePage()
};
