import 'package:capstone_project/Components/appbar_primary.dart';
import 'package:capstone_project/Components/error_page.dart';
import 'package:capstone_project/Components/loading_animation.dart';
import 'package:capstone_project/Components/rounded_button.dart';
import 'package:capstone_project/Components/text_style.dart';
import 'package:capstone_project/Constant/color.dart';
import 'package:capstone_project/State/enum.dart';
import 'package:capstone_project/State/topup_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfirmTopup extends StatefulWidget {
  const ConfirmTopup({Key? key}) : super(key: key);

  @override
  State<ConfirmTopup> createState() => _ConfirmTopupState();
}

class _ConfirmTopupState extends State<ConfirmTopup> {
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final getState = Provider.of<TopupState>(context, listen: false);
      getState.getData();
    });
    super.didChangeDependencies();
  }

  int optionSelected = 0;
  void checkOption(int index) {
    setState(() {
      optionSelected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const AppBarPrimary(
        content: 'Konfirmasi Top Up',
      ),
      body: Consumer<TopupState>(
        builder: (BuildContext context, state, child) {
          if (state.stateType == StateType.loading) {
            return const LoadingAnimation();
          }
          if (state.stateType == StateType.error) {
            return const ErrorPage();
          }
          return SizedBox(
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
                      Container(
                        width: size.width,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width: 2, color: Colors.grey),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const <Widget>[
                            HomeTextStyle(
                              size: 14,
                              content: 'Jumlah Top up',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            HomeTextStyle(
                              size: 24,
                              content: 'Rp 100.000',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * 0.05),
                      // Layout 2
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
                              content: 'Rincian top up',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const <Widget>[
                                HomeTextStyle(
                                  size: 13,
                                  content: 'Jumlah top up',
                                  color: Colors.black,
                                ),
                                HomeTextStyle(
                                  size: 13,
                                  content: 'Rp 100.000',
                                  color: Colors.black,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const <Widget>[
                                HomeTextStyle(
                                  size: 13,
                                  content: 'Biaya top up',
                                  color: Colors.black,
                                ),
                                HomeTextStyle(
                                  size: 13,
                                  content: 'Rp 1000',
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
                          children: const <Widget>[
                            HomeTextStyle(
                              size: 13,
                              content: 'Total',
                              color: Colors.black,
                            ),
                            HomeTextStyle(
                              size: 13,
                              content: 'Rp 101.000',
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
                      GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: Row(
                            children: const <Widget>[
                              Icon(
                                Icons.more_horiz_rounded,
                                color: kPrimaryColor,
                                size: 30,
                              ),
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5)),
                              HomeTextStyle(
                                size: 16,
                                content: "Pilih Metode Pembayaran",
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              )
                            ],
                          ),
                        ),
                      ),
                      RoundedButton(
                        text: "Bayar",
                        press: () {},
                        color: kPrimaryColor,
                        width: size.width * 0.9,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
