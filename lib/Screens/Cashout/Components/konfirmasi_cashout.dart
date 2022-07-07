import 'package:capstone_project/Components/appbar_primary.dart';
import 'package:capstone_project/Components/com_helper.dart';
import 'package:capstone_project/Components/rounded_button.dart';
import 'package:capstone_project/Components/success.dart';
import 'package:capstone_project/Components/text_style.dart';
import 'package:capstone_project/Constant/color.dart';
import 'package:capstone_project/Model/cashout/req_cashout.dart';
import 'package:capstone_project/State/cashout_state.dart';
import 'package:capstone_project/State/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfirmCashout extends StatefulWidget {
  final int amount;
  final int id;
  const ConfirmCashout({
    Key? key,
    required this.amount,
    required this.id,
  }) : super(key: key);

  @override
  State<ConfirmCashout> createState() => _ConfirmCashoutState();
}

class _ConfirmCashoutState extends State<ConfirmCashout> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const AppBarPrimary(
        content: 'Konfirmasi Cashout',
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
                  Container(
                    width: size.width,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 2, color: Colors.grey),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const HomeTextStyle(
                          size: 14,
                          content: 'Jumlah Cashout',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        HomeTextStyle(
                          size: 24,
                          content: 'Rp ${widget.amount}',
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
                          content: 'Rincian cashout',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const HomeTextStyle(
                              size: 13,
                              content: 'Jumlah cashout',
                              color: Colors.black,
                            ),
                            HomeTextStyle(
                              size: 13,
                              content: 'Rp. ${widget.amount}',
                              color: Colors.black,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const <Widget>[
                            HomeTextStyle(
                              size: 13,
                              content: 'Biaya cashout',
                              color: Colors.black,
                            ),
                            HomeTextStyle(
                              size: 13,
                              content: 'Free',
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
                          content: 'Total Coin',
                          color: Colors.black,
                        ),
                        HomeTextStyle(
                          size: 13,
                          content: '${widget.amount}',
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
                            "Koinmu : ${Provider.of<HomeState>(context, listen: false).data.coin!.amount!}",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  RoundedButton(
                    text: "Bayar",
                    press: () async {
                      final navigator = Navigator.of(context);
                      fetchData(context);

                      final setData = await Provider.of<CashoutState>(context,
                              listen: false)
                          .transaksiCashout(
                        ReqCashout(
                          productId: widget.id,
                        ),
                      );

                      navigator.pop();
                      navigator.push(
                        MaterialPageRoute(
                          builder: (context) => SuksesPage(
                            status: "cashout success",
                            coin: "-${setData.data!.grossAmount}",
                            jenis: 'Saldo',
                          ),
                        ),
                      );
                    },
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
