import '../utils/path_provider.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.dashboard,
      page: () => DashbordPage(),
      binding: DashboardBindings(),
    ),
  ];
}
