
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practical_app/pages/home/bloc/category_bloc.dart';
import 'package:practical_app/pages/home/bloc/category_state.dart';
import 'package:practical_app/pages/home/category_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

@override
Widget build(BuildContext context) {
  return BlocBuilder<CategoryBloc, CategoryState>(
    builder: (context, state) {
      if (state is CategoryLoading) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text('ESP TILES', style: TextStyle(color: Colors.white),),
            actions: [
              IconButton(
                icon: Icon(Icons.search,color: Colors.white,),
                onPressed: () {
                  // Implement search functionality
                },
              ),
              IconButton(
                icon: Icon(Icons.filter_list,color: Colors.white,),
                onPressed: () {
                  // Implement filter functionality
                },
              ),
            ],
          ),
          body: Center(child: CircularProgressIndicator()),
        );
      } else if (state is CategoryLoaded) {
        return DefaultTabController(
          length: state.categories.length,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Text('ESP TILES', style: TextStyle(color: Colors.white),),
              actions: [
                IconButton(
                  icon: Icon(Icons.search,color: Colors.white,),
                  onPressed: () {
                    // Implement search functionality
                  },
                ),
                IconButton(
                  icon: Icon(Icons.filter_list,color: Colors.white,),
                  onPressed: () {
                    // Implement filter functionality
                  },
                ),
              ],
              bottom: TabBar(
                isScrollable: true,
                labelColor: Colors.white,
                indicatorColor: Colors.white,
                tabs: state.categories.map<Widget>((category) {
                  return Tab(text: category['Name']);
                }).toList(),
              ),
            ),
            body: TabBarView(
              children: state.categories.map<Widget>((category) {
                return CategoryView(category: category);
              }).toList(),
            ),
          ),
        );
      } else if (state is CategoryError) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Tile Categories'),
          ),
          body: Center(child: Text('Failed to load categories: ${state.message}')),
        );
      } else {
        return Scaffold(
          appBar: AppBar(
            title: Text('Tile Categories'),
          ),
          body: Center(child: Text('Unknown state')),
        );
      }
    },
  );
}
}



