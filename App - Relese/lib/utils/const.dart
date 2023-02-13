import 'package:flutter/cupertino.dart';

double statusAreaHeight(BuildContext context) {
  return MediaQuery.of(context).viewPadding.top;
}

double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height - statusAreaHeight(context);
}
