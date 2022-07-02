import 'package:capstone_project/Components/scroll_behavior.dart';
import 'package:capstone_project/Components/shimmer_widget.dart';
import 'package:capstone_project/Components/text_style.dart';
import 'package:capstone_project/Components/error_page.dart';
import 'package:capstone_project/Screens/Homepage/Page/components/info_container.dart';
import 'package:capstone_project/Screens/Homepage/Page/components/promo_widgets.dart';
import 'package:capstone_project/State/home_provider.dart';
import 'package:capstone_project/State/enum.dart';
import 'package:capstone_project/State/pulsa_provider.dart';
import 'package:flutter/material.dart';
import 'package:capstone_project/Constant/color.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final getState = Provider.of<HomeState>(context, listen: false);
      getState.getUser();
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeState>(
      builder: (BuildContext context, state, child) {
        if (state.stateType == StateType.loading) {
          return Column(
            children: [
              ShimmerWidgets(
                child: InfoContainer(
                  size: widget.size,
                  balance: "100000",
                  phone: "000000000000",
                  coin: '500',
                ),
              ),
            ],
          );
        }
        if (state.stateType == StateType.error) {
          return const ErrorPage();
        }
        return ScrollConfiguration(
          behavior: MyBehavior(),
          child: RefreshIndicator(
            onRefresh: () async {
              final getState = Provider.of<HomeState>(context, listen: false);
              getState.getUser();
            },
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: <Widget>[
                  InfoContainer(
                    size: widget.size,
                    balance: state.data.balance!.amount.toString(),
                    phone: state.data.phone.toString(),
                    coin: state.data.coin!.amount.toString(),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 15)),
                  FiturButton(size: widget.size),
                  const Padding(
                    padding: EdgeInsets.only(left: 15, bottom: 10, top: 15),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: HomeTextStyle(
                          size: 16,
                          content: 'Service',
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    childAspectRatio: 1.2,
                    children: <Widget>[
                      PilihanButton(
                        url: 'assets/icons/icon-pulsa.png',
                        scale: 2,
                        content: 'Pulsa',
                        onTap: () {
                          final getState =
                              Provider.of<PulsaState>(context, listen: false);
                          getState.changeState(StateType.loading);
                          Navigator.pushNamed(context, '/pulsa');
                        },
                      ),
                      PilihanButton(
                        url: 'assets/icons/paket-data.png',
                        scale: 2,
                        content: 'Paket Data',
                        onTap: () {},
                      ),
                      PilihanButton(
                        url: 'assets/icons/voucher.png',
                        scale: 2,
                        content: 'Voucher',
                        onTap: () {},
                      ),
                      PilihanButton(
                        url: 'assets/icons/e-money.png',
                        scale: 2,
                        content: 'E-Money',
                        onTap: () {},
                      ),
                      PilihanButton(
                        url: 'assets/icons/drop.png',
                        scale: 2,
                        content: 'PDAM',
                        onTap: () {},
                      ),
                      PilihanButton(
                        url: 'assets/icons/lighting.png',
                        scale: 2,
                        content: 'PLN',
                        onTap: () {},
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 15, bottom: 10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: HomeTextStyle(
                          size: 16,
                          content: 'Promo',
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: const <Widget>[
                          PromoWidgets(
                            url: 'assets/images/promo-1.png',
                          ),
                          PromoWidgets(
                            url: 'assets/images/promo-2.png',
                          ),
                          PromoWidgets(
                            url: 'assets/images/promo-3.png',
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class PilihanButton extends StatelessWidget {
  final VoidCallback onTap;
  final String url;
  final double scale;
  final String content;

  const PilihanButton({
    Key? key,
    required this.url,
    required this.scale,
    required this.content,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(
            url,
            scale: scale,
          ),
          HomeTextStyle(
            size: 13,
            content: content,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}

class FiturButton extends StatelessWidget {
  const FiturButton({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.95,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kPrimaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            HomeFitur(
              urlIcon: 'assets/icons/planner.png',
              scale: 3,
              content: 'Daily Quest',
              onTap: () {},
            ),
            HomeFitur(
              urlIcon: 'assets/icons/topup.png',
              scale: 2.5,
              content: 'Top Up',
              onTap: () {
                Navigator.pushNamed(context, '/topup');
              },
            ),
            HomeFitur(
              urlIcon: 'assets/icons/transfer.png',
              scale: 2.8,
              content: 'Transfer',
              onTap: () {},
            ),
            HomeFitur(
              urlIcon: 'assets/icons/cashout.png',
              scale: 3,
              content: 'Cashout',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class HomeFitur extends StatelessWidget {
  final VoidCallback onTap;
  final String urlIcon;
  final double scale;
  final String content;
  const HomeFitur({
    Key? key,
    required this.urlIcon,
    required this.scale,
    required this.content,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: <Widget>[
          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Image.asset(
              urlIcon,
              scale: scale,
            ),
          ),
          HomeTextStyle(size: 13, content: content),
        ],
      ),
    );
  }
}
