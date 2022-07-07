import 'package:capstone_project/Components/error_page.dart';
import 'package:capstone_project/Components/loading_animation.dart';
import 'package:capstone_project/Components/text_style.dart';
import 'package:capstone_project/State/enum.dart';
import 'package:capstone_project/State/history_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Riwayat extends StatefulWidget {
  const Riwayat({Key? key}) : super(key: key);

  @override
  State<Riwayat> createState() => _RiwayatState();
}

class _RiwayatState extends State<Riwayat> {
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final getState = Provider.of<HistoryState>(context, listen: false);
      getState.getHistory();
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HistoryState>(
      builder: (BuildContext context, state, child) {
        if (state.stateType == StateType.loading) {
          return const LoadingAnimation();
        }
        if (state.stateType == StateType.error) {
          return const ErrorPage();
        }
        return ListView.separated(
          itemBuilder: (ctx, i) {
            return ListTile(
              leading: state.data[i].productType! == "pulsa"
                  ? Image.asset("assets/icons/icon-pulsa.png")
                  : state.data[i].productType! == "quota"
                      ? Image.asset("assets/icons/paket-data.png")
                      : Image.asset("assets/icons/plus.png"),
              title: HomeTextStyle(
                size: 16,
                content: state.data[i].productType!.toUpperCase(),
                color: Colors.black,
              ),
              subtitle: HomeTextStyle(
                size: 12,
                content: state.data[i].dateString!,
                color: Colors.black,
              ),
              trailing: HomeTextStyle(
                size: 16,
                content: state.data[i].productType! == "pulsa" ||
                        state.data[i].productType! == "quota"
                    ? "- Rp ${state.data[i].grossAmount!.toString()}"
                    : "+ Rp ${state.data[i].grossAmount!.toString()}",
                color: Colors.black,
              ),
            );
          },
          separatorBuilder: (ctx, i) {
            return const Divider();
          },
          itemCount: state.data.length,
        );
      },
    );
  }
}
