import 'package:dart_kollection/dart_kollection.dart';
import 'package:test/test.dart';

void main() {
  group("kotlin syntax", kotlinLikeSyntax);
  group("dart syntax", dartLikeSyntax);
}

void dartLikeSyntax() {
  group('emptyList', () {
    test("basic creation", () {
      final list = KList<String>.empty();
      expect(list.size, 0);
      expect(list.hashCode, 1);
      expect(list, KList.empty());
      expect(list, KList.of());
      var emptyMutable = KMutableList.of("a")..remove("a");
      expect(list.hashCode, emptyMutable.hashCode);
      expect(list, emptyMutable);
    });
  });

  group('listFrom', () {
    test("empty", () {
      final list = KList<String>.empty();
      expect(list.size, 0);
      expect(list.hashCode, 1);
      expect(list, listFrom());
      expect(list, KList<String>.empty());
      var emptyMutable = KMutableList.of("a")..remove("a");
      expect(list.hashCode, emptyMutable.hashCode);
      expect(list, emptyMutable);
      expect(list, emptyList());
    });

    test("create with filled iterable values", () {
      final list = listFrom(["test"]);
      expect(list.size, equals(1));
      expect(list, KList.of("test"));
    });

    test("create with values", () {
      final list = KList.of("test");
      expect(list.size, equals(1));
      expect(list, KList.of("test"));
    });

    test("mutation of original list doesn't manipulate mutableList", () {
      final originalList = ["foo"];
      final klist = listFrom<String>(originalList);
      expect(klist.size, equals(1));
      expect(klist, KList.of("foo"));

      originalList.add("bar");
      expect(originalList, ["foo", "bar"]);
      // originalList was copied, therefore no change of klist
      expect(klist, KList.of("foo"));
    });
  });

  group('mutableListFrom', () {
    test("empty", () {
      final list = KMutableList<String>.of();
      expect(list.size, 0);
      expect(list.hashCode, 1);
      expect(list, listFrom());
      expect(list, KList.of());
      var emptyMutable = KMutableList.of("a")..remove("a");
      expect(list.hashCode, emptyMutable.hashCode);
      expect(list, emptyMutable);
      expect(list, emptyList());
    });

    test("empty is mutable", () {
      final list = KMutableList<String>.from([]);
      list.add("test");
      expect(list.size, equals(1));
      expect(list, KList.of("test"));
    });

    test("create with filled iterable values", () {
      final list = KMutableList.from(["test"]);
      expect(list.size, equals(1));
      expect(list, KList.of("test"));
    });

    test("create with values", () {
      final list = KMutableList.of("test");
      expect(list.size, equals(1));
      expect(list, KList.of("test"));
    });

    test("mutation of original list doesn't manipulate mutableList", () {
      final originalList = ["foo"];
      final klist = KMutableList<String>.from(originalList);
      expect(klist.size, equals(1));
      expect(klist, KList.of("foo"));

      originalList.add("bar");
      expect(originalList, ["foo", "bar"]);
      // originalList was copied, therefore no change of klist
      expect(klist, KList.of("foo"));
    });
  });

  group("hashMapOf", () {
    test("empty is mutable", () {
      final map = KHashMap<int, String>.from();
      map[1] = "a";
      expect(map.size, 1);
      expect(map, KMap.from({1: "a"}));
    });

    test("with empty map is mutable", () {
      final map = KHashMap<int, String>.from({});
      map[1] = "a";
      expect(map.size, 1);
      expect(map, KMap.from({1: "a"}));
    });

    test("mutation of original list doesn't manipulate original map", () {
      var initialMap = {
        1: "Bulbasaur",
        2: "Ivysaur",
      };
      final map = KHashMap.from(initialMap);
      map[1] = "a";
      expect(map.size, 2);
      expect(map, KMap.from({1: "a", 2: "Ivysaur"}));

      // original is unchanged
      expect(initialMap[1], "Bulbasaur");
    });
  });

  group('hashSetOf', () {
    test("empty is mutable", () {
      final set = KHashSet<String>.from();
      set.add("test");
      expect(set.size, equals(1));
      expect(set, KSet.of("test"));
    });

    test("with empty list is mutable", () {
      final set = KMutableSet<String>.from([]);
      set.add("test");
      expect(set.size, equals(1));
      expect(set, KSet.of("test"));
    });

    test("create with value", () {
      final set = KMutableSet<String>.of("test");
      expect(set.size, equals(1));
      expect(set, KSet.of("test"));
    });

    test("mutation of original list doesn't manipulate mutableList", () {
      final originalList = ["foo"];
      final kset = KMutableSet.from(originalList);
      expect(kset.size, equals(1));
      expect(kset, KSet.of("foo"));

      originalList.add("bar");
      expect(originalList, ["foo", "bar"]);
      // originalList was copied, therefore no change of klist
      expect(kset, KSet.of("foo"));
    });
  });

  group('linkedSetOf', () {
    test("empty is mutable", () {
      final set = KLinkedSet<String>.from();
      set.add("test");
      expect(set.size, equals(1));
      expect(set, KSet.of("test"));
    });

    test("empty is mutable", () {
      final set = KLinkedSet<String>.from([]);
      set.add("test");
      expect(set.size, equals(1));
      expect(set, KSet.of("test"));
    });

    test("create with value", () {
      final set = KLinkedSet<String>.of("test");
      expect(set.size, equals(1));
      expect(set, KSet.of("test"));
    });

    test("mutation of original list doesn't manipulate mutableList", () {
      final originalList = ["foo"];
      final kset = KLinkedSet.from(originalList);
      expect(kset.size, equals(1));
      expect(kset, KSet.of("foo"));

      originalList.add("bar");
      expect(originalList, ["foo", "bar"]);
      // originalList was copied, therefore no change of kset
      expect(kset, KSet.of("foo"));
    });
  });
}

void kotlinLikeSyntax() {
  group('emptyList', () {
    test("basic creation", () {
      final list = emptyList<String>();
      expect(list.size, 0);
      expect(list.hashCode, 1);
      expect(list, listFrom());
      expect(list, listOf());
      var emptyMutable = mutableListOf("a")..remove("a");
      expect(list.hashCode, emptyMutable.hashCode);
      expect(list, emptyMutable);
    });
  });

  group('listFrom', () {
    test("empty", () {
      final list = listFrom<String>();
      expect(list.size, 0);
      expect(list.hashCode, 1);
      expect(list, listFrom());
      expect(list, listOf());
      var emptyMutable = mutableListOf("a")..remove("a");
      expect(list.hashCode, emptyMutable.hashCode);
      expect(list, emptyMutable);
      expect(list, emptyList());
    });

    test("create with filled iterable values", () {
      final list = listFrom(["test"]);
      expect(list.size, equals(1));
      expect(list, listOf("test"));
    });

    test("create with values", () {
      final list = listOf("test");
      expect(list.size, equals(1));
      expect(list, listOf("test"));
    });

    test("mutation of original list doesn't manipulate mutableList", () {
      final originalList = ["foo"];
      final klist = listFrom<String>(originalList);
      expect(klist.size, equals(1));
      expect(klist, listOf("foo"));

      originalList.add("bar");
      expect(originalList, ["foo", "bar"]);
      // originalList was copied, therefore no change of klist
      expect(klist, listOf("foo"));
    });
  });

  group('mutableListFrom', () {
    test("empty", () {
      final list = mutableListOf<String>();
      expect(list.size, 0);
      expect(list.hashCode, 1);
      expect(list, listFrom());
      expect(list, listOf());
      var emptyMutable = mutableListOf("a")..remove("a");
      expect(list.hashCode, emptyMutable.hashCode);
      expect(list, emptyMutable);
      expect(list, emptyList());
    });

    test("empty is mutable", () {
      final list = mutableListFrom<String>([]);
      list.add("test");
      expect(list.size, equals(1));
      expect(list, listOf("test"));
    });

    test("create with filled iterable values", () {
      final list = mutableListFrom(["test"]);
      expect(list.size, equals(1));
      expect(list, listOf("test"));
    });

    test("create with values", () {
      final list = mutableListOf("test");
      expect(list.size, equals(1));
      expect(list, listOf("test"));
    });

    test("mutation of original list doesn't manipulate mutableList", () {
      final originalList = ["foo"];
      final klist = mutableListFrom<String>(originalList);
      expect(klist.size, equals(1));
      expect(klist, listOf("foo"));

      originalList.add("bar");
      expect(originalList, ["foo", "bar"]);
      // originalList was copied, therefore no change of klist
      expect(klist, listOf("foo"));
    });
  });

  group("hashMapOf", () {
    test("empty is mutable", () {
      final map = hashMapFrom<int, String>();
      map[1] = "a";
      expect(map.size, 1);
      expect(map, mapFrom({1: "a"}));
    });

    test("with empty map is mutable", () {
      final map = hashMapFrom<int, String>({});
      map[1] = "a";
      expect(map.size, 1);
      expect(map, mapFrom({1: "a"}));
    });

    test("mutation of original list doesn't manipulate original map", () {
      var initialMap = {
        1: "Bulbasaur",
        2: "Ivysaur",
      };
      final map = hashMapFrom<int, String>(initialMap);
      map[1] = "a";
      expect(map.size, 2);
      expect(map, mapFrom({1: "a", 2: "Ivysaur"}));

      // original is unchanged
      expect(initialMap[1], "Bulbasaur");
    });
  });

  group('hashSetOf', () {
    test("empty is mutable", () {
      final set = hashSetOf<String>();
      set.add("test");
      expect(set.size, equals(1));
      expect(set, setOf("test"));
    });

    test("with empty list is mutable", () {
      final set = hashSetFrom<String>([]);
      set.add("test");
      expect(set.size, equals(1));
      expect(set, setOf("test"));
    });

    test("create with value", () {
      final set = hashSetOf<String>("test");
      expect(set.size, equals(1));
      expect(set, setOf("test"));
    });

    test("mutation of original list doesn't manipulate mutableList", () {
      final originalList = ["foo"];
      final kset = hashSetFrom<String>(originalList);
      expect(kset.size, equals(1));
      expect(kset, setOf("foo"));

      originalList.add("bar");
      expect(originalList, ["foo", "bar"]);
      // originalList was copied, therefore no change of klist
      expect(kset, setOf("foo"));
    });
  });

  group('linkedSetOf', () {
    test("empty is mutable", () {
      final set = linkedSetOf<String>();
      set.add("test");
      expect(set.size, equals(1));
      expect(set, setOf("test"));
    });

    test("empty is mutable", () {
      final set = linkedSetFrom<String>([]);
      set.add("test");
      expect(set.size, equals(1));
      expect(set, setOf("test"));
    });

    test("create with value", () {
      final set = linkedSetOf<String>("test");
      expect(set.size, equals(1));
      expect(set, setOf("test"));
    });

    test("mutation of original list doesn't manipulate mutableList", () {
      final originalList = ["foo"];
      final kset = linkedSetFrom<String>(originalList);
      expect(kset.size, equals(1));
      expect(kset, setOf("foo"));

      originalList.add("bar");
      expect(originalList, ["foo", "bar"]);
      // originalList was copied, therefore no change of kset
      expect(kset, setOf("foo"));
    });
  });
}
