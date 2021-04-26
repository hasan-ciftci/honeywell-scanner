import 'package:envanter/presentation/widgets/dashboard_card.dart';
import 'package:envanter/presentation/widgets/recent_item_card.dart';
import 'package:flutter/material.dart';

class DashBoardView extends StatefulWidget {
  @override
  _DashBoardViewState createState() => _DashBoardViewState();
}

class _DashBoardViewState extends State<DashBoardView> {
  bool isStockEmpty = false;
  String dropdownValue = 'Tümü';
  List<String> dropdownValues = ["Tümü", "Güncellenen", "Eklenen", "Silinen"];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: CustomScrollView(
        physics: BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: [
          buildSliverAppBar(
            text: 'Gösterge Paneli',
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                buildInventorySummaryDeckTopic(text: 'Envanter Özeti'),
                buildInventorySummaryDeck(size),
                buildRecentItemsDeckTopic(text: 'Son Hareketler'),
                buildRecentItemsDeck(size),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SliverAppBar buildSliverAppBar({@required String text}) {
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
          ),
          buildDropdownMenuWithText(),
        ],
      ),
    );
  }

  Stack buildDropdownMenuWithText() {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Positioned(
          right: 30,
          child: Text(
            dropdownValue,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            isDense: true,
            icon: Icon(Icons.tune, color: Colors.black),
            items: List.generate(
              4,
              (index) => DropdownMenuItem(
                  child: Text(dropdownValues[index]),
                  value: dropdownValues[index]),
            ),
            onChanged: (value) {
              setState(() {
                dropdownValue = value;
              });
            },
          ),
        ),
      ],
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
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
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
