function Student(firstName, lastName, studentID){
    this.firstName = firstName;
    this.lastName = lastName;
    this.studentID = studentID;
    this.graduated = "yes";
    this.display = function(){
        console.log(this.firstName);
        console.log(this.lastName);
        console.log(this.studentID);
    }
}

var student1 = new Student("Nada","Zeini",8765);
var student2 = new Student("Talal","Yoy",863765);
var arr = [student1,student2];

student2.display();
student1.graduated = "grad";
console.log(student1.graduated);

var student3 = {firstName: "will", lastName: "smith", studentID: 876876 , __proto__:new Student};
Student.prototype.graduated = "no"
student3.display();

console.log(student1.graduated);
console.log(student2.graduated);
console.log(student3.graduated);




    