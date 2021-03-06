package haxpression.utils;

using Lambda;

class Arrays {
  public static function contains<T>(items : Array<T>, item : T) : Bool {
    return items.indexOf(item) != -1;
  }

  public static function isEmpty<T>(items : Array<T>) : Bool {
    return items == null || items.length == 0;
  }

  public static function isFull<T>(items : Array<T>) : Bool {
    return items != null && items.length > 0;
  }

  public static function containsAll<T>(items : Array<T>, others : Array<T>) : Bool {
    if (items.length == 0 && others.length == 0) return true;
    if (items.length == 0) return false;
    if (others.length == 0) return true;
    return all(others, function(other) {
      return contains(items, other);
    });
  }

  public static function containsAny<T>(items : Array<T>, others : Array<T>) : Bool {
    if (items.length == 0 && others.length == 0) return true;
    if (items.length == 0) return false;
    if (others.length == 0) return true;
    return any(others, function(other) {
      return contains(items, other);
    });
  }

  public static function containsNone<T>(items : Array<T>, others : Array<T>) : Bool {
    if (items.length == 0 && others.length == 0) return true;
    if (items.length == 0) return true;
    if (others.length == 0) return true;
    return !containsAny(items, others);
  }

  public static function each<T>(items : Array<T>, callback : T -> Void) : Void {
    return items.iter(callback);
  }

  public static function find<T>(items : Array<T>, callback : T -> Bool) : T {
    for (item in items) {
      if (callback(item)) {
        return item;
      }
    }
    return null;
  }

  public static function any<T>(items : Array<T>, check : T -> Bool) : Bool {
    return items.find(check) != null;
  }

  public static function all<T>(items : Array<T>, check : T -> Bool) : Bool {
    return items.filter(check).length == items.length;
  }

  public static function reduce<T, TResult>(items : Array<T>, callback : TResult -> T -> TResult, acc : TResult) : TResult {
    for (item in items) {
      acc = callback(acc, item);
    }
    return acc;
  }
}
