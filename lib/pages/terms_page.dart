import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:perapal/contents/terms_eng.dart';
import 'package:perapal/contents/terms_ph.dart';
import 'package:perapal/utils/style.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key});

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

const List<String> list = <String>['US', 'PH'];

class _TermsAndConditionsState extends State<TermsAndConditions> {
  String dropdownValue = list.first;
  Widget? terms;

  @override
  void initState() {
    super.initState();
    terms = TermsEng();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: white,
        actions: [
          Padding(
            padding: EdgeInsets.all(small),
            child: DropdownButton<String>(
              value: dropdownValue,
              icon: CountryFlag.fromCountryCode(
                dropdownValue,
                height: 30,
                width: 30,
                borderRadius: 30,
              ),
              elevation: 16,
              style: p1,
              underline: Container(
                height: 2,
                color: white,
              ),
              onChanged: (String? value) {
                setState(() {
                  dropdownValue = value!;
                  if (dropdownValue == 'US') {
                    terms = TermsEng();
                  } else if (dropdownValue == 'PH') {
                    terms = TermsPh();
                  }
                });
              },
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(medium),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    terms?? Container()
                    // Add r widgets here if needed
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}