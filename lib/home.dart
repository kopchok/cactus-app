// ignore_for_file: library_private_types_in_public_api

import 'package:cactus_app/detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_shadow/simple_shadow.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final shadow = [
    const BoxShadow(
      color: Colors.black54,
      spreadRadius: 1,
      blurRadius: 50,
      offset: Offset(1, 0),
    )
  ];

  int indexTab = 0;

  List<Map<String, dynamic>> cactus = [
    {
      "name": "Gymnocalyciocactus",
      "type": "outdoor",
      "price": 23,
      "path": "asset/1.png",
      "description":
          "The Gymnocalyciocactus flourishes outdoors, perfect for adding a rugged charm to your garden."
    },
    {
      "name": "Parodicalcium",
      "type": "outdoor",
      "price": 35,
      "path": "asset/2.png",
      "description":
          "Known for its durability, the Parodicalcium is a superb choice for outdoor landscaping."
    },
    {
      "name": "Acanthopsis",
      "type": "outdoor",
      "price": 11,
      "path": "asset/3.png",
      "description":
          "The Acanthopsis is an ideal outdoor cactus, adding resilience and beauty to your garden."
    },
    {
      "name": "Astrophytaria",
      "type": "indoor",
      "price": 15,
      "path": "asset/4.png",
      "description":
          "With its unique form, the Astrophytaria is an excellent choice for indoor plant enthusiasts."
    },
    {
      "name": "Opuntaceae",
      "type": "indoor",
      "price": 29,
      "path": "asset/5.png",
      "description":
          "The Opuntaceae thrives indoors, requiring minimal care while adding a unique aesthetic."
    },
    {
      "name": "Astrophytphyllum",
      "type": "outdoor",
      "price": 14,
      "path": "asset/6.png",
      "description":
          "Known for its durability, the Astrophytphyllum is a superb choice for outdoor landscaping."
    },
    {
      "name": "Cereopsis",
      "type": "indoor",
      "price": 50,
      "path": "asset/7.png",
      "description":
          "With its unique form, the Cereopsis is an excellent choice for indoor plant enthusiasts."
    },
    {
      "name": "Mammilopsis",
      "type": "outdoor",
      "price": 13,
      "path": "asset/8.png",
      "description":
          "The Mammilopsis is an ideal outdoor cactus, adding resilience and beauty to your garden."
    },
    {
      "name": "Trichocallus",
      "type": "indoor",
      "price": 6,
      "path": "asset/9.png",
      "description":
          "The Trichocallus is perfect for indoor environments, bringing a touch of desert beauty to your home."
    },
    {
      "name": "Acanthphyllum",
      "type": "outdoor",
      "price": 37,
      "path": "asset/10.png",
      "description":
          "Known for its durability, the Acanthphyllum is a superb choice for outdoor landscaping."
    },
  ];

  List<Map<String, dynamic>> filters = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: Column(
        children: [
          Container(
            height: Get.height * 0.5,
            decoration: BoxDecoration(
              color: Colors.green.shade900.withOpacity(0.8),
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.4),
                          Colors.transparent
                        ],
                        stops: const [0, 0.8],
                        begin: Alignment.center,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'florest',
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'asset/search.png',
                                color: Colors.white,
                                width: 16,
                              ),
                              const SizedBox(width: 20),
                              CircleAvatar(
                                backgroundColor: Colors.white.withOpacity(0.2),
                                child: Image.asset(
                                  'asset/shopping-bag.png',
                                  color: Colors.white,
                                  width: 16,
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: Get.height * 0.06,
                  right: 0,
                  child: SimpleShadow(
                    opacity: 0.15,
                    color: Colors.black,
                    offset: const Offset(-50, -30),
                    sigma: 15,
                    child: Image.asset(
                      'asset/2.png',
                      width: Get.width * 0.8,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 50,
                  left: 16,
                  child: Text(
                    'Top\npick',
                    style: GoogleFonts.roboto(
                      fontSize: 50,
                      color: Colors.yellow.shade300,
                      height: 1,
                      letterSpacing: 3,
                      shadows: shadow,
                    ),
                  ),
                ),
                indicatorCount(
                  0,
                  cactus.length,
                  Get.width * 0.06,
                ),
                indicatorCount(
                  1,
                  cactus.where((e) => e['type'] == 'outdoor').length,
                  Get.width * 0.25,
                ),
                indicatorCount(
                  2,
                  cactus.where((e) => e['type'] == 'indoor').length,
                  Get.width * 0.65,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              tabName(
                index: 0,
                label: 'All',
                onTap: () {
                  setState(() {
                    indexTab = 0;
                    filters = cactus;
                  });
                },
              ),
              tabName(
                index: 1,
                label: 'Outdoor',
                onTap: () {
                  setState(() {
                    indexTab = 1;
                    filters =
                        cactus.where((e) => e['type'] == 'outdoor').toList();
                  });
                },
              ),
              tabName(
                index: 2,
                label: 'Indoor',
                onTap: () {
                  setState(() {
                    indexTab = 2;
                    filters =
                        cactus.where((e) => e['type'] == 'indoor').toList();
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: filters.length,
              shrinkWrap: true,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Get.to(
                    const Detail(),
                    arguments: [
                      cactus,
                      filters[index],
                    ],
                  ),
                  child: SizedBox(
                    height: 150,
                    width: Get.width,
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: Get.width * 0.2,
                              color: Colors.transparent,
                            ),
                            Container(
                              width: Get.width * 0.8,
                              decoration: BoxDecoration(
                                color: Colors.green.shade900.withOpacity(0.8),
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(16),
                                  topLeft: Radius.circular(16),
                                ),
                              ),
                            )
                          ],
                        ),
                        SimpleShadow(
                          opacity: 0.2,
                          color: Colors.black,
                          offset: const Offset(-20, -10),
                          sigma: 8,
                          child: Image.asset(
                            filters[index]['path'],
                          ),
                        ),
                        Positioned(
                          top: 20,
                          left: Get.width * 0.32,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: Get.width * 0.4,
                                    child: Text(
                                      filters[index]['name'],
                                      style: GoogleFonts.roboto(
                                        color: Colors.yellow.shade300,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w600,
                                        height: 1,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      boxIcon('asset/raindrops.png'),
                                      const SizedBox(width: 10),
                                      boxIcon('asset/temperature-high.png'),
                                      const SizedBox(width: 10),
                                      boxIcon('asset/brightness.png'),
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(width: 20),
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: const Icon(
                                  Icons.add,
                                  size: 50,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget boxIcon(String path) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white54,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Image.asset(
          path,
          width: 16,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget tabName({
    required String label,
    required int index,
    required Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        label,
        style: GoogleFonts.roboto(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: indexTab == index ? Colors.black : Colors.grey,
        ),
      ),
    );
  }

  Widget indicatorCount(int index, int count, double left) {
    return Positioned(
      bottom: -15,
      left: left,
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          color: indexTab == index ? Colors.black : Colors.grey,
          borderRadius: BorderRadius.circular(45),
        ),
        child: Center(
          child: Text(
            count.toString(),
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
