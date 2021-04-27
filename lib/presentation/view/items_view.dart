import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ItemsView extends StatefulWidget {
  @override
  _ItemsViewState createState() => _ItemsViewState();
}

class _ItemsViewState extends State<ItemsView> with TickerProviderStateMixin {
  final ScrollController _sliverScrollController = ScrollController();

  var isPrimary = false;
  double fabBottomInset = 60;
  bool isUserScrolledDown = false;
  bool isGridViewActivated = false;

  @override
  void initState() {
    super.initState();

    _sliverScrollController.addListener(() {
      if (_sliverScrollController.hasClients &&
          _sliverScrollController.position.userScrollDirection ==
              ScrollDirection.forward) {
        setState(() {
          isPrimary = false;
        });
      } else if (!isPrimary &&
          _sliverScrollController.hasClients &&
          _sliverScrollController.offset > kToolbarHeight * 3) {
        setState(() {
          isPrimary = true;
        });
      }
    });
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification.depth == 0) {
      if (notification is UserScrollNotification) {
        final UserScrollNotification userScroll = notification;
        switch (userScroll.direction) {
          case ScrollDirection.forward:
            if (userScroll.metrics.maxScrollExtent !=
                userScroll.metrics.minScrollExtent) {
              fabBottomInset = 60;
              isUserScrolledDown = false;
            }
            break;
          case ScrollDirection.reverse:
            if (userScroll.metrics.maxScrollExtent !=
                userScroll.metrics.minScrollExtent) {
              fabBottomInset = -150;
              isUserScrolledDown = true;
            }
            break;
          case ScrollDirection.idle:
            break;
        }
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return NotificationListener<ScrollNotification>(
      onNotification: _handleScrollNotification,
      child: Stack(
        children: [
          Scaffold(
            floatingActionButton: Stack(
              clipBehavior: Clip.none,
              children: [
                AnimatedPositioned(
                  curve: Curves.fastOutSlowIn,
                  bottom: fabBottomInset,
                  right: 0,
                  duration: Duration(milliseconds: 400),
                  child: FloatingActionButton(
                    backgroundColor: Colors.red,
                    elevation: 8,
                    onPressed: () {},
                    child: Icon(Icons.add),
                  ),
                ),
              ],
            ),
            body: CustomScrollView(
              controller: _sliverScrollController,
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              slivers: [
                SliverAppBar(
                  toolbarHeight: 30,
                  actionsIconTheme: IconThemeData(color: Colors.black),
                  elevation: 0,
                  floating: true,
                  backgroundColor: Colors.white,
                  actions: [
                    IconButton(
                      icon: Icon(
                        CupertinoIcons.barcode_viewfinder,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(
                        CupertinoIcons.checkmark_square,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(
                        CupertinoIcons.slider_horizontal_3,
                      ),
                      onPressed: () {},
                    ),
                  ],
                  bottom: AppBar(
                    toolbarHeight: 30,
                    primary: false,
                    elevation: 0,
                    backgroundColor: Colors.white,
                    title: Text(
                      "Varlıklar",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                ),
                SliverAppBar(
                  primary: false,
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.white,
                  flexibleSpace: FlexibleSpaceBar(
                    titlePadding:
                        EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    centerTitle: true,
                    title: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        labelText: "Ara",
                        filled: true,
                        fillColor: Colors.grey.withOpacity(.2),
                        isCollapsed: true,
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
                SliverAppBar(
                  iconTheme: IconThemeData(color: Colors.black),
                  toolbarHeight: 40,
                  pinned: true,
                  backgroundColor: Colors.white,
                  primary: isPrimary,
                  titleSpacing: 0,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.sort,
                            ),
                            onPressed: () {},
                          ),
                          Text(
                            "İsim",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: IconButton(
                          icon: Icon(isGridViewActivated
                              ? Icons.list
                              : Icons.grid_view),
                          onPressed: () {
                            setState(() {
                              isGridViewActivated = !isGridViewActivated;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
                SliverGrid.count(
                  crossAxisCount: isGridViewActivated ? 2 : 1,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                  childAspectRatio: isGridViewActivated ? 2 : 5,
                  children: List.generate(
                      30, (index) => ItemCard(size: size, index: index)),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Opacity(
              opacity: isUserScrolledDown ? 0 : 1,
              child: Material(
                elevation: 8.0,
                child: Container(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.home_outlined),
                      Icon(Icons.folder_outlined),
                      Icon(Icons.search),
                      Icon(Icons.notifications_outlined),
                      Icon(Icons.menu),
                    ],
                  ),
                  height: 60,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
            Card(
              color: Colors.grey.shade200,
              elevation: 0,
              child: Container(
                width: widget.size.height * .1,
                height: widget.size.height * .1,
                child: Icon(
                  widget.index % 3 == 0
                      ? Icons.folder
                      : Icons.insert_drive_file,
                  color: Colors.grey,
                  size: widget.size.width * .08,
                ),
              ),
            ),
            Expanded(
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
            ),
            Icon(Icons.more_horiz)
          ],
        ),
      ),
    );
  }
}
