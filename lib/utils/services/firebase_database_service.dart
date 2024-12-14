import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/utils/services/database_service.dart';

class FirebaseDatabaseService implements DatabaseService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData(String path, Map<String, dynamic> data) async {
    await firestore.collection(path).add(data);
  }

  @override
  Future<void> deleteData(String path, String id) async {
    await firestore.collection(path).doc(id).delete();
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getData(String path) {
    return firestore.collection(path).snapshots();
  }

  @override
  Future<Map<String, dynamic>?> getDataById(String path, String id) async {
    final DocumentSnapshot doc = await firestore.collection(path).doc(id).get();
    if (doc.exists) {
      return doc.data() as Map<String, dynamic>;
    } else {
      return null;
    }
  }

  @override
  Future<void> editData(
      String path, String id, Map<String, dynamic> data) async {
    await firestore.collection(path).doc(id).update(data);
  }
}
