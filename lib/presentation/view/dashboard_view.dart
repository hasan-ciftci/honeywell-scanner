import 'package:envanter/presentation/widgets/dashboard_card.dart';
import 'package:envanter/presentation/widgets/recent_item_card.dart';
import 'package:flutter/material.dart';

class DashBoardView extends StatefulWidget {
  @override
  _DashBoardViewState createState() => _DashBoardViewState();
}

class _DashBoardViewState extends State<DashBoardView> {
  bool isStockEmpty = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          buildSliverAppBar(
            context: context,
            text: 'Gösterge Paneli',
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                buildInventorySummaryDeckTopic(text: 'Envanter Özeti'),
                buildInventorySummaryDeck(size),
                buildRecentItemsDeckTopic(text: 'SON ÜRÜNLER'),
                buildRecentItemsDeck(size),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SliverAppBar buildSliverAppBar(
      {@required BuildContext context, @required String text}) {
    return SliverAppBar(
      collapsedHeight: 56,
      backgroundColor: Colors.white,
      floating: false,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.all(8.0),
        title: Text(
          text,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }

  Padding buildInventorySummaryDeckTopic({@required String text}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        text,
        textAlign: TextAlign.start,
      ),
    );
  }

  Container buildInventorySummaryDeck(Size size) {
    return Container(
        color: Colors.white,
        height: size.height * .4,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DashboardCard(
                  size: size,
                  color: Colors.green,
                  icon: Icons.description,
                  quantity: '0',
                  caption: 'Varlıklar',
                ),
                DashboardCard(
                  size: size,
                  color: Colors.orange,
                  icon: Icons.folder,
                  quantity: '0',
                  caption: 'Klasörler',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DashboardCard(
                  size: size,
                  color: Colors.blue,
                  icon: Icons.layers,
                  quantity: '0',
                  caption: 'Toplam Miktar',
                ),
                DashboardCard(
                  size: size,
                  color: Colors.red,
                  icon: Icons.money,
                  quantity: '₺0',
                  caption: 'Toplam Değer',
                ),
              ],
            ),
          ],
        ));
  }

  Padding buildRecentItemsDeckTopic({@required String text}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        text,
        textAlign: TextAlign.start,
      ),
    );
  }

  Container buildRecentItemsDeck(Size size) {
    return Container(
      color: Colors.white,
      child: Align(
          alignment: Alignment.centerLeft,
          child: isStockEmpty
              ? buildRecentItemsEmptyText()
              : buildRecentItems(size)),
    );
  }

  SingleChildScrollView buildRecentItems(Size size) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: List.generate(
            5,
            (index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: RecentItemCard(
                  itemId: 'SWVT49RE033',
                  itemName: 'Apple Macbook Air 128 gb',
                  quantity: (index + 1).toString(),
                  size: size,
                )),
          ),
        ),
      ),
    );
  }

  Padding buildRecentItemsEmptyText() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        "ÜRÜN YOK",
        textAlign: TextAlign.start,
      ),
    );
  }
}
