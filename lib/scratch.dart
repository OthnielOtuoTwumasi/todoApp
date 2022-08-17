
void main (List<String> nameToRemove){
  List<String> names =["Samuel", "Othniel", "John","Dorcas", "Stephen" ];
// to find a list of names containing only a
 // Iterable <String> namesA = names.where((newNames) => newNames.contains("a"));
  Iterable<String> newNamesB = names.where((newNames) => newNames = names.remove(nameToRemove));
 print(newNamesB);



}

