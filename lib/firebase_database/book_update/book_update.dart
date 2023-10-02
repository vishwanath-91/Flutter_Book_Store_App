import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'book_update_function.dart';

class BookUpdateInfo extends StatefulWidget {
  final List<QueryDocumentSnapshot<Object?>> bookInfo;

  const BookUpdateInfo({Key? key, required this.bookInfo}) : super(key: key);

  @override
  State<BookUpdateInfo> createState() => _BookUpdateInfoState();
}

class _BookUpdateInfoState extends State<BookUpdateInfo> {
  final _bookUpdateKey = GlobalKey<FormState>();

  String? updateCategory = '';
  String updateBookId = "";
  String updateReferencerNumber = "";
  String updateTitle = "";
  String updateAuthor = "";
  String updatePublisher = "";
  String updateEdition = "";
  String updateCoverType = "";
  int updatePrice = 0;
  int updateQuantity = 0;

  showValue() {
    print(updateCategory);
    print(updateBookId);
    print(updateReferencerNumber);
    print(updateTitle);
    print(updateAuthor);
    print(updatePublisher);
    print(updateEdition);
    print(updateCoverType);
    print(updateQuantity);
  }

  String? _validateField(String? value) {
    if (value == null || value.isEmpty) {
      return "Value should not be empty";
    }
    return null;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //////////////
    final List<QueryDocumentSnapshot<Object?>> bookInfo = widget.bookInfo;
    ///////////////////////
    final String bookId = bookInfo[0].id;
    //////////////////////
    return Scaffold(
      appBar: AppBar(title: Text("Book Info Update")),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                color: Colors.indigoAccent,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Add Your Book Here For (Your Book Store)",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          Form(
              key: _bookUpdateKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InputDecorator(
                      decoration: InputDecoration(
                          labelText: "Category",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Radio(
                                value: "Comics",
                                groupValue: updateCategory,
                                fillColor:
                                    MaterialStateProperty.all(Colors.blue),
                                splashRadius: 25,
                                onChanged: (newValue) {
                                  setState(() {
                                    updateCategory = newValue.toString();
                                  });
                                },
                              ),
                              const Expanded(child: Text("Comics")),
                              Radio(
                                value: "Classics",
                                groupValue: updateCategory,
                                fillColor:
                                    MaterialStateProperty.all(Colors.blue),
                                splashRadius: 25,
                                onChanged: (newValue) {
                                  setState(() {
                                    updateCategory = newValue.toString();
                                  });
                                },
                              ),
                              const Expanded(child: Text("Classics")),
                              Radio(
                                value: "Horror",
                                groupValue: updateCategory,
                                fillColor:
                                    MaterialStateProperty.all(Colors.blue),
                                splashRadius: 25,
                                onChanged: (newValue) {
                                  setState(() {
                                    updateCategory = newValue.toString();
                                  });
                                },
                              ),
                              const Expanded(child: Text("Horror")),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                value: "Romance",
                                groupValue: updateCategory,
                                fillColor:
                                    MaterialStateProperty.all(Colors.blue),
                                splashRadius: 25,
                                onChanged: (newValue) {
                                  setState(() {
                                    updateCategory = newValue.toString();
                                  });
                                },
                              ),
                              const Expanded(child: Text("Romance")),
                              Radio(
                                value: "Fantasy Fiction",
                                groupValue: updateCategory,
                                fillColor:
                                    MaterialStateProperty.all(Colors.blue),
                                splashRadius: 25,
                                onChanged: (newValue) {
                                  setState(() {
                                    updateCategory = newValue.toString();
                                  });
                                },
                              ),
                              const Expanded(child: Text("Fantasy Fiction")),
                              Radio(
                                value: "History",
                                groupValue: updateCategory,
                                fillColor:
                                    MaterialStateProperty.all(Colors.blue),
                                splashRadius: 25,
                                onChanged: (newValue) {
                                  setState(() {
                                    updateCategory = newValue.toString();
                                  });
                                },
                              ),
                              const Expanded(child: Text("History")),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      initialValue: bookId,
                      key: const ValueKey("bookId"),
                      decoration: InputDecoration(
                          labelText: "Book_Id",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                      validator: (value) => _validateField(value),
                      onSaved: (newValue) {
                        updateBookId = newValue.toString();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      initialValue: bookInfo[0]['referencerNumber'],
                      key: const ValueKey("referencerNumber"),
                      decoration: InputDecoration(
                          labelText: "Referencer_Number",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                      onSaved: (newValue) {
                        updateReferencerNumber = newValue.toString();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      initialValue: bookInfo[0]['Title'],
                      key: const ValueKey("Title"),
                      decoration: InputDecoration(
                        labelText: "Title",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (value) => _validateField(value),
                      onSaved: (newValue) {
                        updateTitle = newValue.toString();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      initialValue: bookInfo[0]['Author'],
                      key: const ValueKey("Author"),
                      decoration: InputDecoration(
                        labelText: "Author",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (value) => _validateField(value),
                      onSaved: (newValue) {
                        updateAuthor = newValue.toString();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      initialValue: bookInfo[0]['Publisher'],
                      key: const ValueKey("Publisher"),
                      decoration: InputDecoration(
                        labelText: "Publisher",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (value) => _validateField(value),
                      onSaved: (newValue) {
                        updatePublisher = newValue.toString();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      initialValue: bookInfo[0]['Edition'],
                      key: const ValueKey("Edition"),
                      decoration: InputDecoration(
                        labelText: "Edition",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (value) => _validateField(value),
                      onSaved: (newValue) {
                        updateEdition = newValue.toString();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      initialValue: bookInfo[0]['Quantity'].toString(),
                      key: const ValueKey("Quantity"),
                      decoration: InputDecoration(
                        labelText: "Quantity",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (value) => _validateField(value),
                      onSaved: (newValue) {
                        updateQuantity = int.parse(newValue!);
                      },
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InputDecorator(
                      decoration: InputDecoration(
                        labelText: "CoverType",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Row(
                        children: [
                          Radio(
                            value: "HardCover",
                            groupValue: updateCoverType,
                            fillColor: MaterialStateProperty.all(Colors.blue),
                            splashRadius: 20,
                            onChanged: (newValue) {
                              setState(() {
                                updateCoverType = newValue.toString();
                              });
                            },
                          ),
                          const Expanded(child: Text("HardCover")),
                          Radio(
                            value: "PaperBack",
                            groupValue: updateCoverType,
                            fillColor: MaterialStateProperty.all(Colors.blue),
                            splashRadius: 25,
                            onChanged: (newValue) {
                              setState(() {
                                updateCoverType = newValue.toString();
                              });
                            },
                          ),
                          const Expanded(child: Text("PaperBack"))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      if (_bookUpdateKey.currentState!.validate()) {
                        _bookUpdateKey.currentState!.save();
                        showValue();
                        updateBook(
                            updateCategory,
                            updateBookId,
                            updateReferencerNumber,
                            updateTitle,
                            updateAuthor,
                            updatePublisher,
                            updateEdition,
                            updateCoverType,
                            updateQuantity);
                      }
                    },
                    child: const Text("Update"),
                  ),
                ],
              ))
        ]),
      ),
    );
  }
}
