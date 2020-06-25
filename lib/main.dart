import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State {
  var _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Stepper",
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Stepper"),
        ),
        body: Stepper(
          controlsBuilder: (BuildContext context,
              {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
            return Row(
              children: <Widget>[
                FlatButton(
                  onPressed: onStepContinue,
                  child: Text('ВПЕРËД'),
                  color: Colors.greenAccent,
                ),
                FlatButton(
                  onPressed: onStepCancel,
                  child: Text('НАЗАД'),
                ),
              ],
            );
          },
          type: StepperType.vertical,
          currentStep: _currentStep,
          onStepContinue:
              _currentStep < 2 ? () => setState(() => _currentStep += 1) : null,
          onStepCancel:
              _currentStep > 0 ? () => setState(() => _currentStep -= 1) : null,
          steps: [
            Step(
              title: Text('Шаг 1'),
              subtitle: Text('Это первый шаг'),
              isActive: true,
              content: Text('This is step 1'),
            ),
            Step(
                title: Text('Step 2'),
                isActive: true,
                content: Text('This is step 2')),
            Step(
                title: Text('Step 3'),
                isActive: true,
                content: Text('This is step 3'))
          ],
        ),
      ),
    );
  }
}
