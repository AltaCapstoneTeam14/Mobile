import 'package:capstone_project/Components/appbar_primary.dart';
import 'package:capstone_project/Components/com_helper.dart';
import 'package:capstone_project/Components/error_page.dart';
import 'package:capstone_project/Components/loading_animation.dart';
import 'package:capstone_project/Components/product_card.dart';
import 'package:capstone_project/Components/rounded_button.dart';
import 'package:capstone_project/Components/scroll_behavior.dart';
import 'package:capstone_project/Components/text_style.dart';
import 'package:capstone_project/Constant/color.dart';
import 'package:capstone_project/Screens/Cashout/Components/konfirmasi_cashout.dart';
import 'package:capstone_project/State/cashout_state.dart';
import 'package:capstone_project/State/enum.dart';
import 'package:capstone_project/State/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CashoutPage extends StatefulWidget {
  const CashoutPage({Key? key}) : super(key: key);

  @override
  State<CashoutPage> createState() => _CashoutPageState();
}

class _CashoutPageState extends State<CashoutPage> {
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final getState = Provider.of<CashoutState>(context, listen: false);
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

  int? totalKoin;
  int? id;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const AppBarPrimary(
        content: 'Cashout',
      ),
      body: Consumer<CashoutState>(
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
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 8, bottom: 14),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: HomeTextStyle(
                              size: 14,
                              content: 'Pilih Nominal',
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      ScrollConfiguration(
                        behavior: MyBehavior(),
                        child: SizedBox(
                          height: size.height * 0.685,
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                            ),
                            shrinkWrap: true,
                            itemBuilder: (ctx, i) {
                              return ProductCard(
                                amount: state.data[i].coinAmount.toString(),
                                onTap: () {
                                  checkOption(i + 1);
                                  totalKoin = state.data[i].coinAmount;
                                  id = state.data[i].id;
                                },
                                selected: i + 1 == optionSelected,
                                url: "assets/icons/rupiah.png",
                                scale: 5.5,
                              );
                            },
                            itemCount: state.data.length,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: HomeTextStyle(
                            size: 16,
                            content:
                                'Koinmu : ${Provider.of<HomeState>(context, listen: false).data.coin!.amount}',
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      RoundedButton(
                        text: "Lanjut",
                        color: kPrimaryColor,
                        width: size.width,
                        press: () {
                          final getKoin =
                              Provider.of<HomeState>(context, listen: false)
                                  .data
                                  .coin!
                                  .amount!;
                          final getToast = ScaffoldMessenger.of(context);
                          if (optionSelected > 0) {
                            if (getKoin < totalKoin!) {
                              getToast.showSnackBar(
                                toastDialog(
                                  "Your coin is not enough",
                                  Colors.red,
                                ),
                              );
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ConfirmCashout(
                                    amount: totalKoin!,
                                    id: id!,
                                  ),
                                ),
                              );
                            }
                          } else {
                            getToast.showSnackBar(
                              toastDialog(
                                "Please select the cashout amount",
                                Colors.red,
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
