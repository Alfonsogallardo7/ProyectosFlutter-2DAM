import 'package:flutter/material.dart';
import 'package:flutter_miarmapp/ui/screens/new_post_screen.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left:10.0),
              child: Text(
                'MiarmaApp',
                style: TextStyle(fontSize: 25, fontFamily: 'Billabong', fontWeight: FontWeight.w500),
              ),
            )),
        Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                              onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const NewPostScreen()));},
                              child: Icon(Icons.add_box_outlined)
                            ), 
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.send),
                )
              ],
            ))
      ]),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
