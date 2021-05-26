/*

compute mean vector

*/
inlets = 1;
outlets = 2;
var n = 0.;
var means = new Array();
var std_div = new Array();


function mean_vector(){
  var inc_list = arrayfromargs(arguments);
  for (var ind = 0; ind < inc_list.length; ind ++){
    means[ind] = inc_list[ind];
  };
};

function list(){
  var inc_list = arrayfromargs(arguments);
  if (std_div.length == 0){
    for (var ind = 0; ind < inc_list.length; ind ++){
      std_div[ind] = Math.pow(inc_list[ind], 2) - Math.pow(means[ind], 2);
    };
    n++;
  }
  else{
    for (var ind = 0; ind < inc_list.length; ind ++){
      std_div[ind] += Math.pow(inc_list[ind], 2) - Math.pow(means[ind], 2);
    };
    n ++;
  };
};

function bang(){
  for (var ind = 0; ind < std_div.length; ind ++){
    std_div[ind] = Math.pow(std_div[ind] / n, 0.5);
  };
  outlet(1, std_div);
  means = new Array();
  std_div = new Array();
  n = 0.;

  outlet(0, "bang");
}
