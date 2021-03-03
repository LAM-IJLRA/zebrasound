/*
group neurons and output ratio of non zero value when receive a bang
*/

intels = 1;
outlets = 1.;
var N = 0 // non zero values
var group = []

function msg_float(arg){
  group.push(arg);
  if (arg > 0){
    N++;
  };
};

function bang(){
  if (N>0){
    outlet(0, N/group.length);
    group = [];
    N = 0;
  }
  else{
    outlet(0, 0.)
    group = [];
  }
};
