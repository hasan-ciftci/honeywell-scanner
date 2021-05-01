import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

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

class OpenAddItemState extends ItemsState {
  final String currentDirectory;

  OpenAddItemState({@required this.currentDirectory});
  @override
  List<Object> get props => [];
}

class CloseAddItemState extends ItemsState {
  CloseAddItemState();
  @override
  List<Object> get props => [];
}

class OpenAddFolderState extends ItemsState {
  final String currentDirectory;

  OpenAddFolderState({@required this.currentDirectory});
  @override
  List<Object> get props => [];
}

class CloseAddFolderState extends ItemsState {
  CloseAddFolderState();
  @override
  List<Object> get props => [];
}
