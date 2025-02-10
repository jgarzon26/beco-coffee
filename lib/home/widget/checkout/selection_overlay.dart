import 'package:beco_coffee/home/widget/checkout/option_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SelectionOverlay extends StatefulWidget {
  final List<String> options;
  final void Function(int index) onSelectOption;
  final int initialIndex;
  final OverlayPortalController controller;

  const SelectionOverlay({
    super.key,
    required this.options,
    required this.onSelectOption,
    this.initialIndex = 0,
    required this.controller,
  });

  @override
  State<SelectionOverlay> createState() => _SelectionOverlayState();
}

class _SelectionOverlayState extends State<SelectionOverlay> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.black87,
          child: GestureDetector(
            onTap: () => widget.controller.hide(),
          ),
        ),
        Positioned.fill(
          top: MediaQuery.sizeOf(context).height * 0.15,
          bottom: MediaQuery.sizeOf(context).height * 0.25,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const Gap(10),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: List.generate(
                          widget.options.length,
                          (index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              child: OptionButton(
                                optionTitle: widget.options[index],
                                isSelected: selectedIndex == index,
                                onPressed: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                  widget.onSelectOption(index);
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
