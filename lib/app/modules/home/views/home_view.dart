import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('HomeView'),
      //   centerTitle: true,
      // ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 25),
          height: MediaQuery.of(context).size.height,
          color: Color(0xff1B255A),
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/img/POLCA-logo.jpeg', // Ganti dengan path menuju gambar logo
                       width: 65,// Sesuaikan dengan ukuran yang diinginkan
                    ),
                    Text('Polca Library', style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    )),
                    Ink(
                      padding: EdgeInsets.only(left: 30, right: 10),
                      decoration: BoxDecoration(
                        color: Colors.white
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.search),
                        color: Colors.black,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Color(0xff8FBEEA)),
                          padding: MaterialStateProperty.all(EdgeInsets.only(left: 10, right: 80)
                          )
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Image.asset(
                      'assets/img/photo-profile.png', // Ganti dengan path menuju gambar logo
                      width: 40,// Sesuaikan dengan ukuran yang diinginkan
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                child:
                SizedBox(
                    height: 200.0,
                    width: 350.0,
                    child: AnotherCarousel(
                      images: [
                        ExactAssetImage("assets/img/slider-1.jpeg"),
                        ExactAssetImage("assets/img/slider-2.jpeg"),
                      ],
                      showIndicator: false,
                      borderRadius: true,
                      moveIndicatorFromBottom: 180.0,
                      noRadiusForIndicator: true,
                      overlayShadow: true,
                      overlayShadowSize: 0,
                    )
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      alignment: Alignment.centerLeft,
                      child: Text('Top Picks For You',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,

                        ),),
                    ),
                    Container(
                      height: 240,
                      padding: EdgeInsets.only(left: 20),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: controller.obx((state) => ListView.builder(
                              itemCount: state?.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Get.toNamed(
                                      Routes.BOOK,
                                      parameters: {
                                        'id': state![index].id.toString(),
                                      },
                                    );
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 130,
                                          height: 160,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image:
                                              AssetImage('assets/img/cover-not-found.jpeg'),
                                              fit: BoxFit.cover,
                                            ),),
                                        ),
                                        Container(
                                          width: 130,
                                          child: Text(
                                            state![index].judul ?? '',
                                            style: TextStyle(
                                                fontSize: 15, color: Colors.white),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }))),
                    ),
                  ],
                ),
              ),

            ],
          ),
        )
      ),
    );
  }
}