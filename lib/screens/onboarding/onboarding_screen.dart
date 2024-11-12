// ignore_for_file: must_be_immutable
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sky_online_platform/bloc/platform_cubit.dart';
import 'package:sky_online_platform/bloc/platform_states.dart';
import 'package:sky_online_platform/constants/colors.dart';
import 'package:sky_online_platform/constants/constants.dart';

import '../../constants/components.dart';
import '../../network/local/shared_pref_helper.dart';
import '../auth/login/login_screen.dart';

class SkyPlatformIntro extends StatefulWidget {
  const SkyPlatformIntro({super.key});

  @override
  _SkyPlatformIntroState createState() => _SkyPlatformIntroState();
}

class _SkyPlatformIntroState extends State<SkyPlatformIntro> {
  final PageController _pageController = PageController();
  double _pageOffset = 0;
  int pageIdx = 0;
  final List<Widget> _screens = [
    // Welcome Screen
    Container(
      padding: const EdgeInsets.all(20),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Welcome!",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "In Sky Online Platform...\nLet's take a look!",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 18),
          ),
          //    SizedBox(height: 60),
        ],
      ),
    ),

    // Teacher Screen
    Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Teacher",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(child: Text("GIF")),
          ),
          const SizedBox(height: 20),
          const Text(
            "Description about the teacher goes here. This is a placeholder text for demo.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
          //  const SizedBox(height: 60),
        ],
      ),
    ),

    // Lectures Screen
    Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Lectures",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(child: Text("GIF")),
          ),
          const SizedBox(height: 20),
          const Text(
            "Description about the teacher goes here. This is a placeholder text for demo.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
          //   const SizedBox(height: 60),
        ],
      ),
    ),

    // Quizs Screen
    Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Quizs",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(child: Text("GIF")),
          ),
          const SizedBox(height: 20),
          const Text(
            "Description about the teacher goes here. This is a placeholder text for demo.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
          //   const SizedBox(height: 60),
        ],
      ),
    ),

    // Wallet Screen
    Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Wallet",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(child: Text("GIF")),
          ),
          const SizedBox(height: 20),
          const Text(
            "Description about the teacher goes here. This is a placeholder text for demo.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
          //  const SizedBox(height: 60),
        ],
      ),
    ),

    // Let`s Get Started Screen
    Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Let`s Get Started",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(child: Text("GIF")),
          ),
          const SizedBox(height: 20),
          const Text(
            "Description about the teacher goes here. This is a placeholder text for demo.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
          //  const SizedBox(height: 60),
        ],
      ),
    ),
  ];
  bool isLast = false;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _pageOffset = _pageController.page ?? 0;
      });
    });
  }

  void _goToNextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 2000),
      curve: Curves.fastEaseInToSlowEaseOut,
    );
    pageIdx++;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlatformCubit, PlatformStates>(
      builder: (context, state) {
        var cubit = PlatformCubit.get(context);
        return SafeArea(
          child: Scaffold(
            body: Stack(
              children: [
                // Background clouds
                // red cloud
                Positioned(
                  left: 0,
                  top: MediaQuery.sizeOf(context).height / 1.5,
                  child: Opacity(
                    opacity: 0.5,
                    child: Image.asset(Constants.redCloud, width: 180),
                  ),
                ),

                // blue cloud
                Positioned(
                  right: 0,
                  top: MediaQuery.sizeOf(context).height / 1.4,
                  child: Opacity(
                    opacity: 0.5,
                    child: Image.asset(Constants.blueCloud, width: 180),
                  ),
                ),

                // stars
                Positioned(
                  right: 20,
                  top: MediaQuery.sizeOf(context).height / 1.55,
                  child: Image.asset(
                      cubit.isDarkMode
                          ? Constants.starDark
                          : Constants.starLight,
                      width: 20),
                ),
                Positioned(
                  right: 40,
                  top: (MediaQuery.sizeOf(context).height / 1.55) + 20,
                  child: Image.asset(
                      cubit.isDarkMode
                          ? Constants.starDark
                          : Constants.starLight,
                      width: 15),
                ),
                Positioned(
                  left: 20,
                  top: MediaQuery.sizeOf(context).height / 1.2,
                  child: Image.asset(
                      cubit.isDarkMode
                          ? Constants.starDark
                          : Constants.starLight,
                      width: 20),
                ),
                Positioned(
                  left: 40,
                  top: (MediaQuery.sizeOf(context).height / 1.2) + 20,
                  child: Image.asset(
                      cubit.isDarkMode
                          ? Constants.starDark
                          : Constants.starLight,
                      width: 15),
                ),

                // PageView for screens
                PageView(
                  scrollDirection: Axis.vertical,
                  onPageChanged: (index) {
                    pageIdx = index;
                    if (pageIdx == _screens.length - 1) {
                      isLast = true;
                      setState(() {});
                    } else {
                      isLast = false;
                      setState(() {});
                    }
                  },
                  controller: _pageController,
                  children: _screens,
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                if (pageIdx == _screens.length - 1) {
                  Components.push(
                    context: context,
                    widget: LoginScreen(),
                  );
                  // submit();
                  debugPrint('last!');
                } else {
                  _goToNextPage();
                }
              },
              label: isLast
                  ? const Row(
                      children: [
                        Text('Let`s Go'),
                        SizedBox(width: 4.0),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 18,
                        )
                      ],
                    )
                  : const SizedBox(),
              extendedPadding: isLast
                  ? const EdgeInsets.symmetric(horizontal: 16.0)
                  : const EdgeInsetsDirectional.only(start: 16.0, end: 8.0),
              backgroundColor: cubit.isDarkMode
                  ? AppColors.lightBborder
                  : AppColors.darkBorder,
              foregroundColor: cubit.isDarkMode ? Colors.black : Colors.white,
              icon: isLast
                  ? const SizedBox()
                  : const Icon(Icons.arrow_forward_ios_rounded),
            ),
          ),
        );
      },
    );
  }

  void submit() {
    SharedPrefHelper.saveData(
      key: 'isOnBoardingDone',
      value: true,
    ).then((value) {
      if (value) {
        Components.pushReplacement(
          context: context,
          widget: LoginScreen(),
        );
      }
    }).catchError((onError) {
      /*
      Widgets.defaultAlertDialog(
        context: context,
        type: QuickAlertType.error,
        isDarkMode: true,
        txt: onError.toString(),
      );
    */
      debugPrint(onError.toString());
    });
  }
}


/*
                // red cloud
                Positioned(
                  left: 0,
                  top: 10 +
                      (_pageOffset *
                          (MediaQuery.sizeOf(context).height /
                              (_screens.length + 1))), // (screens length + 1)

                  child: Opacity(
                    opacity: 0.5,
                    child: Image.asset(Constants.redCloud, width: 150),
                  ),
                ),

                // blue cloud
                Positioned(
                  right: 0,
                  top: 50 +
                      (_pageOffset *
                          (MediaQuery.sizeOf(context).height /
                              (_screens.length +
                                  1))), // Adjust to move clouds down per page

                  child: Opacity(
                    opacity: 0.5,
                    child: Image.asset(Constants.blueCloud, width: 150),
                  ),
                ),

                // stars
                Positioned(
                  right: 20,
                  top: 10 +
                      (_pageOffset *
                          (MediaQuery.sizeOf(context).height /
                              (_screens.length + 1))), // (screens length + 1)

                  child: Image.asset(
                      cubit.isDarkMode
                          ? Constants.starDark
                          : Constants.starLight,
                      width: 20),
                ),
                Positioned(
                  right: 40,
                  top: 30 +
                      (_pageOffset *
                          (MediaQuery.sizeOf(context).height /
                              (_screens.length + 1))), // (screens length + 1)

                  child: Image.asset(
                      cubit.isDarkMode
                          ? Constants.starDark
                          : Constants.starLight,
                      width: 15),
                ),
                Positioned(
                  left: 20,
                  top: 120 +
                      (_pageOffset *
                          (MediaQuery.sizeOf(context).height /
                              (_screens.length +
                                  1))), // Adjust to move clouds down per page

                  child: Image.asset(
                      cubit.isDarkMode
                          ? Constants.starDark
                          : Constants.starLight,
                      width: 20),
                ),
                Positioned(
                  left: 40,
                  top: 140 +
                      (_pageOffset *
                          (MediaQuery.sizeOf(context).height /
                              (_screens.length +
                                  1))), // Adjust to move clouds down per page

                  child: Image.asset(
                      cubit.isDarkMode
                          ? Constants.starDark
                          : Constants.starLight,
                      width: 15),
                ),
*/