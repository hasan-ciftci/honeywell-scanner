import 'package:envanter/core/constants/enum.dart';
import 'package:envanter/core/constants/style.dart';
import 'package:envanter/data/models/bottom_sheet_action_model.dart';
import 'package:envanter/presentation/bloc/dashboard/dashboard_cubit.dart';
import 'package:envanter/presentation/bloc/dashboard/dashboard_state.dart';
import 'package:envanter/presentation/widgets/dashboard_card.dart';
import 'package:envanter/presentation/widgets/icon_with_text.dart';
import 'package:envanter/presentation/widgets/item_card.dart';
import 'package:envanter/presentation/widgets/recent_item_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocListener<DashboardCubit, DashboardState>(
      listener: (BuildContext context, state) {
        if (state is OpenBottomSheetState) {
          showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            context: context,
            builder: (BuildContext ctx) {
              return buildBottomModalSheet(ctx);
            },
          ).whenComplete(
              () => context.read<DashboardCubit>().closeBottomSheet());
        }
      },
      child: Scaffold(
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
      ),
    );
  }

  Widget buildBottomModalSheet(BuildContext ctx) {
    return FractionallySizedBox(
      heightFactor: 0.6,
      child: Padding(
        padding:
            EdgeInsets.only(bottom: StyleConstants.kBottomAppBarHeight / 5),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  child: Card(
                //PLACEHOLDER CARD
                child: ItemCard(
                  index: 0,
                  size: MediaQuery.of(context).size,
                ),
              )),
              Expanded(
                flex: 2,
                child: buildBottomSheetActions(
                    crossAxisLength: 4, actions: bottomSheetActions),
              ),
              buildBottomSheetBackButton(ctx)
            ],
          ),
        ),
      ),
    );
  }

  Card buildBottomSheetActions(
      {@required int crossAxisLength, @required List<dynamic> actions}) {
    return Card(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          (actions.length / crossAxisLength).ceil(),
          (columnIndex) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              crossAxisLength,
              (rowIndex) => columnIndex * crossAxisLength + rowIndex >=
                      actions.length
                  ? SizedBox(
                      width: 50,
                    )
                  : SizedBox(
                      width: 50,
                      child: IconWithText(
                          text:
                              actions[columnIndex * crossAxisLength + rowIndex]
                                  .text,
                          icon:
                              actions[columnIndex * crossAxisLength + rowIndex]
                                  .icon,
                          bottomSheetState:
                              actions[columnIndex * crossAxisLength + rowIndex]
                                  .dashBoardBottomSheetState),
                    ),
            ),
          ),
        ),
      ),
    );
  }

  Padding buildBottomSheetBackButton(BuildContext ctx) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ElevatedButton(
        onPressed: () {
          context.read<DashboardCubit>().closeBottomSheet();
          Navigator.pop(ctx);
        },
        child: Text(
          "Geri dön",
          style: Theme.of(context).textTheme.button,
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) return Colors.white70;
              return Colors.white;
            },
          ),
        ),
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
                child: GestureDetector(
                  onTap: () {
                    context.read<DashboardCubit>().openBottomSheet();
                  },
                  child: RecentItemCard(
                    itemId: 'SWVT49RE033',
                    itemName: 'Apple Macbook Air 128 gb',
                    quantity: (index + 1).toString(),
                    size: size,
                  ),
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

  List<BottomSheetActionModel> bottomSheetActions = [
    BottomSheetActionModel(
        dashBoardBottomSheetState: DashBoardBottomSheetState.EDIT,
        icon: Icons.edit,
        text: "Düzenle"),
    BottomSheetActionModel(
        dashBoardBottomSheetState: DashBoardBottomSheetState.MOVE,
        icon: CupertinoIcons.move,
        text: "Taşı"),
    BottomSheetActionModel(
        dashBoardBottomSheetState: DashBoardBottomSheetState.CHANGE_QTY,
        icon: CupertinoIcons.minus_slash_plus,
        text: "Miktar"),
    BottomSheetActionModel(
        dashBoardBottomSheetState: DashBoardBottomSheetState.SET_ALERT,
        icon: Icons.add_alert_outlined,
        text: "Alarm"),
    BottomSheetActionModel(
        dashBoardBottomSheetState: DashBoardBottomSheetState.EXPORT,
        icon: Icons.open_in_new,
        text: "Aktar"),
    BottomSheetActionModel(
        dashBoardBottomSheetState: DashBoardBottomSheetState.CREATE_LABEL,
        icon: Icons.qr_code,
        text: "Tara"),
    BottomSheetActionModel(
        dashBoardBottomSheetState: DashBoardBottomSheetState.CLONE,
        icon: Icons.file_copy_outlined,
        text: "Çoğalt"),
    BottomSheetActionModel(
        dashBoardBottomSheetState: DashBoardBottomSheetState.HISTORY,
        icon: Icons.history,
        text: "Geçmiş"),
    BottomSheetActionModel(
        dashBoardBottomSheetState: DashBoardBottomSheetState.DELETE,
        icon: Icons.history,
        text: "Sil"),
  ];
}
