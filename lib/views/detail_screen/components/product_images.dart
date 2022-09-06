import 'package:flutter/material.dart';
import 'package:ultimates/models/product.dart';

class ProductImages extends StatefulWidget {
  final Product product;
  const ProductImages({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductImages> createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 400,
          child: AspectRatio(
            aspectRatio: 1.2,
            child: Hero(
              tag: widget.product.id.toString(),
              child: Image.network(widget.product.images[selectedImage]),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(widget.product.images.length,
                (index) => buildSmallProductPreview(index)),
          ],
        )
      ],
    );
  }

  GestureDetector buildSmallProductPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(right: 15),
        padding: const EdgeInsets.all(8),
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: Colors.black.withOpacity(selectedImage == index ? 1 : 0)),
        ),
        child: Image.network(widget.product.images[index]),
      ),
    );
  }
}
