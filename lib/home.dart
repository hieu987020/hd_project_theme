import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hd_project_theme/yellow_theme.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        // floatingActionButton: Icon(
        //   Icons.add_box_sharp,
        //   color: Theme.of(context).colorScheme.primary,
        //   size: 50,
        // ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              // Text('headline 1', style: Theme.of(context).textTheme.headline1),
              // Text('headline 2', style: Theme.of(context).textTheme.headline2),
              // Text('headline 3', style: Theme.of(context).textTheme.headline3),
              Text('headline 4', style: Theme.of(context).textTheme.headline4),
              Text('caption', style: Theme.of(context).textTheme.caption),
              Text('headline 5', style: Theme.of(context).textTheme.headline5),
              Text('headline 6', style: Theme.of(context).textTheme.headline6),
              Text('bodyText1', style: Theme.of(context).textTheme.bodyText1),
              const Text('text'),
              myTextButton(),
              myButton(context, 'Submit', () {}),
              myBox(context),
              const SizedBox(height: 10),
              myTextfield(
                context,
                'Username',
                false,
                _usernameController,
                _usernameFocusNode,
              ),
              myTextfield(
                context,
                'Password',
                true,
                _passwordController,
                _passwordFocusNode,
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: myButton(context, 'Sign In', () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const YellowTheme()),
                      );
                    })),
              ),
              const SizedBox(height: 200),
            ],
          ),
        ),
      ),
    );
  }

  Padding myTextfield(BuildContext context, String label, bool isObscure,
      TextEditingController controller, FocusNode focusNode) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        // ignore: prefer_const_constructors
        decoration: InputDecoration(
          labelText: label,
          // hintText: 'Tell us about yourself',
          helperText: 'Keep it short, this is just a demo.',
          labelStyle: TextStyle(
              color: focusNode.hasFocus
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onBackground),
        ),

        obscureText: isObscure,
        focusNode: focusNode,
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }

  TextButton myTextButton() {
    return TextButton(
      child: const Text('Submit'),
      onPressed: () {},
    );
  }

  ElevatedButton myButton(
      BuildContext context, String text, Function() onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }

  Container myBox(BuildContext context) {
    return Container(
      width: 100,
      height: 50,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface.withOpacity(0.8),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            offset: const Offset(5, 8),
            // spreadRadius: 5,
            blurRadius: 7,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          "Favorite",
          style: Theme.of(context).textTheme.caption,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
