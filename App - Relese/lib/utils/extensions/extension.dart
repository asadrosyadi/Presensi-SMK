// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';

import '../helper.dart';
import 'dart:convert';

extension DoubleExtension on num {
  /// Mengembalikan nilai persentase dari lebar layar
  double sw(BuildContext context) =>
      percentageOfScreenWidth(context, this.toDouble());

  /// Mengembalikan nilai persentase dari tinggi layar
  double sh(BuildContext context) =>
      percentageOfScreenHeight(context, this.toDouble());
}

extension JsonExtension on String {
  Map<String, dynamic> get toMap {
    return jsonDecode(this.replaceAll("'", '"'));
  }
}

extension WidgetExtension on Widget {
  Widget backgroundColor({Color color}) {
    return ColoredBox(
      color: color ?? Colors.transparent,
      child: this,
    );
  }

  Widget borderRadius({
    double topLeft,
    double topRight,
    double bottomLeft,
    double bottomRight,
    double verticalTop,
    double verticalBottom,
    double horizontalLeft,
    double horizontalRight,
    double all,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(
          topLeft ?? verticalTop ?? horizontalLeft ?? all ?? 0,
        ),
        topRight: Radius.circular(
          topRight ?? verticalTop ?? horizontalRight ?? all ?? 0,
        ),
        bottomLeft: Radius.circular(
          bottomLeft ?? verticalBottom ?? horizontalLeft ?? all ?? 0,
        ),
        bottomRight: Radius.circular(
          bottomRight ?? verticalBottom ?? horizontalRight ?? all ?? 0,
        ),
      ),
      child: this,
    );
  }

  Widget margin({
    double horizontal,
    double vertical,
    double top,
    double right,
    double bottom,
    double left,
    double all,
  }) {
    return Container(
      margin: EdgeInsets.only(
        top: top ?? vertical ?? all ?? 0,
        bottom: bottom ?? vertical ?? all ?? 0,
        left: left ?? horizontal ?? all ?? 0,
        right: right ?? horizontal ?? all ?? 0,
      ),
      child: this,
    );
  }
}
