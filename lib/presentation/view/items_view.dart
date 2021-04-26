import 'package:flutter/material.dart';

class ItemsView extends StatefulWidget {
  @override
  _ItemsViewState createState() => _ItemsViewState();
}

class _ItemsViewState extends State<ItemsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          SliverAppBar(
            floating: true,
            backgroundColor: Colors.red,
            title: Text("Actions"),
            bottom: AppBar(
              title: Text("Varlıklar"),
            ),
          ),
          SliverAppBar(
            backgroundColor: Colors.amber,
            floating: false,
            title: Text("arama"),
          ),
          SliverAppBar(
            collapsedHeight: 56,
            backgroundColor: Colors.blue,
            pinned: true,
            title: Text("sort"),
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
