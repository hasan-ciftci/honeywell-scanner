abstract class AddItemEvent {}

class ItemNameChangedEvent extends AddItemEvent {
  final String itemName;

  ItemNameChangedEvent({this.itemName});
}

class ItemQuantityChangedEvent extends AddItemEvent {
  final String itemQuantity;

  ItemQuantityChangedEvent({this.itemQuantity});
}

class ItemMinimumLevelChangedEvent extends AddItemEvent {
  final String itemMinimumLevel;

  ItemMinimumLevelChangedEvent({this.itemMinimumLevel});
}

class ItemPriceChangedEvent extends AddItemEvent {
  final String itemPrice;

  ItemPriceChangedEvent({this.itemPrice});
}

class ItemTotalValueChangedEvent extends AddItemEvent {
  final String itemTotalValue;

  ItemTotalValueChangedEvent({this.itemTotalValue});
}

class ItemTagsChangedEvent extends AddItemEvent {
  final String itemTags;

  ItemTagsChangedEvent({this.itemTags});
}

class ItemNotesChangedEvent extends AddItemEvent {
  final String itemNotes;

  ItemNotesChangedEvent({this.itemNotes});
}

class ItemBarcodeChangedEvent extends AddItemEvent {
  final String itemBarcode;

  ItemBarcodeChangedEvent({this.itemBarcode});
}

class NewItemSubmitted extends AddItemEvent {}
