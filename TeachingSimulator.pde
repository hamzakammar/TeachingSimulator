import g4p_controls.*;
PImage bubble,img,teacherImage,teachingImage;
PImage[] studentImages = new PImage[3];
String[] TeacherQuotes = new String[2];
Teacher teacher;
Classroom C;
String name;
String speaker[] = {"False","N/A","N/A"};
int speechCount = 0;
int numStudents = 8;
int randomStudent;
float rowdiness = 1;
String teachingText;
int time = 0;

int classIndex = 0;
int studentIndexes[][] = new int[3][4];

void setup(){
  size(1100,600);
  
  createGUI();
  C = new Classroom(numStudents,rowdiness);
  frameRate(60);
  
  TeacherQuotes[0] = "Why?";
  TeacherQuotes[1] = "Join Track!";
  name = "Mr. Snatty";  
  teacherImage = loadImage("ChemistryTeacher.png");
  teachingText = "O -- C -- O";
  teachingImage = loadImage("CO2.png");
  teacher = new Teacher(name, TeacherQuotes, subjectSelect.getSelectedText());
  
  img = loadImage("realTeacherTemplate.png");
  studentImages[0] = loadImage("student.png");
  studentImages[1] = loadImage("studentBehind1.png");
  studentImages[2] = loadImage("studentBehind2.png");
  bubble = loadImage("speech.png");
  for(int i=0; i<3; i++) {
    for(int j=0; j<4; j++) {
      studentIndexes[i][j] = int(random(0,3));
    }
  }  
  for (int i=0; i<numStudents; i++) {
    C.Students[i].assignDesk();
  }
       
  //Snatty.speak();
};

void draw(){
  int x,y;
  time++;
  C.drawClassroom();
  teacher.drawTeacher();
  for(int i=0; i<3; i++) {
    for(int j=0; j<4; j++) {
      C.Desks[j][i].drawDesk(studentIndexes[i][j]);
    }
  }
  
  for (int k=0; k<numStudents; k++) {
      try {
        //teaching 
        if (teacher.teaching == true && time%50 == 0 && k != randomStudent) {
          C.Students[k].rowdiness += 0.1;
          C.Students[k].understanding ++;
        }
        else if (time%100 == 0) 
          C.Students[k].rowdiness -= 0.1;
        C.Students[k].displayStats(k);
      }
      catch (Exception e) {
        println();
      }
    }
  
  if (random(1000)>995) {
    speechCount = 0;
    randomStudent = int(random(C.Students.length));
    
    if (random(10)>C.Students[randomStudent].rowdiness) {
    C.Students[randomStudent].askQuestion(classIndex);
  }
    else {
      classIndex = subjectSelect.getSelectedIndex();
      C.Students[randomStudent].causeDisturbance(classIndex);
    }
  }
  //dialogue
  if (speaker[0].equals("True")){
    speechCount++;
    if(speaker[2].equals("Teacher")){
      x = 330;
      y = 100;
    }
    else {
      x = int(C.Students[randomStudent].D.pos.x)+60;
      y = int(C.Students[randomStudent].D.pos.y)-70;
    }
    if (speechCount >= 200){
       speaker[0] = "False"; 
       speaker[2] = "N/A";
       speechCount = 0;
       randomStudent = 13;
     }
    image(bubble,x,y,150,75);
    textSize(8);
    text(speaker[1], x+20,y+30);
   }
}

void rest() {
  C = new Classroom(numStudents, rowdiness);
  for (int i=0; i<numStudents; i++) {
    C.Students[i].assignDesk();
  }
  time = 0;
  teacher.teaching = false;
}
