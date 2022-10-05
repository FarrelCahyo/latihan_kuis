import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:latihan1/halaman2.dart';
import 'books_data.dart';

class ListBuku extends StatefulWidget {
  const ListBuku({Key? key}) : super(key: key);

  @override
  State<ListBuku> createState() => _ListBukuState();
}

class _ListBukuState extends State<ListBuku> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Latihan Kuis"),
        ),
        body: GridView.builder(
          padding: EdgeInsets.all(10),
          gridDelegate:

              // seperti dibawah adalah maksimal ukuran dan dinamis untuk kesampingnya
              //     SliverGridDelegateWithMaxCrossAxisExtent(
              //   maxCrossAxisExtent: 700,
              //       childAspectRatio: 3 / 2,
              //       crossAxisSpacing: 20,
              //       mainAxisSpacing: 20
              // ),

              // adalah maksimal kesamping dan ukurannya menjadi dinamis
              SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
          itemBuilder: (context, index) {
            final BooksData list = booksData[index];

            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailBuku(list: list)));
              },
              child: Card(
                elevation: 50,
                shadowColor: Colors.black,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AspectRatio(
                      aspectRatio: 2568 / 2568,
                      child: Container(
                        // height: 80,
                        // width: 80,
                        child: Image.network(
                          list.imageLinks,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    // Text(
                    //   list.title,
                    //   style: TextStyle(
                    //       color: Colors.black,
                    //       shadows: [
                    //         Shadow(
                    //             color: Colors.white,
                    //             blurRadius: 10,
                    //             offset: Offset(2, 2))
                    //       ],
                    //       fontSize: 20,
                    //       fontWeight: FontWeight.bold),
                    // ),
                    // SizedBox(
                    //   height: 3,
                    // ),
                    // Text(
                    //   list.publisher,
                    //   style: TextStyle(shadows: [
                    //     Shadow(
                    //         color: Colors.white,
                    //         blurRadius: 10,
                    //         offset: Offset(2, 2))
                    //   ], fontSize: 16, fontWeight: FontWeight.bold),
                    // ),
                  ],
                ),
              ),
            );
          },
          itemCount: booksData.length,
        ));
  }
}
