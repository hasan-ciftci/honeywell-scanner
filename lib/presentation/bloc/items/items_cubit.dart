import 'package:bloc/bloc.dart';
import 'package:envanter/data/repositories/items_repository.dart';
import 'package:envanter/presentation/bloc/items/items_state.dart';

class ItemsCubit extends Cubit<ItemsState> {
  final ItemsRepository repository;

  ItemsCubit(this.repository) : super(InitialState());

  openBottomSheet() {
    emit(OpenBottomSheetState());
  }

  closeBottomSheet() {
    emit(CloseBottomSheetState());
  }
}
