import 'package:capstone_project/Components/appbar_primary.dart';
import 'package:capstone_project/Components/com_helper.dart';
import 'package:capstone_project/Components/pending.dart';
import 'package:capstone_project/Components/rounded_button.dart';
import 'package:capstone_project/Components/text_style.dart';
import 'package:capstone_project/Constant/color.dart';
import 'package:capstone_project/Model/topup/payment_request.dart';
import 'package:capstone_project/Screens/Topup/components/bank_transfer.dart';
import 'package:capstone_project/State/pembayaran_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ConfirmTopup extends StatefulWidget {
  final int amount;
  final int grossAmount;
  final int id;
  const ConfirmTopup({
    Key? key,
    required this.amount,
    required this.grossAmount,
    required this.id,
  }) : super(key: key);

  @override
  State<ConfirmTopup> createState() => _ConfirmTopupState();
}

class _ConfirmTopupState extends State<ConfirmTopup> {
  @override
  Widget build(BuildContext context) {
    final getProvider = Provider.of<PaymentState>(context, listen: true);

    Future<void> _launchInBrowser(Uri url) async {
      if (!await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      )) {
        throw 'Could not launch $url';
      }
    }

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const AppBarPrimary(
        content: 'Konfirmasi Top Up',
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
                          content: 'Jumlah Top up',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        HomeTextStyle(
                          size: 24,
                          content: 'Rp. ${widget.amount}',
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
                          children: <Widget>[
                            const HomeTextStyle(
                              size: 13,
                              content: 'Jumlah top up',
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
                          children: <Widget>[
                            const HomeTextStyle(
                              size: 13,
                              content: 'Biaya top up',
                              color: Colors.black,
                            ),
                            HomeTextStyle(
                              size: 13,
                              content:
                                  'Rp. ${widget.grossAmount - widget.amount}',
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
                          content: 'Rp. ${widget.grossAmount}',
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
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                          ),
                        ),
                        backgroundColor: Colors.white,
                        builder: (_) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30.0),
                                    topRight: Radius.circular(30.0),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 10,
                                      offset: Offset(0, 3),
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    const Divider(
                                      thickness: 5,
                                      indent: 170,
                                      endIndent: 170,
                                      color: Colors.grey,
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 10,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          const HomeTextStyle(
                                            size: 16,
                                            content: "Pilih Metode Pembayaran",
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            icon: const Icon(
                                              Icons.close_rounded,
                                              size: 35,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const Padding(padding: EdgeInsets.only(top: 20)),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const BankTransfer(),
                                    ),
                                  );
                                },
                                child: const ListTile(
                                  leading: Icon(
                                    Icons.credit_card_rounded,
                                    color: kPrimaryColor,
                                    size: 50,
                                  ),
                                  title: HomeTextStyle(
                                    size: 16,
                                    content: "ATM/Bank Transfer",
                                    color: Color(0xFF666666),
                                    fontWeight: FontWeight.w500,
                                  ),
                                  subtitle: HomeTextStyle(
                                    size: 13,
                                    content:
                                        "Pay from ATM Bersama, Prima or Alto",
                                    color: Color(0xFF666666),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              // Gopay Payment
                              GestureDetector(
                                onTap: () {
                                  getProvider.addMethod("Gopay");
                                  Navigator.pop(context);
                                },
                                child: ListTile(
                                  leading: Image.asset(
                                    "assets/icons/gopay.png",
                                    scale: 2.1,
                                  ),
                                  title: const HomeTextStyle(
                                    size: 16,
                                    content: "GoPay/other e-Wallets",
                                    color: Color(0xFF666666),
                                    fontWeight: FontWeight.w500,
                                  ),
                                  subtitle: const HomeTextStyle(
                                    size: 13,
                                    content:
                                        "Scan QR code using GoPay or other e-wallets",
                                    color: Color(0xFF666666),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const Padding(padding: EdgeInsets.only(top: 20)),
                            ],
                          );
                        },
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: Row(
                        children: <Widget>[
                          const Icon(
                            Icons.more_horiz_rounded,
                            color: kPrimaryColor,
                            size: 30,
                          ),
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5)),
                          HomeTextStyle(
                            size: 16,
                            content: getProvider.method == "null"
                                ? "Pilih Metode Pembayaran"
                                : getProvider.method,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )
                        ],
                      ),
                    ),
                  ),
                  RoundedButton(
                    text: "Bayar",
                    press: () async {
                      // var name = null;
                      final getToast = ScaffoldMessenger.of(context);
                      final navigator = Navigator.of(context);
                      final getData = getProvider.method;
                      late var setData = PaymentModel(
                        productId: widget.id,
                        transferMethod: getData.toLowerCase(),
                      );

                      if (getData == "Gopay") {
                        fetchData(context);
                        final setGopay = await getProvider.gopayTopup(setData);
                        getProvider.addMethod("null");
                        // dismiss dialog loading
                        navigator.pop();
                        _launchInBrowser(
                          Uri.parse(setGopay.data!.actions![1].url.toString()),
                        );
                        navigator.push(
                          MaterialPageRoute(
                            builder: (context) => PendingPage(
                              va: "",
                              status: setGopay.data!.status!,
                            ),
                          ),
                        );
                      } else if (getData == "BCA" ||
                          getData == "BNI" ||
                          getData == "BRI") {
                        fetchData(context);
                        final setBank = await getProvider.bankTopup(setData);
                        getProvider.addMethod("null");
                        // dismiss dialog loading
                        navigator.pop();
                        navigator.push(
                          MaterialPageRoute(
                            builder: (context) => PendingPage(
                              va: "VA Number : ${setBank.data!.vaNumber}",
                              status: setBank.data!.status!,
                            ),
                          ),
                        );
                      } else {
                        getToast.showSnackBar(
                          toastDialog('Please choose a payment method',
                              Colors.redAccent),
                        );
                      }
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
