import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ItemsView extends StatefulWidget {
  @override
  _ItemsViewState createState() => _ItemsViewState();
}

class _ItemsViewState extends State<ItemsView> {
  final ScrollController _sliverScrollController = ScrollController();

  var isPrimary = false;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _sliverScrollController,
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
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
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
