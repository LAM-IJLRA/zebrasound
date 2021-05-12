inlets = 1;
outlets = 6; //0-2 write 2-5 save

state = 3;

function msg_int(int){
  outlet(state, "bang")
  outlet(int, "bang")
  state = int + 3
}

function bang(){
  outlet(0, state)
}
