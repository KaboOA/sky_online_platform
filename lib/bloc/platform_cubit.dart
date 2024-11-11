import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants/components.dart';
import '../network/local/shared_pref_helper.dart';
import 'platform_states.dart';

class PlatformCubit extends Cubit<PlatformStates> {
  PlatformCubit() : super(PaltformAppInitialState());

  static PlatformCubit get(BuildContext context) => BlocProvider.of(context);

  bool isAr = SharedPrefHelper.getData('isAr') ?? false;
  void changeLang() {
    isAr = !isAr;
    SharedPrefHelper.saveData(key: 'isAr', value: isAr).then((value) {
      emit(PlatformChangeLanguageState());
    }).catchError((onError) {
      debugPrint('Error change lang');
    });
  }

  bool isDarkMode = SharedPrefHelper.getData('isDarkMode') ?? true;
  void changeDarkMode() {
    isDarkMode = !isDarkMode;
    SharedPrefHelper.saveData(key: 'isDarkMode', value: isDarkMode)
        .then((value) {
      emit(PlatformChangeModeState());
    }).catchError((onError) {
      debugPrint('Error change mode');
    });
  }

  // login

  bool isSecure = true;
  void changePassSecure() {
    isSecure = !isSecure;

    emit(PaltformChangePasswordSecureState());
  }

  void platformLogin({
    required String password,
    required String code,
  }) {
    emit(PlatformLoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: '$code@gmail.com',
      password: password,
    )
        .then((value) {
      FirebaseFirestore.instance
          .collection('data')
          .doc('students')
          .collection(Components.getGrade(code[0]))
          .doc(code)
          .get()
          .then((value) {
        emit(PlatformLoginSuccessState());
/*
        debugPrint(value.data().toString());
        Constants.userBox
            .put('user', UserModel.fromJson(value.data()!))
            .then((value) {
          //  isShowDelAccount();
          emit(PlatformLoginSuccessState());
        }).catchError((onError) {
          debugPrint('ahmed ${onError.toString()}');
          emit(PlatformLoginFailState(' ${onError.toString()}'));
        });
        */
      }).catchError((onError) {
        debugPrint('ahmed2 ${onError.toString()}');
        emit(PlatformLoginFailState(onError.toString()));
      });
    }).catchError((onError) {
      debugPrint('ahmed3 ${onError.toString()}');
      emit(PlatformLoginFailState(onError.toString()));
    });
  }
}
