import 'package:asroo_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SizeList extends StatefulWidget {
  @override
  State<SizeList> createState() => _SizeListState();
}

final List<String> sizeList = ['S', 'M', 'L', 'XL', 'XXL'];
var currentSelected = 0;

class _SizeListState extends State<SizeList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  setState(() {
                    currentSelected = index;
                  });
                },
                child: Container(
                  child: Text(
                    sizeList[index],
                    style: TextStyle(
                        color: Get.isDarkMode
                            ? currentSelected == index
                                ? Colors.white
                                : Colors.white
                            : currentSelected == index
                                ? Colors.black
                                : Colors.black),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                      color: Get.isDarkMode
                          ? currentSelected == index
                              ? blueClr.withOpacity(0.4)
                              : Colors.black
                          : currentSelected == index
                              ? mainColor.withOpacity(0.4)
                              : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Colors.grey.withOpacity(0.4), width: 2)),
                ));
          },
          separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
          itemCount: sizeList.length),
    );
  }
}
