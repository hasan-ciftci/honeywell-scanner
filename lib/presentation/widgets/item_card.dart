import 'package:flutter/material.dart';

class ItemCard extends StatefulWidget {
  final Size size;
  final int index;

  const ItemCard({Key key, @required this.size, @required this.index})
      : super(key: key);
  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            buildItemCardImage(),
            buildItemCardInformation(context),
            Icon(Icons.more_horiz)
          ],
        ),
      ),
    );
  }

  Card buildItemCardImage() {
    return Card(
      color: Colors.grey.shade200,
      elevation: 0,
      child: Container(
        width: widget.size.height * .1,
        height: widget.size.height * .1,
        child: Icon(
          widget.index % 3 == 0 ? Icons.folder : Icons.insert_drive_file,
          color: Colors.grey,
          size: widget.size.width * .08,
        ),
      ),
    );
  }

  Expanded buildItemCardInformation(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            widget.index % 3 == 0
                ? "Klasör ${widget.index + 1}"
                : "Varlık ${widget.index + 1}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.caption,
          ),
          Text(
            widget.index % 3 == 0
                ? "Klasör ${widget.index + 1}"
                : "Varlık ${widget.index + 1}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            width: widget.size.width * .15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.folder_outlined,
                  size: 10,
                ),
                Text(
                  "${widget.index + 1}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.caption,
                ),
                Text(
                  "|",
                  style: Theme.of(context).textTheme.caption,
                ),
                Icon(
                  Icons.layers_outlined,
                  size: 10,
                ),
                Text(
                  "${widget.index + 1}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
