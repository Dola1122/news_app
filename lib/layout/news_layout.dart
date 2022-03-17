import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/modules/search/search_screen.dart';

import '../shared/components/components.dart';

class NewsLayoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit, NewsAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        NewsAppCubit cubit = NewsAppCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              titleSpacing: 20,
              title: Text('News App'),
              actions: [
                IconButton(
                    onPressed: () {
                      AppCubit.get(context).changeAppMode();
                    },
                    icon: Icon(Icons.brightness_4_outlined)),
                IconButton(onPressed: () {
                  navigateTo(context,SearchScreen());
                }, icon: Icon(Icons.search)),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                    label: 'Business', icon: Icon(Icons.business)),
                BottomNavigationBarItem(
                    label: 'Sports', icon: Icon(Icons.sports_basketball)),
                BottomNavigationBarItem(
                    label: 'Science', icon: Icon(Icons.science)),
              ],
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeScreen(index);
              },
            ),
            body: cubit.screens[cubit.currentIndex]);
      },
    );
  }
}
