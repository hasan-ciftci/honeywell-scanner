import 'package:equatable/equatable.dart';

abstract class BottomNavBarState extends Equatable {
  final int opacity;

  BottomNavBarState({this.opacity});
}

class HomeViewState extends BottomNavBarState {
  @override
  List<Object> get props => [];
}

class ItemsViewState extends BottomNavBarState {
  ItemsViewState({int opacity}) : super(opacity: opacity);
  @override
  List<Object> get props => [opacity];
}

class SearchViewState extends BottomNavBarState {
  @override
  List<Object> get props => [];
}

class AlarmViewState extends BottomNavBarState {
  @override
  List<Object> get props => [];
}

class MenuViewState extends BottomNavBarState {
  @override
  List<Object> get props => [];
}
