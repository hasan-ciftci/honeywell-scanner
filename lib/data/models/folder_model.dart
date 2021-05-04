import 'package:envanter/core/base/base_model.dart';

class FolderModel extends BaseModel {
  int topFolderId;
  String folderName;
  String folderDescription;
  String folderCreatedOn;
  int folderCreatedBy;
  int folderStatus;
  String folderDeletedOn;
  int folderDeletedBy;
  String folderModifiedOn;
  int folderModifiedBy;

  FolderModel(
      {this.topFolderId,
      this.folderName,
      this.folderDescription,
      this.folderCreatedOn,
      this.folderCreatedBy,
      this.folderStatus,
      this.folderDeletedOn,
      this.folderDeletedBy,
      this.folderModifiedOn,
      this.folderModifiedBy});

  FolderModel.fromJson(Map<String, dynamic> json) {
    topFolderId = json['topFolderId'];
    folderName = json['folderName'];
    folderDescription = json['folderDescription'];
    folderCreatedOn = json['folderCreatedOn'];
    folderCreatedBy = json['folderCreatedBy'];
    folderStatus = json['folderStatus'];
    folderDeletedOn = json['folderDeletedOn'];
    folderDeletedBy = json['folderDeletedBy'];
    folderModifiedOn = json['folderModifiedOn'];
    folderModifiedBy = json['folderModifiedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['topFolderId'] = this.topFolderId;
    data['folderName'] = this.folderName;
    data['folderDescription'] = this.folderDescription;
    data['folderCreatedOn'] = this.folderCreatedOn;
    data['folderCreatedBy'] = this.folderCreatedBy;
    data['folderStatus'] = this.folderStatus;
    data['folderDeletedOn'] = this.folderDeletedOn;
    data['folderDeletedBy'] = this.folderDeletedBy;
    data['folderModifiedOn'] = this.folderModifiedOn;
    data['folderModifiedBy'] = this.folderModifiedBy;
    return data;
  }

  @override
  fromJson(Map<String, Object> json) {
    return FolderModel.fromJson(json);
  }

  @override
  Map<String, Object> toJsonOffline() {
    // TODO: implement toJsonOffline
    throw UnimplementedError();
  }
}
