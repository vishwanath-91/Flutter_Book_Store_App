import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../book_update/book_update.dart';

class BookViewPage extends StatefulWidget {
  final List<QueryDocumentSnapshot<Object?>> bookInfo;

  const BookViewPage({Key? key, required this.bookInfo}) : super(key: key);

  @override
  State<BookViewPage> createState() => _BookViewPageState();
}

class _BookViewPageState extends State<BookViewPage> {
  @override
  Widget build(BuildContext context) {
    // Access the bookInfo data from the widget's property
    final List<QueryDocumentSnapshot<Object?>> bookInfo = widget.bookInfo;
    ////////////////////
    final String bookId = bookInfo[0].id;

    // You can now use bookInfo to display the data
    return Scaffold(
      appBar: AppBar(title: Text("Book info")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: Column(children: [
              Text("Author: ${bookInfo[0]['Author']}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 25)),
              Text("BookId: $bookId"),
              Text("Title: ${bookInfo[0]['Title']}"),
              Text("Edition: ${bookInfo[0]["Edition"]}"),
              Text("Publisher: ${bookInfo[0]["Publisher"]}"),
              Text("CoverType: ${bookInfo[0]["CoverType"]}"),
              Text("referencerNumber: ${bookInfo[0]["referencerNumber"]}"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return BookUpdateInfo(bookInfo: bookInfo);
                          },
                        ));
                      },
                      child: Text("Update")),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.red)),
                      onPressed: () {},
                      child: Text("Delete"))
                ],
              )
            ]),
          ),
        ],
      ),
    );
  }
}
