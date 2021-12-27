class Template {
  final String image, name, salePrice, price;
  final int isFree, reivew;
  final double star;

  Template({this.image, this.name, this.salePrice, this.price, this.isFree, this.star, this.reivew});
}
List<Template> allTemplate =[
  Template(
      image: 'assets/images/template1.png',
      name: "Template 1",
      salePrice: "199.000đ",
      price: "249.000đ",
      isFree: 0,
    star: 4,
    reivew: 2555,
  ),
  Template(
    image: 'assets/images/template2.png',
    name: "Template 2",
    isFree: 1,
    star: 5,reivew: 200,
  ),
  Template(
    image: 'assets/images/template3.png',
    name: "Template 3",
    salePrice: "199.000đ",
    price: "249.000đ",
    isFree: 0,
    star: 5,
    reivew: 25,
  ),
];