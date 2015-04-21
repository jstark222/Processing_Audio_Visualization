// Need G4P library
import g4p_controls.*;
import java.io.File;
import javax.swing.JFileChooser;
import javax.swing.filechooser.*;
import javax.swing.SwingUtilities;


String file_name;
JFileChooser file_chooser = new JFileChooser();

public void setup(){
  size(480, 320, JAVA2D);
  createGUI();
  customGUI();
  // Place your setup code here
  
}

public void draw(){
  background(230);
  
}


public void openFile()
{
  try
  {
    SwingUtilities. invokeLater(new Runnable()
    {
      public void run()
      {
        file_chooser.setDialogTitle("Choose a Song");
        file_chooser.setAcceptAllFileFilterUsed(true);
        int return_val = file_chooser.showOpenDialog(null);
        if ( return_val == JFileChooser.APPROVE_OPTION )
        {
          File file = file_chooser.getSelectedFile();
          file_name = file.getAbsolutePath();
        }
        else
        {
          file_name = "none";
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

// Use this method to add additional statements
// to customise the GUI controls
public void customGUI(){

}
