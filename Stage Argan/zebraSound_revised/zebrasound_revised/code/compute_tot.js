// compute total values per signal

inlets = 1;
outlets = 2;
var tot_list = new Array(0); //initial vectr
var N = 0.; //number of received lists

function list()
{
	var inc_list = arrayfromargs(arguments);
	if (tot_list.length == 0){
    tot_list = new Array(inc_list.length);
    for(var ind = 0; ind < tot_list.length; ind++){tot_list[ind] = parseFloat(inc_list[ind])};
    N++;
	}
	else{
		for(var ind = 0; ind < tot_list.length; ind++){tot_list[ind] += parseFloat(inc_list[ind])}
    N++;

	};
};

function bang(){
  //for(var ind = 0; ind < tot_list.length; ind++){tot_list[ind] = tot_list[ind] / N;};
  //post(tot_list[0]);
  //post(tot_list[0])

	outlet(0, tot_list);
  outlet(1, N);
  tot_list = new Array(0);
  N=0.;
};
