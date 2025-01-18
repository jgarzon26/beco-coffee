import 'package:beco_coffee/home/controller/search_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchAppBar extends ConsumerStatefulWidget implements PreferredSizeWidget {
  final bool hasNotifications;

  const SearchAppBar({
    super.key,
    required this.hasNotifications,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  ConsumerState<SearchAppBar> createState() => _SearchAppBarState();
}

class _SearchAppBarState extends ConsumerState<SearchAppBar> {
  late final TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    final searchModel = ref.read(searchNotifierProvider);
    searchController = TextEditingController(
      text: searchModel.query,
    );
  }

  @override
  void dispose() { 
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchState = ref.watch(
            searchNotifierProvider.select(
              (searchModel) => searchModel.isSearching,
            ),
          );

          if (searchState == false) {
            searchController.text = '';
          }

    return AppBar(
      title: SizedBox(
        height: MediaQuery.of(context).size.height * 0.045,
        child: SearchBar(
            hintStyle: WidgetStatePropertyAll(
              Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.black54,
                  ),
            ),
            backgroundColor: const WidgetStatePropertyAll(Colors.white),
            controller: searchController,
            onTap: () {
              ref.read(searchNotifierProvider.notifier).setSearchState(true);
            },
            onChanged: (value) {
              ref.read(searchNotifierProvider.notifier).setQuery(value);
            },
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            shape: const WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            leading: const Icon(
              Icons.search,
              color: Colors.black54,
            ),
            hintText: 'Search',
          ),
      ),
      actions: [
        IconButton(
          style: IconButton.styleFrom(
            backgroundColor: Colors.transparent,
          ),
          onPressed: () {},
          icon: ImageIcon(
            widget.hasNotifications
                ? const AssetImage('assets/icon/bell-notification.png')
                : const AssetImage('assets/icon/bell.png'),
            size: 40,
          ),
        ),
      ],
    );
  }
}
