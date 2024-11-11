// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sky_online_platform/constants/colors.dart';
import '../generated/l10n.dart';
import 'styles.dart';

class Widgets {}

class DefaultWaitedButton extends StatelessWidget {
  DefaultWaitedButton({
    super.key,
    required this.isLoading,
    required this.onPressed,
    required this.txt,
    this.width,
    required this.isDarkMode,
  });
  bool isLoading;
  void Function() onPressed;
  String txt;
  double? width;
  bool isDarkMode;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: DefaultButton(
        isDarkMode: isDarkMode,
        onPressed: onPressed,
        width: width,
        child: isLoading
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    width: 20.0,
                    height: 20.0,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2.8,
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Text(
                    S.of(context).loading,
                    textAlign: TextAlign.center,
                    style:
                        AppTextStyles.body2Style.copyWith(color: Colors.white),
                  ),
                ],
              )
            : Text(
                txt,
                textAlign: TextAlign.center,
                style: AppTextStyles.body2Style.copyWith(color: Colors.white),
              ),
      ),
    );
  }
}

class DefaultButton extends StatelessWidget {
  DefaultButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.width,
    required this.isDarkMode,
    this.color,
  });
  Widget child;
  void Function() onPressed;
  double? width;
  bool isDarkMode;
  Color? color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: color ?? AppColors.appPrimaryColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: child,
      ),
    );

    /*MaterialButton(
      onPressed: onPressed,
      color: AppColors.defaultAppColor,
      height: 50.0,
      child: Text(
        txt,
        style: const TextStyle(color: Colors.white, fontSize: 18.0),
      ),
    );
    */
  }
}

class DefaultTextField11 extends StatelessWidget {
  DefaultTextField11({
    super.key,
    required this.type,
    required this.label,
    required this.controller,
    this.textInputAction = TextInputAction.next,
    required this.errStr,
    this.enabled = true,
    this.isPassword = false,
    this.onChanged,
    this.onSubmit,
    this.suffixIcon,
    this.maxLength,
    this.maxLines,
    this.height,
    this.textAlign,
    required this.isDarkMode,
  });
  TextInputType? type;
  TextEditingController controller;
  String label;
  String errStr;
  TextInputAction textInputAction;
  Widget? suffixIcon;
  bool isPassword;
  bool enabled;
  int? maxLength;

  int? maxLines;
  void Function(String)? onSubmit;
  void Function(String)? onChanged;
  TextAlign? textAlign;
  double? height;
  bool isDarkMode;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onSubmit,
      enabled: enabled,
      textAlign: textAlign ?? TextAlign.start,
      textAlignVertical: TextAlignVertical.center,
      maxLength: maxLength,
      keyboardType: type,
      controller: controller,
      maxLines: maxLines ?? 1,
      style: AppTextStyles.body2Style,
      onChanged: onChanged,
      validator: (value) {
        if (value!.isEmpty) {
          return '$errStr ${S.of(context).is_req}';
        }
        return null;
      },
      obscureText: isPassword,
      textInputAction: textInputAction,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        counterText: '',
        contentPadding: EdgeInsetsDirectional.symmetric(
          horizontal: 12.0,
          vertical: height ?? 12,
        ),
        hintText: (label),
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        //  label: Text(label),
        fillColor: isDarkMode ? Colors.black : Colors.white,
        suffixIcon: suffixIcon,
        /*
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.appSecondaryColor,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.appSecondaryColor,
            width: 2.0,
          ),
        ),
        */
        //  border: InputBorder.none,
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
      ),
    );
  }
}

class DefaultTextButton extends StatelessWidget {
  DefaultTextButton({
    super.key,
    required this.txt,
    required this.onPressed,
    this.fontSize,
    this.color,
    this.underLine = true,
  });
  String txt;
  double? fontSize;
  void Function() onPressed;
  Color? color;
  bool underLine;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        txt,
        style: AppTextStyles.body2Style.copyWith(
          decoration: underLine ? TextDecoration.underline : null,
          fontSize: fontSize,
          decorationColor: color ?? AppColors.appPrimaryColor,
          color: color ?? AppColors.appPrimaryColor,
        ),
      ),
    );
  }
}
