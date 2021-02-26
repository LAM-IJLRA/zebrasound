// Compute the group parameter "Average" vector for the current frame

inlets = 1;
outlets = 1;
var N = 0.;

var out_list = [0., 0., 0., 0., 0., 0., 0., 0., 0., 0.];
var N_group = [0., 0., 0., 0., 0., 0., 0., 0., 0., 0.];


function  list(){
  var inc_list = arrayfromargs(arguments);
  out_list[inc_list[0]] += inc_list[1];
  N_group[inc_list[0]] += 1.;
};

function N_roi(n){
  N = n;
}

function bang(){
  for (var ind = 0; ind < out_list.length; ind++){
    if (N_group[ind] > 0){
      out_list[ind] /= N_group[ind];
    }
    else{
      out_list[ind] = 0.;
    };
  };
  outlet(0, out_list);
  out_list = [0., 0., 0., 0., 0., 0., 0., 0., 0., 0.];
  N_group = [0., 0., 0., 0., 0., 0., 0., 0., 0., 0.];
}
