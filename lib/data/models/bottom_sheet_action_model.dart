import 'package:envanter/core/constants/enum.dart';
import 'package:flutter/material.dart';

class BottomSheetActionModel {
  final IconData icon;
  final String text;
  final DashBoardBottomSheetState dashBoardBottomSheetState;

  BottomSheetActionModel(
      {@required this.icon,
      @required this.text,
      @required this.dashBoardBottomSheetState});
}
