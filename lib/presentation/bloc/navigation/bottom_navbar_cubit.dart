import 'package:bloc/bloc.dart';
import 'package:envanter/core/constants/enum.dart';
import 'package:envanter/data/repositories/bottom_navbar_repository.dart';
import 'package:envanter/presentation/bloc/navigation/bottom_navbar_state.dart';
import 'package:flutter/material.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit({@required this.repository}) : super(HomeViewState());
  final BottomNavBarRepository repository;

  getView(NavigationBarState navigationBarState) {
    switch (navigationBarState) {
      case NavigationBarState.HOME:
        emit(HomeViewState());
        break;
      case NavigationBarState.ITEMS:
        emit(ItemsViewState(opacity: 1));
        break;
      case NavigationBarState.SEARCH:
        emit(SearchViewState());
        break;
      case NavigationBarState.ALARM:
        emit(AlarmViewState());
        break;
      case NavigationBarState.MENU:
        emit(MenuViewState());
        break;
      default:
        emit(HomeViewState());
    }
  }

  changeOpacity(NavigationBarState navigationBarState) {
    switch (navigationBarState) {
      case NavigationBarState.ITEMS_DISABLED:
        emit(ItemsViewState(opacity: 0));
        break;
      default:
        emit(ItemsViewState(opacity: 1));
        break;
    }
  }
}
