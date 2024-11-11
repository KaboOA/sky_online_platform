// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/platform_cubit.dart';
import '../../bloc/platform_states.dart';
import '../../constants/components.dart';
import '../../constants/constants.dart';
import '../../network/local/shared_pref_helper.dart';
import '../onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({
    super.key,
    required this.cubit,
  });

  PlatformCubit cubit;
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      SharedPrefHelper.getData('isOnBoardingDone') == null
          ? const Duration(seconds: 4)
          : const Duration(milliseconds: 3500),
    ).then((value) {
      if (SharedPrefHelper.getData('isOnBoardingDone') == null) {
        Components.pushReplacement(
          context: context,
          widget: const SkyPlatformIntro(),
        ); //const OnBoardingScreen());
      } else {
        Components.pushReplacement(
          context: context,
          widget: const Scaffold(
            body: Text('SKKKKY!!!'),
          )
          /*(Constants.userBox.isNotEmpty
              ? HomeLayout(
                  cubit: widget.cubit,
                  isQuiz: false,
                  isFirstTime: true,
                  pageController: PageController(initialPage: 0),
                )
              : LoginPage())
              */
          ,
        ); //const OnBoard
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PlatformCubit, PlatformStates>(
        builder: (context, state) {
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      Constants.appIcon,
                    ),
                    const Text(
                      'Sky Online Platform',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
                const Spacer(),
                Opacity(
                  opacity: 0.5,
                  child: Image.asset(
                    width: 100.0,
                    height: 100.0,
                    widget.cubit.isDarkMode
                        ? Constants.codLogoDark
                        : Constants.codLogoLight,
                  ),
                ),
                const SizedBox(height: 16.0),
                /*
                if (SharedPrefHelper.getData('isOnBoardingDone') == null)
                  SizedBox(
                    width: 0.0,
                    height: 0.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, i) => CachedNetworkImage(
                        imageUrl: i == Components.boardings.length
                            ? Constants.koraiemPhoto
                            : Components.boardings[i].image!,
                        width: 0.0,
                        height: 0.0,
                      ),
                      itemCount: Components.boardings.length + 1,
                    ),
                  ),
                  */
              ],
            ),
          );
        },
      ),
    );
  }
}
