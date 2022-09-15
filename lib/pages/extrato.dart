import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nucleo/components/components.dart';
import 'package:nucleo/kpadding.dart';

class Extrato extends StatefulWidget {
  const Extrato({
    Key? key,
    this.selected = false,
  }) : super(key: key);
  final bool selected;

  @override
  State<Extrato> createState() => _ExtratoState();
}

class _ExtratoState extends State<Extrato> {
  DateTime selectedDate = DateTime.now();

  get selected => false;

  Color get primarySwatch => Colors.grey;

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
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: kPadding),
          child: Column(
            children: <Widget>[
              const MenuBar(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: kPadding),
                height: 60,
                child: Text(
                  'Extrato de Pontos',
                  style: headlineTextStyle,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: kPadding),
                height: 250,
                width: 400,
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
                child: ListView(
                  children: <Widget>[
                    const SizedBox(
                      height: 45,
                    ),
                    Text('Inicio:', style: bodyTextStyle),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => _selectDate(context),
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.resolveWith<Color>(
                                    (states) {
                              if (states.contains(MaterialState.focused) ||
                                  states.contains(MaterialState.hovered) ||
                                  states.contains(MaterialState.pressed)) {
                                return Colors.white.withOpacity(0.8);
                              }

                              return primarySwatch;
                            }),
                            textStyle:
                                MaterialStateProperty.resolveWith<TextStyle>(
                                    (states) {
                              if (states.contains(MaterialState.focused) ||
                                  states.contains(MaterialState.hovered) ||
                                  states.contains(MaterialState.pressed)) {
                                return GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      letterSpacing: 1),
                                );
                              }

                              return GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    color: textPrimary,
                                    letterSpacing: 1),
                              );
                            }),
                          ),
                          icon: const Icon(Icons.date_range_outlined,
                              color: Color(0xFF3A3A3A)),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child:
                              Text("${selectedDate.toLocal()}".split(' ')[0]),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text('Fim:', style: bodyTextStyle),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => _selectDate(context),
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.resolveWith<Color>(
                                    (states) {
                              if (states.contains(MaterialState.focused) ||
                                  states.contains(MaterialState.hovered) ||
                                  states.contains(MaterialState.pressed)) {
                                return Colors.white.withOpacity(0.8);
                              }

                              return primarySwatch;
                            }),
                            textStyle:
                                MaterialStateProperty.resolveWith<TextStyle>(
                                    (states) {
                              if (states.contains(MaterialState.focused) ||
                                  states.contains(MaterialState.hovered) ||
                                  states.contains(MaterialState.pressed)) {
                                return GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      letterSpacing: 1),
                                );
                              }

                              return GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    color: textPrimary,
                                    letterSpacing: 1),
                              );
                            }),
                          ),
                          icon: const Icon(Icons.date_range_outlined,
                              color: Color(0xFF3A3A3A)),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child:
                              Text("${selectedDate.toLocal()}".split(' ')[0]),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(130, 0, 130, 0),
                      child: OutlinedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          overlayColor:
                              MaterialStateProperty.all<Color>(textPrimary),
                          side: MaterialStateProperty.resolveWith((states) {
                            if (states.contains(MaterialState.focused) ||
                                states.contains(MaterialState.hovered) ||
                                states.contains(MaterialState.pressed)) {
                              return const BorderSide(
                                  color: textPrimary, width: 2);
                            }

                            return BorderSide(color: primarySwatch, width: 2);
                          }),
                          foregroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                                  (states) {
                            if (states.contains(MaterialState.focused) ||
                                states.contains(MaterialState.hovered) ||
                                states.contains(MaterialState.pressed)) {
                              return Colors.white;
                            }

                            return primarySwatch;
                          }),
                          textStyle:
                              MaterialStateProperty.resolveWith<TextStyle>(
                                  (states) {
                            if (states.contains(MaterialState.focused) ||
                                states.contains(MaterialState.hovered) ||
                                states.contains(MaterialState.pressed)) {
                              return GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    letterSpacing: 1),
                              );
                            }

                            return GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                  fontSize: 14,
                                  color: textPrimary,
                                  letterSpacing: 1),
                            );
                          }),
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                                  const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 16)),
                        ),
                        child: const Text(
                          "Buscar",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Text(
                      'Total',
                      style: headlineTextStyle,
                    ),
                    Text(
                      '0',
                      style: headlineTextStyle,
                    ),
                    Text(
                      'Pts',
                      style: headlineSecondaryTextStyle,
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
