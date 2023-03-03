import 'package:dorado_map/widgets/map_button.dart';
import 'package:flutter/material.dart';

import '../ui_utils/app_colors.dart';
import '../ui_utils/assets.dart';

class SearchTextField extends StatelessWidget {
  final FocusNode focusNode;
  const SearchTextField({
    Key? key,
    required this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: kToolbarHeight,
        right: 16,
        left: 16,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 4),
                        blurRadius: 24,
                        color: AppColors.shadowColor.withOpacity(.15),
                      )
                    ],
                  ),
                  child: TextField(
                    scrollPadding: EdgeInsets.zero,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(bottom: 35),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Ресторан, блюдо',
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColors.gray,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(8),
                          bottom: Radius.circular(8),
                        ),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(8),
                          bottom: Radius.circular(8),
                        ),
                        borderSide: BorderSide.none,
                      ),
                      prefixIconConstraints: const BoxConstraints(
                        maxHeight: 16,
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 12,
                        ),
                        child: Assets.searchIcon.svg(),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              MapButton(
                onTap: () {},
                paddingAll: 14,
                width: 52,
                height: 52,
                child: Assets.burgerMenu.svg(),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.only(
              left: 16,
              top: 18,
              bottom: 18,
              right: 12,
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.purple)),
            child: Row(
              children: [
                SizedBox(
                  width: 32,
                  height: 32,
                  child: Image.asset(
                    Assets.bellHopIcon,
                  ),
                ),
                const SizedBox(width: 11),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Вы находитесь в Kaif Provenance',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'Нажмите, чтобы ознакомиться подробнее',
                      style: TextStyle(
                        color: AppColors.gray,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
