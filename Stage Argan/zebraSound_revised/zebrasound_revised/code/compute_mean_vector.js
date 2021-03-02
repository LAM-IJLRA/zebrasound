/*

compute mean vector

*/
inlets = 1;
outlets = 2;
var N = 0.
signals = new Array()

function list(){
  var inc_list = arrayfromargs(arguments);
  if (signals.length == 0){
    for (var ind = 0; ind < inc_list.length; ind ++){
      signals[ind] = inc_list[ind];
    };
    N++;
  }
  else{
    for (var ind = 0; ind < inc_list.length; ind ++){
      signals[ind] += inc_list[ind]
    };
    N ++;
  };
};

function bang(){
  for (var ind = 0; ind < signals.length; ind ++){
    signals[ind] /= N;
  };
  outlet(1, signals);
  outlet(0, "bang");
  N = 0.;
  signals = [];
};
