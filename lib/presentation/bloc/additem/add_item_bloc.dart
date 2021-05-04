import 'package:bloc/bloc.dart';
import 'package:envanter/data/repositories/add_item_repository.dart';
import 'package:envanter/presentation/bloc/additem/add_item_event.dart';
import 'package:envanter/presentation/bloc/additem/add_item_state.dart';

class AddItemBloc extends Bloc<AddItemEvent, AddItemState> {
  final AddItemRepository repository;

  AddItemBloc({this.repository}) : super(AddItemState());

  @override
  Stream<AddItemState> mapEventToState(AddItemEvent event) async* {
    if (event is ItemNameChangedEvent) {
      yield state.copyWith(itemName: event.itemName);
    } else if (event is ItemQuantityChangedEvent) {
      yield state.copyWith(itemQuantity: event.itemQuantity);
    } else if (event is ItemMinimumLevelChangedEvent) {
      yield state.copyWith(itemMinimumLevel: event.itemMinimumLevel);
    } else if (event is ItemPriceChangedEvent) {
      yield state.copyWith(itemPrice: event.itemPrice);
    } else if (event is ItemTotalValueChangedEvent) {
      yield state.copyWith(itemTotalValue: event.itemTotalValue);
    } else if (event is ItemTagsChangedEvent) {
      yield state.copyWith(itemTags: event.itemTags);
    } else if (event is ItemNotesChangedEvent) {
      yield state.copyWith(itemNotes: event.itemNotes);
    } else if (event is ItemBarcodeChangedEvent) {
      yield state.copyWith(itemBarcode: event.itemBarcode);
    } else if (event is ItemPriceChangedEvent) {
      yield state.copyWith(itemPrice: event.itemPrice);
    } else if (event is NewItemSubmitted) {}
  }
}
