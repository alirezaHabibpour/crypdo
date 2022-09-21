import 'package:flutter/cupertino.dart';
import 'package:crypdo/src/commons/utils/style/global_style.dart';

class CustomLoading extends StatelessWidget {

  final String? title;


  const CustomLoading({ Key? key, this.title }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10000,
      color: GlobalStyle.primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           SizedBox(height: 15),
          SizedBox(height: 15),
          Text(title ?? 'loading ....', style: GlobalStyle.textH0BBlack),
        ],
      ),
    );
  }
}