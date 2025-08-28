import 'package:di_state_managment/componnet/extension.dart';
import 'package:di_state_managment/componnet/text_style.dart';
import 'package:di_state_managment/data/repo/home_repo.dart';
import 'package:di_state_managment/gen/assets.gen.dart';
import 'package:di_state_managment/resource/app_colors.dart';
import 'package:di_state_managment/resource/dimens.dart';
import 'package:di_state_managment/resource/strings.dart';
import 'package:di_state_managment/screens/home/bloc/home_bloc.dart';
import 'package:di_state_managment/screens/product_list/product_list_screen.dart';
import 'package:di_state_managment/widgets/app_slider.dart';
import 'package:di_state_managment/widgets/cat_widget.dart';
import 'package:di_state_managment/widgets/product_items.dart';
import 'package:di_state_managment/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final homeBloc = HomeBloc(homeReopsitory);
        homeBloc.add(HomeInIt());
        return homeBloc;
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is HomeLoaded) {
                  return Column(
                    children: [
                      SearchBtn(onTap: () {}),
                      AppSlider(imgList: state.home.sliders),

                      //cat
                      SizedBox(
                        height: 150,
                        width: double.infinity,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.home.categories.length,
                          reverse: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CatWidget(
                                color: index.isEven
                                    ? LightAppColors.catAiColor
                                    : LightAppColors.catClassicColor,
                                iconPath: state.home.categories[index].image,
                                title: state.home.categories[index].title,
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductListScreen(
                                      param: state.home.categories[index].id,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Dimens.large.height,
                      SizedBox(
                        height: 300,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          reverse: true,
                          child: Row(
                            children: [
                              SizedBox(
                                height: 300,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  physics: ClampingScrollPhysics(),
                                  itemCount: state.home.amazingProducts.length, 
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    
                                    return ProductItem(
                                  product: state.home.amazingProducts[index]
                                  );
                                  },
                                ),
                              ),
                              VerticalText(amazeText: AppStrings.wonder),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.sizeOf(context).height / 6.7,
                        width: MediaQuery.sizeOf(context).width / 1.2,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(Dimens.medium),
                            bottomRight: Radius.circular(Dimens.medium),
                          ),
                        ),
                        child: Image.asset(
                          Assets.png.unnamed.path,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Dimens.large.height,
                      SizedBox(
                        height: 300,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          reverse: true,
                          child: Row(
                            children: [
                              SizedBox(
                                height: 300,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  physics: ClampingScrollPhysics(),
                                  itemCount:
                                      state.home.mostSellerProducts.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    
                                    return ProductItem(
                                      product: state
                                        .home
                                        .mostSellerProducts[index]
                                    
                                  );
                                  },
                                ),
                              ),
                              VerticalText(amazeText: AppStrings.bestSelled),
                            ],
                          ),
                        ),
                      ),
                      Dimens.large.height,
                      SizedBox(
                        height: 300,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          reverse: true,
                          child: Row(
                            children: [
                              SizedBox(
                                height: 300,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  physics: ClampingScrollPhysics(),
                                  itemCount: state.home.newextProducts.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    
                                    return ProductItem(
                                      product: state.home.newextProducts[index]
                                                                
                                  );
                                  },
                                ),
                              ),
                              VerticalText(amazeText: AppStrings.newest),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                } else if (state is HomeError) {
                  return Text("Error");
                } else {
                  throw Exception('invalid state');
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

class VerticalText extends StatelessWidget {
  const VerticalText({super.key, required this.amazeText});

  final String amazeText;
  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: -1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.rotate(
                angle: 1.5,
                child: SvgPicture.asset(Assets.svg.arrowLeft),
              ),
              Dimens.medium.width,
              Text(AppStrings.seeAll, style: LightAppTextStyle.seeMore),
            ],
          ),
          Dimens.medium.height,
          Text(amazeText, style: LightAppTextStyle.wonderTextStyle),
          Dimens.medium.height,
        ],
      ),
    );
  }
}
