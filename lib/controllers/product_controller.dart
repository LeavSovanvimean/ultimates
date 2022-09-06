import 'package:get/get.dart';
import 'package:ultimates/models/product.dart';
//import 'package:ultimates/services/product_service.dart';

// class ProductController extends GetxController {
//   var isLoading = true.obs;
//   var products = <Product>[].obs;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchProducts();
//   }

//   void fetchProducts() async {
//     isLoading(true);
//     try {
//       var todos = await ProductServices.getProduct();
//       if (todos != null) {
//         //products.value = todos;
//       }
//     } finally {
//       isLoading(false);
//     }
//   }
// }

class ProductController extends GetxController {
  var isLoading = true.obs;
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(const Duration(seconds: 0));
    const String description =
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

    List<Product> productModel = [
      Product(
        id: 1,
        images: [
          "https://media.discordapp.net/attachments/976887812009906186/1016745185264287875/Jaguar-competition-c-type-motorsport_540x_1.png",
          "https://media.discordapp.net/attachments/976887812009906186/1016751730035281950/Jaguar-competition-c-type-motorsport-2_540x_1.png",
          "https://media.discordapp.net/attachments/976887812009906186/1016751730383388733/Jaguar-competition-c-type-motorsport-3_1296x_1.png",
          "https://media.discordapp.net/attachments/976887812009906186/1016751730630869012/Jaguar-C-Type-Car-motorsport-side_1296x_1.png",
        ],
        productName: "Bremount Waterman Apex",
        price: 645.99,
        description: description,
        category: 'Men',
        rating: 5,
        isFavourite: true,
        isPopular: true,
      ),
      Product(
        id: 2,
        images: [
          "https://media.discordapp.net/attachments/976887812009906186/1016745185520123914/S300-Kaimu-Bracelet-Ladies-Supermarine-Watch-unisex_540x_1.png",
          "https://media.discordapp.net/attachments/976887812009906186/1016751729263517776/waterman-apex-diving-bracelet-strap-2_540x_1.png",
          "https://media.discordapp.net/attachments/976887812009906186/1016751729536139345/waterman-apex-diving-bracelet-strap-3_540x_1.png",
          "https://media.discordapp.net/attachments/976887812009906186/1016751729796202657/waterman-apex-diving-bracelet-strap-caseback_540x_1.png"
        ],
        productName: "Bremount Sle of Man TT",
        price: 579.99,
        description: description,
        category: 'Men',
        rating: 4.4,
        isFavourite: true,
        isPopular: true,
      ),
      Product(
        id: 3,
        images: [
          "https://media.discordapp.net/attachments/976887812009906186/1016745185847292024/S300-RFU-complimentary-rugby-strap_540x_1.png",
        ],
        productName: "Bremount Waterman Apex",
        price: 364.99,
        description: description,
        category: 'Men',
        rating: 3.5,
        isFavourite: true,
        isPopular: true,
      ),
      Product(
        id: 4,
        images: [
          "https://media.discordapp.net/attachments/976887812009906186/1016745186082160700/S300-Vigo-strap-Ladies-Supermarine-Watch-unisex_540x_1.png",
        ],
        productName: "Bremount S300 Kaimu",
        category: 'Men',
        price: 249.00,
        description: description,
        rating: 4.5,
        isFavourite: true,
        isPopular: true,
      ),
      Product(
        id: 5,
        images: [
          "https://media.discordapp.net/attachments/976887812009906186/1016745186308661318/waterman-apex-diving-blue-rubber-strap-bimini-shark-lab_540x_1.png",
        ],
        productName: "Bremount S300 VIGO",
        category: 'Men',
        price: 200.00,
        description: description,
        rating: 3.8,
        isFavourite: true,
        isPopular: true,
      ),
      Product(
        id: 6,
        images: [
          "https://media.discordapp.net/attachments/976887812009906186/1016745186568716348/waterman-apex-diving-bracelet-bimini-shark-lab_540x_1.png",
        ],
        productName: "Bremount JAGUAR C-TYPE",
        category: 'Men',
        price: 429.99,
        description: description,
        rating: 2,
        isFavourite: true,
        isPopular: true,
      ),
      Product(
        id: 7,
        images: [
          "https://media.discordapp.net/attachments/976887812009906186/1016745236015366204/bronze-argonaut-military-armed-forces-diving-watch-mod_540x_1.png",
        ],
        productName: "Bremount Argonaut Bronze",
        category: 'Men',
        price: 200.00,
        description: description,
        rating: 5,
        isFavourite: true,
        isPopular: true,
      ),
      Product(
        id: 8,
        images: [
          "https://media.discordapp.net/attachments/976887812009906186/1016745236308971560/BremontIsleofManTTFront_1296x_1.png",
        ],
        productName: "Bremount S300 RFU",
        category: 'Men',
        price: 199.99,
        description: description,
        rating: 3.5,
        isFavourite: true,
        isPopular: true,
      ),
      Product(
        id: 9,
        images: [
          "https://media.discordapp.net/attachments/976887812009906186/1016752868570697728/Dambuster-Lancaster-Bomber-Military-Defence-Limited_1296x_1.png",
        ],
        productName: "DAMBUSTER LIMITED EDITION",
        category: 'Men',
        price: 168.99,
        description: description,
        rating: 4.1,
        isFavourite: true,
        isPopular: true,
      ),
      Product(
        id: 10,
        images: [
          "https://media.discordapp.net/attachments/976887812009906186/1016752868847534110/Armed-Forces-Ghurka-Welfare-Bronze_d7a65a99-35e8-497d-939d-8a59482e430e_1296x_1.png",
        ],
        productName: "BROADSWORD BRONZE",
        category: 'Men',
        price: 619.99,
        description: description,
        rating: 3,
        isFavourite: true,
        isPopular: true,
      ),
    ];

    products.value = productModel;
  }
}
