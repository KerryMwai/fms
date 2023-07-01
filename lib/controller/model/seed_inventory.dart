class SeedInventory {
  final String batchNumber;
  final String variety;
  final String seller;
  final int quantity;
  final int purchaseQuantity;
  final double totalAmountPaid;
  final String acquisitionDate;
  final int planted;
  final int remaining;
  final String storage;

  SeedInventory(
      {required this.batchNumber,
      required this.variety,
      required this.seller,
      required this.quantity,
      required this.purchaseQuantity,
      required this.totalAmountPaid,
      required this.acquisitionDate,
      required this.planted,
      required this.remaining,
      required this.storage});

  factory SeedInventory.fromJson(Map<String, dynamic> json) => SeedInventory(
      batchNumber: json['batchNumber'],
      variety: json['variety'],
      seller: json['seller'],
      quantity: json['quantity'],
      purchaseQuantity: json['purchaseQuantity'],
      totalAmountPaid: json['totalAmountPaid'],
      acquisitionDate: json['acquisitionDate'],
      planted: json['planted'],
      remaining: json['remaining'],
      storage: json['storage']);

  Map<String, dynamic> toJson() {
    return {
      'batchNumber': batchNumber,
      'variety': variety,
      'seller': seller,
      'quantity': quantity,
      'purchaseQuantity': purchaseQuantity,
      'totalAmountPaid': totalAmountPaid,
      'acquisitionDate': acquisitionDate,
      'usage':{
        'planted':planted,
        'remaining':remaining
      },
      'storage': storage
    };
  }
}
