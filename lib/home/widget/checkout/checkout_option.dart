import 'package:beco_coffee/home/widget/checkout/option_value_tile.dart';
import 'package:beco_coffee/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CheckoutOption extends StatefulWidget {
  final String optionTitle, optionMenuLabel;
  final String optionValueTitle;
  final Widget Function(
    BuildContext context,
    OverlayPortalController controller,
  ) overlayBuilder;
  final Widget? customSelectedWidget;

  const CheckoutOption({
    super.key,
    required this.optionTitle,
    required this.optionMenuLabel,
    required this.optionValueTitle,
    required this.overlayBuilder,
    this.customSelectedWidget,
  });

  @override
  State<CheckoutOption> createState() => _CheckoutOptionState();
}

class _CheckoutOptionState extends State<CheckoutOption> {
  final selectionOverlayController = OverlayPortalController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.optionTitle,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              TextButton(
                onPressed: () {
                  selectionOverlayController.show();
                },
                child: OverlayPortal(
                  controller: selectionOverlayController,
                  overlayChildBuilder: (context) {
                    return widget.overlayBuilder(
                      context,
                      selectionOverlayController,
                    );
                  },
                  child: Text(
                    widget.optionMenuLabel,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: const Color.fromRGBO(36, 84, 248, 1),
                        ),
                  ),
                ),
              ),
            ],
          ),
          const Gap(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: widget.customSelectedWidget ??
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  decoration: BoxDecoration(
                    color: kPrimaryContainer,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: OptionValueTile(
                    leadingIconSize: 30,
                    optionTitle: widget.optionValueTitle,
                    titleStyle:
                        Theme.of(context).textTheme.headlineMedium?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                  ),
                ),
          ),
        ],
      ),
    );
  }
}
