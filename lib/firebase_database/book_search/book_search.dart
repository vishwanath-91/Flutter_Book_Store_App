import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/firebase_database/book_view/book_view_page.dart';

class BookSearch extends StatefulWidget {
  const BookSearch({Key? key}) : super(key: key);

  @override
  State<BookSearch> createState() => _BookSearchState();
}

class _BookSearchState extends State<BookSearch> {
  String? category = 'Comics';
  final bookIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                color: Colors.indigoAccent,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Search Your Book Here For (Your Book Store)",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InputDecorator(
              decoration: InputDecoration(
                  labelText: "Search By Category",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Column(
                children: [
                  Row(
                    children: [
                      Radio(
                        value: "Comics",
                        groupValue: category,
                        onChanged: (newValue) {
                          setState(() {
                            category = newValue.toString();
                          });
                        },
                      ),
                      const Text("Comics"),
                      Radio(
                        value: "Classics",
                        groupValue: category,
                        onChanged: (newValue) {
                          setState(() {
                            category = newValue.toString();
                          });
                        },
                      ),
                      const Text("Classics"),
                      Radio(
                        value: "Horror",
                        groupValue: category,
                        onChanged: (newValue) {
                          setState(() {
                            category = newValue.toString();
                          });
                        },
                      ),
                      const Text("Horror"),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: "Romance",
                        groupValue: category,
                        onChanged: (newValue) {
                          setState(() {
                            category = newValue.toString();
                          });
                        },
                      ),
                      const Text("Romance"),
                      Radio(
                        value: "Fantasy Fiction",
                        groupValue: category,
                        onChanged: (newValue) {
                          setState(() {
                            category = newValue.toString();
                          });
                        },
                      ),
                      const Text("Fantasy Fiction"),
                      Radio(
                        value: "History",
                        groupValue: category,
                        onChanged: (newValue) {
                          setState(() {
                            category = newValue.toString();
                          });
                        },
                      ),
                      const Text("History")
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                controller: bookIdController,
                decoration: InputDecoration(
                    labelText: "Search By Book Id",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)))),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {});
              },
              child: const Text("Search")),
          Expanded(
              child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection(category!)
                .where(FieldPath.documentId, isEqualTo: bookIdController.text)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                // Handle the error here, e.g., show an error message
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const Center(
                  child: Text('No books found.'),
                );
              } else {
                final bookInfo = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: bookInfo.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: Card(
                        margin: EdgeInsets.all(10),
                        color: Colors.white70,
                        child: ListTile(
                          leading: CircleAvatar(),
                          title: Text(bookInfo[index]['Author']),
                          subtitle: Text(bookInfo[index]['Title']),
                          trailing: Text(
                            bookInfo[index]["referencerNumber"],
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return BookViewPage(bookInfo: bookInfo);
                          },
                        ));
                      },
                    );
                  },
                );
              }
            },
          )),
        ],
      ),
    );
  }
}
