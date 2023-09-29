import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> create(
  String category,
  String bookId,
  String referencerNumber,
  String title,
  String author,
  String publisher,
  String edition,
  String coverType,
  int quantity,
) async {
  await FirebaseFirestore.instance.collection(category).doc(bookId).set({
    'referencerNumber': referencerNumber,
    'Title': title,
    'Author': author, // Corrected 'author' to 'Author'
    'Publisher': publisher,
    'Edition': edition,
    'CoverType': coverType,
    'Quantity': quantity,
  });
  print("Profile created successfully");
}
