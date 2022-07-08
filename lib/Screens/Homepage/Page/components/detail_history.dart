import 'package:capstone_project/Components/background_primary.dart';
import 'package:capstone_project/Components/text_style.dart';
import 'package:flutter/material.dart';

class DetailHistoryPage extends StatelessWidget {
  final String date;
  final String orderId;
  final String status;
  final String productType;
  final String name;
  final String grossAmount;
  final String paymentMethod;
  const DetailHistoryPage({
    Key? key,
    required this.date,
    required this.orderId,
    required this.status,
    required this.productType,
    required this.name,
    required this.grossAmount,
    required this.paymentMethod,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackgroundPrimary(
      appBar: "Detail Transaksi",
      child: Container(
        width: size.width * 0.9,
        height: size.height * 0.5,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1,
            color: Colors.grey.shade300,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 2,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HomeTextStyle(
                        size: 12,
                        content: date,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                      HomeTextStyle(
                        size: 12,
                        content: "order id : $orderId",
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: HomeTextStyle(
                          size: 14,
                          content: 'Transaction $status',
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          color: Colors.grey.shade200,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: HomeTextStyle(
                              size: 18,
                              content: name.toUpperCase(),
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const HomeTextStyle(
                          size: 16,
                          content: 'Total Bayar',
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        HomeTextStyle(
                          size: 16,
                          content: 'Rp $grossAmount',
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(top: 5)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const HomeTextStyle(
                          size: 16,
                          content: 'Metode Pembayaran',
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        HomeTextStyle(
                          size: 16,
                          content: paymentMethod.toUpperCase(),
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
