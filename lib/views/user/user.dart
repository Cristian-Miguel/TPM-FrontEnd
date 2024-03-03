import 'package:flutter/material.dart';
import 'package:turismo_flutter/controllers/user/user_controller.dart';
import 'package:turismo_flutter/middleware/manage_secure_storage.dart';
import 'package:turismo_flutter/views/user/Login.dart';

class User extends StatefulWidget {
  const User({super.key});
  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  var isCloseSession = false;
  var user = '';
  var fullName = '';

  getInfoUser() async {
    var response = await UserController.getUser();
    setState(() {
      user = response['User'];
      fullName = "${response['Name']} ${response['LastName']}";
    });
  }

  @override
  void initState() {
    super.initState();
    getInfoUser();
  }

  @override
  Widget build(BuildContext context) {
    return isCloseSession ? const Login() : profileUserView();
  }

  profileUserView() {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 10,
        actions: <Widget>[
          IconButton(
            onPressed: () async => {
              await ManageSecureStorage.deleteToken(),
              setState(() {
                isCloseSession = true;
              }),
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.black45,
            ),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      top: 25, bottom: 25, left: 10, right: 10),
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: NetworkImage(
                          'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        fullName,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        user,
                        textAlign: TextAlign.start,
                        style: const TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.black12,
              height: 5,
              thickness: 0.7,
              indent: 10,
              endIndent: 10,
            ),
            Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 25, bottom: 20, left: 10),
                  child: const Text(
                    "Account Settings",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.fromLTRB(2, 7, 2, 7),
                  elevation: 0,
                  shape: const Border(
                    bottom: BorderSide(width: 1, color: Colors.black26),
                    top: BorderSide(width: 1, color: Colors.black26),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.account_circle_outlined),
                    title: const Text('Personal information'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {},
                  ),
                ),
                Card(
                  margin: const EdgeInsets.fromLTRB(2, 7, 2, 7),
                  elevation: 0,
                  shape: const Border(
                    bottom: BorderSide(width: 1, color: Colors.black26),
                    top: BorderSide(width: 1, color: Colors.black26),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.money_sharp),
                    title: const Text('Payments and receipts'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {},
                  ),
                ),
                Card(
                  margin: const EdgeInsets.fromLTRB(2, 7, 2, 7),
                  elevation: 0,
                  shape: const Border(
                    bottom: BorderSide(width: 1, color: Colors.black26),
                    top: BorderSide(width: 1, color: Colors.black26),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.add_alert),
                    title: const Text('Notifications'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {},
                  ),
                ),
                Card(
                  margin: const EdgeInsets.fromLTRB(2, 7, 2, 7),
                  elevation: 0,
                  shape: const Border(
                    bottom: BorderSide(width: 1, color: Colors.black26),
                    top: BorderSide(width: 1, color: Colors.black26),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.announcement_sharp),
                    title: const Text('Privacy'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {},
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 15, bottom: 15, left: 10),
                  child: const Text(
                    "Support",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.fromLTRB(2, 7, 2, 7),
                  elevation: 0,
                  shape: const Border(
                    bottom: BorderSide(width: 1, color: Colors.black26),
                    top: BorderSide(width: 1, color: Colors.black26),
                  ),
                  child: ListTile(
                      leading: const Icon(Icons.account_balance),
                      title: const Text('How ExploraMich works'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () => {
                            // Navigator.of(context).pop(),
                          }),
                ),
                Card(
                  margin: const EdgeInsets.fromLTRB(2, 7, 2, 7),
                  elevation: 0,
                  shape: const Border(
                    bottom: BorderSide(width: 1, color: Colors.black26),
                    top: BorderSide(width: 1, color: Colors.black26),
                  ),
                  child: ListTile(
                      leading: const Icon(Icons.money_sharp),
                      title: const Text('Contact the helpdesk'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () => {
                            // Navigator.of(context).pop(),
                          }),
                ),
                Card(
                  margin: const EdgeInsets.fromLTRB(2, 7, 2, 7),
                  elevation: 0,
                  shape: const Border(
                    bottom: BorderSide(width: 1, color: Colors.black26),
                    top: BorderSide(width: 1, color: Colors.black26),
                  ),
                  child: ListTile(
                      leading: const Icon(Icons.help),
                      title: const Text('Get help'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () => {
                            // Navigator.of(context).pop(),
                          }),
                ),
                Card(
                  margin: const EdgeInsets.fromLTRB(2, 7, 2, 20),
                  elevation: 0,
                  shape: const Border(
                    bottom: BorderSide(width: 1, color: Colors.black26),
                    top: BorderSide(width: 1, color: Colors.black26),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.app_registration),
                    title: const Text('Send us your comments'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () => {
                      // Navigator.of(context).pop(),
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
