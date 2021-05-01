import 'package:envanter/data/repositories/items_repository.dart';
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

    return Scaffold(
      body: Center(
        child: Text("Add item"),
      ),
    );
  }
}
