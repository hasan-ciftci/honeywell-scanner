abstract class AddFolderEvent {}

class FolderNameChanged extends AddFolderEvent {
  final String folderName;

  FolderNameChanged({this.folderName});
}

class FolderTagsChanged extends AddFolderEvent {
  final String folderTags;

  FolderTagsChanged({this.folderTags});
}

class FolderNotesChanged extends AddFolderEvent {
  final String folderNotes;

  FolderNotesChanged({this.folderNotes});
}

class FolderBarcodeChanged extends AddFolderEvent {
  final String folderBarcode;

  FolderBarcodeChanged({this.folderBarcode});
}

class NewFolderSubmitted extends AddFolderEvent {}
