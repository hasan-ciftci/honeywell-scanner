import 'package:bloc/bloc.dart';
import 'package:envanter/data/repositories/items_repository.dart';
import 'package:envanter/presentation/bloc/items/items_state.dart';
import 'package:meta/meta.dart';

class ItemsCubit extends Cubit<ItemsState> {
  final ItemsRepository repository;

  ItemsCubit(this.repository) : super(InitialState());

  openBottomSheet() {
    emit(OpenBottomSheetState());
  }

  closeBottomSheet() {
    emit(CloseBottomSheetState());
  }

  openAddItemPage({@required String currentDirectory}) {
    emit(OpenAddItemState(currentDirectory: currentDirectory));
  }

  openAddFolderPage({@required String currentDirectory}) {
    emit(OpenAddFolderState(currentDirectory: currentDirectory));
  }

  closeAddItemPage() {
    emit(CloseAddItemState());
  }

  closeAddFolderPage() {
    emit(CloseAddFolderState());
  }
}
