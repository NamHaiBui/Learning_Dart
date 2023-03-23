void main(List<String> args) {}
// bool doTypesMatch(Object a, Object b){
//   return a.runtimeType == b.runtimeType;
// }
bool doTypesMatch<T1, T2>(T1 a, T2 b) {
  return T1 == T2;
}
