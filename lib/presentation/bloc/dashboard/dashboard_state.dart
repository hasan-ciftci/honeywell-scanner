import 'package:equatable/equatable.dart';

abstract class DashboardState extends Equatable {
  DashboardState();
}

class InitialState extends DashboardState {
  @override
  List<Object> get props => [];
}

class OpenBottomSheetState extends DashboardState {
  @override
  List<Object> get props => [];
}

class CloseBottomSheetState extends DashboardState {
  @override
  List<Object> get props => [];
}
