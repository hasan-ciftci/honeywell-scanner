import 'package:envanter/core/constants/enum.dart';
import 'package:flutter/material.dart';

class IconWithText extends StatelessWidget {
  final String text;
  final IconData icon;
  final DashBoardBottomSheetState bottomSheetState;

  const IconWithText({
    Key key,
    @required this.text,
    @required this.icon,
    @required this.bottomSheetState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Icon(icon),
          Text(text),
        ],
      ),
    );
  }
}
