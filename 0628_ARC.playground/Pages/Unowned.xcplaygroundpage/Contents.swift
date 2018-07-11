//: [Previous](@previous)
//: - - -
//: # Unowned
//: - - -

class Teacher {
  let name: String
  var student: Student?
  init(name: String) {
    self.name = name
  }
  deinit {
    print("Teacher is being deinitialized")
  }
}

class Student {
  let name: String
  //  let teacher: Teacher
  unowned let teacher: Teacher
  init(name: String, teacher: Teacher) {
    self.name = name
    self.teacher = teacher
  }
  deinit {
    print("Student is being deinitialized")
  }
}

var teacher: Teacher? = Teacher(name: "쌤")
var student: Student? = Student(name: "학생", teacher: teacher!)
teacher?.student = student


print("\n---------- [ teacher release ] ----------\n")
teacher = nil


print("\n---------- [ student release ] ----------\n")
//print(student?.teacher)
student = nil



//: [Next](@next)
