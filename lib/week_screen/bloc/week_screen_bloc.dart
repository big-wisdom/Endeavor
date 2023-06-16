import 'package:bloc/bloc.dart';
import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';

part 'week_screen_event.dart';
part 'week_screen_state.dart';

class WeekScreenBloc extends Bloc<WeekScreenEvent, WeekScreenState> {
  DateTime selectedDay;
  DataRepository _dataRepository;

  WeekScreenBloc(
      {required DataRepository dataRepository, required this.selectedDay})
      : _dataRepository = dataRepository,
        super(WeekScreenInitial()) {
    on<WeekScreenEvent>((event, emit) {
      throw UnimplementedError();
    });
  }

  List<DateTime> get monthRange {
    List<DateTime> dates = [];

    // Start at 30 days ago
    DateTime date = selectedDay.subtract(const Duration(days: 30));

    // Loop until 30 days from now
    while (date.isBefore(selectedDay.add(const Duration(days: 30)))) {
      dates.add(DateTime.utc(date.year, date.month, date.day));
      date = date.add(const Duration(days: 1));
    }

    return dates;
  }
}
