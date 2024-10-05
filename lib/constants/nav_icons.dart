import 'package:iconify_flutter_plus/icons/cil.dart';
import 'package:iconify_flutter_plus/icons/ion.dart';
import 'package:iconify_flutter_plus/icons/teenyicons.dart';

const navIcons = [
  NavIcons(
    label: 'Home',
    iconUrl: Cil.home,
  ),
  NavIcons(
    label: 'Orders',
    iconUrl:
        '<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 48 48"><g fill="none" stroke="currentColor" stroke-linejoin="round" stroke-width="4"><rect width="30" height="36" x="9" y="8" rx="2"/><path stroke-linecap="round" d="M18 4v6m12-6v6m-14 9h16m-16 8h12m-12 8h8"/></g></svg>',
  ),
  NavIcons(
    label: 'Chat',
    iconUrl: Teenyicons.chat_outline,
  ),
  NavIcons(
    label: 'Cart',
    iconUrl: Ion.cart_outline,
  ),
  NavIcons(
    label: 'Profile',
    iconUrl:
        '<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 48 48"><g fill="none" stroke="currentColor" stroke-linejoin="round" stroke-width="4"><rect width="30" height="36" x="9" y="8" rx="2"/><path stroke-linecap="round" d="M18 4v6m12-6v6m-14 9h16m-16 8h12m-12 8h8"/></g></svg>',
  ),
];

class NavIcons {
  final String label;
  final String iconUrl;

  const NavIcons({
    required this.label,
    required this.iconUrl,
  });
}
