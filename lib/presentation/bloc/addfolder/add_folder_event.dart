abstract class AddFolderEvent {}

class FolderNameChangedEvent extends AddFolderEvent {
  final String folderName;

  FolderNameChangedEvent({this.folderName});
}

class FolderTagsChangedEvent extends AddFolderEvent {
  final String folderTags;

  FolderTagsChangedEvent({this.folderTags});
}

class FolderNotesChangedEvent extends AddFolderEvent {
  final String folderNotes;

  FolderNotesChangedEvent({this.folderNotes});
}

class FolderBarcodeChangedEvent extends AddFolderEvent {
  final String folderBarcode;

  FolderBarcodeChangedEvent({this.folderBarcode});
}

class NewFolderSubmitted extends AddFolderEvent {}
