class ProductItem {
  final String image, title, description;
  final int amount, uid;
  ProductItem({
    required this.uid,
    required this.image,
    required this.title,
    required this.description,
    required this.amount,
  });
}

List<ProductItem> products = [
  ProductItem(
    uid: 1,
    title: "Argentina- Bariloche",
    amount: 4000,
    image: "assets/images/argentina.png",
    description: "400.000,00 de negócio gerado entre empresas do Núcleo",
  ),
  ProductItem(
    uid: 2,
    title: "Casa Decor- São Paulo",
    amount: 4000,
    image: "assets/images/casadecor.png",
    description: "400.000,00 de negócio gerado entre empresas do Núcleo",
  ),
  ProductItem(
    uid: 3,
    title: "Uruguai",
    amount: 4000,
    image: "assets/images/uruguai.png",
    description: "400.000,00 de negócio gerado entre empresas do Núcleo",
  ),
  ProductItem(
    uid: 4,
    title: "Paris",
    amount: 4000,
    image: "assets/images/Paris.png",
    description: "400.000,00 de negócio gerado entre empresas do Núcleo",
  ),
  ProductItem(
    uid: 5,
    title: "Egito",
    amount: 4000,
    image: "assets/images/egito.png",
    description: "400.000,00 de negócio gerado entre empresas do Núcleo",
  ),
  ProductItem(
    uid: 6,
    title: "Porto",
    amount: 4000,
    image: "assets/images/porto.png",
    description: "400.000,00 de negócio gerado entre empresas do Núcleo",
  ),
];
