import 'package:asroo_app/utils/theme.dart';
import 'package:asroo_app/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';

int radioContainerIndex = 1;

class PaymentMeyhodWidget extends StatefulWidget {
  @override
  State<PaymentMeyhodWidget> createState() => _PaymentMeyhodWidgetState();
}

class _PaymentMeyhodWidgetState extends State<PaymentMeyhodWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          buildRadioPayment(
              name: 'Payal',
              image: 'assets/images/paypal.png',
              scale: .7,
              value: 1,
              onChanged: (value) {
                setState(() {
                  radioContainerIndex = value;
                });
              }),
          const SizedBox(
            height: 15,
          ),
          buildRadioPayment(
              name: 'Google Pay',
              image: 'assets/images/google.png',
              scale: .8,
              value: 2,
              onChanged: (value) {
                setState(() {
                  radioContainerIndex = value;
                });
              }),
          const SizedBox(
            height: 15,
          ),
          buildRadioPayment(
              name: 'Credit',
              image: 'assets/images/credit.png',
              scale: .7,
              value: 3,
              onChanged: (value) {
                setState(() {
                  radioContainerIndex = value;
                });
              }),
        ],
      ),
    );
  }
}

Widget buildRadioPayment(
    {required String image,
    required double scale,
    required String name,
    required int value,
    required Function onChanged}) {
  return Container(
    height: 50,
    width: double.infinity,
    color: Colors.grey[300],
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              scale: scale,
            ),
            const SizedBox(
              width: 10,
            ),
            TextUtils(
                text: name,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black),
            Radio(
                value: value,
                groupValue: radioContainerIndex,
                fillColor:
                    MaterialStateColor.resolveWith((states) => mainColor),
                onChanged: (value) {
                  onChanged(value);
                })
          ],
        )
      ],
    ),
  );
}
