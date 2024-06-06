import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourism_app/core/utils/service_locator.dart';
import 'package:tourism_app/features/Auth/data/repos/auth_repo.dart';
import 'package:tourism_app/features/Auth/presentation/view_models/login/login_cubit.dart';
import 'package:tourism_app/features/Auth/presentation/views/login_view.dart';
import 'package:tourism_app/features/home/presentation/views/home_view.dart';
import 'package:tourism_app/features/splash/presentation/views/splash_view.dart';

abstract class Routes {
  static const kloginView = '/kloginView';
  static const khomeView = '/khomeView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: khomeView,
        pageBuilder: (_, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const HomeView(),
            transitionDuration: const Duration(milliseconds: 1000),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c),
          );
        },
      ),
      GoRoute(
        path: kloginView,
        pageBuilder: (_, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: BlocProvider(
              create: (context) => LoginCubit(getIt.get<AuthRepo>()),
              child: const LoginView(),
            ),
            transitionDuration: const Duration(milliseconds: 1000),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c),
          );
        },
      ),
    ],
  );
}
