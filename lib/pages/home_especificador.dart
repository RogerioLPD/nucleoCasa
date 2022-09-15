import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nucleo/components/blog.dart';
import 'package:nucleo/kpadding.dart';

class HomeEspecificador extends StatefulWidget {
  const HomeEspecificador({
    Key? key,
    this.selected = false,
  }) : super(key: key);
  final bool selected;

  @override
  State<HomeEspecificador> createState() => _HomeEspecificadorState();
}

class _HomeEspecificadorState extends State<HomeEspecificador> {
  DateTime selectedDate = DateTime.now();

  get selected => false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: kIsWeb ? kPadding : 0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: kPadding),
          child: Column(
            children: <Widget>[
              const MenuBar(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: kPadding),
                height: 300,
                width: 500,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(4, 4),
                      blurRadius: 5,
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      padding: const EdgeInsets.all(kPadding),
                      onPressed: () => _selectDate(context),
                      icon: const Icon(Icons.date_range_outlined),
                    ),
                    Expanded(
                      child: Text("${selectedDate.toLocal()}".split(' ')[0]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
