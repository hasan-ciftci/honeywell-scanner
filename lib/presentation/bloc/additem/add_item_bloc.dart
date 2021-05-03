import 'package:bloc/bloc.dart';
import 'package:envanter/data/repositories/add_item_repository.dart';
import 'package:envanter/presentation/bloc/additem/add_item_event.dart';
import 'package:envanter/presentation/bloc/additem/add_item_state.dart';

class AddItemBloc extends Bloc<AddItemEvent, AddItemState> {
  final AddItemRepository repository;

  AddItemBloc({this.repository}) : super(AddItemState());

  @override
  Stream<AddItemState> mapEventToState(AddItemEvent event) async* {
    if (event is ItemNameChanged) {
      yield state.copyWith(itemName: event.itemName);
    } else if (event is ItemMinimumLevelChanged) {
      yield state.copyWith(itemMinimumLevel: event.itemMinimumLevel);
    } else if (event is ItemPriceChanged) {
      yield state.copyWith(itemPrice: event.itemPriceChanged);
    } else if (event is ItemTotalValueChanged) {
      yield state.copyWith(itemTotalValue: event.itemTotalValue);
    } else if (event is ItemTagsChanged) {
      yield state.copyWith(itemTags: event.itemTags);
    } else if (event is ItemNotesChanged) {
      yield state.copyWith(itemNotes: event.itemNotes);
    } else if (event is ItemBarcodeChanged) {
      yield state.copyWith(itemBarcode: event.itemBarcode);
    } else if (event is ItemPriceChanged) {
      yield state.copyWith(itemPrice: event.itemPriceChanged);
    } else if (event is NewItemSubmitted) {}
  }
}
