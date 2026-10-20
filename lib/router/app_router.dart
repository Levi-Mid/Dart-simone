import 'package:go_router/go_router.dart';

import '../views/detalhes_view.dart';
import '../views/home_view.dart';
import '../views/splash_view.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: '/detalhes',
      builder: (context, state) {
        final dados = state.extra as Map<String, dynamic>;
        return DetalhesView(monitor: dados['monitor'], dia: dados['dia']);
      },
    ),
  ],
);