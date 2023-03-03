import 'package:flutter/material.dart';

import '../../../ui_utils/app_colors.dart';
import '../../../widgets/bottom_button.dart';

class Footer extends StatefulWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  int? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 4),
                blurRadius: 24,
                color: AppColors.shadowColor.withOpacity(.15),
              )
            ],
          ),
          child: Row(
            children: [
              BottomButton(
                selected: selectedValue == 1,
                onTap: () {
                  onTap(1);
                },
                leftRadius: 8,
                text: '≈2500 ₽',
              ),
              BottomButton(
                onTap: () {
                  onTap(2);
                },
                selected: selectedValue == 2,
                rubleCount: 2,
                text: '≈7500 ₽',
              ),
              BottomButton(
                selected: selectedValue == 3,
                onTap: () {
                  onTap(3);
                },
                rightRadius: 8,
                rubleCount: 3,
                text: '≈15000 ₽',
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 4),
                blurRadius: 24,
                color: AppColors.shadowColor.withOpacity(.15),
              )
            ],
          ),
          child: ElevatedButton(
            onPressed: (){},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
              minimumSize: MaterialStateProperty.all(const Size(113, 52)),
              maximumSize: MaterialStateProperty.all(const Size(113, 52)),
              padding: MaterialStateProperty.all(
                EdgeInsets.zero,
              ),
              overlayColor: MaterialStateProperty.all(
                AppColors.shadowColor.withOpacity(0.090),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide.none,
                ),
              ),
              shadowColor: MaterialStateProperty.all(Colors.transparent),
            ),
            child: const Text(
              'Фильтр',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColors.purple,
                fontSize: 14,
              ),
            ),
          ),
        ),
        // GestureDetector(
        //   onTap: () {},
        //   child: Container(
        //     padding: const EdgeInsets.only(
        //       top: 18,
        //       bottom: 17,
        //       right: 33,
        //       left: 28,
        //     ),
        //     decoration: BoxDecoration(
        //       color: Colors.white,
        //       borderRadius: BorderRadius.circular(8),
        //     ),
        //   ),
        // )
      ],
    );
  }

  void onTap(int value) {
    setState(() {
      selectedValue = value;
    });
  }
}
