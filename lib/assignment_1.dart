import 'dart:async';
import 'dart:io';
import 'dart:convert';

int calculate() {
  return 6 * 7;
}

void readFile() {
  var path = '/Users/baqir/Sites/flutter-session-assignments/assignment_1/lib/file.txt';
  var count = 1;
  File(path)
    .openRead()
    .map(utf8.decode)
    .transform(LineSplitter())
    .forEach((l) {
      print('line: $l');
      var max_words = countWordsInString(l);
      print('line # $count: $max_words');
      count = count + 1;
    });
}

List countWordsInString(String sentence) {
  var mylist = sentence.split(' ');

  var mydict = new Map();
  var max_freq = 1;
  var max_words = [];

  mylist.forEach((String currentItem) {
    if(mydict.containsKey(currentItem)) {
      mydict[currentItem] = mydict[currentItem] + 1;
    } else {
      mydict[currentItem] = 1;
    }

    if(mydict[currentItem] > max_freq) {
      max_words = [];
      max_freq = mydict[currentItem];
      max_words.add(currentItem);
    }
  });

  return max_words;
}