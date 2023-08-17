import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("HomePage"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Stepper(
            currentStep: currentStep,
            controlsBuilder: (context, details) {
              return Row(
                children: [
                  Spacer(
                    flex: 2,
                  ),
                  ElevatedButton(
                    onPressed: details.onStepContinue,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff38C9C4),
                      foregroundColor: Color(0xffffffff),
                    ),
                    child: const Text("Next"),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: details.onStepContinue,
                    child: const Text("Back"),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                ],
              );
            },
            onStepCancel: () {
              setState(() {
                if (currentStep > 0) {
                  currentStep--;
                }
              });
            },
            onStepContinue: () {
              setState(() {
                if (currentStep < 6) {
                  currentStep++;
                }
              });
            },
            onStepTapped: (value) {
              setState(() {
                currentStep = value;
              });
            },
            steps: [
              Step(
                title: const Text("Step 1"),
                content: const Text("This is a 1st Step..."),
                isActive: (currentStep >= 0),
                state: (currentStep == 0)
                    ? StepState.editing
                    : (currentStep >= 0)
                        ? StepState.complete
                        : StepState.indexed,
              ),
              Step(
                title: const Text("Step 2"),
                content: const Text("This is a 2nd Step..."),
                isActive: (currentStep >= 1),
                state: (currentStep == 1)
                    ? StepState.editing
                    : (currentStep >= 1)
                        ? StepState.complete
                        : StepState.indexed,
              ),
              Step(
                title: Text("Step 3"),
                content: Text("This is a 3rd Step..."),
                isActive: (currentStep >= 2),
                state: (currentStep == 2)
                    ? StepState.editing
                    : (currentStep >= 2)
                        ? StepState.complete
                        : StepState.indexed,
              ),
              Step(
                title: Text("Step 4"),
                content: Text("This is a 4th Step..."),
                isActive: (currentStep >= 3),
                state: (currentStep == 3)
                    ? StepState.editing
                    : (currentStep >= 3)
                        ? StepState.complete
                        : StepState.indexed,
              ),
              Step(
                title: Text("Step 5"),
                content: Text("This is a 5th Step..."),
                isActive: (currentStep >= 4),
                state: (currentStep == 4)
                    ? StepState.editing
                    : (currentStep >= 4)
                        ? StepState.complete
                        : StepState.indexed,
              ),
              Step(
                title: Text("Step 6"),
                content: Text("This is a 6th Step..."),
                isActive: (currentStep >= 5),
                state: (currentStep == 5)
                    ? StepState.editing
                    : (currentStep >= 5)
                        ? StepState.complete
                        : StepState.indexed,
              ),
              Step(
                title: Text("Step 7"),
                content: Text("This is a 7th Step..."),
                isActive: (currentStep >= 6),
                state: (currentStep == 6)
                    ? StepState.editing
                    : (currentStep >= 6)
                        ? StepState.complete
                        : StepState.indexed,
              ),
            ],
          ),
        ));
  }
}
