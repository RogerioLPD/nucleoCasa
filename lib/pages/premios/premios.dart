import 'package:flutter/material.dart';
import 'package:nucleo/components/components.dart';
import 'package:nucleo/kpadding.dart';
import 'package:nucleo/pages/premios/item.dart';
import 'package:nucleo/pages/premios/viagem_item.dart';
import 'package:nucleo/responsive.dart';

class PremiosPage extends StatelessWidget {
  const PremiosPage({Key? key}) : super(key: key);

  Color get primarySwatch => Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          children: <Widget>[
            const MenuBar(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kPadding),
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: kPadding),
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: kPadding,
                    crossAxisSpacing: kPadding,
                    childAspectRatio: 1.20,
                  ),
                  itemBuilder: (context, index) => Item(
                    selected:
                        ResponsiveLayout.isIphone(context) ? false : index == 0,
                    item: products[index],
                    onPressed: () {},
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
