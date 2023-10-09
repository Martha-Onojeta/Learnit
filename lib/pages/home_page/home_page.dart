import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/values/app_color.dart';
import 'package:learning_app/pages/home_page/bloc/home_page_bloc.dart';
import 'package:learning_app/pages/home_page/widget/home_pages_widget.dart';
import 'package:learning_app/pages/sign_in/widgets/sign_in_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: BlocBuilder<HomePageBloc, HomePageState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 25.w, vertical: 0),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: homePageText('Hello!',
                      color: AppColors.primaryThirdElementText, top: 20),
                ),
                SliverToBoxAdapter(
                  child: homePageText(
                    'Startech',
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.only(top: 20.h),
                ),
                SliverToBoxAdapter(
                  child: searchView(),
                ),
                SliverToBoxAdapter(
                  child: slidersView(context, state),
                ),
                SliverToBoxAdapter(
                  child: menuView(),
                ),
                SliverPadding(
                  padding:
                      EdgeInsets.symmetric(vertical: 18.h, horizontal: 0.w),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 15,
                            childAspectRatio: 1.6),
                    delegate: SliverChildBuilderDelegate(
                        childCount: 4,
                        (context, index) =>
                            GestureDetector(onTap: () {}, child: courseGrid())),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
