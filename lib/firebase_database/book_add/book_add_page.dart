import 'package:flutter/material.dart';

import 'book_add_function.dart';

class BookAdd extends StatefulWidget {
  const BookAdd({Key? key}) : super(key: key);

  @override
  State<BookAdd> createState() => _BookAddState();
}

class _BookAddState extends State<BookAdd> {
  final _bookFormKey = GlobalKey<FormState>();
  String category = "";
  String bookId = "";
  String referencerNumber = "";
  String title = "";
  String author = "";
  String publisher = "";
  String edition = "";
  String coverType = "";
  int price = 0;
  int quantity = 0;

  showValue() {
    print(category);
    print(bookId);
    print(referencerNumber);
    print(title);
    print(author);
    print(publisher);
    print(edition);
    print(coverType);
    print(quantity);
  }

  String? _validateField(String? value) {
    if (value == null || value.isEmpty) {
      return "Value should not be empty";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
            key: _bookFormKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: "Category",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: "Comics",
                              groupValue: category,
                              fillColor: MaterialStateProperty.all(Colors.blue),
                              splashRadius: 25,
                              onChanged: (newValue) {
                                setState(() {
                                  category = newValue.toString();
                                });
                              },
                            ),
                            const Expanded(child: Text("Comics")),
                            Radio(
                              value: "Classics",
                              groupValue: category,
                              fillColor: MaterialStateProperty.all(Colors.blue),
                              splashRadius: 25,
                              onChanged: (newValue) {
                                setState(() {
                                  category = newValue.toString();
                                });
                              },
                            ),
                            const Expanded(child: Text("Classics")),
                            Radio(
                              value: "Horror",
                              groupValue: category,
                              fillColor: MaterialStateProperty.all(Colors.blue),
                              splashRadius: 25,
                              onChanged: (newValue) {
                                setState(() {
                                  category = newValue.toString();
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
                              groupValue: category,
                              fillColor: MaterialStateProperty.all(Colors.blue),
                              splashRadius: 25,
                              onChanged: (newValue) {
                                setState(() {
                                  category = newValue.toString();
                                });
                              },
                            ),
                            const Expanded(child: Text("Romance")),
                            Radio(
                              value: "Fantasy Fiction",
                              groupValue: category,
                              fillColor: MaterialStateProperty.all(Colors.blue),
                              splashRadius: 25,
                              onChanged: (newValue) {
                                setState(() {
                                  category = newValue.toString();
                                });
                              },
                            ),
                            const Expanded(child: Text("Fantasy Fiction")),
                            Radio(
                              value: "History",
                              groupValue: category,
                              fillColor: MaterialStateProperty.all(Colors.blue),
                              splashRadius: 25,
                              onChanged: (newValue) {
                                setState(() {
                                  category = newValue.toString();
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
                    key: const ValueKey("bookId"),
                    decoration: InputDecoration(
                        labelText: "Book_Id",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                    validator: (value) => _validateField(value),
                    onSaved: (newValue) {
                      bookId = newValue.toString();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    key: const ValueKey("referencerNumber"),
                    decoration: InputDecoration(
                        labelText: "Referencer_Number",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                    onSaved: (newValue) {
                      referencerNumber = newValue.toString();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    key: const ValueKey("Title"),
                    decoration: InputDecoration(
                      labelText: "Title",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) => _validateField(value),
                    onSaved: (newValue) {
                      title = newValue.toString();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    key: const ValueKey("Author"),
                    decoration: InputDecoration(
                      labelText: "Author",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) => _validateField(value),
                    onSaved: (newValue) {
                      author = newValue.toString();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    key: const ValueKey("Publisher"),
                    decoration: InputDecoration(
                      labelText: "Publisher",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) => _validateField(value),
                    onSaved: (newValue) {
                      publisher = newValue.toString();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    key: const ValueKey("Edition"),
                    decoration: InputDecoration(
                      labelText: "Edition",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) => _validateField(value),
                    onSaved: (newValue) {
                      edition = newValue.toString();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    key: const ValueKey("Quantity"),
                    decoration: InputDecoration(
                      labelText: "Quantity",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) => _validateField(value),
                    onSaved: (newValue) {
                      quantity = int.parse(newValue!);
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
                          groupValue: coverType,
                          fillColor: MaterialStateProperty.all(Colors.blue),
                          splashRadius: 20,
                          onChanged: (newValue) {
                            setState(() {
                              coverType = newValue.toString();
                            });
                          },
                        ),
                        const Expanded(child: Text("HardCover")),
                        Radio(
                          value: "PaperBack",
                          groupValue: coverType,
                          fillColor: MaterialStateProperty.all(Colors.blue),
                          splashRadius: 25,
                          onChanged: (newValue) {
                            setState(() {
                              coverType = newValue.toString();
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
                    if (_bookFormKey.currentState!.validate()) {
                      _bookFormKey.currentState!.save();
                      showValue();
                      create(category, bookId, referencerNumber, title, author,
                          publisher, edition, coverType, quantity);
                      // TODO: Handle the saved form data, e.g., submit it to an API or store it.
                    }
                  },
                  child: const Text("Add"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
