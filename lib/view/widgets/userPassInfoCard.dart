import 'package:flutter/material.dart';

class UserPassInfoCard extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final data;
  const UserPassInfoCard({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        popDetails(context, size);
      },
      child: Card(
        elevation: 10,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.1,
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Username: ' + data['userName']),
              const Spacer(),
              const Text('*****************'),
            ],
          ),
        ),
      ),
    );
  }

  popDetails(context, size) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: SizedBox(
              width: size.width * 0.3,
              height: size.height * 0.1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Text('Username: ' + data['userName']),
                  const Spacer(),
                  Text('Password: ' + data['password']),
                  const Spacer(),
                ],
              ),
            ),
          );
        });
  }
}
