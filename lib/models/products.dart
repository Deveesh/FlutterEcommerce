import 'package:ecommerce/models/singleProduct.dart';
import 'package:flutter/cupertino.dart';

//Contains dummy product data
class Products with ChangeNotifier {
  List<SingleProduct> _items = [
    SingleProduct(
      "1",
      "NMD_RACER",
      "Women\'s adidas Originals NMD_Racer Primeknit Shoes",
      "Channeling the streamlined look of an \'80s racer, these shoes are updated with modern features. The foot-hugging adidas Primeknit upper offers a soft, breathable feel. The Boost midsole provides responsive comfort accented with a contrast-color EVA heel plug. Embroidered details add a distinctive finish.',",
      "https://content.adidas.co.in/static/Product-AH2430/WOMEN_Originals_SHOES_LOW_AH2430_1.jpg",
      7499,
      46,
    ),

    SingleProduct(
      "2",
      "SLEEKS",
      "Women's adidas Originals Sleek Shoes",
      "A modern take on adidas sport heritage, tailored just for women. Perforated 3-Stripes on the leather upper of these shoes offer a sleek look that mirrors iconic tennis styles.",
      "https://content.adidas.co.in/static/Product-G27341/WOMEN_Originals_SHOES_LOW_G27341_1.jpg",
      3499,
      75,
    ),

    SingleProduct(
      "3",
      "PUKA SLIPPERS",
      "Women's adidas Swim Puka Slippers",
      "These adidas Puka slippers for women's come with slim straps for a great fit. Feature performance logo on the footbed and textured Rubber outsole that gives unique comfort.",
      "https://content.adidas.co.in/static/Product-CM0081/Men_SWIM_SLIDES_CM0081_1.jpg",
      999,
      40,
    ),

    SingleProduct(
      "4",
      "QUESTAR",
      "Women's adidas Sport Inspired Questar Ride Shoes",
      "Inspired by modern tech runners, these women's shoes step out with unexpected style. They're built with a breathable knit upper, while the heel offers the extra support of an Achilles-hugging design. The cushioned midsole provides a soft landing with every stride.",
      "https://content.adidas.co.in/static/Product-B44832/Women_CORE_RUNNING_SHOES_LOW_B44832_1.jpg",
      6999,
      20,
    ),

    SingleProduct(
      "5",
      "TAEKWONDO 21",
      "Women's adidas Originals Taekwondo Shoes",
      "This design is inspired by vintage Taekwondo styles originally worn to perfect high kicks and rapid foot strikes. The canvas shoes make a streetwear fashion statement as a chic, foot-hugging slip-on. They're shaped for a narrow, women's-specific fit and ride on a soft gum rubber outsole.",
      "https://content.adidas.co.in/static/Product-D98205/WOMEN_Originals_SHOES_LOW_D98205_1.jpg",
      7999,
      50,
    ),

    SingleProduct(
      "6",
      "DROGOS 24",
      "Men's adidas Sport Inspired Drogo Shoes ",
      "The adidas running-inspired shoes for men. An excellent combination of breathable Mesh with synthetic overlays on the upper makes it very comfortable for your feet on the run. Durable and non slippery one piece super grip EVA midsole and outsole ensures maximum stability and grip on the ground.",
      "https://content.adidas.co.in/static/Product-CL4156/MEN_RUNNING_SHOES_CL4156_1.jpg",
      2699,
      50,
    ),

    SingleProduct(
      "7",
      "NAYOS 87",
      "Men's adidas Running Nayo 1.0 shoes",
      "The adidas Nayo 1.0 shoes for men. These lightweight running shoes give all round comfort, cushioning, durability & support in a simplistic design. The mesh upper ensure breathability and durability while the Light strike EVA midsole provides premium cushioning's. Full Rubber outsole provides durability.",
      "https://content.adidas.co.in/static/Product-CI9914/Men_RUNNING_SHOES_LOW_CI9914_1.jpg",
      4999,
      60,
    ),
  ];

  List<SingleProduct> get items {
    return [..._items];
  }

  //Finds first(and only) product with given id
  SingleProduct findById(String id) {
    return _items.firstWhere((pdt) => (pdt.id == id));
  }
}
