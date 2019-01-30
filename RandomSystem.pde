//Jonathan Chan
//30-1-2019
//Random from array system

int randomArray(int r, int ra) {

  IntList rList = new IntList();
    for (int i = 0; i < ra; i++) {
      if (i != r) {
      rList.append(i);
      }  
    }
    int rr = floor(random(ra-1));
    r = rList.get(rr);
    
    return r;
}
