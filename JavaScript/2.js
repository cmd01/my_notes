var obj = {
	prop: "yo",
	prop: function(){

	}
},
regexp = /baba/g,
func = function(){},
arr = [1,2,3];
arr[1] = '24';

console.log(typeof obj);
console.log(obj);
console.log(typeof regexp);
console.log(regexp);
console.log(func);
console.log(arr);