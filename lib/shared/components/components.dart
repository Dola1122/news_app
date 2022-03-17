// import 'package:first/shared/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/web_view/web_view_screen.dart';

//
// Widget defaultButton({
//   double width = double.infinity,
//   Color color = Colors.blue,
//   required String text,
//   required function,
// }) {
//   return Container(
//     height: 40,
//     child: MaterialButton(
//       onPressed: function,
//       child: Text(
//         text,
//         style: TextStyle(color: Colors.white),
//       ),
//     ),
//     width: width,
//     color: color,
//   );
// }
//
// Widget defaultFormField({
//   required String validateText,
//   required String labelText,
//   required TextEditingController controller,
//   required IconData prefixIcon,
//   var onTap,
//   IconData? suffexIcon,
//   TextInputType? type,
//   bool isPassword = false,
//   IconData passwordIcon = Icons.remove_red_eye,
// }) =>
//     TextFormField(
//       validator: (value) {
//         if (value!.isEmpty) {
//           return validateText;
//         }
//         return null;
//       },
//       onTap: onTap,
//       decoration: InputDecoration(
//         border: OutlineInputBorder(),
//         labelText: labelText,
//         prefixIcon: Icon(prefixIcon),
//         suffixIcon: isPassword
//             ? IconButton(
//                 icon: Icon(passwordIcon),
//                 onPressed: () {
//                   isPassword = false;
//                   passwordIcon = Icons.visibility_off;
//                 },
//               )
//             : Icon(suffexIcon),
//       ),
//       keyboardType: type,
//       obscureText: isPassword,
//       controller: controller,
//     );
//
// Widget defaultTask(Map model, context) => Dismissible(
//       key: Key(model['id'].toString()),
//       onDismissed: (direction){
//         AppCubit.get(context).deleteFromDataBase(model['id']);
//       },
//       child: Row(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: CircleAvatar(
//               radius: 40,
//               child: Text('${model['time']}'),
//             ),
//           ),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   '${model['title']}',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//                 Text(
//                   '${model['date']}',
//                   style: TextStyle(color: Colors.grey),
//                 ),
//               ],
//               mainAxisSize: MainAxisSize.min,
//             ),
//           ),
//           IconButton(
//               onPressed: () {
//                 AppCubit.get(context).updateDataBase('done', model['id']);
//               },
//               icon: Icon(
//                 Icons.check_circle,
//                 color: Colors.green,
//               )),
//           SizedBox(
//             width: 10,
//           ),
//           IconButton(
//               onPressed: () {
//                 AppCubit.get(context).updateDataBase('archive', model['id']);
//               },
//               icon: Icon(Icons.archive)),
//           SizedBox(
//             width: 10,
//           )
//         ],
//       ),
//     );

Widget buildArticleItem(article, context) => InkWell(
      onTap: () {
        navigateTo(context, WebViewScreen(article['url']));
      },
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage('${article['urlToImage']}'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                height: 120,
                width: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Text(
                      '${article['title']}',
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    )),
                    Text(
                      '${article['publishedAt']}',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

Widget itemDividor() => Container(
      height: 1,
      width: double.infinity,
      color: Colors.grey[300],
    );

Widget defaultFormField({
  required String validateText,
  required String labelText,
  required TextEditingController controller,
  required IconData prefixIcon,
  var onTap,
  var onChange,
  IconData? suffexIcon,
  TextInputType? type,
  bool isPassword = false,
  IconData passwordIcon = Icons.remove_red_eye,
}) =>
    TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return validateText;
        }
        return null;
      },
      onTap: onTap,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(passwordIcon),
                onPressed: () {
                  isPassword = false;
                  passwordIcon = Icons.visibility_off;
                },
              )
            : Icon(suffexIcon),
      ),
      keyboardType: type,
      obscureText: isPassword,
      controller: controller,
      onChanged: onChange,
    );

void navigateTo(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ));
