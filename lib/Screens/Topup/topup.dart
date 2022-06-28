import 'package:capstone_project/Components/error_page.dart';
import 'package:capstone_project/Components/loading_animation.dart';
import 'package:capstone_project/Components/rounded_button.dart';
import 'package:capstone_project/Components/scroll_behavior.dart';
import 'package:capstone_project/Components/text_style.dart';
import 'package:capstone_project/Constant/color.dart';
import 'package:capstone_project/State/enum.dart';
import 'package:capstone_project/State/topup_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopupPage extends StatefulWidget {
  const TopupPage({Key? key}) : super(key: key);

  @override
  State<TopupPage> createState() => _TopupPageState();
}

class _TopupPageState extends State<TopupPage> {
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
        content: 'Top Up',
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
            child: Padding(
              padding: const EdgeInsets.all(20),
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
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                          ),
                          shrinkWrap: true,
                          itemBuilder: (ctx, i) {
                            return ProductCard(
                              amount: state.data[i].amount.toString(),
                              onTap: () {
                                checkOption(i + 1);
                              },
                              selected: i + 1 == optionSelected,
                            );
                          },
                          itemCount: state.data.length,
                        ),
                      ),
                    ],
                  ),
                  RoundedButton(
                    text: "Lanjut",
                    press: () {},
                    color: kPrimaryColor,
                    width: size.width,
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

class ProductCard extends StatefulWidget {
  final String amount;
  final VoidCallback onTap;
  final bool selected;
  const ProductCard({
    Key? key,
    required this.amount,
    required this.onTap,
    required this.selected,
  }) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(
            color: kPrimaryColor,
            width: 4,
            style: widget.selected ? BorderStyle.solid : BorderStyle.none,
          ),
        ),
        elevation: 5,
        margin: const EdgeInsets.all(6),
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/icons/gold-coins.png"),
              alignment: Alignment.topCenter,
            ),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: HomeTextStyle(
                  size: 14,
                  content: "Rp. ${widget.amount}",
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}

class AppBarPrimary extends StatelessWidget implements PreferredSizeWidget {
  final String content;
  const AppBarPrimary({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleTextStyle: const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      iconTheme: const IconThemeData(
        color: Colors.black,
        size: 32,
      ),
      title: Text(content),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
