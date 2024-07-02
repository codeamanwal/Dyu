import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Stream<List<MyModel>> getItems() {
  //   return _db.collection('items').snapshots().map((snapshot) =>
  //       snapshot.docs.map((doc) => MyModel.fromFirestore(doc.data())).toList());
  // }
  //
  // Future<void> addItem(MyModel item) {
  //   return _db.collection('items').add(item.toMap());
  // }
  //
  // Future<void> updateItem(MyModel item) {
  //   return _db.collection('items').doc(item.id).update(item.toMap());
  // }
  //
  // Future<void> deleteItem(String id) {
  //   return _db.collection('items').doc(id).delete();
  // }
}
