import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:prueba_tecnica_dismac/app/ui/pages/details/controller.dart/details_controller.dart';

import '../global_controller/global_controller.dart';
import '../pages/details/details_page.dart';
import '../pages/favorites/controller/favorites_controller.dart';
import '../pages/favorites/favorites_page.dart';
import '../pages/home/controller/home_controller.dart';
import '../pages/home/home_page.dart';
import '../pages/root/controller/root_controller.dart';
import '../pages/root/root_page.dart';
import '../pages/search/controller/search_page_controller.dart';
import '../pages/search/search_page.dart';
import '../pages/splash/controller/splash_controller.dart';
import '../pages/splash/splash_page.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> get getAppicationRoutes => {
        SplashPage.routerPage: (_) => const SplashPage(),
        RootPage.routerPage: (_) => const RootPage(),
        HomePage.routerPage: (_) => const HomePage(),
        SearchPage.routerPage: (_) => const SearchPage(),
        FavoritesPage.routerPage: (_) => const FavoritesPage(),
        DetailsPage.routerPage: (_) => const DetailsPage(),
      };

  static List<SingleChildWidget> get providers => [
        ChangeNotifierProvider(create: (_) => SplashController()),
        ChangeNotifierProvider(create: (_) => GlobalController()),
        ChangeNotifierProvider(create: (_) => RootController()),
        ChangeNotifierProvider(create: (_) => HomeController()),
        ChangeNotifierProvider(create: (_) => FavoritesController()),
        ChangeNotifierProvider(create: (_) => SearchPageController()),
        ChangeNotifierProvider(create: (_) => DetailsController()),
      ];
}
