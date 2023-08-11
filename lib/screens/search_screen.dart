import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipe_book/model/food_model.dart';

import '../bloc/food_bloc.dart';
import '../searchbloc/search_bloc.dart';
import '../widgets/recipe_tile.dart';
import 'item_detailpage.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  static Future<void> show(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SearchScreen(),
      ),
    );
  }
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();
  SearchBloc new_block = SearchBloc();


  @override
  void initState() {

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(
          //color: Colors.black,
        ),
        title: Text(
          'Search',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: _buildChild(context),
        ),
      ),
    );
  }

  Widget _buildChild(BuildContext context) {
    return BlocProvider(
      create: (_) => new_block,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: Colors.grey, width: 1.5),
            ),
            child: TextField(
              cursorColor: Colors.red[900],
              controller: _searchController,
              onSubmitted: (value) {
                new_block.add(SearchFoodList(value));
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                hintText: "Enter ingredient",
                hintStyle: TextStyle(
                  color: Colors.grey[600],
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),

          BlocListener<SearchBloc, SearchState>(
            listener: (context, state) {
              if (state is SearchError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message!),
                  ),
                );
              }
            },
            child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state is SearchInitial) {
                  return Container();
                } else if (state is SearchLoading) {
                  return _buildLoading();
                } else if (state is SearchLoaded) {
                  if(state.searchModel.meals == null)
                     return _buildContainer();
                  else
                    return _buildContent(state.searchModel);
                } else if (state is SearchError) {
                  return Container();
                } else {
                  return Container();
                }

              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoading() => Center(child: CircularProgressIndicator());

  Widget _buildContainer() => Center(child: Text("No Results"));

  Widget _buildContent(FoodModel model){
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 12.0, vertical: 25.0),
      child: GridView.builder(
        physics: ScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        padding: EdgeInsets.all(4.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        shrinkWrap: true,
        itemCount: model.meals!.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                      FullDetail(index: index,
                          light_mode: 1,
                          item_data: model),));
            },
            child: RecipeTile(
              imageUrl:  model.meals![index].strMealThumb!,
              recipeName: model.meals![index].strMeal!,
              recipeSource: model.meals?[index].strSource ??
                  "source",
            ),
          );
        },
      ),
    );
  }
}