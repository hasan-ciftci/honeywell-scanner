import 'package:flutter/material.dart';

class RecentItemCard extends StatelessWidget {
  final String itemId;
  final String itemName;
  final String quantity;
  final Size size;

  const RecentItemCard(
      {Key key,
      @required this.itemId,
      @required this.itemName,
      @required this.quantity,
      this.size})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        height: size.height * .25,
        width: size.width * .25,
        child: Column(
          children: [
            buildRecentItemImage(),
            buildRecentItemInformation(context),
          ],
        ),
      ),
    );
  }

  Expanded buildRecentItemImage() {
    return Expanded(
      child: Card(
        color: Colors.grey,
        elevation: 0,
        child: Center(
          child: Icon(
            Icons.insert_drive_file_outlined,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
    );
  }

  Expanded buildRecentItemInformation(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(4.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildRecentItemId(context),
                  buildRecentItemName(context),
                  buildRecentItemQuantity(context),
                ],
              ),
            ),
            Expanded(
              child: Icon(Icons.more_vert),
            ),
          ],
        ),
      ),
    );
  }

  Text buildRecentItemId(BuildContext context) {
    return Text(
      itemId,
      style: Theme.of(context).textTheme.caption,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Text buildRecentItemName(BuildContext context) {
    return Text(
      itemName,
      style: Theme.of(context).textTheme.bodyText1,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Text buildRecentItemQuantity(BuildContext context) {
    return Text(
      quantity + " unit",
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context)
          .textTheme
          .caption
          .copyWith(fontWeight: FontWeight.bold),
    );
  }
}
