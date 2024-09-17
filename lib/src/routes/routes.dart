import 'package:jaspr_router/jaspr_router.dart';

import '../pages/about.dart';
import '../pages/home.dart';

class WebAppRoutes {
  static final routes = [
    Route(path: '/', title: 'Home', builder: (context, state) => const Home()),
    Route(
        path: '/about',
        title: 'About',
        builder: (context, state) => const About()),
  ];
}
