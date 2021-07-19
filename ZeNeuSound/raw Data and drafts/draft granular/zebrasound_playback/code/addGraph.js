inlets = 1.;
outlets = 3.;

openedGraphs = [];

function add(newRef){
  openedGraphs.push(newRef);

  outlet(0, newRef);
  outlet(2, openedGraphs)
}

//function del(ref)
function del(ref){
  index = openedGraphs.indexOf(ref);
  if (index > -1){
    openedGraphs.splice(index)
  }
  outlet(1, ref);
  outlet(2, openedGraphs);
}
