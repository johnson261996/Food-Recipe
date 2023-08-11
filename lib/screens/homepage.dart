import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipe_book/screens/audio_playerpage.dart';
import 'package:receipe_book/screens/item_detailpage.dart';
import 'package:receipe_book/screens/search_screen.dart';
import '../bloc/food_bloc.dart';
import '../model/food_model.dart';
import '../widgets/appbar_tiitle.dart';
import '../widgets/category_tile.dart';
import '../widgets/recipe_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FoodBloc _newsBloc = FoodBloc();

  @override
  void initState() {
    _newsBloc.add(GetFoodList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white, ~dynamic
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: AppBarTitle(),

        // Music page
        actions: [
          IconButton(
              icon: Icon(
                Icons.music_note,
                color: Colors.black,
              ),
              onPressed: () =>  Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AudioPlayerWidget())),
          )
        ],
      ),
      body: BlocProvider(
        create: (_) => _newsBloc,
        child: BlocListener<FoodBloc, FoodState>(
          listener: (context, state) {
            if (state is FoodError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<FoodBloc, FoodState>(
            builder: (context, state) {
              if (state is FoodInitial) {
                return _buildLoading();
              } else if (state is FoodLoading) {
                return _buildLoading();
              } else if (state is FoodLoaded) {
                return _buildContent(state.foodModel);
              } else if (state is FoodError) {
                return Container();
              } else {
                return Container();
              }
              // return _buildContent();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLoading() => Center(child: CircularProgressIndicator());

  Widget _buildInputField() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GestureDetector(
        onTap: () => SearchScreen.show(context),
        child: Container(
          height: 45.0,
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: Colors.grey, width: 1.5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.search, color: Colors.grey[500]),
              SizedBox(width: 8.0),
              Text(
                'Search by food ingredient',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 16.0,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildContent(FoodModel model) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInputField(),
          Container(
            height: 100.0,
            margin: EdgeInsets.only(left: 12.0, top: 10.0),
            child: ListView.builder(
              physics: ScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
              itemCount: model.meals!.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return CategoryTile(
                  imageUrl: model.meals![index].strMealThumb!,
                  title: model.meals![index].strMeal!,
                );
              },
            ),
          ),
          SizedBox(height: 16.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              "Today's Special Dishes",
              style: TextStyle(
                fontSize: 18.0,
                //color: Colors.black, ~dynamic
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 25.0),
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
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FullDetail(index: index, light_mode: 1,item_data:model),));
                  },
                  child: RecipeTile(
                    imageUrl: model.meals![index].strMealThumb!,
                    recipeName: model.meals![index].strMeal!,
                    recipeSource: model.meals?[index].strSource ?? "source",
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

}
