import 'package:beco_coffee/home/controller/checkout_notifier.dart';
import 'package:beco_coffee/home/model/beco_office.dart';
import 'package:beco_coffee/home/model/checkout.dart';
import 'package:beco_coffee/home/widget/checkout/checkout_option.dart';
import 'package:beco_coffee/home/widget/checkout/selection_overlay.dart'
    as select_overlay;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CheckoutOptionsColumn extends ConsumerWidget {
  final List<BecoOffice> shopAddresses;
  final List<String> bankNames;

  const CheckoutOptionsColumn({
    super.key,
    required this.shopAddresses,
    required this.bankNames,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode =
        ref.watch(checkoutNotifierProvider.select((value) => value.mode));
    final shopAddressIndex = ref.watch(
        checkoutNotifierProvider.select((value) => value.shopAddressIndex));

    final paymentIndex = ref
        .watch(checkoutNotifierProvider.select((value) => value.paymentIndex));

    return Column(
      children: [
        Center(
          child: ToggleSwitch(
            initialLabelIndex: CheckoutMode.values.indexOf(mode),
            totalSwitches: CheckoutMode.values.length,
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
                    mode.name[0].toUpperCase() + mode.name.substring(1))
                .toList(),
            onToggle: (index) {
              ref
                  .read(checkoutNotifierProvider.notifier)
                  .updateMode(CheckoutMode.values[index!]);
            },
          ),
        ),
        const Gap(10),
        CheckoutOption(
          optionTitle: 'Shop Address',
          optionValueTitle: shopAddresses[shopAddressIndex].office_location,
          optionMenuLabel: mode == CheckoutMode.pickup ? 'Select' : 'Edit',
          customSelectedWidget: mode == CheckoutMode.pickup
              ? null
              : const Text(
                  'Current Location'), //TODO: get current location of user
          overlayBuilder: (context, controller) {
            return select_overlay.SelectionOverlay(
              initialIndex: shopAddressIndex,
              controller: controller,
              options: shopAddresses
                  .map((office) => office.office_location)
                  .toList(),
              onSelectOption: (index) {
                ref
                    .read(checkoutNotifierProvider.notifier)
                    .updateShopAddressIndex(index);

                ref
                    .read(checkoutNotifierProvider.notifier)
                    .updateTargetLocation(shopAddresses[index].latlng);
              },
            );
          },
        ),
        const Gap(5),
        CheckoutOption(
          optionTitle: 'Payment',
          optionMenuLabel: 'Select',
          optionValueTitle: bankNames[paymentIndex],
          overlayBuilder: (context, controller) {
            return select_overlay.SelectionOverlay(
              initialIndex: paymentIndex,
              controller: controller,
              options: bankNames,
              onSelectOption: (index) {
                ref
                    .read(checkoutNotifierProvider.notifier)
                    .updatePaymentIndex(index);
              },
            );
          },
        ),
      ],
    );
  }
}
