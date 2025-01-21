import 'package:beco_coffee/home/model/coffee.dart';
import 'package:beco_coffee/home/widget/home/promotions/promotion_tile.dart';
import 'package:flutter/material.dart';

class PromotionsListView extends StatelessWidget {
  const PromotionsListView({
    super.key,
    this.promotions,
  });

  final List<Coffee>? promotions;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: promotions?.length ?? 7,
      itemBuilder: (context, index) {
        return PromotionTile(promotion: promotions?[index]);
      },
    );
  }
}