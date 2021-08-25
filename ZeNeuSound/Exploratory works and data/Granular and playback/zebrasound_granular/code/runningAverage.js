// compute a running average over N

inlets = 2;
outlets = 2;

int_vector = [];
N=1

function msg_int(n){
  N=n
}

function list(){
  var inc_list = arrayfromargs(arguments);
  if (int_vector.length == 0){
    int_vector = arrayfromargs(arguments);
  }
  else{
    for (var ind = 0; ind < inc_list.length; ind ++){
      int_vector[ind] += inc_list[ind]
    };
  }
}

function bang(){
  for (var ind = 0; ind < int_vector.length; ind ++){
    int_vector[ind] = int_vector[ind]/N
  }
  outlet(0, int_vector)
  outlet(1, int_vector.length)
  int_vector = [];
}
