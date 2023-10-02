import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> delete(
  String collection,
  String bookId,
) async {
  await FirebaseFirestore.instance.collection(collection).doc(bookId).delete();
  print("Profile created successfully");
}
