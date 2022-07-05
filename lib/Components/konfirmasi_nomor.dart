import 'package:capstone_project/Components/appbar_primary.dart';
import 'package:capstone_project/Components/rounded_button.dart';
import 'package:capstone_project/Components/text_style.dart';
import 'package:capstone_project/Constant/color.dart';
import 'package:capstone_project/State/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfirmNumber extends StatefulWidget {
  final VoidCallback onTap;
  final String number;
  final String operator;
  final String jenis;
  final int amount;
  final int grossAmount;
  final int id;
  const ConfirmNumber({
    Key? key,
    required this.number,
    required this.onTap,
    required this.operator,
    required this.jenis,
    required this.amount,
    required this.grossAmount,
    required this.id,
  }) : super(key: key);

  @override
  State<ConfirmNumber> createState() => _ConfirmNumberState();
}

class _ConfirmNumberState extends State<ConfirmNumber> {
  @override
  Widget build(BuildContext context) {
    final getProvider = Provider.of<HomeState>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const AppBarPrimary(
        content: 'Konfirmasi',
      ),
      body: SizedBox(
        width: double.infinity,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  // Layout 1
                  SizedBox(
                    width: size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const HomeTextStyle(
                          size: 14,
                          content: 'Detail Nomor',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        HomeTextStyle(
                          size: 18,
                          content: '${widget.operator} - ${widget.number}',
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),

                  // Layout 2
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: SizedBox(
                      width: size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const HomeTextStyle(
                            size: 14,
                            content: 'Rincian Pembelian',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          HomeTextStyle(
                            size: 18,
                            content: widget.jenis,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Layout 3
                  Container(
                    width: size.width,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 2, color: Colors.grey),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        const HomeTextStyle(
                          size: 13,
                          content: 'Rincian Harga',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const HomeTextStyle(
                              size: 13,
                              content: 'Harga Pulsa',
                              color: Colors.black,
                            ),
                            HomeTextStyle(
                              size: 13,
                              content: 'Rp ${widget.amount}',
                              color: Colors.black,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const HomeTextStyle(
                              size: 13,
                              content: 'Biaya Layanan',
                              color: Colors.black,
                            ),
                            HomeTextStyle(
                              size: 13,
                              content:
                                  'Rp ${widget.grossAmount - widget.amount}',
                              color: Colors.black,
                            ),
                          ],
                        ),
                        const Padding(padding: EdgeInsets.only(bottom: 5)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const HomeTextStyle(
                          size: 13,
                          content: 'Total',
                          color: Colors.black,
                        ),
                        HomeTextStyle(
                          size: 13,
                          content: 'Rp ${widget.grossAmount}',
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: size.height * 0.22,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    offset: Offset(3.0, 0),
                    color: Colors.grey,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 10,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: HomeTextStyle(
                        size: 16,
                        content:
                            "Saldo Kamu - Rp. ${getProvider.data.balance!.amount}",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  RoundedButton(
                    text: "Bayar",
                    press: widget.onTap,
                    color: kPrimaryColor,
                    width: size.width * 0.9,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
