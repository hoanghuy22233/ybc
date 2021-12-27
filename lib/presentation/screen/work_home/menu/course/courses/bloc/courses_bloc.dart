import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:ybc/model/repo/home_repository.dart';
import 'package:ybc/presentation/screen/work_home/menu/course/courses/bloc/courses_event.dart';
import 'package:ybc/presentation/screen/work_home/menu/course/courses/bloc/courses_state.dart';
import 'package:ybc/utils/dio/dio_error_util.dart';
import 'package:ybc/utils/dio/dio_status.dart';

class CoursesBloc extends Bloc<CoursesEvent, CoursesState> {
  final HomeRepository homeRepository;

  CoursesBloc({@required this.homeRepository});

  @override
  CoursesState get initialState => CoursesState.empty();

  @override
  Stream<CoursesState> mapEventToState(CoursesEvent event) async* {
    if (event is LoadCourses) {
      yield* _mapLoadCoursesToState(event.id, event.name, event.create);
    } else if (event is RefreshCourses) {
      yield CoursesState.loading(state.copyWith(
          status: DioStatus(
        code: DioStatus.API_PROGRESS,
      )));
      yield* _mapLoadCoursesToState(event.id, event.name, event.create);
    }
  }

  Stream<CoursesState> _mapLoadCoursesToState(
      int id, String name, String create) async* {
    try {
      final response = await homeRepository.getCourser(
          categoryId: id ?? null, name: name ?? '', create: create ?? '');
      yield CoursesState.success(state.update(
          courses: response.data.data,
          status:
              DioStatus(code: DioStatus.API_SUCCESS, message: response.msg)));
    } catch (e) {
      yield CoursesState.failure(
          state.update(status: DioErrorUtil.handleError(e)));
    }
  }

// Stream<ImagesState> _mapRemoveImagesToState(int id) async* {
//   try {
//     final response = await userRepository.removePost(id: id);
//     yield ImagesState.success(state.update(
//         post: response.data,
//         status: DioStatus(
//             code: DioStatus.API_SUCCESS, message: response.message)));
//   } catch (e) {
//     yield ImagesState.failure(
//         state.update(status: DioErrorUtil.handleError(e)));
//   }
// }
}
