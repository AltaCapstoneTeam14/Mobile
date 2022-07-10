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
                          "${Provider.of<HomeState>(context, listen: false).data.coin!.amount}",
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
                      HomeTextStyle(
                        size: 16,
                        content:
                            "Claim ${state.data.loginCount} Day(s) in a Week",
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 7,
                        ),
                        shrinkWrap: true,
                        itemBuilder: (ctx, i) {
                          return GridTile(
                            footer: Text(index[i]),
                            child: Icon(
                              Icons.attach_money_outlined,
                              color: state.data.status! == 'claimed' &&
                                      i < state.data.loginCount!
                                  ? Colors.yellow.shade700
                                  : Colors.grey,
                            ),
                          );
                        },
                        itemCount: index.length,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.45),
              RoundedButton(
                text: 'Claim',
                press: () {
                  state.claimCoin();
                  Provider.of<DailyState>(context, listen: false).getStatus();
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
