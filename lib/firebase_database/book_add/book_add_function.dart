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
    'referencerNumber': referencerNumber.toUpperCase(),
    'Title': title.toUpperCase(),
    'Author': author.toLowerCase(), // Corrected 'author' to 'Author'
    'Publisher': publisher.toUpperCase(),
    'Edition': edition.toUpperCase(),
    'CoverType': coverType,
    'Quantity': quantity,
  });
  print("Profile created successfully");
}
