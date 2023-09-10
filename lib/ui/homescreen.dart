// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:e_commerce_comic/cubit/filtergenre/filtergenre_cubit.dart';
import 'package:e_commerce_comic/cubit/getcomic/getcomic_cubit.dart';
import 'package:e_commerce_comic/models/genre_category_model.dart';
import 'package:e_commerce_comic/routers/app_pages.dart';
import 'package:e_commerce_comic/ui/widgets/cardItem.dart';
import 'package:e_commerce_comic/ui/widgets/caroselslider.dart';
import 'package:e_commerce_comic/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<GenreCategoryModel> data = Constant.filter
        .map(
          (e) => GenreCategoryModel.fromJson(e),
        )
        .toList();
    return Scaffold(
      backgroundColor: kContainerColor,
      body: SafeArea(
          child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            height: MediaQuery.of(context).size.height * 0.1,
            width: double.infinity,
            child: SizedBox(
              child: TextFormField(
                onChanged: (value) {
                  context.read<GetcomicCubit>().getSearch(value.toUpperCase());
                  setState(() {});
                },
                decoration: InputDecoration(
                  focusColor: Colors.amber[900],
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                      borderSide: BorderSide.none),
                  hintText: 'Search',
                  hintStyle: titleTextStyle.copyWith(
                      fontWeight: light, color: kSecondaryTwoColor),
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              child: SingleChildScrollView(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Column(
                    children: [
                      const CaroselSlider(),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                if (index == 0) {
                                  context
                                      .read<FiltergenreCubit>()
                                      .changeIndex(index);
                                  context.read<GetcomicCubit>().get();
                                } else {
                                  context
                                      .read<FiltergenreCubit>()
                                      .changeIndex(index);
                                  context
                                      .read<GetcomicCubit>()
                                      .getFilter(data[index].value);
                                }
                              },
                              child: BlocBuilder<FiltergenreCubit, int>(
                                builder: (context, state) {
                                  return Container(
                                    margin: const EdgeInsets.only(right: 16),
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: state == index
                                            ? kPrimaryColor
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Center(
                                        child: Text(
                                      data[index].name,
                                      style: state == index
                                          ? whiteTextStyle
                                          : blueTextStyle,
                                    )),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 16),
                        height: MediaQuery.of(context).size.height * 0.44,
                        child: BlocBuilder<GetcomicCubit, GetcomicState>(
                          builder: (context, state) {
                            return state.when(
                              initial: () => const Center(
                                child: Text("no data"),
                              ),
                              loading: () => const Center(
                                child: CircularProgressIndicator(),
                              ),
                              loaded: (model, page, isNext) {
                                if (model.isEmpty) {
                                  return const Center(
                                    child: Text("No Comics"),
                                  );
                                }
                                return GridView.builder(
                                  padding: EdgeInsets.zero,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 1.0 / 1.4,
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 8,
                                    crossAxisSpacing: 8,
                                  ),
                                  itemCount: model.length,
                                  shrinkWrap: true,
                                  physics: const ScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final item = model[index];
                                    return GestureDetector(onTap: (){
                                      context.push(Routes.detail,extra: item);
                                    },child: CardItem(data: item));
                                  },
                                );
                              },
                              error: (error) => Center(
                                child: Text(error),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
