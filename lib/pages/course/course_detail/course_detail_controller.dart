import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:learning_app/common/apis/course_api.dart';
import 'package:learning_app/common/entities/course.dart';
import 'package:learning_app/common/widgets/toast.dart';
import 'package:learning_app/pages/course/course_detail/bloc/course_detail_bloc.dart';

class CourseDetailController {
  final BuildContext context;

  CourseDetailController({required this.context});
  void init() async {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    asyncLoadAllData(args['id']);
  }

  asyncLoadAllData(int? id) async {
    CourseRequestEntity courseRequestEntity = CourseRequestEntity();
    courseRequestEntity.id = id;
    var result = await CourseAPI.courseDetail(params: courseRequestEntity);
    if (result.code == 200) {
      if (context.mounted) {
        context.read<CourseDetailBloc>().add(TriggerCourseDetail(result.data!));
      } else {
        print('...................context is not available...........');
      }
    } else {
      toastInfo(msg: 'Something went wrong');
      print('...............Error code ${result.code}.................');
    }
  }

  Future<void> goBuy(int? id) async {
    EasyLoading.show(
        indicator: const CircularProgressIndicator(),
        maskType: EasyLoadingMaskType.clear,
        dismissOnTap: true);
    CourseRequestEntity courseRequestEntity = CourseRequestEntity();
    courseRequestEntity.id = id;

    var result = await CourseAPI.coursePay(params: courseRequestEntity);
    EasyLoading.dismiss();
    if (result.code == 200) {
      var url = Uri.decodeFull(result.data!);
      print('-----my stripe url is $url-----');
    } else {
      print('-----failed payment----');
    }
  }
}
