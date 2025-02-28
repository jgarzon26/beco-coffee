import 'package:beco_coffee/home/controller/wishlist_notifier.dart';
import 'package:beco_coffee/home/widget/coffee_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WishlistScreen extends ConsumerWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wishlist = ref.watch(wishlistNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const ImageIcon(
              AssetImage(
                'assets/icon/options.png',
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: wishlist.when(
          data: (wishlists) {
            if (wishlists.isEmpty) {
              return const Center(
                child: Text('No Favorites yet. Add some coffee!'),
              );
            }

            return CoffeeGridView(
              isScrollable: true,
              coffees: wishlists,
            );
          },
          error: (err, st) => Center(
            child: Text(err.toString()),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        ),
      ),
    );
  }
}
