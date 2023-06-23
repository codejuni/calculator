import 'package:calculator/tiles/item_tile_number.dart';
import 'package:calculator/tiles/item_tile_symbol.dart';
import 'package:calculator/viewmodels/calculator_viewmodel.dart';
import 'package:flutter/material.dart';

class CalculatorBody extends StatelessWidget {
  const CalculatorBody({
    super.key,
    required this.controller,
  });

  final CalculatorViewModel controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.3,
          color: Theme.of(context).cardColor,
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                controller.text,
                textAlign: TextAlign.end,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              const SizedBox(height: 10),
              Text(
                controller.calculation,
                textAlign: TextAlign.end,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 35,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).shadowColor,
                  blurRadius: 4,
                ),
              ],
            ),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      ItemTileSymbol(
                        text: 'C',
                        onTap: controller.clearAll,
                        color: Colors.red,
                        flex: 2,
                      ),
                      ItemTileSymbol(
                        text: '%',
                        onTap: () {
                          controller.fillTextField(' % ');
                        },
                      ),
                      ItemTileSymbol(
                        text: '/',
                        onTap: () {
                          controller.fillTextField(' / ');
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      ItemTileNumber(
                        text: '1',
                        onTap: () {
                          controller.fillTextField('1');
                        },
                      ),
                      ItemTileNumber(
                        text: '2',
                        onTap: () {
                          controller.fillTextField('2');
                        },
                      ),
                      ItemTileNumber(
                        text: '3',
                        onTap: () {
                          controller.fillTextField('3');
                        },
                      ),
                      ItemTileSymbol(
                        text: 'x',
                        onTap: () {
                          controller.fillTextField(' x ');
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      ItemTileNumber(
                        text: '4',
                        onTap: () {
                          controller.fillTextField('4');
                        },
                      ),
                      ItemTileNumber(
                        text: '5',
                        onTap: () {
                          controller.fillTextField('5');
                        },
                      ),
                      ItemTileNumber(
                        text: '6',
                        onTap: () {
                          controller.fillTextField('6');
                        },
                      ),
                      ItemTileSymbol(
                        text: '+',
                        onTap: () {
                          controller.fillTextField(' + ');
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      ItemTileNumber(
                        text: '7',
                        onTap: () {
                          controller.fillTextField('7');
                        },
                      ),
                      ItemTileNumber(
                        text: '8',
                        onTap: () {
                          controller.fillTextField('8');
                        },
                      ),
                      ItemTileNumber(
                        text: '9',
                        onTap: () {
                          controller.fillTextField('9');
                        },
                      ),
                      ItemTileSymbol(
                        text: '-',
                        onTap: () {
                          controller.fillTextField(' - ');
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      ItemTileSymbol(
                        text: '.',
                        onTap: () {
                          controller.fillTextField('.');
                        },
                      ),
                      ItemTileNumber(
                        flex: 2,
                        text: '0',
                        onTap: () {
                          controller.fillTextField('0');
                        },
                      ),
                      ItemTileSymbol(
                        text: '=',
                        onTap: controller.saveResult,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
