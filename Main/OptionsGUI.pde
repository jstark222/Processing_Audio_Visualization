// Variable declarations 
// autogenerated do not edit

import java.awt.Font;
import java.awt.*;

GLabel label1; 
GTextField textfield1; 
GLabel label2; 
GTextField textfield2; 
GLabel label3; 
GTextField textfield3; 
GCheckbox checkbox1; 
GLabel label4; 
GCheckbox checkbox2; 
GCheckbox checkbox3; 
GCheckbox checkbox4; 
GCheckbox checkbox5; 
GCheckbox checkbox6; 
GLabel label5; 
GCheckbox checkbox7; 
GCheckbox checkbox8; 
GCheckbox checkbox9; 
GCheckbox checkbox10; 



void drawRectangle(){
  if(!optionBool)
  {
     fill(233); 
     rect(w-425, h-600, 400, 500); 
     noFill();
  }
  
}

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

public void checkbox2_clicked1(GCheckbox source, GEvent event) { //_CODE_:checkbox2:666692:
  println("checkbox2 - GCheckbox >> GEvent." + event + " @ " + millis());
} //_CODE_:checkbox2:666692:

public void checkbox3_clicked1(GCheckbox source, GEvent event) { //_CODE_:checkbox3:545766:
  println("checkbox3 - GCheckbox >> GEvent." + event + " @ " + millis());
} //_CODE_:checkbox3:545766:

public void checkbox4_clicked1(GCheckbox source, GEvent event) { //_CODE_:checkbox4:718822:
  println("checkbox4 - GCheckbox >> GEvent." + event + " @ " + millis());
} //_CODE_:checkbox4:718822:

public void checkbox5_clicked1(GCheckbox source, GEvent event) { //_CODE_:checkbox5:264324:
  println("checkbox5 - GCheckbox >> GEvent." + event + " @ " + millis());
} //_CODE_:checkbox5:264324:

public void checkbox6_clicked1(GCheckbox source, GEvent event) { //_CODE_:checkbox6:373425:
  println("checkbox6 - GCheckbox >> GEvent." + event + " @ " + millis());
} //_CODE_:checkbox6:373425:

public void checkbox7_clicked1(GCheckbox source, GEvent event) { //_CODE_:checkbox7:388812:
  println("checkbox7 - GCheckbox >> GEvent." + event + " @ " + millis());
} //_CODE_:checkbox7:388812:

public void checkbox8_clicked1(GCheckbox source, GEvent event) { //_CODE_:checkbox8:553317:
  println("checkbox8 - GCheckbox >> GEvent." + event + " @ " + millis());
} //_CODE_:checkbox8:553317:

public void checkbox9_clicked1(GCheckbox source, GEvent event) { //_CODE_:checkbox9:552271:
  println("checkbox9 - GCheckbox >> GEvent." + event + " @ " + millis());
} //_CODE_:checkbox9:552271:

public void checkbox10_clicked1(GCheckbox source, GEvent event) { //_CODE_:checkbox10:651947:
  println("checkbox10 - GCheckbox >> GEvent." + event + " @ " + millis());
} //_CODE_:checkbox10:651947:



// Create all the GUI controls. 
// autogenerated do not edit
public void createOptionsGUI(){
  
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.GREEN_SCHEME);
  G4P.setCursor(ARROW);
  if(frame != null)
    frame.setTitle("Options");
  Font ARIAL = new Font("ARIAL", Font.PLAIN, 14);
  label1 = new GLabel(this, (w-400), h-550, 124, 30);
  label1.setText("Beat Sensitivity");
  label1.setFont(ARIAL);
  label1.setTextBold();
  label1.setOpaque(false);
  textfield1 = new GTextField(this, (w-260), h-545, 90, 20, G4P.SCROLLBARS_NONE);
  textfield1.setOpaque(true);
  textfield1.setText(String.valueOf(bSensitive));
  textfield1.addEventHandler(this, "textfield1_change1");
  label2 = new GLabel(this, (w-400), h-500, 124, 30);
  label2.setText("Ball Speed");
  label2.setFont(ARIAL);
  label2.setTextBold();
  label2.setOpaque(false);
  textfield2 = new GTextField(this, (w-260), h-495, 90, 20, G4P.SCROLLBARS_NONE);
  textfield2.setOpaque(true);
  textfield2.setText(String.valueOf(speed));
  textfield2.addEventHandler(this, "textfield2_change1");
  label3 = new GLabel(this, (w-400), h-450, 124, 30);
  label3.setText("Number of Balls");
  label3.setFont(ARIAL);
  label3.setTextBold();
  label3.setOpaque(false);
  textfield3 = new GTextField(this, (w-260), h-445, 90, 20, G4P.SCROLLBARS_NONE);
  textfield3.setOpaque(true);
  textfield3.setText(String.valueOf(NUMBALLS));
  textfield3.addEventHandler(this, "textfield3_change1");
  checkbox1 = new GCheckbox(this, (w-300), h-380, 150, 40);
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
  checkbox2 = new GCheckbox(this, (w-375), h-275, 140, 30);
  checkbox2.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  checkbox2.setText("  No Background");
  checkbox2.setTextBold();
  checkbox2.setOpaque(false);
  checkbox2.addEventHandler(this, "checkbox2_clicked1");
  checkbox2.setSelected(true);
  checkbox3 = new GCheckbox(this, (w-375), h-250, 140, 30);
  checkbox3.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  checkbox3.setText("  Black");
  checkbox3.setTextBold();
  checkbox3.setOpaque(false);
  checkbox3.addEventHandler(this, "checkbox3_clicked1");
  checkbox4 = new GCheckbox(this, (w-375), h-225, 140, 30);
  checkbox4.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  checkbox4.setText("  White");
  checkbox4.setTextBold();
  checkbox4.setOpaque(false);
  checkbox4.addEventHandler(this, "checkbox4_clicked1");
  checkbox5 = new GCheckbox(this, (w-375), h-200, 140, 30);
  checkbox5.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  checkbox5.setText("  Strobe");
  checkbox5.setTextBold();
  checkbox5.setOpaque(false);
  checkbox5.addEventHandler(this, "checkbox5_clicked1");
  checkbox6 = new GCheckbox(this, (w-375), h-175, 140, 30);
  checkbox6.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  checkbox6.setText("  Disco");
  checkbox6.setTextBold();
  checkbox6.setOpaque(false);
  checkbox6.addEventHandler(this, "checkbox6_clicked1");
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
  checkbox9.setText("  Star Streaming");
  checkbox9.setTextBold();
  checkbox9.setOpaque(false);
  checkbox9.addEventHandler(this, "checkbox9_clicked1");
  checkbox10 = new GCheckbox(this, (w-220), h-200, 140, 30);
  checkbox10.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  checkbox10.setText("  Rainbow Waveform");
  checkbox10.setTextBold();
  checkbox10.setOpaque(false);
  checkbox10.addEventHandler(this, "checkbox10_clicked1");
}

public void enableOptionsGUI(){
 
  textfield1.setEnabled(true);
  textfield2.setEnabled(true);
  textfield3.setEnabled(true);
 
  checkbox1.setEnabled(true);

  checkbox2.setEnabled(true);
  checkbox3.setEnabled(true);
  checkbox4.setEnabled(true);
  checkbox5.setEnabled(true);

  checkbox6.setEnabled(true);
  
  checkbox7.setEnabled(true);
  checkbox8.setEnabled(true);
  checkbox9.setEnabled(true);
  checkbox10.setEnabled(true);
  label1.setVisible(true);
  label2.setVisible(true);
  label3.setVisible(true);
  label4.setVisible(true);
  label5.setVisible(true);
  textfield1.setVisible(true);
  textfield2.setVisible(true);
  textfield3.setVisible(true);

  checkbox1.setVisible(true);
  checkbox2.setVisible(true);
  checkbox3.setVisible(true);
  checkbox4.setVisible(true);
  checkbox5.setVisible(true);
  checkbox6.setVisible(true);
  checkbox7.setVisible(true);
  checkbox8.setVisible(true);
  checkbox9.setVisible(true);
  checkbox10.setVisible(true);
}

public void disableOptionsGUI(){
 textfield1.setEnabled(false);
  textfield2.setEnabled(false);
  textfield3.setEnabled(false);
 
  checkbox1.setEnabled(false);

  checkbox2.setEnabled(false);
  checkbox3.setEnabled(false);
  checkbox4.setEnabled(false);
  checkbox5.setEnabled(false);

  checkbox6.setEnabled(false);
  
  checkbox7.setEnabled(false);
  checkbox8.setEnabled(false);
  checkbox9.setEnabled(false);
  checkbox10.setEnabled(false);
  label1.setVisible(false);
  label2.setVisible(false);
  label3.setVisible(false);
  label4.setVisible(false);
  label5.setVisible(false);
  textfield1.setVisible(false);
  textfield2.setVisible(false);
  textfield3.setVisible(false);

  checkbox1.setVisible(false);
  checkbox2.setVisible(false);
  checkbox3.setVisible(false);
  checkbox4.setVisible(false);
  checkbox5.setVisible(false);
  checkbox6.setVisible(false);
  checkbox7.setVisible(false);
  checkbox8.setVisible(false);
  checkbox9.setVisible(false);
  checkbox10.setVisible(false);

  
}

