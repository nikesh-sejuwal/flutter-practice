var Apple =
    "The process of comparing between unknown physical quantity to known standard quantity is called measurement";
void main() {
  var word = Apple.split(" ");
  var mapping = word.map((e) => ' $e = ${e.length}');
  var join = mapping.join(",");
  print(join);
}
