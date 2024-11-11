// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:sky_online_platform/bloc/platform_cubit.dart';
import 'package:sky_online_platform/bloc/platform_states.dart';
import 'package:sky_online_platform/constants/styles.dart';

import '../../../constants/constants.dart';
import '../../../constants/widgets.dart';
import '../../../generated/l10n.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  var fKey = GlobalKey<FormState>();

  TextEditingController codeController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlatformCubit, PlatformStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = PlatformCubit.get(context);
        return Scaffold(
          // backgroundColor:
          //     cubit.isDarkMode ? AppColors.darkBorder : AppColors.lightBborder,
          body: Form(
            key: fKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Stack(
                  children: [
                    // stars

                    const SizedBox(height: 50.0),
                    Positioned(
                      right: 20,
                      child: Image.asset(
                        cubit.isDarkMode
                            ? Constants.starDark
                            : Constants.starLight,
                        width: 20,
                      ),
                    ),
                    Positioned(
                      right: 40,
                      top: 20,
                      child: Image.asset(
                        cubit.isDarkMode
                            ? Constants.starDark
                            : Constants.starLight,
                        width: 15,
                      ),
                    ),
                    Positioned(
                      left: 20,
                      top: 130,
                      child: Image.asset(
                        cubit.isDarkMode
                            ? Constants.starDark
                            : Constants.starLight,
                        width: 20,
                      ),
                    ),
                    Positioned(
                      left: 40,
                      top: 150,
                      child: Image.asset(
                        cubit.isDarkMode
                            ? Constants.starDark
                            : Constants.starLight,
                        width: 15,
                      ),
                    ),
                    Image.asset(
                      Constants.appIcon,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).login,
                        style: AppTextStyles.headStyle,
                      ),
                      const SizedBox(height: 12.0),
                      Text(
                        S.of(context).code,
                        style: AppTextStyles.title2Style,
                      ),
                      const SizedBox(height: 4.0),
                      DefaultTextField11(
                        isDarkMode: cubit.isDarkMode,
                        height: 16.0,
                        controller: codeController,
                        label: S.of(context).enter_your_code,
                        errStr: S.of(context).code,
                        type: TextInputType.number,
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        S.of(context).password,
                        style: AppTextStyles.title2Style,
                      ),
                      const SizedBox(height: 4.0),
                      DefaultTextField11(
                        isDarkMode: cubit.isDarkMode,
                        controller: passwordController,
                        height: 16.0,
                        label: S.of(context).enter_your_password,
                        errStr: S.of(context).password,
                        type: TextInputType.visiblePassword,
                        isPassword: cubit.isSecure,
                        textInputAction: TextInputAction.done,
                        suffixIcon: IconButton(
                          onPressed: () {
                            cubit.changePassSecure();
                          },
                          icon: Icon(
                            cubit.isSecure
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color:
                                cubit.isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      Row(
                        children: [
                          const Spacer(),
                          DefaultTextButton(
                            txt: S.of(context).forget_pass,
                            underLine: false,
                            onPressed: () {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 28.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 28.0),
                        child: DefaultWaitedButton(
                          width: double.infinity,
                          isDarkMode: cubit.isDarkMode,
                          isLoading: isLoading,
                          onPressed: () async {
                            if (fKey.currentState!.validate()) {
                              bool isConnected =
                                  await InternetConnection().hasInternetAccess;
                              if (isConnected) {
                                cubit.platformLogin(
                                  password: passwordController.text,
                                  code: codeController.text,
                                );
                              } else {
                                /*
                                Widgets.defaultAlertDialog(
                                  context: context,
                                  type: QuickAlertType.error,
                                  isDarkMode: PlatformCubit.get(context).isDarkMode,
                                  body: S.of(context).no_internet,
                                  txt: 'مفيش نت يا حزين',
                                );
                                */
                              }
                            }
                          },
                          txt: S.of(context).login,
                        ),
                      ),
                      const SizedBox(height: 28.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            S.of(context).donot_have_acc,
                            style: AppTextStyles.body2Style,
                          ),
                          const SizedBox(width: 4.0),
                          DefaultTextButton(
                            txt: S.of(context).register,
                            underLine: true,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
