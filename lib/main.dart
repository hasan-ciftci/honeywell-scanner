import 'package:envanter/core/constants/enum.dart';
import 'package:envanter/data/repositories/bottom_navbar_repository.dart';
import 'package:envanter/presentation/bloc/navigation/bottom_navbar_cubit.dart';
import 'package:envanter/presentation/bloc/navigation/bottom_navbar_state.dart';
import 'package:envanter/presentation/view/alarm_view.dart';
import 'package:envanter/presentation/view/dashboard_view.dart';
import 'package:envanter/presentation/view/items_view.dart';
import 'package:envanter/presentation/view/menu_view.dart';
import 'package:envanter/presentation/view/search_view.dart';
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
        child: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
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
                  DashBoardView(),
                  ItemsView(),
                  SearchView(),
                  AlarmView(),
                  MenuView(),
                ],
              ),
              bottomNavigationBar:
                  state.opacity == 0 ? null : buildBottomAppBar(),
            );
          },
        ),
      ),
    ),
  );
}

BlocBuilder buildBottomAppBar() {
  return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
    builder: (BuildContext context, state) {
      return Material(
        elevation: 8.0,
        child: Container(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                  onTap: () {
                    context
                        .read<BottomNavBarCubit>()
                        .getView(NavigationBarState.HOME);
                  },
                  child: Icon(
                    Icons.home_outlined,
                    color: state is HomeViewState ? Colors.red : Colors.black,
                  )),
              GestureDetector(
                  onTap: () {
                    context
                        .read<BottomNavBarCubit>()
                        .getView(NavigationBarState.ITEMS);
                  },
                  child: Icon(
                    Icons.folder_outlined,
                    color: state is ItemsViewState ? Colors.red : Colors.black,
                  )),
              GestureDetector(
                  onTap: () {
                    context.read<BottomNavBarCubit>().getView(
                          NavigationBarState.SEARCH,
                        );
                  },
                  child: Icon(
                    Icons.search,
                    color: state is SearchViewState ? Colors.red : Colors.black,
                  )),
              GestureDetector(
                  onTap: () {
                    context
                        .read<BottomNavBarCubit>()
                        .getView(NavigationBarState.ALARM);
                  },
                  child: Icon(
                    Icons.notifications_outlined,
                    color: state is AlarmViewState ? Colors.red : Colors.black,
                  )),
              GestureDetector(
                  onTap: () {
                    context
                        .read<BottomNavBarCubit>()
                        .getView(NavigationBarState.MENU);
                  },
                  child: Icon(
                    Icons.menu,
                    color: state is MenuViewState ? Colors.red : Colors.black,
                  )),
            ],
          ),
          height: 55,
        ),
      );
    },
  );
}
