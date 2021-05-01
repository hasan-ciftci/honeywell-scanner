import 'package:equatable/equatable.dart';

abstract class ItemsState extends Equatable {
  ItemsState();
}

class InitialState extends ItemsState {
  @override
  List<Object> get props => [];
}

class OpenBottomSheetState extends ItemsState {
  @override
  List<Object> get props => [];
}

class CloseBottomSheetState extends ItemsState {
  @override
  List<Object> get props => [];
}
