import 'package:flutter/material.dart';
import 'package:crypdo/src/commons/utils/style/global_style.dart';

class KeyPad extends StatelessWidget{
 double buttonSize = 70;
 final TextEditingController textController;
 final Function onChange;
 final Function onSubmit;
  final bool isPinLogin;

 KeyPad({required this.onChange,required this.onSubmit,required this.textController,required this.isPinLogin});

 @override
 Widget build(BuildContext context) {
   return Wrap(
     children: [
       Container(
          margin: EdgeInsets.only(left: 20 , right: 20 , bottom: 20, top: 10),
         child: Column(
           children: [
             SizedBox(height: 10),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 buttonWidget('3'),
                 buttonWidget('2'),
                 buttonWidget('1'),

               ],
             ),
             SizedBox(height: 10),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 buttonWidget('6'),
                 buttonWidget('5'),
                 buttonWidget('4'),

               ],
             ),
             SizedBox(height: 10),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 buttonWidget('9'),
                 buttonWidget('8'),
                 buttonWidget('7'),

               ],
             ),
             SizedBox(height: 10),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 buttonWidget('.'),
                 buttonWidget('0'),
                 Directionality(textDirection: TextDirection.ltr, child: iconButtonWidget(Icons.backspace_outlined, () {
                   if (textController.text.length > 0) {
                     textController.text = textController.text
                         .substring(0, textController.text.length - 1);
                   }
                   onChange(textController.text);
                 })),

               ],
             ),
           ],
         ),
       ),
     ],
   );
 }

 buttonWidget(String buttonText) {
   return Container(
     height: buttonSize,
     width: buttonSize,
     child: ElevatedButton(
       style: ButtonStyle(
         backgroundColor:  MaterialStateProperty.all<Color>(
           Colors.transparent
         ),
           shadowColor:  MaterialStateProperty.all<Color>(
           GlobalStyle.boxEndColor.withOpacity(0.6)
         ),
       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
           RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(buttonSize / 2),
       ))),

       onPressed: () {
         if (textController.text.length <= 10) {
           textController.text = textController.text + buttonText;
           onChange(textController.text);
         }
       },
       child: Center(
         child: Text(
           buttonText,
           style: GlobalStyle.textH3BigWhite,
         ),
       ),
     ),
   );
 }

 iconButtonWidget(IconData icon, Function function) {
   return InkWell(
     onTap: () => function.call(),
     child: Container(
       height: buttonSize,
       width: buttonSize,
       decoration: BoxDecoration(color: GlobalStyle.boxStartColor, shape: BoxShape.circle),
       child: Center(
         child: Icon(icon,
           size: 25,
           color: Colors.white,
         ),
       ),
     ),
   );
 }
}
