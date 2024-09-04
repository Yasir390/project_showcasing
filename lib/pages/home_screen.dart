import 'dart:developer';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bdcalling_task_yasirarafat/const/const.dart';
import 'package:bdcalling_task_yasirarafat/pages/developer_info.dart';
import 'package:bdcalling_task_yasirarafat/widgets/close_btn.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/custom_btn.dart';
import '../data/json_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String?> parsedVersions = [];
  String errorMessage = '';

  List<String?> parseJSON(List<dynamic> input) {
    List<String?> result = [];
    try {
      for (var item in input) {
        if (item is Map) {
          int maxKey = item.keys
              .where((k) => int.tryParse(k) != null)
              .map((k) => int.parse(k))
              .reduce((a, b) => a > b ? a : b);

          List<String?> tempList = List.filled(maxKey + 1, null);

          item.forEach((key, value) {
            int? index = int.tryParse(key);
            if (index != null && value is Map && value.containsKey('title')) {
              tempList[index] = value['title'];
            }
          });

          result.addAll(tempList);
        } else if (item is List) {
          for (var subItem in item) {
            if (subItem is Map && subItem.containsKey('title')) {
              result.add(subItem['title']);
            }
          }
        }
      }
    } catch (e) {
      log('Error parsing JSON: $e');
      errorMessage = 'Error parsing JSON: $e';
    }

    return result;
  }

  void parseAndDisplayInput(List<dynamic> input) {
    setState(() {
      errorMessage = '';
      parsedVersions = parseJSON(input);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Json Task'),
        centerTitle: true,
        foregroundColor: Colors.white,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple, Colors.red],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => DeveloperInfoScreen(),));
          }, icon: Icon(Icons.info_outline,color: Colors.white,))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    onTap: () {
                      _showBottomSheet(context, 'Output of Input1');
                      parseAndDisplayInput(JsonData.input1);
                    },
                    colors: const [Colors.tealAccent, Colors.redAccent],
                    btnName: 'Parse Input 1',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomButton(
                    onTap: () {
                      _showBottomSheet(context, 'Output of Input2');
                      parseAndDisplayInput(JsonData.input2);
                    },
                    colors: const [Colors.tealAccent, Colors.redAccent],
                    btnName: 'Parse Input 2',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (errorMessage.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(errorMessage,
                    style: const TextStyle(color: Colors.red)),
              ),
            Spacer(),
            Center(
              child: AnimatedTextKit(
                isRepeatingAnimation: true,
                  animatedTexts: [
                    ColorizeAnimatedText(
                      'Press button to fetch Json data',
                      textStyle: colorizeTextStyle.copyWith(fontSize: 17),
                      colors: colorizeColors,
                    ),
                  ]),
            ),
            // Center(child: Text('Press button to fetch Json data',style: GoogleFonts.aBeeZee().copyWith(
            //   fontSize: 20,
            // ),),),
            Spacer(),
          ],
        ),
      ),
    );
  }

  //bottom sheet
  _showBottomSheet(BuildContext context, String text) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.blue.shade200,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(6),
          height: 400,
          decoration: bottomSheetContainerDecoration,
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  text,
                  style: GoogleFonts.aBeeZee()
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(
                thickness: 1,
                color: Colors.black,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: parsedVersions.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: Text(
                        parsedVersions[index] ?? '',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.aBeeZee().copyWith(fontSize: 13),
                      ),
                    );
                  },
                ),
              ),

              // close button of bottom sheet
              CustomCloseButton()
             // CloseButton()
            ],
          ),
        );
      },
    );
  }
}
