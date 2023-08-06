import 'package:asroo_app/logic/controllers/payment_controller.dart';
import 'package:asroo_app/utils/theme.dart';
import 'package:asroo_app/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controllers/auth_controller.dart';
import '../../../routes/routes.dart';

int radioContainerIndex = 1;
bool changeColors = false;
final TextEditingController phoneController = TextEditingController();
final controller = Get.find<PayMentController>();
final authController = Get.find<AuthController>();

class DeliveryContainerWidget extends StatefulWidget {
  const DeliveryContainerWidget({super.key});

  @override
  State<DeliveryContainerWidget> createState() =>
      _DeliveryContainerWidgetState();
}

class _DeliveryContainerWidgetState extends State<DeliveryContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildRadioContainer(
            address: 'Riadh, Al-mansora',
            name: 'True Store',
            phone: '43-556-3243',
            title: 'True Shop',
            value: 1,
            color: changeColors ? Colors.white : Colors.grey.shade300,
            onChanged: (value) {
              setState(() {
                radioContainerIndex = value;
                changeColors = !changeColors;
              });
            },
            icon: Container()),
        const SizedBox(
          height: 5,
        ),
        Obx(
          () => buildRadioContainer(
              address: controller.address.value,
              name: authController.displayUserName.value,
              phone: controller.phoneNumber.value,
              title: 'Delivery',
              value: 2,
              color: changeColors ? Colors.grey.shade300 : Colors.white,
              onChanged: (value) {
                setState(() {
                  radioContainerIndex = value;
                  changeColors = !changeColors;
                });
                controller.updatePosition();
              },
              icon: InkWell(
                onTap: () {
                  Get.defaultDialog(
                      backgroundColor: Colors.white,
                      radius: 10,
                      textCancel: 'Cancel',
                      confirmTextColor: Colors.black,
                      textConfirm: 'Save',
                      cancelTextColor: Colors.black,
                      onCancel: () {
                        Get.toNamed(Routes.paymentScreen);
                      },
                      onConfirm: () {
                        Get.back();
                        controller.phoneNumber.value = phoneController.text;
                      },
                      buttonColor: Get.isDarkMode ? blueClr : mainColor,
                      content: Padding(
                        padding: const EdgeInsets.all(15),
                        child: TextField(
                          controller: phoneController,
                          onChanged: (searchName) {},
                          style: TextStyle(
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black),
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.text,
                          onSubmitted: (value) {
                            phoneController.text = value;
                          },
                          maxLength: 11,
                          decoration: InputDecoration(
                            fillColor: Get.isDarkMode
                                ? blueClr.withOpacity(.2)
                                : mainColor.withOpacity(.2),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10)),
                            errorBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10)),
                            hintText: "Enter Your Phone Number",
                            suffixIcon: IconButton(
                                onPressed: () {
                                  phoneController.clear();
                                },
                                icon: const Icon(Icons.close)),
                            hintStyle: const TextStyle(
                                color: Colors.black45,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                            focusColor: Colors.red,
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Get.isDarkMode ? blueClr : mainColor,
                            ),
                          ),
                        ),
                      ),
                      title: 'Enter Your Phone Number',
                      titleStyle: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold));
                },
                child: Icon(Icons.contact_phone,
                    size: 20, color: Get.isDarkMode ? blueClr : mainColor),
              )),
        )
      ],
    );
  }
}

Widget buildRadioContainer({
  required Color color,
  required int value,
  required Function onChanged,
  required String name,
  required String title,
  required String phone,
  required String address,
  required Widget icon,
}) {
  return Container(
    height: 120,
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(.2),
              spreadRadius: 3,
              blurRadius: 5)
        ]),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Radio(
            fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
            value: value,
            groupValue: radioContainerIndex,
            onChanged: (value) {
              onChanged(value);
            }),
        const SizedBox(
          width: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils(
                  text: title,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              const SizedBox(
                height: 5,
              ),
              TextUtils(
                  text: name,
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const Text('🇸🇦 +966'),
                  TextUtils(
                      text: phone,
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                  const SizedBox(width: 120),
                  SizedBox(
                    child: icon,
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              TextUtils(
                  text: address,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
            ],
          ),
        )
      ],
    ),
  );
}
