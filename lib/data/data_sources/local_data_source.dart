import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:yourdiamonds/data/models/dataset_model.dart';

abstract class DataSetLocalDataSource {
  Future<DataSetModel?> getDataSet();
  Future<Box> openBox(String type);
}

class DataSetLocalDataSourceImpl extends DataSetLocalDataSource {
  DataSetLocalDataSourceImpl();

  @override
  Future<DataSetModel?> getDataSet() async {
    try {
      final response = await DataSetModel.fromJson(DataSet);
      return response;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  @override
  Future<Box> openBox(String type) async {
    var box;
    try {
      box = await Hive.openBox(type);
      return box;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    try {
      await Hive.deleteBoxFromDisk(type);
      box = await Hive.openBox(type);
      return box;
    } catch (e) {
      if (kDebugMode) {
        print('Error resetting box.. $e');
      }
      rethrow;
    }
  }
}
