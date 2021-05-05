import 'dart:ui';

import 'package:envanter/core/extension/string_parse.dart';
import 'package:envanter/data/repositories/add_item_repository.dart';
import 'package:envanter/data/repositories/items_repository.dart';
import 'package:envanter/presentation/bloc/additem/add_item_bloc.dart';
import 'package:envanter/presentation/bloc/additem/add_item_event.dart';
import 'package:envanter/presentation/bloc/additem/add_item_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddItemView extends StatefulWidget {
  @override
  _AddItemViewState createState() => _AddItemViewState();
}

class _AddItemViewState extends State<AddItemView> {
  @override
  Widget build(BuildContext context) {
    context.read<ItemsRepository>().getCurrentDirectory();

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: Column(
          children: [
            buildAddPhotoButton(size),
            buildItemFieldsForm(size),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      leadingWidth: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildCloseButton(),
          buildSaveButton(),
        ],
      ),
    );
  }

  IconButton buildCloseButton() {
    return IconButton(
      icon: Icon(
        Icons.close,
        color: Colors.black,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  BlocBuilder buildSaveButton() {
    return BlocBuilder<AddItemBloc, AddItemState>(
      builder: (BuildContext context, state) {
        return Opacity(
          opacity: state.isValidItemName ? 1 : 0,
          child: GestureDetector(
            onTap: () async {
              try {
                context.read<AddItemRepository>().saveItem(
                      itemFolderId: 1,
                      itemTitle: state.itemName ?? "",
                      itemQuantity:
                          state.itemQuantity.parseInt(defaultValue: 0),
                      itemMinLevel:
                          state.itemMinimumLevel.parseInt(defaultValue: 0),
                      itemPrice: state.itemPrice.parseDouble(defaultValue: 0.0),
                      itemTag: state.itemTags ?? "",
                      itemNote: state.itemNotes ?? "",
                      itemBarcode: state.itemBarcode ?? "",
                      itemQrLabel: state.itemBarcode ?? "",
                      itemCreatedOn: DateTime.now().toIso8601String(),
                      itemCreatedBy: 1,
                      itemTypeId: 1,
                      itemCurrency: 1,
                      itemPhoto: "",
                      itemCustomField: "",
                      itemQuantityType: 0,
                      itemStatus: 0,
                    );
              } catch (e) {
                print(e);
              }
            },
            child: Container(
              margin: EdgeInsets.only(right: 16.0),
              padding: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                color: Color(0xFFe22236),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                "Kaydet",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
        );
      },
    );
  }

  Padding buildItemFieldsForm(Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          buildFormTopic(),
          buildItemNameTextField(),
          buildMainFieldsForm(size),
          SizedBox(height: 4),
          buildExtraFieldsForm(size),
        ],
      ),
    );
  }

  Row buildFormTopic() {
    return Row(
      children: [
        Icon(
          Icons.insert_drive_file_outlined,
          size: 15,
        ),
        SizedBox(
          width: 4,
        ),
        Text("Varlık")
      ],
    );
  }

  Padding buildItemNameTextField() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: TextField(
        style: TextStyle(fontSize: 25),
        decoration: InputDecoration(
          isCollapsed: true,
          hintStyle: TextStyle(fontSize: 25),
          hintText: "Varlık İsmi Giriniz",
          border: InputBorder.none,
        ),
        onChanged: (value) {
          context
              .read<AddItemBloc>()
              .add(ItemNameChangedEvent(itemName: value));
        },
      ),
    );
  }

  Table buildMainFieldsForm(Size size) {
    return Table(
      border: TableBorder.all(color: Colors.grey, width: 0.5),
      children: [
        TableRow(children: [
          SizedBox(
            height: size.height * .1,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Miktar",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(color: Colors.grey),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: SizedBox(
                          height: 16,
                          child: TextFormField(
                            initialValue: "1",
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              isCollapsed: true,
                              border: InputBorder.none,
                            ),
                            onChanged: (value) {
                              context.read<AddItemBloc>().add(
                                  ItemQuantityChangedEvent(
                                      itemQuantity: value));
                            },
                          ),
                        ),
                      ),
                      Icon(CupertinoIcons.minus_slash_plus)
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: size.height * .1,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Minimum Seviye",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(color: Colors.grey),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: SizedBox(
                          height: 16,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "-",
                              isCollapsed: true,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Icon(CupertinoIcons.bell)
                    ],
                  )
                ],
              ),
            ),
          ),
        ]),
        TableRow(children: [
          SizedBox(
            height: size.height * .1,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Fiyat",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(color: Colors.grey),
                  ),
                  Flexible(
                    child: SizedBox(
                      height: 16,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "-",
                          isCollapsed: true,
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          context
                              .read<AddItemBloc>()
                              .add(ItemPriceChangedEvent(itemPrice: value));
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: size.height * .1,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Toplam Değer",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(color: Colors.grey),
                  ),
                  BlocBuilder<AddItemBloc, AddItemState>(
                    builder: (BuildContext context, state) {
                      if (state.itemPrice != null &&
                          state.itemPrice.isNotEmpty &&
                          state.itemQuantity != null &&
                          state.itemQuantity.isNotEmpty) {
                        final currentTotal = double.parse(state.itemPrice) *
                            double.parse(state.itemQuantity);
                        if (currentTotal > 0.0)
                          return Text(currentTotal.toString());
                      }
                      return Text("-");
                    },
                  ),
                ],
              ),
            ),
          ),
        ]),
      ],
    );
  }

  Table buildExtraFieldsForm(Size size) {
    bool isNoteExists = false;

    return Table(
      border: TableBorder.all(color: Colors.grey, width: 0.5),
      children: [
        TableRow(children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: SizedBox(
              height: size.height * .06,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Etiketler",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Colors.grey),
                  ),
                  Icon(Icons.arrow_right)
                ],
              ),
            ),
          ),
        ]),
        TableRow(children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Notlar " * 1,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(color: Colors.grey),
                        ),
                        BlocBuilder<AddItemBloc, AddItemState>(
                          builder: (BuildContext context, state) {
                            if (state.itemNotes != null &&
                                state.itemNotes.isNotEmpty) {
                              isNoteExists = true;
                            }
                            return Visibility(
                              visible: isNoteExists,
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  "Notlar " * 4,
                                  maxLines: 5,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  Icon(Icons.arrow_right)
                ],
              ),
            ),
          )
        ]),
        TableRow(children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: SizedBox(
              height: size.height * .06,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "QR / Barkod",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Colors.grey),
                  ),
                  Icon(CupertinoIcons.barcode_viewfinder)
                ],
              ),
            ),
          ),
        ]),
      ],
    );
  }

  SizedBox buildAddPhotoButton(Size size) {
    return SizedBox(
      height: size.height * .35,
      child: Container(
        margin: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_photo_alternate_outlined,
                size: size.height * .1,
                color: Colors.grey,
              ),
              Text(
                "Fotoğraf Ekle",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(color: Colors.grey),
              )
            ],
          ),
        ),
      ),
    );
  }
}
