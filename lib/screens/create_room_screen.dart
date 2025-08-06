import 'package:flutter/material.dart';
import 'package:tictactoe/resources/socket_methods.dart';
import 'package:tictactoe/responsive/responsive.dart';
import 'package:tictactoe/widgets/custom_button.dart';
import 'package:tictactoe/widgets/custom_text.dart';
import 'package:tictactoe/widgets/custom_textfield.dart';

class CreateRoomScreen extends StatefulWidget {
  static String routeName = '/create-room';

  const CreateRoomScreen({super.key});

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  TextEditingController nicknameController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void dispose() {
    nicknameController.dispose(); // 👈 avoid memory leaks
    super.dispose();
  }

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    TextEditingController nicknameController = TextEditingController();
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
                text: 'Create Room',
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

              const SizedBox(height: 20),
              SizedBox(
                width: 380,
                height: 50,
                child: CustomButton(
                  onTap: () =>
                      _socketMethods.createRoom(nicknameController.text),
                  text: 'Create',
                ),
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
