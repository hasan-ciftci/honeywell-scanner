import 'package:envanter/core/base/base_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static DatabaseService _instance;

  static DatabaseService get instance {
    _instance ??= DatabaseService._init();
    return _instance;
  }

  DatabaseService._init();

  String _databaseName = "recordsdb";
  String _itemTable = "Item";
  String _folderTable = "Folder";
  int _version = 1;
  Database database;

  String itemId = "itemId";
  String itemFolderId = "itemFolderId";
  String itemTitle = "itemTitle";
  String itemQuantity = "itemQuantity";
  String itemMinLevel = "itemMinLevel";
  String itemPrice = "itemPrice";
  String itemTag = "itemTag";
  String itemNote = "itemNote";
  String itemBarcode = "itemBarcode";
  String itemQrLabel = "itemQrLabel";
  String itemCustomField = "itemCustomField";
  String itemCreatedOn = "itemCreatedOn";
  String itemCreatedBy = "itemCreatedBy";
  String itemStatus = "itemStatus";
  String itemTypeId = "itemTypeId";
  String itemCurrency = "itemCurrency";
  String itemQuantityType = "itemQuantityType";

  String folderId = "folderId";
  String topFolderId = "topFolderId";
  String folderName = "folderName";
  String folderDescription = "folderDescription";
  String folderCreatedOn = "folderCreatedOn";
  String folderCreatedBy = "folderCreatedBy";
  String folderStatus = "folderStatus";
  String folderDeletedOn = "folderDeletedOn";
  String folderDeletedBy = "folderDeletedBy";
  String folderModifiedOn = "folderModifiedOn";
  String folderModifiedBy = "folderModifiedBy";

  Future open() async {
    database = await openDatabase(
      _databaseName,
      version: _version,
      onCreate: (db, version) async {
        await createTable(db);
      },
    );
  }

  Future<bool> insertItem<T extends BaseModel>(T model) async {
    if (database == null) await open();

    final insertedItem = await database.insert(
      _itemTable,
      model.toJsonOffline(),
    );

    return insertedItem != null;
  }

  Future<bool> insertFolder<T extends BaseModel>(T model) async {
    if (database == null) open();

    final insertedFolder = await database.insert(
      _folderTable,
      model.toJson(),
    );

    return insertedFolder != null;
  }

  Future<void> createTable(Database db) async {
    await db.execute(
      '''CREATE TABLE IF NOT EXISTS $_itemTable (
        $itemId INTEGER PRIMARY KEY AUTOINCREMENT, 
        $itemFolderId INTEGER,
        $itemTitle VARCHAR(100),
        $itemQuantity INTEGER,
        $itemMinLevel INTEGER,
        $itemPrice DOUBLE,
        $itemTag VARCHAR(1000),
        $itemNote VARCHAR(1000), 
        $itemBarcode VARCHAR(1000),
        $itemQrLabel VARCHAR(1000),
        $itemCustomField VARCHAR(2000),
        $itemCreatedOn VARCHAR(100),
        $itemCreatedBy INTEGER,
        $itemStatus INTEGER,
        $itemTypeId INTEGER,
        $itemCurrency INTEGER,
        $itemQuantityType INTEGER
        )
        ''',
    );

    await db.execute(
      '''CREATE TABLE IF NOT EXISTS $_folderTable (
        $folderId INTEGER PRIMARY KEY AUTOINCREMENT, 
        $topFolderId INTEGER,
        $folderName VARCHAR(50),
        $folderDescription VARCHAR(1000),
        $folderCreatedOn VARCHAR(100),
        $folderCreatedBy INTEGER,
        $folderStatus INTEGER,
        $folderDeletedOn VARCHAR(100),
        $folderDeletedBy INTEGER,
        $folderModifiedOn VARCHAR(100),
        $folderModifiedBy INTEGER
        )
        ''',
    );
  }
}
