// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_shadow/simple_shadow.dart';

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  List<Map<String, dynamic>> cactus = [];
  Map<String, dynamic> selected = {};
  int selectedIndex = 0;
  ScrollController controller = ScrollController();

  void scrollToIndex() {
    if (selectedIndex <= 2) {
      controller.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
      );
    } else if (selectedIndex >= 7) {
      controller.animateTo(
        800,
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
      );
    } else {
      controller.animateTo(
        (selectedIndex * 150) - 300,
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    cactus = Get.arguments[0];
    selected = Get.arguments[1];
    selectedIndex = cactus.indexWhere((e) => e['name'] == selected['name']);
    WidgetsBinding.instance.addPostFrameCallback((_) => scrollToIndex());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade900,
      body: Stack(
        children: [
          Positioned(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.black54.withOpacity(0.2),
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
                const SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 20,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 15),
                          Text(
                            'back',
                            style: GoogleFonts.roboto(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          )
                        ],
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
            top: Get.height * 0.14,
            child: SizedBox(
              height: Get.height * 0.8,
              width: 180,
              child: ListView.builder(
                controller: controller,
                itemCount: cactus.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: index == selectedIndex
                              ? Colors.green.shade900
                              : Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.only(
                              topRight: index == (selectedIndex + 1)
                                  ? const Radius.circular(30)
                                  : const Radius.circular(0),
                              bottomRight: index == (selectedIndex - 1)
                                  ? const Radius.circular(30)
                                  : const Radius.circular(0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                                selected = cactus.firstWhere(
                                  (e) => e['name'] == cactus[index]['name'],
                                );
                              });
                              scrollToIndex();
                            },
                            child: SimpleShadow(
                              opacity: 0.2,
                              color: Colors.black,
                              offset: const Offset(-20, -10),
                              sigma: 7,
                              child: Image.asset(
                                cactus[index]['path'],
                                width: 150,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ),
          Positioned(
            top: 100,
            right: -120,
            child: SimpleShadow(
              opacity: 0.2,
              color: Colors.black,
              offset: const Offset(-50, -20),
              sigma: 15,
              child: Image.asset(
                selected['path'],
                width: 350,
              ),
            ),
          ),
          Positioned(
            left: 200,
            top: 450,
            child: SizedBox(
              width: 200,
              child: Text(
                selected['name'],
                style: GoogleFonts.roboto(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow.shade300,
                  height: 1.1,
                ),
              ),
            ),
          ),
          Positioned(
            left: 200,
            top: 520,
            child: Text(
              '\$${selected['price']}.00',
              style: GoogleFonts.roboto(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.yellow.shade300,
              ),
            ),
          ),
          Positioned(
            left: 200,
            top: 570,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                boxIcon('asset/raindrops.png'),
                const SizedBox(width: 10),
                boxIcon('asset/temperature-high.png'),
                const SizedBox(width: 10),
                boxIcon('asset/brightness.png'),
              ],
            ),
          ),
          Positioned(
            left: 200,
            top: 630,
            child: SizedBox(
              width: 200,
              child: Text(
                selected['description'],
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
            ),
          ),
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
}
