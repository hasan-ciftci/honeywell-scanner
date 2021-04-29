import 'dart:ui';

import 'package:envanter/core/constants/enum.dart';
import 'package:envanter/presentation/bloc/navigation/bottom_navbar_cubit.dart';
import 'package:envanter/presentation/widgets/item_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemsView extends StatefulWidget {
  @override
  _ItemsViewState createState() => _ItemsViewState();
}

class _ItemsViewState extends State<ItemsView> with TickerProviderStateMixin {
  final ScrollController _sliverScrollController = ScrollController();

  var isPrimary = false;
  double fabBottomInset = 0;
  bool isGridViewActivated = false;

  @override
  void initState() {
    super.initState();
    _sliverScrollController.addListener(setSliverAppBarToPrimaryWhenPinned);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return NotificationListener<ScrollNotification>(
      onNotification: _handleScrollNotification,
      child: Scaffold(
        floatingActionButton: buildAnimatedFAB(),
        body: buildBody(context, size),
      ),
    );
  }

  Stack buildAnimatedFAB() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        AnimatedPositioned(
          curve: Curves.easeInBack,
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
    );
  }

  CustomScrollView buildBody(BuildContext context, Size size) {
    return CustomScrollView(
      controller: _sliverScrollController,
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      slivers: [
        buildActionsAndTitleAppBar(context),
        buildSearchAppBar(),
        buildSortAndGridAppBar(context),
        buildItemGrid(size)
      ],
    );
  }

  SliverAppBar buildActionsAndTitleAppBar(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 30,
      actionsIconTheme: IconThemeData(color: Colors.black),
      elevation: 0,
      floating: true,
      backgroundColor: Colors.white,
      actions: [
        IconButton(
          icon: Icon(CupertinoIcons.barcode_viewfinder),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(CupertinoIcons.checkmark_square),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(CupertinoIcons.slider_horizontal_3),
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
    );
  }

  SliverAppBar buildSearchAppBar() {
    return SliverAppBar(
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
    );
  }

  SliverAppBar buildSortAndGridAppBar(BuildContext context) {
    return SliverAppBar(
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
              icon: Icon(isGridViewActivated ? Icons.list : Icons.grid_view),
              onPressed: () {
                setState(() {
                  isGridViewActivated = !isGridViewActivated;
                });
              },
            ),
          )
        ],
      ),
    );
  }

  SliverGrid buildItemGrid(Size size) {
    return SliverGrid.count(
      crossAxisCount: isGridViewActivated ? 2 : 1,
      mainAxisSpacing: 2,
      crossAxisSpacing: 2,
      childAspectRatio: isGridViewActivated ? 2 : 5,
      children:
          List.generate(30, (index) => ItemCard(size: size, index: index)),
    );
  }

  void setSliverAppBarToPrimaryWhenPinned() {
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
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification.depth == 0) {
      if (notification is UserScrollNotification) {
        final UserScrollNotification userScroll = notification;
        switch (userScroll.direction) {
          case ScrollDirection.forward:
            if (userScroll.metrics.maxScrollExtent !=
                userScroll.metrics.minScrollExtent) {
              fabBottomInset = 0;
              context
                  .read<BottomNavBarCubit>()
                  .changeOpacityOfBottomNavBar(NavigationBarState.HOME);
            }
            break;
          case ScrollDirection.reverse:
            if (userScroll.metrics.maxScrollExtent !=
                userScroll.metrics.minScrollExtent) {
              fabBottomInset = -150;
              context.read<BottomNavBarCubit>().changeOpacityOfBottomNavBar(
                  NavigationBarState.ITEMS_DISABLED);
            }
            break;
          case ScrollDirection.idle:
            break;
        }
      }
    }
    return false;
  }
}
