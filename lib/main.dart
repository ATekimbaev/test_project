import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_project/core/dio/dio_settings.dart';
import 'package:test_project/core/ui_componets/app_colors.dart';
import 'package:test_project/data/repositories/authorization_repository.dart';
import 'package:test_project/presentation/bloc/bloc/auth_bloc.dart';
import 'package:test_project/router/router.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => DioSettings(),
        ),
        RepositoryProvider(
          create: (context) => AuthorizationRepository(
            dio: RepositoryProvider.of<DioSettings>(context).dio,
          ),
        ),
      ],
      child: BlocProvider(
        create: (context) => AuthBloc(
          repository: RepositoryProvider.of<AuthorizationRepository>(context),
        ),
        child: CupertinoApp.router(
          theme: CupertinoThemeData(
            scaffoldBackgroundColor: AppColors.bgGrey,
            textTheme: CupertinoTextThemeData(
              textStyle: GoogleFonts.manropeTextTheme().displayLarge,
            ),
          ),
          routerConfig: AppRouter().config(),
        ),
      ),
    );
  }
}
