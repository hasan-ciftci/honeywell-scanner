import 'package:envanter/data/repositories/items_repository.dart';
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
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: Column(
          children: [
            buildAppBar(size),
            buildAddPhotoButton(size),
            SizedBox(
              height: size.height * .55,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Row(
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
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.0),
                      child: TextField(
                        style: TextStyle(fontSize: 25),
                        decoration: InputDecoration(
                          isCollapsed: true,
                          hintStyle: TextStyle(fontSize: 25),
                          hintText: "Klasör İsmi Giriniz",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Table(
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: SizedBox(
                                          height: 16,
                                          child: TextFormField(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                        decoration: InputDecoration(
                                          hintText: "-",
                                          isCollapsed: true,
                                          border: InputBorder.none,
                                        ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Toplam Değer",
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        .copyWith(color: Colors.grey),
                                  ),
                                  Flexible(
                                    child: SizedBox(
                                      height: 16,
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          hintText: "-",
                                          isCollapsed: true,
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Table(
                      border: TableBorder.all(color: Colors.grey, width: 0.5),
                      children: [
                        TableRow(children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: SizedBox(
                              height: size.height * .06,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: SizedBox(
                              height: size.height * .06,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Notlar",
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
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: SizedBox(
                              height: size.height * .06,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
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

  SizedBox buildAppBar(Size size) {
    return SizedBox(
      height: size.height * .1,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
