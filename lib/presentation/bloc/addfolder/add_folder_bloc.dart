import 'package:bloc/bloc.dart';
import 'package:envanter/data/repositories/add_folder_repository.dart';

import 'add_folder_event.dart';
import 'add_folder_state.dart';

class AddFolderBloc extends Bloc<AddFolderEvent, AddFolderState> {
  final AddFolderRepository repository;

  AddFolderBloc({this.repository}) : super(AddFolderState());

  @override
  Stream<AddFolderState> mapEventToState(AddFolderEvent event) async* {
    if (event is FolderNameChangedEvent) {
      yield state.copyWith(folderName: event.folderName);
    } else if (event is FolderTagsChangedEvent) {
      yield state.copyWith(folderTags: event.folderTags);
    } else if (event is FolderNotesChangedEvent) {
      yield state.copyWith(folderNotes: event.folderNotes);
    } else if (event is FolderBarcodeChangedEvent) {
      yield state.copyWith(folderBarcode: event.folderBarcode);
    } else if (event is NewFolderSubmitted) {}
  }
}
