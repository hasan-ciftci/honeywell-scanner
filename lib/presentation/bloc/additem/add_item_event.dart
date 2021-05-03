abstract class AddItemEvent {}

class ItemNameChanged extends AddItemEvent {
  final String itemName;

  ItemNameChanged({this.itemName});
}

class ItemMinimumLevelChanged extends AddItemEvent {
  final String itemMinimumLevel;

  ItemMinimumLevelChanged({this.itemMinimumLevel});
}

class ItemPriceChanged extends AddItemEvent {
  final String itemPriceChanged;

  ItemPriceChanged({this.itemPriceChanged});
}

class ItemTotalValueChanged extends AddItemEvent {
  final String itemTotalValue;

  ItemTotalValueChanged({this.itemTotalValue});
}

class ItemTagsChanged extends AddItemEvent {
  final String itemTags;

  ItemTagsChanged({this.itemTags});
}

class ItemNotesChanged extends AddItemEvent {
  final String itemNotes;

  ItemNotesChanged({this.itemNotes});
}

class ItemBarcodeChanged extends AddItemEvent {
  final String itemBarcode;

  ItemBarcodeChanged({this.itemBarcode});
}

class NewItemSubmitted extends AddItemEvent {}
