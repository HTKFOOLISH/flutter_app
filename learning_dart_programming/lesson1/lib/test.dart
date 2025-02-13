void main(){
  // Map userData = userMap(name: 'K Dev', age: 22, gender: 'M', userClass: 12);
  Map userData = userMap('K Dev', 22, 'M', 12);
  print(userData.values.toList().join(', '));
}

Map userMap(String name, int age, String gender, int userClass){
  return {
    'name' : name,
    'age' : age,
    'gender' : gender,
    'userClass' : userClass
  };
}