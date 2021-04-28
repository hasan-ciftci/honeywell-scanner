import 'package:equatable/equatable.dart';

abstract class DashboardState extends Equatable {
  DashboardState();
}

class OpenBottomModelState extends DashboardState {
  @override
  List<Object> get props => [];
}

class CloseBottomModelState extends DashboardState {
  @override
  List<Object> get props => [];
}
