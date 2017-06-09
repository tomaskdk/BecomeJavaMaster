import ketai.ui.*;

String words = "";
String answer;
double x=0;
int enter=0;


void setup() {
  fullScreen();
  textFont(createFont("SourceCodePro-Regular.ttf", 36));
}


void draw() {
  background(0); 
  textSize(34);
  text("Type the formula", 50, 50);
  text(words,50,90);
  if(enter==1){
    try {
        x=main.plus(words);
        answer = String.valueOf(x);
        text("The answer is "+answer,50,130);
        words="";
        enter=-1;
        noLoop();
      } catch (NumberFormatException e) {
        text("Wrong code! Try again",50,130);
        words="";
        enter=-1;
        noLoop();
      }
  }
}

void keyPressed() {  
  println(key);

  if(key=='\n'){
    enter=enter+1;
    loop();
  }else if((int(key)>=48&&int(key)<=57)||int(key)==42||int(key)==43||int(key)==45||int(key)==47){
    words = words + key;
  }
 
}

void mousePressed(){
    KetaiKeyboard.toggle(this);
}

public static class main{
  public static double plus(String answer) {
      double x = 0;
      if (answer.contains("+")) {
        String[] split = answer.split("\\+");
        double[] number = new double[split.length];
        if (main.arraypurity(split) == 0) {
          for (int i = 0; i < split.length; i++) {
            number[i] = Double.parseDouble(split[i]);
            x = x + number[i];
          }
        } else {
          for (int i = 0; i < split.length; i++) {
            number[i] = main.minus(split[i]);
            x = x + number[i];
          }
        }
      } else if (main.purity(answer) == 1) {
        x = main.minus(answer);
      } else {
        x = Double.parseDouble(answer);
      }
      return x;
    }
  
    public static double minus(String answer) {
      double x = 0;
      if (answer.contains("-")) {
  
        String[] split = answer.split("\\-");
        double[] number = new double[split.length];
        if (main.arraypurity(split) == 0) {
          for (int i = 0; i < split.length; i++) {
            number[i] = Double.parseDouble(split[i]);
            if (i == 0) {
              x = number[0];
            } else {
              x = x - number[i];
            }
          }
        } else {
          for (int i = 0; i < split.length; i++) {
            number[i] = main.times(split[i]);
            if (i == 0) {
              x = number[0];
            } else {
              x = x - number[i];
            }
          }
        }
 
      } else {
        x = main.times(answer);
      }
      return x;
    }
  
    public static double times(String answer) {
      double x = 0;
      if (answer.contains("*")) {
  
        String[] split = answer.split("\\*");
        double[] number = new double[split.length];
        if (main.arraypurity(split) == 0) {
          for (int i = 0; i < split.length; i++) {
            number[i] = Double.parseDouble(split[i]);
            if (i == 0) {
              x = number[0];
            } else {
              x = x * number[i];
            }
          }
        } else {
          for (int i = 0; i < split.length; i++) {
            number[i] = main.division(split[i]);
            if (i == 0) {
              x = number[0];
            } else {
              x = x * number[i];
            }
          }
        }
      } else {
        x = main.division(answer);
      }
      return x;
    }
  
    public static double division(String answer) {
      double x = 0;
  
      String[] split = answer.split("/");
      double[] number = new double[split.length];
  
      if (main.arraypurity(split) == 0) {
        for (int i = 0; i < split.length; i++) {
          number[i] = Double.parseDouble(split[i]);
          if (i == 0) {
            x = number[0];
          } else {
            x = x / number[i];
          }
        }
      } 
  
      return x;
  
    }
  
    public static int arraypurity(String[] split) {
      int temp = 0;
      for (int i = 0; i < split.length; i++) {
        temp = temp+main.purity(split[i]);
      }
      return temp;
    }
  
    public static int purity(String a) {
      int temp = 0;
      if (a.contains("+") || a.contains("-") || a.contains("*") || a.contains("/")) {
        temp = 1;
      }
      return temp;
    }
}