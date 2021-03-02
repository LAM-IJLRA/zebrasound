/*
Apply a threshold based on standard deviation
*/
inlets = 1;
outlets = 2;
var tools = new Object.create(null);
var k = 0.;
var sigma = [];
var means = [];
var threshes = [];

include("toolSet.js", tools);

function comp_thresh(){
  threshes = new Array(sigma.length);
  for (var ind = 0; (ind < sigma.length) & (ind < means.length); ind++){
    threshes[ind] = k*sigma[ind];
  };
};

function k_threshold(new_k) {
  k = new_k;
  comp_thresh();
}

function std_div_vector(){
  var inc_list = arrayfromargs(arguments);
  tools.copy_vector(sigma, inc_list);
  comp_thresh();
};

function mean_vector() {
  var inc_list = arrayfromargs(arguments);
  tools.copy_vector(means, inc_list);
  comp_thresh();
};

function list(){
  var inc_list = arrayfromargs(arguments);
  index = inc_list[0];
  value = inc_list[1];
  if (value < threshes[index]){
    outlet(0, 0.);
  }
  else {
    outlet(0, value);
  }
}


function bang(){
  outlet(1, threshes);
}
