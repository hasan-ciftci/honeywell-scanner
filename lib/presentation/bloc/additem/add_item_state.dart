import 'package:equatable/equatable.dart';

class AddItemState extends Equatable {
  final String itemName;
  bool get isValidItemName => itemName != null && itemName.length > 0;

  final String itemQuantity;
  final String itemMinimumLevel;
  final String itemPrice;
  final String itemTotalValue;
  final String itemTags;
  final String itemNotes;
  final String itemBarcode;

  AddItemState({
    this.itemName,
    this.itemQuantity,
    this.itemMinimumLevel,
    this.itemPrice,
    this.itemTotalValue,
    this.itemTags,
    this.itemNotes,
    this.itemBarcode,
  });

  AddItemState copyWith({
    String itemName,
    String itemQuantity,
    String itemMinimumLevel,
    String itemPrice,
    String itemTotalValue,
    String itemTags,
    String itemNotes,
    String itemBarcode,
  }) {
    return AddItemState(
      itemName: itemName ?? this.itemName,
      itemQuantity: itemQuantity ?? this.itemQuantity,
      itemMinimumLevel: itemMinimumLevel ?? this.itemMinimumLevel,
      itemPrice: itemPrice ?? this.itemPrice,
      itemTotalValue: itemTotalValue ?? this.itemTotalValue,
      itemTags: itemTags ?? this.itemTags,
      itemNotes: itemNotes ?? this.itemNotes,
      itemBarcode: itemBarcode ?? this.itemBarcode,
    );
  }

  @override
  List<Object> get props => [
        itemName,
        itemQuantity,
        itemMinimumLevel,
        itemPrice,
        itemTotalValue,
        itemTags,
        itemNotes,
        itemBarcode
      ];
}
