import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/routes/app_pages.dart';
import '../controllers/book_detail_controller.dart';

class BookDetailView extends GetView<BookDetailController> {
  const BookDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1B255A),
      appBar: AppBar(
        backgroundColor: Color(0xff1B255A),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Get.offAllNamed(Routes.HOME);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/img/photo-profile.png',
              width: 40,
              height: 40,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  width: 200, // Lebar gambar yang ingin ditampilkan
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/img/cover-not-found.jpeg',
                        width: 150, // Lebar gambar yang ingin ditampilkan di tengah
                        fit: BoxFit.cover,
                      ),
                      Text('Title')
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
