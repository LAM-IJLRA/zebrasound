inlets = 1;
outlets = 1;

var max = 0;

function list()
{
	var inc_list = arrayfromargs(arguments);
	for (ind = 0; ind < inc_list.length; ind++){
    if (inc_list[ind] > max){
      max=inc_list[ind];
    };
  };
};

function bang(){
	outlet(0, max);
	max=0.;
};
