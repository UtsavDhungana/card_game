import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app/router/app_router.dart';
import 'app/theme/theme_data.dart';
import 'core/constants/configs.dart';
import 'features/login/presentation/cubit/login_cubit.dart';
import 'injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  // await Firebase.initializeApp();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<LoginCubit>(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(
          UiConfig.kWidth,
          UiConfig.kHeight,
        ),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: ((context, child) {
          return MaterialApp(
            title: AppConfig.appName,
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            onGenerateRoute: _appRouter.onGeneratRoute,
            initialRoute: '/',
          );
        }),
      ),
    );
  }
}
