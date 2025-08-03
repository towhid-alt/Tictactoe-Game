import 'package:flutter/material.dart';
import 'package:tictactoe/responsive/responsive.dart';
import 'package:tictactoe/widgets/custom_button.dart';
import 'package:tictactoe/widgets/custom_text.dart';
import 'package:tictactoe/widgets/custom_textfield.dart';

class JoinRoomScreen extends StatefulWidget {
  static String routeName = '/join-room';
  const JoinRoomScreen({super.key});

  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {
  TextEditingController nicknameController = TextEditingController();
  TextEditingController gameIdController = TextEditingController();
  @override
  void dispose() {
    nicknameController.dispose();
    gameIdController.dispose(); // 👈 avoid memory leaks
    super.dispose();
  }

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Responsive(
        child: Padding(
          padding: EdgeInsets.only(left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomText(
                shadows: [Shadow(blurRadius: 40, color: Colors.blue)],
                text: 'Join\nRoom',
                fontSize: 70,
              ),
              SizedBox(height: size.height * 0.08),
              SizedBox(
                width: 390,
                child: CustomTextfield(
                  hintText: 'Enter your nickname',
                  controller: nicknameController,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 390,
                child: CustomTextfield(
                  hintText: 'Enter Game ID',
                  controller: gameIdController,
                ),
              ),

              const SizedBox(height: 20),
              SizedBox(
                width: 380,
                height: 50,
                child: CustomButton(onTap: () {}, text: 'Create'),
              ),

              /*SizedBox(
                width: 390,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: Text('Create'),
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
