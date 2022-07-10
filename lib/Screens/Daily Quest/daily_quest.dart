import 'package:capstone_project/Components/background_primary.dart';
import 'package:capstone_project/Components/error_page.dart';
import 'package:capstone_project/Components/loading_animation.dart';
import 'package:capstone_project/Components/rounded_button.dart';
import 'package:capstone_project/Components/text_style.dart';
import 'package:capstone_project/Constant/color.dart';
import 'package:capstone_project/State/daily_provider.dart';
import 'package:capstone_project/State/enum.dart';
import 'package:capstone_project/State/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DailyPage extends StatefulWidget {
  const DailyPage({Key? key}) : super(key: key);

  @override
  State<DailyPage> createState() => _DailyPageState();
}

class _DailyPageState extends State<DailyPage> {
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final getState = Provider.of<DailyState>(context, listen: false);
      getState.getStatus();
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    List index = [
      'Day 1',
      'Day 2',
      'Day 3',
      'Day 4',
      'Day 5',
      'Day 6',
      'Day 7'
    ];
    Size size = MediaQuery.of(context).size;
    return BackgroundPrimary(
      appBar: "Bishacoin",
      child: Consumer<DailyState>(
        builder: (BuildContext context, state, child) {
          if (state.stateType == StateType.loading) {
            return const LoadingAnimation();
          }
          if (state.stateType == StateType.error) {
            return const ErrorPage();
          }
          return Column(
            children: [
              SizedBox(height: size.height * 0.1),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HomeTextStyle(
                      size: 25,
                      content:
                          "${Provider.of<HomeState>(context).data.coin!.amount}",
                      fontWeight: FontWeight.w500,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Image.asset(
                        "assets/icons/chinese-coin.png",
                        scale: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: size.width * 0.9,
                height: size.height * 0.27,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 1,
                    color: Colors.grey.shade300,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 10,
                      offset: Offset(2, 3),
                      color: Colors.grey,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: HomeTextStyle(
                          size: 16,
                          content:
                              "Claim ${state.data.loginCount} Day(s) this week",
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 7,
                          childAspectRatio: 0.8,
                        ),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (ctx, i) {
                          return Column(
                            children: [
                              Icon(
                                Icons.money_rounded,
                                size: 40,
                                color: state.data.status! == 'claimed' &&
                                        i < state.data.loginCount!
                                    ? Colors.yellow.shade700
                                    : Colors.grey,
                              ),
                              HomeTextStyle(
                                size: 12,
                                content: index[i],
                                color: Colors.black,
                              )
                            ],
                          );
                        },
                        itemCount: index.length,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.45),
              state.data.status! == 'claimed'
                  ? const HomeTextStyle(
                      size: 16,
                      content: "You've taken the coins today",
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    )
                  : RoundedButton(
                      text: 'Claim',
                      press: () {
                        state.claimCoin();
                        Provider.of<DailyState>(context, listen: false)
                            .getStatus();
                        Provider.of<HomeState>(context, listen: false)
                            .getUser();
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (_) {
                            return Dialog(
                              backgroundColor: Colors.white,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    // The loading indicator
                                    Icon(
                                      Icons.money_rounded,
                                      color: Colors.yellow.shade700,
                                      size: 100,
                                    ),
                                    const HomeTextStyle(
                                      size: 20,
                                      content: 'You Get 100 Coin',
                                      color: Colors.black,
                                    ),
                                    RoundedButton(
                                      text: 'Oke',
                                      press: () {
                                        Navigator.pop(context);
                                      },
                                      color: kPrimaryColor,
                                      width: size.width * 0.6,
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      color: kPrimaryColor,
                      width: size.width * 0.9,
                    )
            ],
          );
        },
      ),
    );
  }
}
