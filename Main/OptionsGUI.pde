// Variable declarations 
// autogenerated do not edit

import java.awt.Font;
import java.awt.*;

GLabel label1; 
GTextField textfield1; 
GLabel label3; 
GTextField textfield3; 
GCheckbox checkbox1; 
GLabel label4; 
GToggleGroup togGroup1; 
GOption noBack_radio; 
GOption black; 
GOption white; 
GOption strobe; 
GOption disco; 
GLabel label5; 
GCheckbox checkbox7; 
GCheckbox checkbox8; 
GCheckbox checkbox9; 
GCheckbox checkbox10;
GButton actButton;



void drawRectangle(){
  if(!optionBool)
  {
     fill(233); 
     rect(w-425, h-520, 400, 500); 
     noFill();
  }
  
}
/*
public void textfield1_change1(GTextField source, GEvent event) { //_CODE_:textfield1:910149:
     println("textfield3 - GTextField >> GEvent." + event + " @ " + millis());
     println("Integer " + textfield1.getText());
    if (source == textfield1  &&  event == GEvent.CHANGED && textfield1.getText() != "" && Integer.parseInt(textfield1.getText()) > 10) {  //This is a work-around for the double button clicked effect
      println("HERE");
      bSensitive = Integer.parseInt(textfield2.getText());
   }
} //_CODE_:textfield1:910149:

public void textfield2_change1(GTextField source, GEvent event) { //_CODE_:textfield2:852425:
  println("textfield3 - GTextField >> GEvent." + event + " @ " + millis());
} //_CODE_:textfield2:852425:

public void textfield3_change1(GTextField source, GEvent event) { //_CODE_:textfield3:283395:
  println("textfield3 - GTextField >> GEvent." + event + " @ " + millis());
} //_CODE_:textfield3:283395:
*/
public void checkbox1_clicked1(GCheckbox source, GEvent event) { //_CODE_:checkbox1:856806:
   if(fillTrue)
    {
      fillTrue = false;
    }
    else
    {
      fillTrue = true;
    }
} //_CODE_:checkbox1:856806:

public void noBackg_clicked1(GOption source, GEvent event) { //_CODE_:checkbox2:666692:
   backgroundEffect = 1;
} //_CODE_:checkbox2:666692:

public void black_clicked1(GOption source, GEvent event) { //_CODE_:checkbox3:545766:
  backgroundEffect = 0;
} //_CODE_:checkbox3:545766:

public void white_clicked1(GOption source, GEvent event) { //_CODE_:checkbox4:718822:
  backgroundEffect = 2;
} //_CODE_:checkbox4:718822:

public void strobe_clicked1(GOption source, GEvent event) { //_CODE_:checkbox5:264324:
  backgroundEffect = 3;
} //_CODE_:checkbox5:264324:

public void disco_clicked1(GOption source, GEvent event) { //_CODE_:checkbox6:373425:
  backgroundEffect = 4;
} //_CODE_:checkbox6:373425:

public void checkbox7_clicked1(GCheckbox source, GEvent event) { //_CODE_:checkbox7:388812:
  //println("checkbox7 - GCheckbox >> GEvent." + event + " @ " + millis());
} //_CODE_:checkbox7:388812:

public void checkbox8_clicked1(GCheckbox source, GEvent event) { //_CODE_:checkbox8:553317:
  //println("checkbox8 - GCheckbox >> GEvent." + event + " @ " + millis());
} //_CODE_:checkbox8:553317:

public void checkbox9_clicked1(GCheckbox source, GEvent event) { //_CODE_:checkbox9:552271:
  //println("checkbox9 - GCheckbox >> GEvent." + event + " @ " + millis());
} //_CODE_:checkbox9:552271:

public void checkbox10_clicked1(GCheckbox source, GEvent event) { //_CODE_:checkbox10:651947:
  //println("checkbox10 - GCheckbox >> GEvent." + event + " @ " + millis());
} //_CODE_:checkbox10:651947:

public void actButton_click(GButton source, GEvent event) {
   //println(textfield1.getText());
  if (event == GEvent.CLICKED) {  //This is a work-around for the double button clicked effect
        bSensitive = Integer.parseInt(textfield1.getText());
        num_show = Integer.parseInt(textfield3.getText());
        ballreInit();
   }
}
// Create all the GUI controls. 
// autogenerated do not edit
public void createOptionsGUI(){
  
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.GREEN_SCHEME);
  G4P.setCursor(ARROW);
  if(frame != null)
    frame.setTitle("Options");
  Font ARIAL = new Font("ARIAL", Font.PLAIN, 14);
  label1 = new GLabel(this, (w-400), h-500, 124, 30);
  label1.setText("Beat Sensitivity");
  label1.setFont(ARIAL);
  label1.setTextBold();
  label1.setOpaque(false);
  textfield1 = new GTextField(this, (w-260), h-495, 90, 20, G4P.SCROLLBARS_NONE);
  textfield1.setOpaque(true);
  textfield1.setText(String.valueOf(bSensitive));
  textfield1.addEventHandler(this, "textfield1_change1");
  //The label2, ball speed is deleted
  label3 = new GLabel(this, (w-400), h-450, 124, 30);
  label3.setText("Number of Balls");
  label3.setFont(ARIAL);
  label3.setTextBold();
  label3.setOpaque(false);
  textfield3 = new GTextField(this, (w-260), h-445, 90, 20, G4P.SCROLLBARS_NONE);
  textfield3.setOpaque(true);
  textfield3.setText(String.valueOf(NUMBALLS));
  textfield3.addEventHandler(this, "textfield3_change1");
  actButton = new GButton(this, (w-325), (h-400), 100, 30);
  actButton.setText("Activate");
  actButton.setTextBold();
  actButton.addEventHandler(this, "actButton_click");
  actButton.fireAllEvents(true);
  checkbox1 = new GCheckbox(this, (w-220), (h-350), 150, 40);
  checkbox1.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  checkbox1.setText("  Fill Balls");
  checkbox1.setTextBold();
  checkbox1.setOpaque(false);
  checkbox1.addEventHandler(this, "checkbox1_clicked1");
  label4 = new GLabel(this, (w-410), h-320, 200, 40);
  label4.setText("Background");
  label4.setFont(ARIAL);
  label4.setTextBold();
  label4.setOpaque(false);
  togGroup1 = new GToggleGroup();
  noBack_radio = new GOption(this, (w-375), h-275, 140, 30);
  noBack_radio.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  noBack_radio.setText(" No Background");
  noBack_radio.setTextBold();
  noBack_radio.setOpaque(false);
  noBack_radio.addEventHandler(this, "noBackg_clicked1");
  black = new GOption(this, (w-375), h-250, 140, 30);
  black.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  black.setText(" Black");
  black.setTextBold();
  black.setOpaque(false);
  black.addEventHandler(this, "black_clicked1");
  white = new GOption(this, (w-375), h-225, 140, 30);
  white.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  white.setText("  White");
  white.setTextBold();
  white.setOpaque(false);
  white.addEventHandler(this, "white_clicked1");
  strobe = new GOption(this, (w-375), h-200, 140, 30);
  strobe.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  strobe.setText(" Strobe");
  strobe.setTextBold();
  strobe.setOpaque(false);
  strobe.addEventHandler(this, "strobe_clicked1");
  disco = new GOption(this, (w-375), h-175, 140, 30);
  disco.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  disco.setText("  Disco");
  disco.setTextBold();
  disco.setOpaque(false);
  disco.addEventHandler(this, "disco_clicked1");
  togGroup1.addControl(noBack_radio);
  noBack_radio.setSelected(true);
  togGroup1.addControl(black);
  togGroup1.addControl(white);
  togGroup1.addControl(strobe);
  togGroup1.addControl(disco);
  label5 = new GLabel(this, (w-275), h-320, 200, 40);
  label5.setText("Effects");
  label5.setFont(ARIAL);
  label5.setTextBold();
  label5.setOpaque(false);
  checkbox7 = new GCheckbox(this, (w-220), h-275, 140, 30);
  checkbox7.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  checkbox7.setText("  Balls");
  checkbox7.setTextBold();
  checkbox7.setOpaque(false);
  checkbox7.addEventHandler(this, "checkbox7_clicked1");
  checkbox8 = new GCheckbox(this, (w-220), h-250, 140, 30);
  checkbox8.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  checkbox8.setText("  Exploding balls");
  checkbox8.setTextBold();
  checkbox8.setOpaque(false);
  checkbox8.addEventHandler(this, "checkbox8_clicked1");
  checkbox9 = new GCheckbox(this, (w-220), h-225, 140, 30);
  checkbox9.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  checkbox9.setText("  Waveform");
  checkbox9.setTextBold();
  checkbox9.setOpaque(false);
  checkbox9.addEventHandler(this, "checkbox9_clicked1");
  checkbox10 = new GCheckbox(this, (w-220), h-200, 140, 30);
  checkbox10.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  checkbox10.setText("  Waveform Melt");
  checkbox10.setTextBold();
  checkbox10.setOpaque(false);
  checkbox10.addEventHandler(this, "checkbox10_clicked1");
  
}

public void enableOptionsGUI(){
  drawRectangle();
 
  textfield1.setEnabled(true);
  textfield3.setEnabled(true);
  actButton.setEnabled(true);
 
  checkbox1.setEnabled(true);

  noBack_radio.setEnabled(true);
  black.setEnabled(true);
  white.setEnabled(true);
  strobe.setEnabled(true);

  disco.setEnabled(true);
  
  checkbox7.setEnabled(true);
  checkbox8.setEnabled(true);
  checkbox9.setEnabled(true);
  checkbox10.setEnabled(true);
  label1.setVisible(true);
  label3.setVisible(true);
  label4.setVisible(true);
  label5.setVisible(true);
  textfield1.setVisible(true);
  textfield3.setVisible(true);
  actButton.setVisible(true);

  checkbox1.setVisible(true);
  noBack_radio.setVisible(true);
  black.setVisible(true);
  white.setVisible(true);
  strobe.setVisible(true);
  disco.setVisible(true);
  checkbox7.setVisible(true);
  checkbox8.setVisible(true);
  checkbox9.setVisible(true);
  checkbox10.setVisible(true);
}

public void disableOptionsGUI(){
 textfield1.setEnabled(false);
  textfield3.setEnabled(false);
  actButton.setEnabled(false);
 
  checkbox1.setEnabled(false);

  noBack_radio.setEnabled(false);
  black.setEnabled(false);
  white.setEnabled(false);
  strobe.setEnabled(false);

  disco.setEnabled(false);
  
  checkbox7.setEnabled(false);
  checkbox8.setEnabled(false);
  checkbox9.setEnabled(false);
  checkbox10.setEnabled(false);
  label1.setVisible(false);
  label3.setVisible(false);
  label4.setVisible(false);
  label5.setVisible(false);
  textfield1.setVisible(false);
  textfield3.setVisible(false);
  actButton.setVisible(false);

  checkbox1.setVisible(false);
  noBack_radio.setVisible(false);
  black.setVisible(false);
  white.setVisible(false);
  strobe.setVisible(false);
  disco.setVisible(false);
  checkbox7.setVisible(false);
  checkbox8.setVisible(false);
  checkbox9.setVisible(false);
  checkbox10.setVisible(false);

  
}

