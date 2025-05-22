import 'package:flutter/material.dart';
import 'package:my_first_app/components/outline_button.dart';
const Color primaryBrown = Color(0xFF7B3F00);

class HariReviewPage extends StatefulWidget {
  const HariReviewPage({super.key});

  @override
  State<HariReviewPage> createState() => _HariReviewPageState();
}

class _HariReviewPageState extends State<HariReviewPage> {
  int currentStep = 1;
  int selectedIndex1 = -1;
  int selectedIndex2 = -1;

  final titleController = TextEditingController();
  final issueController = TextEditingController();

  final options1 = [
    {'icon': Icons.lightbulb_outlined, 'label': 'Electrical Shops'},
    {'icon': Icons.book_sharp, 'label': 'Books Shop'},
    {'icon': Icons.build, 'label': 'Hardware Shops'},
  ];

  final options2 = [
    {'icon': Icons.soup_kitchen_sharp, 'label': 'Canteens'},
    {'icon': Icons.emoji_food_beverage_outlined, 'label': 'Juice Corner'},
    {'icon': Icons.local_dining_outlined, 'label': 'Restaurants'},
  ];

  Widget step1() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Step $currentStep / 2", style:
          TextStyle(
              color: Color(0xFF7B3F00),
            fontSize: 12,
          )),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Container(height: 2.5, color: Color(0xFF7B3F00)),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  height: 2.5 ,
                  color: currentStep == 2 ? Color(0xFF7B3F00) : Colors.grey[100],
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          const Text(
            "Select the space you're facing problem in your city",
            style: TextStyle(
                fontSize: 18,
            ),
          ),
          const SizedBox(height: 10),
          const Text("Shops", style: TextStyle(
              color: Colors.black54,
          )),
          Expanded(
            child: ListView.builder(
              itemCount: options1.length,
              itemBuilder: (context, index) {
                final option = options1[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.5),
                  child: my_OutlinedButton(
                    icon: option['icon'] as IconData,
                    label: option['label'] as String,
                    isSelected: selectedIndex1 == index,
                    onTap: () {
                      setState(() {
                        selectedIndex1 = (selectedIndex1 == index) ? -1 : index;
                      });
                    },
                  ),
                );
              },
            ),
          ),
          const Text("Food Area", style: TextStyle( color: Colors.black54)),
          Expanded(
            child: ListView.builder(
              itemCount: options2.length,
              itemBuilder: (context, index) {
                final option = options2[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.5),
                  child: my_OutlinedButton(
                    icon: option['icon'] as IconData,
                    label: option['label'] as String,
                    isSelected: selectedIndex2 == index,
                    onTap: () {
                      setState(() {
                        selectedIndex2 = (selectedIndex2 == index) ? -1 : index;
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );

  }

  Widget step2() {
    return Expanded(
      child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Step $currentStep / 2",
        style: TextStyle(
          color: Color(0xFF7B3F00),
          fontSize: 12,
        )),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Container(height: 2.5, color: Color(0xFF7B3F00)),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  height: 2.5,
                  color: currentStep == 2 ? Color(0xFF7B3F00) : Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            "Give info about the issue you're facing",
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),
          const Text("Short title"),
          const SizedBox(height: 10),
          TextField(
            controller: titleController,
            maxLines: 1,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black12),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(20),
              ),
              hintText: "e.g. No one is giving Luxor pens",
              hintStyle: const TextStyle(color: Colors.grey),
            ),
          ),
          const SizedBox(height: 15),
          const Text("Briefly explain your issue"),
          const SizedBox(height: 10),
          TextField(
            controller: issueController,
            maxLines: 4,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black12),
                    borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20),
                ),
              hintText: "Tell us exactly what’s wrong so it can be fixed faster",
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
          const SizedBox(height: 20),
          const Text(" + Add photos ",
              style: TextStyle(
                  color: Color(0xFF7B3F00) ,
                fontWeight: FontWeight.bold ,
              )),
              // const SizedBox(height: 10),
        ],
      ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              if (currentStep == 2) {
                setState(() {
                  currentStep = 1;
                });
              }
            },
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Write your reviews',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              currentStep == 1 ? step1() : step2(),
            ],
          ),
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Divider(
              color: Colors.grey,
              thickness: 1.5,
              height: 0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12 , vertical: 15),
              child: ElevatedButton(
                onPressed: () {
                  if (currentStep == 1) {
                    if (selectedIndex1 != -1 || selectedIndex2 != -1) {
                      setState(() {
                        currentStep = 2;
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Select at least one option to proceed'),
                          backgroundColor: Colors.grey[500],
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Complaint Submitted!'),
                        backgroundColor: Colors.green,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF7B3F00),
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  currentStep == 1 ? "Next" : "Submit Complaint",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

