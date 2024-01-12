class CardModel{
  final String? image;
  final String? productName;
  final int? price;
   int numberOfProduct;

  CardModel({required this.image,required this.productName,required this.price,required this.numberOfProduct});

}
List<CardModel> products = [
  CardModel(
      image: 'assets/decorations plants/strelitzia.png',
      productName: 'Strelizia',
      price: 100,
      numberOfProduct: 1),
  CardModel(
      image: 'assets/decorations plants/simulation.png',
      productName: 'Simulation',
      price: 70,
      numberOfProduct: 1),
  CardModel(
      image: 'assets/decorations plants/sansevieria.png',
      productName: 'Sansevieria',
      price: 15,
      numberOfProduct: 1),
  CardModel(
      image: 'assets/decorations plants/banana tree.png',
      productName: 'Banana tree',
      price: 78,
      numberOfProduct: 1),
];