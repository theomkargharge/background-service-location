import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RechargeAndEarnSingleCard extends StatelessWidget {
  const RechargeAndEarnSingleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.keyboard_backspace_rounded,
          size: 30,
          color: Color(0xFF707070),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Recharge & Earn',
              style: TextStyle(fontSize: 22, color: Color(0xFF303030)),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.all(10),
              height: 323,
              width: 390,
              decoration: BoxDecoration(
                  color: const Color(0xFFF3F3F3),
                  border: Border.all(color: const Color(0xFFB5B5B5)),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  SvgPicture.asset('assets/cal.svg'),
                  const SizedBox(
                    height: 20,
                  ),
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                            text: '₹101',
                            style: TextStyle(
                                fontSize: 30,
                                color: Color(0xFF2DBB55),
                                fontWeight: FontWeight.w800)),
                        TextSpan(
                            text: '₹301',
                            style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFFAAAAAA),
                                fontWeight: FontWeight.w800,
                                decoration: TextDecoration.lineThrough))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Monthly Recharge',
                    style: TextStyle(fontSize: 14, color: Color(0xFFAAAAAA)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 198,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Pay Now',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Pay Later',
                    style: TextStyle(fontSize: 14, color: Color(0xFFAAAAAA)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
