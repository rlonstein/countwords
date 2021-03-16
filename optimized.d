import std.stdio;
import std.string;
import std.algorithm.iteration : splitter;
import std.algorithm.sorting : schwartzSort;

void main() {
  int[string] freq;
  char[] buf;

  while (stdin.readln(buf) && !stdin.eof()) {
    foreach (word; splitter(buf)) {
      for (ptrdiff_t idx = 0; idx < word.length; idx++) {
        if (word[idx]-'A' < 26) {
          word[idx] = word[idx]|32;
        }
      }
      if (auto ptr = (word in freq)) {
        ++*ptr;
      }
      else {
        freq[cast(immutable char[])word.dup] = 1;
      }
    }
  }

  auto ordered = schwartzSort!(k => freq[k], "a > b")(freq.keys);
  foreach (k; ordered) {
    writeln(k," ", freq[k]);
  }
}
