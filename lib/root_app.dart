import 'package:envanter/data/repositories/items_repository.dart';
import 'package:envanter/presentation/bloc/dashboard/dashboard_cubit.dart';
import 'package:envanter/presentation/bloc/items/items_cubit.dart';
import 'package:envanter/presentation/bloc/navigation/bottom_navbar_cubit.dart';
import 'package:envanter/presentation/bloc/navigation/bottom_navbar_state.dart';
import 'package:envanter/presentation/view/alarm_view.dart';
import 'package:envanter/presentation/view/dashboard_view.dart';
import 'package:envanter/presentation/view/items_view.dart';
import 'package:envanter/presentation/view/menu_view.dart';
import 'package:envanter/presentation/view/search_view.dart';
import 'package:envanter/presentation/widgets/bottom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/repositories/dashboard_repository.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      builder: (BuildContext context, state) {
        return Scaffold(
          body: IndexedStack(
            index: context.read<BottomNavBarCubit>().getIndexOfIndexedStack(),
            children: [
              BlocProvider<DashboardCubit>(
                create: (_) => DashboardCubit(DashboardRepository()),
                child: DashBoardView(),
              ),
              BlocProvider<ItemsCubit>(
                create: (_) => ItemsCubit(ItemsRepository()),
                child: ItemsView(),
              ),
              SearchView(),
              AlarmView(),
              MenuView(),
            ],
          ),
          bottomNavigationBar: state.opacity == 0 ? null : buildBottomAppBar(),
        );
      },
    );
  }
}
