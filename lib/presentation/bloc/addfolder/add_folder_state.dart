import 'package:equatable/equatable.dart';

class AddFolderState extends Equatable {
  final String folderName;
  bool get isValidFolderName => folderName != null && folderName.length > 0;
  final String folderTags;
  final String folderNotes;
  final String folderBarcode;

  AddFolderState({
    this.folderName,
    this.folderTags,
    this.folderNotes,
    this.folderBarcode,
  });

  AddFolderState copyWith({
    String folderName,
    String folderQuantity,
    String folderMinimumLevel,
    String folderPrice,
    String folderTotalValue,
    String folderTags,
    String folderNotes,
    String folderBarcode,
  }) {
    return AddFolderState(
      folderName: folderName ?? this.folderName,
      folderTags: folderTags ?? this.folderTags,
      folderNotes: folderNotes ?? this.folderNotes,
      folderBarcode: folderBarcode ?? this.folderBarcode,
    );
  }

  @override
  List<Object> get props =>
      [folderName, folderTags, folderNotes, folderBarcode];
}
