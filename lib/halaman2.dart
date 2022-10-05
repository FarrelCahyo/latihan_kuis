import 'package:flutter/material.dart';
import 'books_data.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailBuku extends StatefulWidget {
  final BooksData list;

  const DetailBuku({Key? key, required this.list}) : super(key: key);

  @override
  State<DetailBuku> createState() => _DetailBukuState();
}

class _DetailBukuState extends State<DetailBuku> {
  bool isBook = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.list.title}"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isBook = !isBook;
              });
            },
            icon: (isBook) ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
          ),
          IconButton(
            onPressed: () {
              _launchURL(widget.list.previewLink);
            },
            icon: Icon(Icons.share),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: (MediaQuery.of(context).size.height) / 3,
              child: Image.network(
                widget.list.imageLinks,
                width: 192,
              ),
              decoration: BoxDecoration(
                color: (isBook) ? Colors.deepOrange : Colors.white,
              ),
            ),


            Container(
                height: (MediaQuery.of(context).size.height) / 3,
                decoration: BoxDecoration(
                  color: (isBook) ? Colors.deepOrange : Colors.white,
                ),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              // Text(
                              //   widget.list.title,
                              //   style: TextStyle(
                              //       color: (isBook) ? Colors.deepOrangeAccent : Colors.black,
                              //       fontSize: 24, fontWeight: FontWeight.bold),
                              // ),
                              Text(
                                "Author : ${widget.list.authors}",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal),
                              ),
                              // SizedBox(
                              //   height: 20,
                              // ),
                              Container(
                                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                child: Text(
                                  widget.list.publisher,
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                child: Text(
                                  widget.list.publishedDate,
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              // SizedBox(
                              //   height: 20,
                              // ),
                              Container(
                                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                child: Text(
                                  widget.list.description,
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              // SizedBox(
                              //   height: 20,
                              // ),

                              // Container(
                              //   padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                              //   child: Text(
                              //     widget.list.categories.length,
                              //     textAlign: TextAlign.justify,
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: 20,
                              // ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: 1,
                    )),
          ],
        ),
      ),
    );
  }

  void _launchURL(_url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }
}
