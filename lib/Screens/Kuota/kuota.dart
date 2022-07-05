import 'package:capstone_project/Components/appbar_primary.dart';
import 'package:capstone_project/Components/error_page.dart';
import 'package:capstone_project/Components/loading_animation.dart';
import 'package:capstone_project/Components/product_card_v2.dart';
import 'package:capstone_project/Components/rounded_button.dart';
import 'package:capstone_project/Components/scroll_behavior.dart';
import 'package:capstone_project/Components/text_style.dart';
import 'package:capstone_project/Constant/color.dart';
import 'package:capstone_project/State/enum.dart';
import 'package:capstone_project/State/home_provider.dart';
import 'package:capstone_project/State/kuota_provider.dart';
import 'package:capstone_project/State/operator_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class KuotaPage extends StatefulWidget {
  const KuotaPage({Key? key}) : super(key: key);

  @override
  State<KuotaPage> createState() => _KuotaPageState();
}

class _KuotaPageState extends State<KuotaPage> {
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<KuotaState>(context, listen: false).getData();
      Provider.of<OperatorState>(context, listen: false).getData();
    });
    super.didChangeDependencies();
  }

  final TextEditingController _controller = TextEditingController();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
        content: 'Kuota',
      ),
      body: Consumer2<KuotaState, OperatorState>(
        builder: (context, state1, state2, child) {
          if (state1.stateType == StateType.loading) {
            return const LoadingAnimation();
          }
          if (state1.stateType == StateType.error) {
            return const ErrorPage();
          }
          return ScrollConfiguration(
            behavior: MyBehavior(),
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                height: size.height * 0.89,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8, left: 8),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: HomeTextStyle(
                                size: 16,
                                content:
                                    'Saldomu Rp. ${Provider.of<HomeState>(context, listen: false).data.balance!.amount}',
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFE0E0E0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: size.width,
                            height: 55,
                            child: Center(
                              child: TextField(
                                controller: _controller,
                                keyboardType: TextInputType.number,
                                enabled: true,
                                cursorColor: kPrimaryColor,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.phone_android,
                                  ),
                                  hintText: "Nomor Handphone",
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10, top: 20),
                            child: Container(
                              width: size.width,
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom:
                                      BorderSide(width: 2, color: Colors.grey),
                                ),
                              ),
                              child: GestureDetector(
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
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 20,
                                                    vertical: 10,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      const HomeTextStyle(
                                                        size: 16,
                                                        content:
                                                            "Pilih Operator Seluler",
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                      IconButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        icon: const Icon(
                                                          Icons.close_rounded,
                                                          size: 35,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          ScrollConfiguration(
                                            behavior: MyBehavior(),
                                            child: SingleChildScrollView(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: SizedBox(
                                                  height: size.height * 0.41,
                                                  child: ListView.separated(
                                                    shrinkWrap: true,
                                                    itemBuilder: (ctx, i) {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          state1.addMethod(
                                                              state2.data[i]
                                                                  .name!);
                                                          checkOption(0);
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: ListTile(
                                                          title: HomeTextStyle(
                                                            size: 20,
                                                            content: state2
                                                                .data[i].name!,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    separatorBuilder: (ctx, i) {
                                                      return const Divider();
                                                    },
                                                    itemCount:
                                                        state2.data.length,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const Padding(
                                              padding:
                                                  EdgeInsets.only(top: 20)),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Row(
                                  children: [
                                    const Icon(Icons.more_horiz_rounded),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: HomeTextStyle(
                                        size: 18,
                                        content: state1.method == 'null'
                                            ? 'Pilih Operator'
                                            : state1.method,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          state1.method == 'null'
                              ? const Center(
                                  child: Text(""),
                                )
                              : SizedBox(
                                  height: size.height * 0.58,
                                  child: ListView.builder(
                                    itemBuilder: (ctx, i) {
                                      return ProductCardV2(
                                        amount:
                                            "${state1.data[i].description} \nRp. ${state1.data[i].grossAmount}",
                                        name: state1.data[i].name!,
                                        onTap: () {
                                          checkOption(i + 1);
                                          // harga = state1.data[i].denom;
                                          // total = state1.data[i].grossAmount;
                                          // id = state1.data[i].id;
                                          // operator =
                                          //     state1.data[i].providerName;
                                          // jenis = state1.data[i].name;
                                        },
                                        selected: i + 1 == optionSelected,
                                      );
                                    },
                                    itemCount: state1.data.length,
                                  ),
                                ),
                        ],
                      ),
                      RoundedButton(
                        text: "Lanjut",
                        color: kPrimaryColor,
                        width: size.width,
                        press: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}