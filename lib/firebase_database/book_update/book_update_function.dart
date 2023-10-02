import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> updateBook(
    updateCategory,
    updateBookId,
    updateReferencerNumber,
    updateTitle,
    updateAuthor,
    updatePublisher,
    updateEdition,
    updateCoverType,
    updateQuantity) async {
  // Update book information in Firestore
  final bookRef = FirebaseFirestore.instance
      .collection(updateCategory)
      .doc(updateBookId); // Generates a new document ID
  await bookRef.set({
    'referencerNumber': updateReferencerNumber.toUpperCase(),
    'Title': updateTitle.toUpperCase(),
    'Author': updateAuthor.toLowerCase(),
    'Publisher': updatePublisher.toUpperCase(),
    'Edition': updateEdition.toUpperCase(),
    'CoverType': updateCoverType,
    'Quantity': updateQuantity,
  });
}

Future<void> delete(
  String category,
  String bookId,
) async {
  await FirebaseFirestore.instance.collection(category).doc(bookId).delete();
  print("Profile created successfully");
}
