
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:password_blocks/view/screens/home.dart';
import 'package:provider/provider.dart';

import '../../view_model/metaMaskProvider.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MetaMaskProvider()..start(),
        builder: (context, child) {
          return Container(
            child:
            Center(
              child: Consumer<MetaMaskProvider>(
                builder: (context, provider, child) {
                  late final String message;
                  if (provider.isConnected && provider.isInOperatingChain) {
                    return HomePage();
                  } else if (provider.isConnected &&
                      !provider.isInOperatingChain) {
                    message =
                    'Wrong chain. Please connect to ${MetaMaskProvider.operatingChain}';
                  } else if (provider.isEnabled) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        MaterialButton(
                          onPressed: () async{
                            provider.connect();
                          }
                          ,
                          color: Colors.white,
                          padding: const EdgeInsets.all(0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.network(
                                'https://i0.wp.com/kindalame.com/wp-content/uploads/2021/05/metamask-fox-wordmark-horizontal.png?fit=1549%2C480&ssl=1',
                                width: 250,
                              ),
                            ],
                          ),
                        ),

                      ],
                    );
                  } else {
                    message = 'Please use a Web3 supported browser.';
                  }
                  return Text(
                    message,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.blue),
                  );
                },
              ),
            ),
          );
        });
  }
}
