/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

public void button1_click1(GButton source, GEvent event) { //_CODE_:button1:605786:
  speechCount = 0;

  Jeff.causeDisturbance(1);
  //delay(5000);
} //_CODE_:button1:605786:

public void button2_click1(GButton source, GEvent event) { //_CODE_:button2:472636:
  speechCount = 0;

   Jeff.askQuestion(1);
} //_CODE_:button2:472636:

public void button3_click1(GButton source, GEvent event) { //_CODE_:button3:760748:
  speechCount = 0;

  Snatty.speak();
} //_CODE_:button3:760748:

synchronized public void win_draw1(PApplet appc, GWinData data) { //_CODE_:window1:872767:
  appc.background(230);
} //_CODE_:window1:872767:

public void subjectSelectChanged(GDropList source, GEvent event) { //_CODE_:subjectSelect:714673:
  if (subjectSelect.getSelectedText().equals("Math")){
    TeacherQuotes[0] = "That's Beautiful";
    TeacherQuotes[1] = "Taylor Swift";
    name = "Mr. Dasilva";
    teachingText = "y = mx + b";
    teacherImage = loadImage("DaSilva.png");
    teachingImage = null;


   }
  else if (subjectSelect.getSelectedText().equals("Chemistry")){
    TeacherQuotes[0] = "Why?";
    TeacherQuotes[1] = "Join Track!";
    name = "Mr. Snatty";  
    teacherImage = loadImage("ChemistryTeacher.png");
    teachingText = "O -- C -- O";
    teachingImage = null;

}
  
  else if (subjectSelect.getSelectedText().equals("Computer Science")){
    TeacherQuotes[0] = "Open up Processing";
    TeacherQuotes[1] = "";
    name = "Mr. Schatmann";
    teacherImage = loadImage("Schatmann.png");
    teachingText = "Mandelbrot Set:";
    teachingImage = loadImage("MandelbrotSet.png");
  }
  else if (subjectSelect.getSelectedText().equals("English")){
    TeacherQuotes[0] = "";
    TeacherQuotes[1] = "";
    name = "Mr. Wiebe";  
    teacherImage = loadImage("speech.png");
  }
  else{
    TeacherQuotes[0] = "Feel the rain on your skin";
    TeacherQuotes[1] = "Alllllrighhht";
    name = "Mr. Vrolyk";  
    teacherImage = loadImage("speech.png");

  }
  teacher = new Teacher(name, TeacherQuotes, subjectSelect.getSelectedText());

  TeacherIntro.setText(("You will be playing as "+ teacher.name));
} //_CODE_:subjectSelect:714673:

public void crazinessChanged(GSlider source, GEvent event) { //_CODE_:craziness:374725:
  String crazinessText = "That's cr";
  for (int i = 0; i < craziness.getValueI(); i++){
    crazinessText += "a";
  }
  crazinessText += "zy";
  crazinessLabel.setText(crazinessText);
} //_CODE_:craziness:374725:

public void setNumStudents(GSlider source, GEvent event) { //_CODE_:NUMStudents:804576:
  numStudents = NUMStudents.getValueI();
} //_CODE_:NUMStudents:804576:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  button1 = new GButton(this, 103, 31, 80, 30);
  button1.setText("Disturbance");
  button1.addEventHandler(this, "button1_click1");
  button2 = new GButton(this, 101, 81, 80, 30);
  button2.setText("Question");
  button2.addEventHandler(this, "button2_click1");
  button3 = new GButton(this, 102, 129, 80, 30);
  button3.setText("Answer");
  button3.addEventHandler(this, "button3_click1");
  window1 = GWindow.getWindow(this, "Window title", 0, 0, 240, 400, JAVA2D);
  window1.noLoop();
  window1.setActionOnClose(G4P.KEEP_OPEN);
  window1.addDrawHandler(this, "win_draw1");
  label1 = new GLabel(window1, 35, 7, 163, 20);
  label1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label1.setText("TEACHER SIMULATORl");
  label1.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  label1.setOpaque(false);
  subjectSelect = new GDropList(window1, 40, 83, 145, 120, 5, 10);
  subjectSelect.setItems(loadStrings("list_714673"), 0);
  subjectSelect.addEventHandler(this, "subjectSelectChanged");
  label2 = new GLabel(window1, 40, 63, 145, 20);
  label2.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label2.setText("Choose Your Subject");
  label2.setOpaque(false);
  craziness = new GSlider(window1, 40, 156, 145, 40, 10.0);
  craziness.setShowValue(true);
  craziness.setShowLimits(true);
  craziness.setLimits(1.0, 0.0, 10.0);
  craziness.setNumberFormat(G4P.DECIMAL, 2);
  craziness.setOpaque(false);
  craziness.addEventHandler(this, "crazinessChanged");
  label3 = new GLabel(window1, 40, 135, 145, 20);
  label3.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label3.setText("How Crazy is your Class?");
  label3.setOpaque(false);
  TeacherIntro = new GLabel(window1, 1, 103, 241, 20);
  TeacherIntro.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  TeacherIntro.setOpaque(false);
  crazinessLabel = new GLabel(window1, 0, 196, 240, 20);
  crazinessLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  crazinessLabel.setOpaque(false);
  NUMStudents = new GSlider(window1, 40, 239, 145, 40, 10.0);
  NUMStudents.setShowLimits(true);
  NUMStudents.setLimits(8, 1, 12);
  NUMStudents.setNumberFormat(G4P.INTEGER, 0);
  NUMStudents.setOpaque(false);
  NUMStudents.addEventHandler(this, "setNumStudents");
  label4 = new GLabel(window1, 40, 219, 145, 20);
  label4.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label4.setText("How many Students?");
  label4.setOpaque(false);
  window1.loop();
}

// Variable declarations 
// autogenerated do not edit
GButton button1; 
GButton button2; 
GButton button3; 
GWindow window1;
GLabel label1; 
GDropList subjectSelect; 
GLabel label2; 
GSlider craziness; 
GLabel label3; 
GLabel TeacherIntro; 
GLabel crazinessLabel; 
GSlider NUMStudents; 
GLabel label4; 
