import 'package:flutter/material.dart';

class Components {
  static pushReplacement(
      {required BuildContext context, required Widget widget}) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
  }

  static push({required BuildContext context, required Widget widget}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
  }

  static pop({required BuildContext context}) {
    Navigator.of(context).pop();
  }

/*
  static List<BoardingModel> boardings = [
    BoardingModel(
      image: Constants.firstOnBoarding,
      title: 'أهلاَ بيك في منصة\nبِالْعَرَبِيّ',
      body: "#لن_يسبقك_أحد",
    ),
    BoardingModel(
      image: Constants.teacher,
      title: 'بنك الاسئلة',
      body: 'حل اكبر كمية اسئلة من بنك الاسئلة.',
    ),
    BoardingModel(
      image: Constants.lectures,
      title: 'الحصص',
      body: 'تقدر تتفرج علي الحصص براحتك في اي وقت.',
    ),
    BoardingModel(
      image: Constants.questions,
      title: 'الامتحانات',
      body: 'هتمتحن ف اي وقت عن طريق ادخال كود الامتحان.',
    ),
    BoardingModel(
      image: Constants.requests,
      title: 'الاسئلة',
      body: 'تقدر تبعت سؤال للسكرتيرة وترد عليك.',
    ),
    BoardingModel(
      image: Constants.getStatred,
      title: "يلا بينا!",
      body: 'يلا بينا نبدأ.',
    ),
  ];
*/
  static String getGrade(String num) {
    if (num == '1') {
      return 'first';
    } else if (num == '2') {
      return 'second';
    } else if (num == '3') {
      return 'third';
    } else {
      return 'sec';
    }
  }

  static String getGradeNum(String grade) {
    if (grade == 'first') {
      return '1';
    } else if (grade == 'second') {
      return '2';
    } else {
      return '3';
    }
  }

  static Color getColorFromPercentage(double percentage) {
    if (percentage >= 0.9) {
      return Colors.green;
    } else if (percentage >= 0.6) {
      return Colors.yellow;
    } else if (percentage >= 0.3) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  static IconData lectureDataIcon(String type) {
    if (type == 'video') {
      return Icons.video_collection;
    } else if (type == 'pdf') {
      return Icons.picture_as_pdf;
    } else {
      return Icons.quiz;
    }
  }
}
