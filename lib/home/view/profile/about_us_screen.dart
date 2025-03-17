import 'package:beco_coffee/home/widget/profile/about_us_template.dart';
import 'package:flutter/material.dart';

const _pap = [
  'At BeCo Coffee, we are committed to protecting your privacy. This Privacy Policy outlines how we collect, use, and safeguard your personal information when you use the BeCo Coffee App.',
  'When you create an account or place an order through the BeCo Coffee App, we collect personal information such as your name, email address, phone number, and payment information. Additionally, we automatically gather usage data, which includes information about your device and how you interact with the app, such as your IP address and device type.',
  'We use your information primarily to process and fulfill your orders. This includes communicating with you about your orders and providing customer support. If you have opted in to receive promotional communications, we may also send you updates and offers. Furthermore, we analyze usage data to improve our app and services based on user feedback.',
  'We want to assure you that we do not sell or rent your personal information to third parties. However, we may share your information with trusted service providers who assist us in operating the app and delivering services, all under strict confidentiality agreements. In certain circumstances, we may disclose your information if required by law or to protect our rights.',
  'To protect your personal information, we implement reasonable security measures against unauthorized access, loss, or misuse. However, please be aware that no method of transmission over the internet or electronic storage is completely secure.',
  'You have the right to access, update, or delete your personal information at any time. If you wish to opt out of receiving promotional communications, you can follow the unsubscribe instructions included in those messages.',
  'We may update this Privacy Policy from time to time, and any changes will be posted in the app. Your continued use of the app after such changes constitutes your acceptance of the new policy. If you have any questions or concerns regarding this Privacy Policy, please do not hesitate to contact us at support@becocoffeeapp.com.',
];

const _tos = [
  'Welcome to the BeCo Coffee App. By accessing or using our app, you agree to comply with and be bound by these Terms of Service. If you do not agree with these terms, we kindly ask that you refrain from using our app.',
  'To access certain features of the BeCo Coffee App, you may need to create an account. When you register, you agree to provide accurate, current, and complete information. It is your responsibility to maintain the security of your password and account, and you must notify us immediately of any unauthorized use of your account.',
  'Through the BeCo Coffee App, you can place orders for coffee and related products. All payments are processed securely through our payment processor. By placing an order, you agree to pay the total amount due, which includes any applicable taxes and fees. If you wish to cancel an order, you may do so within [insert time frame] of placing it. Refunds will be processed according to our refund policy, which is available within the app.',
  'As a user of the BeCo Coffee App, you agree not to engage in any unlawful activities or conduct that could damage, disable, or impair the app or interfere with any other party\'s use of it. All content, trademarks, and other intellectual property within the BeCo Coffee App are owned by or licensed to BeCo Coffee. You may not use, reproduce, or distribute any content without our prior written consent.',
  'To the fullest extent permitted by law, BeCo Coffee shall not be liable for any indirect, incidental, or consequential damages arising from your use of the app. We reserve the right to update these Terms of Service from time to time. Any changes will be posted in the app, and your continued use after such changes constitutes your acceptance of the new terms. These Terms of Service shall be governed by and construed in accordance with the laws of [insert jurisdiction]. If you have any questions regarding these Terms of Service, please contact us at support@becocoffeeapp.com.',
];

const _aC = [
  'At BeCo Coffee, we believe that every cup of coffee tells a story, and we are dedicated to making that story accessible to everyone. Founded with a passion for coffee and a commitment to convenience, the BeCo Coffee App was created to revolutionize the way coffee lovers order and enjoy their favorite brews. Our mission is to connect coffee enthusiasts with high-quality, locally sourced coffee, all at the touch of a button.',
  'The BeCo Coffee App offers a seamless online ordering experience, allowing users to browse an extensive menu of coffee options, customize their orders, and have their favorite beverages delivered right to their doorstep. We understand that life can be busy, and our goal is to provide a hassle-free way to enjoy premium coffee without compromising on quality or flavor.',
  'Our team is made up of coffee aficionados who are passionate about sourcing the finest beans and crafting exceptional blends. We work closely with local roasters and farmers to ensure that every cup of coffee not only tastes great but also supports sustainable practices and fair trade. We take pride in our commitment to quality, and we strive to create a community of coffee lovers who appreciate the art of brewing.',
  'At BeCo Coffee, we value our customers and are dedicated to providing outstanding service. Our user-friendly app is designed to make ordering coffee as easy and enjoyable as possible. Whether you’re at home, at work, or on the go, we are here to ensure that your coffee experience is nothing short of exceptional.',
  'Join us on this journey as we celebrate the love of coffee and the joy it brings to our lives. With the BeCo Coffee App, your perfect cup of coffee is just a few taps away.',
];

const _faq = [
  '1. How do I place an order through the BeCo Coffee App?',
  'To place an order, download the BeCo Coffee App from your device\'s app store. Create an account or log in if you already have one. Browse our menu, select your desired coffee, customize it to your liking, add it to your cart, and proceed to checkout. Follow the prompts to complete your order.',
  '2. What payment methods do you accept?',
  'The BeCo Coffee App accepts various payment methods, including major credit and debit cards, as well as popular digital wallets. All transactions are processed securely to ensure your information is protected.',
  '3. Can I customize my coffee order?',
  'Yes! The BeCo Coffee App allows you to customize your drinks. You can adjust sweetness levels, choose different milk options, add flavor shots, and more. Your coffee, your way!',
  '4. Do you offer refunds?',
  'BeCo Coffee don\'t offer refunds, but we do offer a satisfaction guarantee.',
];

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<(String, List<String>)> aboutUsData = [
      (
        'Policy and Privacy',
        _pap,
      ),
      (
        'Terms of Service',
        _tos,
      ),
      (
        'About Company',
        _aC,
      ),
      (
        'FAQs',
        _faq,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          if (index == 0 || index == aboutUsData.length + 1) {
            return const SizedBox.shrink();
          }
          return ListTile(
            titleTextStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            title: Text(aboutUsData[index - 1].$1),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutUsTemplate(
                      title: aboutUsData[index - 1].$1,
                      body: aboutUsData[index - 1].$2),
                )),
          );
        },
        separatorBuilder: (context, index) {
          if (index == 0) return const SizedBox(height: 5);
          return const Divider(thickness: 1, color: Colors.grey);
        },
        itemCount: 2 + aboutUsData.length,
      ),
    );
  }
}
