import 'package:envanter/core/base/base_model.dart';

class ItemModel extends BaseModel {
  int itemFolderId;
  String itemTitle;
  int itemQuantity;
  int itemMinLevel;
  double itemPrice;
  String itemTag;
  String itemNote;
  String itemBarcode;
  String itemQrLabel;
  String itemPhoto;
  String itemCustomField;
  String itemCreatedOn;
  int itemCreatedBy;
  int itemStatus;
  String itemDeletedOn;
  int itemDeletedBy;
  String itemModifiedOn;
  int itemModifiedBy;
  int itemTypeId;
  int itemCurrency;
  int itemQuantityType;

  ItemModel(
      {this.itemFolderId,
      this.itemTitle,
      this.itemQuantity,
      this.itemMinLevel,
      this.itemPrice,
      this.itemTag,
      this.itemNote,
      this.itemBarcode,
      this.itemQrLabel,
      this.itemPhoto,
      this.itemCustomField,
      this.itemCreatedOn,
      this.itemCreatedBy,
      this.itemStatus,
      this.itemDeletedOn,
      this.itemDeletedBy,
      this.itemModifiedOn,
      this.itemModifiedBy,
      this.itemTypeId,
      this.itemCurrency,
      this.itemQuantityType});

  ItemModel.fromJson(Map<String, dynamic> json) {
    itemFolderId = json['itemFolderId'];
    itemTitle = json['itemTitle'];
    itemQuantity = json['itemQuantity'];
    itemMinLevel = json['itemMinLevel'];
    itemPrice = json['itemPrice'];
    itemTag = json['itemTag'];
    itemNote = json['itemNote'];
    itemBarcode = json['itemBarcode'];
    itemQrLabel = json['itemQrLabel'];
    itemPhoto = json['itemPhoto'];
    itemCustomField = json['itemCustomField'];
    itemCreatedOn = json['itemCreatedOn'];
    itemCreatedBy = json['itemCreatedBy'];
    itemStatus = json['itemStatus'];
    itemDeletedOn = json['itemDeletedOn'];
    itemDeletedBy = json['itemDeletedBy'];
    itemModifiedOn = json['itemModifiedOn'];
    itemModifiedBy = json['itemModifiedBy'];
    itemTypeId = json['itemTypeId'];
    itemCurrency = json['itemCurrency'];
    itemQuantityType = json['itemQuantityType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemFolderId'] = this.itemFolderId;
    data['itemTitle'] = this.itemTitle;
    data['itemQuantity'] = this.itemQuantity;
    data['itemMinLevel'] = this.itemMinLevel;
    data['itemPrice'] = this.itemPrice;
    data['itemTag'] = this.itemTag;
    data['itemNote'] = this.itemNote;
    data['itemBarcode'] = this.itemBarcode;
    data['itemQrLabel'] = this.itemQrLabel;
    data['itemPhoto'] = this.itemPhoto;
    data['itemCustomField'] = this.itemCustomField;
    data['itemCreatedOn'] = this.itemCreatedOn;
    data['itemCreatedBy'] = this.itemCreatedBy;
    data['itemStatus'] = this.itemStatus;
    data['itemDeletedOn'] = this.itemDeletedOn;
    data['itemDeletedBy'] = this.itemDeletedBy;
    data['itemModifiedOn'] = this.itemModifiedOn;
    data['itemModifiedBy'] = this.itemModifiedBy;
    data['itemTypeId'] = this.itemTypeId;
    data['itemCurrency'] = this.itemCurrency;
    data['itemQuantityType'] = this.itemQuantityType;
    return data;
  }

  @override
  fromJson(Map<String, Object> json) {
    return ItemModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJsonOffline() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemFolderId'] = this.itemFolderId;
    data['itemTitle'] = this.itemTitle;
    data['itemQuantity'] = this.itemQuantity;
    data['itemMinLevel'] = this.itemMinLevel;
    data['itemPrice'] = this.itemPrice;
    data['itemTag'] = this.itemTag;
    data['itemNote'] = this.itemNote;
    data['itemBarcode'] = this.itemBarcode;
    data['itemQrLabel'] = this.itemQrLabel;

    data['itemCustomField'] = this.itemCustomField;
    data['itemCreatedOn'] = this.itemCreatedOn;
    data['itemCreatedBy'] = this.itemCreatedBy;
    data['itemStatus'] = this.itemStatus;

    data['itemTypeId'] = this.itemTypeId;
    data['itemCurrency'] = this.itemCurrency;
    data['itemQuantityType'] = this.itemQuantityType;
    return data;
  }
}
