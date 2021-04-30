import 'package:envanter/data/repositories/bottom_navbar_repository.dart';
import 'package:envanter/presentation/bloc/navigation/bottom_navbar_cubit.dart';
import 'package:envanter/presentation/view/items_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      home: BlocProvider<BottomNavBarCubit>(
        create: (_) => BottomNavBarCubit(
          repository: BottomNavBarRepository(),
        ),
        child: ItemsView(),
      ),
    ),
  );
}
