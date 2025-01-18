import 'package:flutter/material.dart';

class CouponTextField extends StatefulWidget {
  final void Function(String value)? onSubmit;

  const CouponTextField({
    super.key,
    this.onSubmit,
  });

  @override
  State<CouponTextField> createState() => _CouponTextFieldState();
}

class _CouponTextFieldState extends State<CouponTextField> {
  final couponController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    couponController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: TextField(
        controller: couponController,
        decoration: InputDecoration(
          hintText: 'Coupon here',
          hintStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.black.withOpacity(0.2),
              ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.black.withOpacity(0.8),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
              onPressed: () {
                _formKey.currentState!.save();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  'Apply',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
