import 'package:beco_coffee/common/loading_image_builder.dart';
import 'package:beco_coffee/home/model/coffee.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PromotionTile extends StatelessWidget {
  const PromotionTile({
    super.key,
    this.promotion,
  });

  final Coffee? promotion;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.grey,
        ),
        child: promotion != null
            ? Stack(
                alignment: Alignment.center,
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: Image.network(
                      promotion!.image_src,
                      fit: BoxFit.cover,
                      loadingBuilder: loadingImageBuilder,
                    ),
                  ),
                  Positioned.fill(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        onTap: () {
                          context.goNamed('product-detail', extra: promotion);
                        },
                      ),
                    ),
                  ),
                ],
              )
            : const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
      ),
    );
  }
}
