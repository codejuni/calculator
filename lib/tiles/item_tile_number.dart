import 'package:flutter/material.dart';

class ItemTileNumber extends StatelessWidget {
  const ItemTileNumber({
    super.key,
    required this.text,
    this.flex = 1,
    required this.onTap,
  });

  final VoidCallback onTap;
  final String text;
  final int? flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex!,
      child: TextButton(
        onPressed: onTap,
        child: SizedBox(
          height: double.infinity,
          child: Center(
            child: Text(
              text,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
