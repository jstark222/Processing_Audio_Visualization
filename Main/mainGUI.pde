import g4p_controls.*;
import java.io.File;
import javax.swing.JFileChooser;
import javax.swing.*;
import javax.swing.SwingUtilities;
import javax.swing.filechooser.FileFilter;
import java.awt.event.*;

import java.awt.BorderLayout;
import java.awt.Rectangle;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;

import javax.swing.JComponent;
import javax.swing.JFrame;
import javax.swing.JMenuItem;
import javax.swing.JPopupMenu;
import javax.swing.JTextField;
import javax.swing.KeyStroke;
import javax.swing.text.BadLocationException;


String sensitivityInput = "50";
JPopupMenu popup;
JMenuItem menuItem;
JComponent jcom;

//Booleans control toggle of displayed Controls/ProgressBar
boolean showControls = true;
boolean showProgress = true;


JFileChooser file_chooser = new JFileChooser();

//EVENT HANDLERS
//==========================================================================

public void playButton_click(GButton source, GEvent event) { 
  if (source == playButton  &&  event == GEvent.CLICKED) {  //This is a work-around for the double button clicked effect
 
    if (!player.isPlaying()) player.play();  //Self-evident, but the play() method simply starts playing the loaded fileplayer.play();
  }
} 

public void stopButton_click(GButton source, GEvent event) {
  
  if (source == stopButton  &&  event == GEvent.CLICKED) {  //This is a work-around for the double button clicked effect
    player.pause();
  }
} 

public void songButton_click(GButton source, GEvent event) { 
 
  if (source == songButton  &&  event == GEvent.CLICKED) {  //This is a work-around for the double button clicked effect
    if (player.isPlaying()) player.pause();
    openFile();
  }
 
} 

public void optionsButton_click(GButton source, GEvent event) { 
  
  if (source == optionsButton  &&  event == GEvent.CLICKED) {  //This is a work-around for the double button clicked effect
  }
} 

public void slider1_click(GSlider source, GEvent event) { 
  if (source == slider1  &&  mRelease) {  //This is a work-around for the double button clicked effect
    player.cue(int(map(slider1.getValueF(), 0.0, 1.0, 0, player.length())));
  }
  
  
} 
class MenuActionListener implements ActionListener {
  public void actionPerformed(ActionEvent e) {
    if(e.getActionCommand()  == "Show/Hide Song Controls")
    {
        if(showControls)
        {
            disableGui();
            showControls = false;
        }
        else
        {
            enableGui();
            showControls = true;
          
        }
        
    }
    else if(e.getActionCommand() == "Show/Hide Progress Bar")
    {
        if(showProgress)
        {
            disableProgressBar();
            showProgress = false;
        }
        else
        {
            enableProgressBar();
            showProgress = true;
          
        }
    }
    else if(e.getActionCommand() == "Play Next Song")
    {
      if (currentSong < fileName.size() - 1  &&  fileName.size() > 1) {
        currentSong++;
        player.pause();
        loadSong();
        player.play();
      }
    }
    else if(e.getActionCommand() == "Play Previous Song")
    {
      if (currentSong > 0) {
        currentSong--;
        player.pause();
        loadSong();
        player.play();
      }
    }
    else if(e.getActionCommand() == "Exit")
    {
       mode = 3;
    }


  }
}
//===================================================================


//GUI ENABLES AND DISABLES
//=====================================================================

public void enableGui(){
 playButton.setVisible(true);
 stopButton.setVisible(true);
 songButton.setVisible(true);
 optionsButton.setVisible(true);
 playButton.setEnabled(true);
 stopButton.setEnabled(true);
 optionsButton.setEnabled(true);
 songButton.setEnabled(true); 
}

public void disableGui(){
 playButton.setVisible(false);
 stopButton.setVisible(false);
 songButton.setVisible(false);
 optionsButton.setVisible(false);
 playButton.setEnabled(false);
 stopButton.setEnabled(false);
 optionsButton.setEnabled(false);
 songButton.setEnabled(false);
  
}

public void enableProgressBar(){
  slider1.setVisible(true);
  slider1.setEnabled(true);
  
}

public void disableProgressBar(){
  slider1.setVisible(false);
  slider1.setEnabled(false);
  
}
//=================================================================

// Create all the GUI controls. 
//=================================================================
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);
  if(frame != null)
    frame.setTitle("Sketch Window");
    
  playButton = new GButton(this, 275, 530, 100, 30);
  playButton.setText("Play");
  playButton.setTextBold();
  playButton.addEventHandler(this, "playButton_click");
  playButton.fireAllEvents(true);
  
  stopButton = new GButton(this, 425, 530, 100, 30);
  stopButton.setText("Stop");
  stopButton.setTextBold();
  stopButton.addEventHandler(this, "stopButton_click");
  stopButton.fireAllEvents(true);
  
  songButton = new GButton(this, 125, 530, 100, 30);
  songButton.setText("Song");
  songButton.setTextBold();
  songButton.addEventHandler(this, "songButton_click");
  songButton.fireAllEvents(true);
  
  optionsButton = new GButton(this, 575, 530, 100, 30);
  optionsButton.setText("Options");
  optionsButton.setTextBold();
  optionsButton.addEventHandler(this, "optionsButton_click");
  optionsButton.fireAllEvents(true);
}

void drawSongSlider(){
  slider1 = new GSlider(this, 2, (h - 50), width, 53, 10.0);
  slider1.setShowLimits(false);
  slider1.setTextOrientation(G4P.ORIENT_LEFT);
  slider1.setLimits(0.0, 0.0, 1.0);
  slider1.setNumberFormat(G4P.DECIMAL, 2);
  slider1.setOpaque(false);
  slider1.addEventHandler(this, "slider1_click");
  
}
void mouseReleased(){
 mRelease = true; 
}

// Variable declarations 
// autogenerated do not edit
GButton playButton; 
GButton stopButton; 
GButton songButton; 
GButton optionsButton; 
GSlider slider1; 

//mouse RIGHT CLICK MENU
void mousePressed() {
  if (mouseButton == RIGHT) {
    JFrame frame = new JFrame("Popup Example");
    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);




    final JTextField textField = new JTextField();
    //frame.add(textField, BorderLayout.NORTH);
    
    this.add(textField, BorderLayout.SOUTH);

    final JPopupMenu popup = new JPopupMenu();
    JMenuItem menuItem1 = new JMenuItem("Show/Hide Song Controls");
    menuItem1.addActionListener(new MenuActionListener());
    popup.add(menuItem1);

    JMenuItem menuItem2 = new JMenuItem("Show/Hide Progress Bar");
    menuItem2.addActionListener(new MenuActionListener());
    popup.add(menuItem2);
    
    JMenuItem menuItem3 = new JMenuItem("Play Next Song");
    menuItem3.addActionListener(new MenuActionListener());
    popup.add(menuItem3);
    
    JMenuItem menuItem4 = new JMenuItem("Play Previous Song");
    menuItem4.addActionListener(new MenuActionListener());
    popup.add(menuItem4);
    
    JMenuItem menuItem5 = new JMenuItem("Exit");
    menuItem5.addActionListener(new MenuActionListener());
    popup.add(menuItem5);
    

    
        
    popup.show(textField, mouseX, mouseY);
    


  }

}

//FOR TESTING PURPOSES ONLY  DELETE ME!!!!!!!!!!!!!!!!!!!!!!!!!!!
//==================================================================
void keyPressed() {
  switch(key) {
    case '1':
      //mode = 1;
      addme++;
      break;
    case '2':
      mode = 2;
      break;
    case '3':
      mode = 3;
      break;
    case 'q':
      effect = 1;
      break;
    case 'w':
      effect = 2;
      break;
    case 'e':
      effect = 3;
      break;  
    case 's':
      sensitivityInput = "999";
      beat.setSensitivity(int(sensitivityInput));
      println("Sensitivity is: " + sensitivityInput);
  }
}
//====================================================================

//FILE OPENER
//====================================================================
public void openFile()
{
  try
  {
    SwingUtilities. invokeLater(new Runnable()
    {
      public void run()
      {
        file_chooser.setDialogTitle("Choose a Song");
        file_chooser = checkType(file_chooser);
        int return_val = file_chooser.showOpenDialog(null);
        if ( return_val == JFileChooser.APPROVE_OPTION)
        {
          
          File file = file_chooser.getSelectedFile();
          
          
          if (initSongSelected) {
            fileName.add(file.getAbsolutePath());
            currentSong = fileName.size() - 1;
          }
          else { fileName.set(0, file.getAbsolutePath()); initSongSelected = true; }
          
          loadSong();
        }
        else
        {
          //fileName = "none";  //Seems like it would crash our program if "none" ever got passed to player
        }
      }
    }
    );
  }
  catch (Exception e)
  {
    e.printStackTrace();
  }
}

//================================================================


//Applying File Filter
//=================================================================
public JFileChooser checkType(JFileChooser type){
    FileFilter filter1 = new ExtensionFileFilter("Aiff, au, wav, mp3", new String[]{ "AIFF", "AU", "WAV", "MP3"});
    type.setFileFilter(filter1);
 
    return type;
    
}

//FILE FILTER
/* MusicFilter.java is used by FileChooserDemo2.java. */
class ExtensionFileFilter extends FileFilter {
  String description;

  String extensions[];

  public ExtensionFileFilter(String description, String extension) {
    this(description, new String[] { extension });
  }

  public ExtensionFileFilter(String description, String extensions[]) {
    if (description == null) {
      this.description = extensions[0];
    } else {
      this.description = description;
    }
    this.extensions = (String[]) extensions.clone();
    toLower(this.extensions);
  }

  private void toLower(String array[]) {
    for (int i = 0, n = array.length; i < n; i++) {
      array[i] = array[i].toLowerCase();
    }
  }

  public String getDescription() {
    return description;
  }

  public boolean accept(File file) {
    if (file.isDirectory()) {
      return true;
    } else {
      String path = file.getAbsolutePath().toLowerCase();
      for (int i = 0, n = extensions.length; i < n; i++) {
        String extension = extensions[i];
        if ((path.endsWith(extension) && (path.charAt(path.length() - extension.length() - 1)) == '.')) {
          return true;
        }
      }
    }
    return false;
  }
}
//=======================================================================
