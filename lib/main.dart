import 'package:flutter/material.dart';
import 'package:styleguide/ui/colors.dart';
import 'package:styleguide/ui/custom_widgets.dart';
import 'package:styleguide/ui/dimens.dart';
import 'package:styleguide/ui/fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom widgets',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StyleGuideScreen(),
    );
  }
}

class StyleGuideScreen extends StatefulWidget {
  @override
  _StyleGuideScreenState createState() => _StyleGuideScreenState();
}

class _StyleGuideScreenState extends State<StyleGuideScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: surface,
      appBar: AppBar(
        title: buildText('Summer breeze',
            size: hugeText, fontFamily: indie, weight: FontWeight.w600),
        backgroundColor: accent,
      ),
      body: Container(
        padding: EdgeInsets.all(screenPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: mediumMargin),
            MyOwnCustomTextWidget('Welcome to our app!', size: hugeText),
            buildText('This is the place where you can relax...'),
            buildText('... and let go all your pain :)',
                fontFamily: indie, weight: FontWeight.w600),
            buildText('We just some info about you:', margin: bigMargin),
            buildInputField(firstNameController, hintText: 'First name'),
            buildInputField(lastNameController, hintText: 'Last name'),
            buildInputField(phoneController,
                hintText: 'Phone', isInErrorState: true),
            buildInputField(emailController,
                hintText: 'Email', isEnabled: false),
            Row(
              children: [
                buildButton(
                    text: 'Submit', onTap: () {}, splashColor: Colors.yellow),
                buildButton(
                    text: 'Exit', width: 80, onTap: () {}, isUnderlined: true),
                buildButton(
                  text: 'Bye',
                  backgroundColor: accent,
                  splashColor: Colors.deepOrange,
                  onTap: () {},
                ),
              ],
            ),
            SizedBox(height: mediumMargin),
            MyOwnCustomTextWidget(
              'Never gonna give you up \n:)\nNever gonna let you down\n:)\nweeeeeeeee... :)',
              fontFamily: serif,
            ),
          ],
        ),
      ),
    );
  }
}
