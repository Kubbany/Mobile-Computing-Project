abstract class DatabaseService {
  Future<void> addData(String path, Map<String, dynamic> data);
  Future<List<Map<String, dynamic>>?> getData(String path);
  Future<Map<String, dynamic>?> getDataById(String path, String id);
  Future<void> deleteData(String path, String id);
}
