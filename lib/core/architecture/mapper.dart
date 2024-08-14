abstract class EntityMapper<T> {
  Map<String, dynamic>? toMap(T entity);
  T fromMap(dynamic map);
}
