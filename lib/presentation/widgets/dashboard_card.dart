import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard({
    Key key,
    @required this.size,
    @required this.icon,
    @required this.color,
    @required this.caption,
    @required this.quantity,
  }) : super(key: key);

  final Size size;
  final IconData icon;
  final Color color;
  final String caption;
  final String quantity;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: size.height * .16,
        width: size.width * .35,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
                child: CircleAvatar(
              backgroundColor: color.withOpacity(.3),
              child: Icon(
                icon,
                color: color,
              ),
            )),
            Flexible(
              child: Text(
                quantity,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: color),
              ),
            ),
            Flexible(
              child: Text(
                caption,
                style:
                    Theme.of(context).textTheme.caption.copyWith(color: color),
              ),
            ),
          ],
        ),
      ),
      elevation: 4,
    );
  }
}
