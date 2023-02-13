import 'package:attendancewithfingerprint/utils/const.dart';
import 'package:flutter/cupertino.dart';

double percentageOfSize(double size, double percentage) {
  return size * percentage / 100;
}

double percentageOfScreenHeight(BuildContext context, double percentage) {
  return percentageOfSize(screenHeight(context), percentage);
}

double percentageOfScreenWidth(BuildContext context, double percentage) {
  return percentageOfSize(screenWidth(context), percentage);
}
