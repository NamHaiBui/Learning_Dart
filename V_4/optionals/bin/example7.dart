void main(List<String> args) {
  try {
    final String? firstName = null;
    // Force unwrapping: No longer care if the varaible is optional or not
    print(
        firstName!); // You are taking a risk to crash the program in case the variable is null
  } catch (error) {
    print(error);
  }
}
