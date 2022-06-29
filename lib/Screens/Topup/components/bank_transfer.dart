import 'package:capstone_project/Components/appbar_primary.dart';
import 'package:capstone_project/Components/text_style.dart';
import 'package:capstone_project/Model/Bank/bank_model.dart';
import 'package:capstone_project/State/pembayaran_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BankTransfer extends StatelessWidget {
  const BankTransfer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final getProvider = Provider.of<PaymentState>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const AppBarPrimary(content: "Pilih Bank"),
      body: SizedBox(
        width: double.infinity,
        height: size.height,
        child: ListView.separated(
          itemBuilder: (ctx, i) {
            return GestureDetector(
              onTap: () {
                getProvider.addMethod("Bank ${items[i].name.toUpperCase()}");
                int count = 0;
                Navigator.of(context).popUntil((_) => count++ >= 2);
              },
              child: ListTile(
                leading: Image.asset(
                  items[i].gambar,
                  width: 60,
                ),
                title: HomeTextStyle(
                  size: 20,
                  content: "Bank ${items[i].name.toUpperCase()}",
                  color: Colors.black,
                ),
              ),
            );
          },
          separatorBuilder: (ctx, i) {
            return const Divider();
          },
          itemCount: items.length,
        ),
      ),
    );
  }
}
