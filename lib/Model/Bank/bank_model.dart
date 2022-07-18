class BankModel {
  final String name;
  final String gambar;

  BankModel({
    required this.name,
    required this.gambar,
  });
}

List<BankModel> items = [
  BankModel(name: "bca", gambar: "assets/bank/bank-bca.png"),
  BankModel(name: "bni", gambar: "assets/bank/bank-bni.png"),
  BankModel(name: "bri", gambar: "assets/bank/bank-bri.png"),
];
