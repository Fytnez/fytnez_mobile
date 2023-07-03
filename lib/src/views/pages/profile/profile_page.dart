import 'package:flutter/material.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User user = receiveUser(context);
    return Scaffold(
      body: ListView( 
        padding: const EdgeInsets.all(60),
        children: [
          name(user),
          weight(user),
          height(user),
          email(user),
          birthday(user)
        ],
      ),
    );
  }
  User receiveUser(BuildContext context) {
    var param = ModalRoute.of(context);
    if (param != null) {
      User user = param.settings.arguments as User;
      return user;
    } else {
      throw Exception('Problemas em receber o usuario');
    }
  }
  Widget nome(User user){
    return Center( 
      child: Text(
        user.name, 
        style: const TextStyle(fontSize: 30)
      )
    );
  }
  Widget weight(User user){
    return Center( 
      child: Text(
        user.weight, 
        style: const TextStyle(fontSize: 30)
      )
    );
  }
  Widget height(User user){
    return Center( 
      child: Text(
        user.height, 
        style: const TextStyle(fontSize: 30)
      )
    );
  }
  Widget email(User user){
    return Center( 
      child: Text(
        user.email, 
        style: const TextStyle(fontSize: 30)
      )
    );
    }
  Widget birthday(User user){
    return Center( 
      child: Text(
        user.birthday, 
        style: const TextStyle(fontSize: 30)
      )
    );


}