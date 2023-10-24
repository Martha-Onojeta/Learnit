import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/widgets/base_text_widget.dart';
import 'package:learning_app/pages/course/course_detail/bloc/course_detail_bloc.dart';
import 'package:learning_app/pages/course/course_detail/course_detail_controller.dart';
import 'package:learning_app/pages/course/widgets/course_details_widget.dart';

class CourseDetailPage extends StatefulWidget {
  const CourseDetailPage({super.key});

  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage> {
  // late var id;

  late CourseDetailController _courseDetailController;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _courseDetailController = CourseDetailController(context: context);
    _courseDetailController.init();
    // id = ModalRoute.of(context)!.settings.arguments as Map;
    // print(id.values.toString());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseDetailBloc, CourseDetailState>(
      builder: (context, state) {
        return state.courseItem == null
            ? const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.blue,
                ),
              )
            : Scaffold(
                backgroundColor: Colors.white,
                appBar: courseDetailAppBar(),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 25.w, vertical: 12.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            thunbnail(state.courseItem!.thumbnail.toString()),
                            SizedBox(
                              height: 15.h,
                            ),
                            menuView(),
                            SizedBox(
                              height: 15.h,
                            ),
                            reusableText('Course Description'),
                            SizedBox(
                              height: 15.h,
                            ),
                            decriptionText(
                                state.courseItem!.description.toString()),
                            SizedBox(
                              height: 30.h,
                            ),
                            GestureDetector(
                                onTap: () {
                                  _courseDetailController
                                      .goBuy(state.courseItem!.id);
                                },
                                child: goBuyButton('Go Buy')),
                            SizedBox(
                              height: 30.h,
                            ),
                            reusableText('The Course Includes',
                                fontSize: 14.sp),
                            courseSummaryView(context, state),
                            SizedBox(
                              height: 20.h,
                            ),
                            reusableText('Lesson List', fontSize: 14.sp),
                            SizedBox(
                              height: 20.h,
                            ),
                            courseLessonList(state),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
      },
    );
  }
}
