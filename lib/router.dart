// lib/router.dart

import 'package:go_router/go_router.dart';
import 'package:go_router_deeplinking/main.dart';
import 'package:go_router_deeplinking/news.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
    path: "/",
    builder: (context, state) =>
        const MyHomePage(title: "Flutter Deep linking Demo"),
  ),
  GoRoute(
    path: "/news/:id/:path",
    name: "news",
    builder: (context, state) => NewsPage(
      userId: state.pathParameters["id"].toString(),
      path: state.pathParameters["path"].toString(),
    ),
  )
]);
