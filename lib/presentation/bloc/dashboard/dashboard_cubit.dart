import 'package:bloc/bloc.dart';
import 'package:envanter/data/repositories/dashboard_repository.dart';
import 'package:envanter/presentation/bloc/dashboard/dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final DashboardRepository repository;

  DashboardCubit(this.repository) : super(InitialState());

  openBottomSheet() {
    emit(OpenBottomSheetState());
  }

  closeBottomSheet() {
    emit(CloseBottomSheetState());
  }
}
