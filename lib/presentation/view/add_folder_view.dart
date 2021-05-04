import 'package:envanter/data/repositories/items_repository.dart';
import 'package:envanter/presentation/bloc/addfolder/add_folder_bloc.dart';
import 'package:envanter/presentation/bloc/addfolder/add_folder_event.dart';
import 'package:envanter/presentation/bloc/addfolder/add_folder_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddFolderView extends StatefulWidget {
  @override
  _AddFolderViewState createState() => _AddFolderViewState();
}

class _AddFolderViewState extends State<AddFolderView> {
  @override
  Widget build(BuildContext context) {
    context.read<ItemsRepository>().getCurrentDirectory();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: Column(
          children: [
            buildAddPhotoButton(size),
            SizedBox(
              height: size.height * .55,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    buildFormTopic(),
                    buildFolderNameTextField(),
                    SizedBox(height: 4),
                    buildFolderFieldsForm(size, context),
                  ],
                ),
              ),
            ),
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
    return BlocBuilder<AddFolderBloc, AddFolderState>(
      builder: (BuildContext context, state) {
        return Opacity(
          opacity: state.isValidFolderName ? 1 : 0,
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
        );
      },
    );
  }

  Row buildFormTopic() {
    return Row(
      children: [
        Icon(
          Icons.folder_outlined,
          size: 15,
        ),
        SizedBox(
          width: 4,
        ),
        Text("Klasör")
      ],
    );
  }

  Padding buildFolderNameTextField() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: TextField(
        style: TextStyle(fontSize: 25),
        decoration: InputDecoration(
          isCollapsed: true,
          hintStyle: TextStyle(fontSize: 25),
          hintText: "Klasör İsmi Giriniz",
          border: InputBorder.none,
        ),
        onChanged: (value) {
          context
              .read<AddFolderBloc>()
              .add(FolderNameChangedEvent(folderName: value));
        },
      ),
    );
  }

  Table buildFolderFieldsForm(Size size, BuildContext context) {
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: SizedBox(
              height: size.height * .06,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
