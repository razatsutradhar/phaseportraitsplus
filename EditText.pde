class EditText {
  String searchQuery = "";
  String fadedText;
  boolean isSelected;
  boolean isShown;
  int x;
  int y;
  int w;
  int h;
  int substring = 0;
  EditText(int x, int y, int w, int h, String fadedText) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.fadedText = fadedText;
  }
  EditText(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.fadedText = "";
  }


  String keyUpdate() {
    if (isSelected) {
      if (keyCode == BACKSPACE) {
        try {
          searchQuery = searchQuery.substring(0, substring-1) + searchQuery.substring(substring, searchQuery.length());
          substring--;
        }
        catch(Exception e) {
        }
      } else if (keyCode == DELETE) {
        try {
          searchQuery = searchQuery.substring(0, substring) + searchQuery.substring(substring+1, searchQuery.length());
        }
        catch(Exception e) {
        }
      } else if (keyCode == LEFT) {
        substring = substring > 0 ? --substring : 0;
      } else if (keyCode == RIGHT) {
        substring = substring <= searchQuery.length()-1? ++substring : searchQuery.length();
      } else if (keyCode == SHIFT) {
      } else {
        searchQuery = searchQuery.substring(0, substring) + key + searchQuery.substring(substring, searchQuery.length());
        substring++;
      }

      text(substring, 400, 30);
    }
    return searchQuery;
  }

  void updateSelected() {
    if (mousePressed)
      if ((mouseX-width/2) > x && (mouseX-width/2)<x+w && (mouseY-height/2) > y && (mouseY-height/2)<y+h) {
        isSelected = true;
      } else {
        isSelected = false;
      }
  }

  String getString() {
    return searchQuery;
  }

  void show(boolean isShown) {
    this.isShown = isShown;
    if (isShown) {
      if (isSelected) {
        fill(255);
      } else {
        fill(150);
      }
      rect(x, y, w, h);    
      textSize((int)(h*0.7));

      if (searchQuery.equals("")) {
        fill(100);
        text(fadedText, x, y+h/2);
      } else {
        fill(0);
        text(searchQuery.substring(0, substring) + "|" + searchQuery.substring(substring, searchQuery.length()), x, y+h/2);
      }
    }
  }

  boolean isSelected() {
    return isSelected && isShown;
  }

  void setPos(int x, int y) {
    this.x = x;
    this.y = y;
  }

  void setStr(String str) {
    searchQuery = str;
    substring = str.length();
  }
}
