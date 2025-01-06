import 'package:flutter/material.dart';

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  final bool hasNotifications;

  const SearchAppBar({
    super.key,
    required this.hasNotifications,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  @override
  Widget build(BuildContext context) {
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
