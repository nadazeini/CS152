function Student(firstName, lastName, studentID) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.studentID = studentID;
    this.display = function () {
        console.log(this.firstName + " " + this.lastName + " " + this.studentID);
    }
}

var student1 = new Student("Michael", "Smith", 134111);
var student2 = new Student("Taylor", "Swift", 1452345);
var student3 = new Student("Will", "Bob", 7456734);
student3.graduated = true;
var stArray = [];

var julia = {
    firstName: "julia", lastName: "andrews", studentID: 7456731, __proto__: new Student
};
stArray = new Array(student1, student2, student3, julia);

for (let i = 0; i < stArray.length; i++) {
    stArray[i].display();
}



