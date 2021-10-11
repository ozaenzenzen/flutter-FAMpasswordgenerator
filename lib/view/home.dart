import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fam_passwordgenerator/model/generate_password.dart';
import 'package:flutter_fam_passwordgenerator/model/home_controller_input.dart';
import 'package:flutter_fam_passwordgenerator/view/home_topcontainer.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:cupertino_icons/cupertino_icons.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

ControllerInput controllerInput = ControllerInput();
GeneratePassword generatePassword = GeneratePassword();
TextEditingController outputController = TextEditingController();

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final consHeight = MediaQuery.of(context).size.height;
    final consWidth = MediaQuery.of(context).size.width;
    final constAppBarColor = Colors.lightBlue;

    return Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        elevation: 0,
        leading: new IconButton(
          padding: new EdgeInsets.symmetric(
            horizontal: 20,
          ),
          icon: Icon(
            CupertinoIcons.bars,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            padding: new EdgeInsets.symmetric(
              horizontal: 20,
            ),
            icon: Icon(CupertinoIcons.square_grid_2x2),
            onPressed: () {},
          ),
        ],
        backgroundColor: constAppBarColor,
      ),
      body: new SingleChildScrollView(
        child: Column(
          children: [
            TopContainer(
              consWidth: consWidth,
              consHeight: consHeight,
              constAppBarColor: constAppBarColor,
            ),

            //Input Text Field
            InputTextField(),

            new SizedBox(height: 10),

            //Button for Generate
            SizedBox(
              height: consHeight * 0.06,
              width: consWidth * 0.25,
              child: new ElevatedButton(
                onPressed: () {
                  setState(() {

                    FocusScope.of(context).unfocus();
                    if (controllerInput.isOn) {
                      controllerInput.validate = false;

                      //Melakukan set nilai dalam kelas controller input
                      controllerInput.icSetter(
                          controllerInput.inputController.text.toString());

                      // print(controllerInput.icGetter);

                      // Memanggil fungsi dalam kelas Output Controller
                      outputController.text = generatePassword
                          .generateone(controllerInput.icGetter);
                    } else {
                      controllerInput.validate = true;
                    }
                  });
                },
                child: new Text(
                  "Generate it!",
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: consHeight * 0.015,
                    fontFamily: "SF Text",
                    // fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),

            new SizedBox(height: 10),

            //Output Text Field
            OutputTextField(),
          ],
        ),
      ),
    );
  }
}

class OutputTextField extends StatefulWidget {
  const OutputTextField({
    Key key,
  }) : super(key: key);

  @override
  _OutputTextFieldState createState() => _OutputTextFieldState();
}

class _OutputTextFieldState extends State<OutputTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          new Container(
            margin: new EdgeInsets.only(
              left: 40,
              bottom: 10,
              top: 15,
            ),
            child: new Text(
              "Output",
              style: new TextStyle(
                // color: Colors.white,
                // fontSize: consHeight * 0.025,
                fontFamily: "SF Text",
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          new Container(
            margin: new EdgeInsets.symmetric(
              horizontal: 40,
            ),
            child: new TextField(
              controller: outputController,
              maxLines: null,
              enableInteractiveSelection: true,
              decoration: InputDecoration(
                // hintText: "Generate Text Will Shown Here...",
                labelText: "Generate Text Will Shown Here...",
                labelStyle: new TextStyle(
                  fontSize: 13,
                ),
                contentPadding: EdgeInsets.only(left: 20),
                border: new OutlineInputBorder(
                  borderSide: new BorderSide(),
                  borderRadius: new BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InputTextField extends StatefulWidget {
  InputTextField({
    Key key,
  }) : super(key: key);

  @override
  _InputTextFieldState createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  @override
  void initState() {
    super.initState();
    controllerInput.inputController.addListener(() {
      setState(() {
        //isOn bernilai salah jika controllerinput lebih besar dari 0
        //isOn bernilai salah jika textfield ada isinya
        controllerInput.isOn = controllerInput.inputController.text.length > 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          new Container(
            margin: new EdgeInsets.only(
              left: 40,
              bottom: 10,
              top: 15,
            ),
            child: new Text(
              "Input Text",
              style: new TextStyle(
                // color: Colors.white,
                // fontSize: consHeight * 0.025,
                fontFamily: "SF Text",
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          new Container(
            margin: new EdgeInsets.symmetric(
              horizontal: 40,
            ),
            child: new TextField(
              controller: controllerInput.inputController,
              decoration: InputDecoration(
                errorText: controllerInput.validate ? "Can't be empty!" : null,
                //jika isOn true(benar) memiliki nilai "salah", maka keluar icon, jika tidak maka null
                suffixIcon: (controllerInput.isOn)
                    ? IconButton(
                        icon: Icon(CupertinoIcons.clear_circled_solid),
                        onPressed: () {
                          controllerInput.inputController.clear();
                        },
                      )
                    : new Container(
                        width: 0,
                        height: 0,
                        color: Colors.transparent,
                      ),
                hintText: "Minimal 1 kata",
                hintStyle: TextStyle(
                  fontSize: 13,
                ),
                labelText: "Write Text Here...",
                labelStyle: new TextStyle(
                  fontSize: 13,
                ),
                contentPadding: EdgeInsets.only(left: 20),
                border: new OutlineInputBorder(
                  borderSide: new BorderSide(),
                  borderRadius: new BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

