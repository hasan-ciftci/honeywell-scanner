import 'package:bloc/bloc.dart';
import 'package:envanter/data/repositories/add_folder_repository.dart';

import 'add_folder_event.dart';
import 'add_folder_state.dart';

class AddFolderBloc extends Bloc<AddFolderEvent, AddFolderState> {
  final AddFolderRepository repository;

  AddFolderBloc({this.repository}) : super(AddFolderState());

  @override
  Stream<AddFolderState> mapEventToState(AddFolderEvent event) async* {
    if (event is FolderNameChanged) {
      yield state.copyWith(folderName: event.folderName);
    } else if (event is FolderTagsChanged) {
      yield state.copyWith(folderTags: event.folderTags);
    } else if (event is FolderNotesChanged) {
      yield state.copyWith(folderNotes: event.folderNotes);
    } else if (event is FolderBarcodeChanged) {
      yield state.copyWith(folderBarcode: event.folderBarcode);
    } else if (event is NewFolderSubmitted) {}
  }
}
