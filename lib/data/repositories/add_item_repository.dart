import 'package:envanter/core/init/database/database_service.dart';
import 'package:envanter/data/models/item_model.dart';
import 'package:meta/meta.dart';

class AddItemRepository {
  Future<void> saveItem({
    @required int itemFolderId,
    @required String itemTitle,
    @required int itemQuantity,
    @required int itemMinLevel,
    @required double itemPrice,
    @required String itemTag,
    @required String itemNote,
    @required String itemBarcode,
    @required String itemQrLabel,
    @required String itemPhoto,
    @required String itemCustomField,
    @required String itemCreatedOn,
    @required int itemCreatedBy,
    @required int itemTypeId,
    @required int itemStatus,
    @required int itemCurrency,
    @required int itemQuantityType,
  }) async {
    ItemModel itemModel = ItemModel(
        itemFolderId: itemFolderId,
        itemTitle: itemTitle,
        itemQuantity: itemQuantity,
        itemMinLevel: itemMinLevel,
        itemPrice: itemPrice,
        itemTag: itemTag,
        itemNote: itemNote,
        itemBarcode: itemBarcode,
        itemQrLabel: itemQrLabel,
        itemPhoto: itemPhoto,
        itemCustomField: itemCustomField,
        itemCreatedOn: itemCreatedOn,
        itemCreatedBy: itemCreatedBy,
        itemTypeId: itemTypeId,
        itemCurrency: itemCurrency,
        itemStatus: 0,
        itemQuantityType: itemQuantityType);
    try {
      await DatabaseService.instance.insertItem<ItemModel>(itemModel);
    } catch (e) {
      print(e);
    }
  }
}
