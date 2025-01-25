import 'package:beco_coffee/home/repo/checkout_repo.dart';
import 'package:beco_coffee/home/widget/checkout/checkout_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:beco_coffee/home/widget/checkout/selection_overlay.dart'
    as select_overlay;

enum CheckoutMode { pickup, delivery }

class CheckoutScreen extends ConsumerStatefulWidget {
  const CheckoutScreen({super.key});

  @override
  ConsumerState<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends ConsumerState<CheckoutScreen> {
  var mode = CheckoutMode.pickup;
  var shopAddressIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Checkout',
        ),
      ),
      body: FutureBuilder(
        future: Future.wait([
          ref.read(checkoutRepoProvider).getBecoOfficeLocations(),
        ]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }

          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Gap(20),
                StatefulBuilder(
                  builder: (context, setState) {
                    return Expanded(
                      child: Column(
                        children: [
                          Center(
                            child: ToggleSwitch(
                              totalSwitches: 2,
                              minWidth: MediaQuery.sizeOf(context).width * 0.7,
                              minHeight: 50,
                              cornerRadius: 20,
                              borderColor: const [Colors.black87],
                              borderWidth: 2,
                              inactiveBgColor: Colors.white,
                              inactiveFgColor: Colors.black87,
                              activeBgColor: const [Colors.black87],
                              activeFgColor: Colors.white,
                              customTextStyles: const [
                                TextStyle(
                                  fontSize: 26,
                                )
                              ],
                              labels: CheckoutMode.values
                                  .map((mode) =>
                                      mode.name[0].toUpperCase() +
                                      mode.name.substring(1))
                                  .toList(),
                              onToggle: (index) {
                                mode = CheckoutMode.values[index ?? 0];
                              },
                            ),
                          ),
                          const Gap(10),
                          CheckoutOption(
                            optionTitle: 'Shop Address',
                            optionValueTitle: snapshot.data![0]
                                [shopAddressIndex],
                            optionMenuLabel:
                                mode == CheckoutMode.pickup ? 'Select' : 'Edit',
                            overlayBuilder: (context, controller) {
                              return Stack(
                                children: [
                                  Container(
                                    color: Colors.black87,
                                    child: GestureDetector(
                                      onTap: () => controller.hide(),
                                    ),
                                  ),
                                  Positioned.fill(
                                    top: MediaQuery.sizeOf(context).height *
                                        0.15,
                                    bottom:
                                        MediaQuery.sizeOf(context).height * 0.3,
                                    child: select_overlay.SelectionOverlay(
                                      initialIndex: shopAddressIndex,
                                      options: snapshot.data![0],
                                      onSelectOption: (index) {
                                        setState(
                                            () => shopAddressIndex = index);
                                      },
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
