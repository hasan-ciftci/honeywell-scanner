import 'package:envanter/presentation/bloc/dashboard/dashboard_cubit.dart';
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
        int indexedStackIndex = 0;
        if (state is HomeViewState)
          indexedStackIndex = 0;
        else if (state is ItemsViewState)
          indexedStackIndex = 1;
        else if (state is SearchViewState)
          indexedStackIndex = 2;
        else if (state is AlarmViewState)
          indexedStackIndex = 3;
        else if (state is MenuViewState) indexedStackIndex = 4;
        return Scaffold(
          body: IndexedStack(
            index: indexedStackIndex,
            children: [
              BlocProvider<DashboardCubit>(
                create: (_) => DashboardCubit(DashboardRepository()),
                child: DashBoardView(),
              ),
              ItemsView(),
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
