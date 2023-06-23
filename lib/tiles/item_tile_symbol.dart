import 'package:flutter/material.dart';

class ItemTileSymbol extends StatelessWidget {
  const ItemTileSymbol({
    super.key,
    required this.text,
    required this.onTap,
    this.color,
    this.flex = 1,
  });

  final VoidCallback onTap;
  final String text;
  final Color? color;
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
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 18,
                    color: color,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
