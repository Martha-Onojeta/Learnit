import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/entities/user.dart';
import 'package:learning_app/common/routes/names.dart';
import 'package:learning_app/common/values/app_color.dart';
import 'package:learning_app/pages/home_page/bloc/home_page_bloc.dart';
import 'package:learning_app/pages/home_page/home_controller.dart';
import 'package:learning_app/pages/home_page/widget/home_pages_widget.dart';
import 'package:learning_app/pages/sign_in/widgets/sign_in_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //late HomeController _homeController;
  late UserItem userProfile;

  @override
  void initState() {
    super.initState();
    // _homeController = HomeController(context: context);
    // _homeController.init();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    userProfile = HomeController(context: context).userProfile!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(userProfile!.avatar!.toString()),
      body: BlocBuilder<HomePageBloc, HomePageState>(
        builder: (context, state) {
          if (state.courseItem.isEmpty) {
            HomeController(context: context).init();
            print('.......course is empty');
          } else {
            print('.......State.course is not empty');
          }
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
                    '${userProfile!.name!}',
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
                        childCount: state.courseItem.length,
                        (context, index) => GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  AppRoutes.COURSE_DETAIL,
                                  arguments: {
                                    "id": state.courseItem.elementAt(index).id
                                  });
                            },
                            child: courseGrid(state.courseItem[index]))),
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
