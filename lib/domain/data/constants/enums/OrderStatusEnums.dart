enum OrderStatusEnums {
  NEW,
  MEASURE_PLANNING,
  MEASURE_ASSIGNED,
  MEASURE_ACCEPTED,
  MEASURE_STARTED,
  MEASURE_MEETING_STARTED,
  MEASURE_FINISHED,
  MECHANIC_PLANNING,
  MECHANIC_ASSIGNED,
  MECHANIC_ACCEPTED,
  MECHANIC_STARTED,
  MECHANIC_BEGIN_START_ADMINISTRATION,
  MECHANIC_END_START_ADMINISTRATION,
  MECHANIC_BEGIN_END_ADMINISTRATION,
  MECHANIC_FINISHED,
  TRANSPORTATION_PLANNING,
  TRANSPORTATION_ARRANGED,
  TRANSPORTATION_ACCEPTED,
  TRANSPORTATION_STARTED,
  DELIVERY_STARTED,
  DELIVERY_FINISHED,
  DONE
}

extension OrderStatusExtension on OrderStatusEnums {
  String parseToString() => toString().split('.').last;
}
