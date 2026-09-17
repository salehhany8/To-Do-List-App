class Validators {
  static validateEmail(String? value){
    if (value == null || value.trim().isEmpty) {
      return "this field is Required";
    }
    if (!value!.contains("@") || !value!.contains(".com")) {
      return "not valid Email format";
    }
    return null;
  }

  static validatePassword(String? value){
    if (value == null || value.trim().isEmpty) {
      return "this field is Required";
    }
    if (value!.length<8) {
      return "Password must be at least 8 characters";
    }
    return null;
  }

  static validateTskName(String? value){
    if (value == null || value.trim().isEmpty) {
      return "You can't make empty task name";
    }
    if (value!.length<4) {
      return "task name must at least 4 characters";
    }
    return null;
  }

}