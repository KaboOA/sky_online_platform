import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sky_online_platform/firebase_options.dart';
import 'package:sky_online_platform/generated/l10n.dart';

import 'bloc/platform_cubit.dart';
import 'bloc/platform_states.dart';
import 'constants/colors.dart';
import 'screens/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlatformCubit(),
      child: BlocBuilder<PlatformCubit, PlatformStates>(
        builder: (context, state) {
          var cubit = PlatformCubit.get(context);

          return MaterialApp(
            locale: cubit.isAr ? const Locale('ar') : const Locale('en'),
            themeMode: cubit.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            debugShowCheckedModeBanner: false,
            home: SplashScreen(cubit: cubit),
            theme: ThemeData(
              //  primarySwatch: Colors.amber,
              colorScheme: ThemeData()
                  .colorScheme
                  .copyWith(primary: AppColors.appSecondaryColor),
              useMaterial3: true,
              fontFamily: cubit.isAr ? 'Cairo' : 'Roboto',
              // colorSchemeSeed: AppColors.appSecondaryColor,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
              ),
            ),
            darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
              colorScheme: ThemeData()
                  .colorScheme
                  .copyWith(primary: AppColors.appSecondaryColor),
              scaffoldBackgroundColor: Colors.black,
              textTheme: Typography()
                  .white
                  .apply(fontFamily: cubit.isAr ? 'Cairo' : 'Roboto'),
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.black,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.black,
                  statusBarIconBrightness: Brightness.light,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
