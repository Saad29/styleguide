import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:styleguide/ui/colors.dart';
import 'package:styleguide/ui/dimens.dart';
import 'package:styleguide/ui/fonts.dart';

/// N O T E
/// You can use this code like widgets, or as functions(both options shown below)
/// Whatever way you like more :)

class MyOwnCustomTextWidget extends StatelessWidget {
  const MyOwnCustomTextWidget(this.text,
      {this.size = mediumText,
      this.weight = FontWeight.w400,
      this.fontFamily = sans,
      this.margin = smallMargin,
      Key key})
      : super(key: key);

  final String text;
  final double size;
  final FontWeight weight;
  final String fontFamily;
  final double margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: margin),
      child: Text(text,
          style: TextStyle(
              fontFamily: fontFamily, fontWeight: weight, fontSize: size)),
    );
  }
}

/// MyOwnCustomTextWidget and buildText do exactly the same thing.
/// Chose whatever way you want

Widget buildText(String text,
    {double size = mediumText,
    FontWeight weight = FontWeight.w400,
    String fontFamily = sans,
    double margin = smallMargin}) {
  return Container(
    margin: EdgeInsets.only(top: margin),
    child: Text(text,
        style: TextStyle(
            fontFamily: fontFamily, fontWeight: weight, fontSize: size)),
  );
}

Widget buildInputField(TextEditingController controller,
    {String hintText,
    TextAlign textAlign = TextAlign.left,
    Color textColor = primaryText,
    Color backgroundColor = surface,
    bool isInErrorState = false,
    bool isEnabled = true,
    String fontFamily = sans,
    double textSize = mediumText,
    double topMargin = smallMargin}) {
  return Container(
    margin: EdgeInsets.only(top: smallMargin),
    child: TextField(
      textAlign: textAlign,
      cursorColor: textColor,
      controller: controller,
      enabled: isEnabled,
      decoration: InputDecoration(
          filled: true,
          contentPadding:
              EdgeInsets.symmetric(horizontal: textFieldSidesMargin),
          fillColor: backgroundColor,
          counterText: '',
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: isInErrorState ? error : primaryText,
                  width: textFieldUnderlineThickness)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: isInErrorState ? error : accent,
                  width: textFieldUnderlineThickness)),
          disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: isInErrorState ? error : disabled,
                  width: textFieldUnderlineThickness)),
          hintText: hintText,
          hintStyle: TextStyle(
              color: hint, fontFamily: fontFamily, fontSize: textSize)),
      style: TextStyle(
          fontSize: textSize, color: textColor, fontFamily: fontFamily),
    ),
  );
}

Widget buildButton(
    {@required String text,
    @required Function onTap,
    bool isUnderlined = false,
    double width = buttonSize,
    Color textColor = primaryText,
    double textSize = biggerText,
    FontWeight fontWeight = FontWeight.w400,
    IconData iconData,
    Color borderColor = Colors.transparent,
    String fontFamily = indie,
    Color backgroundColor = surface,
    double topMargin = buttonVerticalMargin,
    Color splashColor = accent}) {
  return Container(
    width: width,
    margin: EdgeInsets.only(top: topMargin),
    decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(
          Radius.circular(defaultCorner),
        ),
        border: Border.all(color: borderColor)),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(defaultCorner),
        onTap: () {
          onTap();
        },
        splashColor: splashColor,
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: buttonHorizontalPadding,
              vertical: buttonVerticalPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (iconData != null)
                Container(
                  child: Icon(
                    iconData,
                    color: primaryText,
                    size: smallIcon,
                  ),
                  margin: EdgeInsets.only(
                    right: buttonHorizontalPadding,
                  ),
                ),
              Text(
                text,
                style: TextStyle(
                  fontSize: textSize,
                  fontWeight: fontWeight,
                  fontFamily: fontFamily,
                  color: textColor,
                  decoration: isUnderlined ? TextDecoration.underline : null,
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
