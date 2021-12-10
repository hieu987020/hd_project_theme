import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Remember extends StatelessWidget {
  Remember({Key? key}) : super(key: key);
  final _usernameController = TextEditingController();
  // ignore: unused_field
  final _unfocusedColor = Colors.grey[600];
  final _usernameFocusNode = FocusNode();

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
        appBar: AppBar(title: const Text('Home')),
        resizeToAvoidBottomInset: true,
        floatingActionButton: Icon(
          Icons.add_box_sharp,
          color: Theme.of(context).colorScheme.primary,
          size: 50,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              // Text('headline 1', style: Theme.of(context).textTheme.headline1),
              // Text('headline 2', style: Theme.of(context).textTheme.headline2),
              // Text('headline 3', style: Theme.of(context).textTheme.headline3),
              Text('headline 4', style: Theme.of(context).textTheme.headline4),
              Text('caption', style: Theme.of(context).textTheme.caption),
              Text('headline 5', style: Theme.of(context).textTheme.headline5),
              Text('headline 6', style: Theme.of(context).textTheme.headline6),
              Text('bodyText1', style: Theme.of(context).textTheme.bodyText1),
              const Text('nothing'),
              myTextButton(),
              myButton(context),
              myBox(context),
              const SizedBox(height: 30),
              myTextfield(context, 'Username', false),
              myTextfield(context, 'Password', true),
              const SizedBox(height: 200),
            ],
          ),
        ),
      ),
    );
  }

  Padding myTextfield(BuildContext context, String label, bool isObscure) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _usernameController,
        // ignore: prefer_const_constructors
        decoration: InputDecoration(
          labelText: label,
          // hintText: 'Tell us about yourself',
          // helperText: 'Keep it short, this is just a demo.',
          // prefixIcon: Icon(
          //   Icons.person,
          //   color: _usernameFocusNode.hasFocus
          //       ? Theme.of(context).colorScheme.primary
          //       : _unfocusedColor,
          // ),
          // prefixText: 'Name',
          // prefixStyle: const TextStyle(color: Colors.green),
          // suffixText: 'USD',
          // suffixStyle: const TextStyle(color: Colors.green),
          labelStyle: TextStyle(
            color: _usernameFocusNode.hasFocus
                ? Theme.of(context).colorScheme.primary
                : _unfocusedColor,
          ),
        ),
        obscureText: isObscure,
        focusNode: _usernameFocusNode,
      ),
    );
  }

  TextButton myTextButton() {
    return TextButton(
      child: const Text('Submit'),
      onPressed: () {},
    );
  }

  ElevatedButton myButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: const Text('Submit'),
    );
  }

  Container myBox(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary,
            offset: const Offset(10, 20),
            // spreadRadius: 5,
            blurRadius: 7,
          )
        ],
      ),
    );
  }
}
