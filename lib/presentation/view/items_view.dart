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
  double fabBottomInset = 20;

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
              fabBottomInset = 20;
            }
            break;
          case ScrollDirection.reverse:
            if (userScroll.metrics.maxScrollExtent !=
                userScroll.metrics.minScrollExtent) {
              fabBottomInset = -100;
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
    return NotificationListener<ScrollNotification>(
      onNotification: _handleScrollNotification,
      child: Scaffold(
        floatingActionButton: Stack(
          clipBehavior: Clip.none,
          children: [
            AnimatedPositioned(
              curve: Curves.fastOutSlowIn,
              bottom: fabBottomInset,
              right: 20,
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
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          slivers: [
            SliverAppBar(
              toolbarHeight: 45,
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
                toolbarHeight: 45,
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
                titlePadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
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
              toolbarHeight: 45,
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
                    child: Icon(Icons.grid_view),
                  )
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 10000,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
