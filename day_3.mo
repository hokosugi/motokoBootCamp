import Array "mo:base/Array";
import Nat32 "mo:base/Nat32";
import Char "mo:base/Char";
import Nat "mo:base/Nat";
import Iter "mo:base/Iter";
import Int "mo:base/Int";
import List "mo:base/List";

actor {
    // Challenge 1
    func swap<N>(arr: [var N], i: Nat, j: Nat) : [var N] {
        var swap_arr: [N] = [];
        var thaw_swap_arr = Array.thaw<N>(swap_arr);
        var for_swap = thaw_swap_arr[i];
        thaw_swap_arr[i] := thaw_swap_arr[j];
        thaw_swap_arr[j] := for_swap;
        return thaw_swap_arr;
    };

    // Challenge 2
    public func init_count(i: Nat) : async [Nat] {
        let arr = Array.tabulate<Nat>(
            i,
            func(x: Nat){x}
        );
        return arr;
    };

    // Challenge 3 
    public func seven(arr: [Nat]) : async Text {
        let t: Text = "Seven is found";
        let f: Text = "Seven not found";
        for (v in arr.vals()){
            for (c in Nat.toText(v).chars()){  // vが複数桁でも検索できるようにCharタイプでイテレート
                if (c == Char.fromNat32(55)){  // 55はunicodeで 7
                    return t;
                };
            };
        };
        return f;
    };
    // Challenge 4
    public func nat_opt_to_nat(n: ?Nat, m: Nat) : async Text {
        switch (n) {
            case(null){
                return Nat.toText(m);
            };
            case(?something){
                return Nat.toText(something);
            };
        };
    };
    // nat_opt_to_nat(null, 10)->10

    // Challenge 5
    public func day_of_the_week(n: Nat) : async ?Text {
        let arr = ["Monday", "Tuesday", "Wednesdday", "Thursday", "Friday", "Sturday", "Sunday"];
        if (n <= arr.size()){
            return ?arr[n-1];
        };
        return null;
    };
    // day_of_the_week(0)-> "Monday"

    // Challenge 6
    public func populate_array(arr: [?Nat]) : async [Nat] {
        let not_null_arr = Array.mapFilter<?Nat, Nat>(
            arr,
            func(x: ?Nat): ?Nat {
                if(x==null) ?0 else x
            }
        );
        return not_null_arr;
    };
    // populate_arry([1, 2,  , 4,  , 6])-> [1, 2, 0, 4, 0, 6]

    // Challenge 7
    public func sum_of_array(arr: [Nat]) : async Nat {
        return Array.foldLeft<Nat, Nat>(
            arr,
            0,
            func(x: Nat, y: Nat): Nat {x+y}
        )
    };
    // sum_of_array([1, 2, 3, 9])->15

    // Challenge 8
    public func squared_array(arr: [Nat]) : async [Nat] {
        return Array.map<Nat, Nat>(
            arr,
            func(x: Nat){Nat.pow(x, 2)}
        )
    };
    // squared_array([1, 2, 3, 9])-> [1, 4, 9, 81]

    // Challenge 9
    public func increase_by_index(arr: [Nat]) : async [Nat] {
        return Array.mapEntries<Nat, Nat>(
            arr,
            func(x: Nat, i: Nat){x+i}
        )
    };
    // increase_by_index([1, 2, 3, 9])->[1, 3, 5, 12]

    // Challenge 10
    private func contains<A>(arr: [A], a: A, f: ((A, A))->Bool) : async Bool {
        let array = Array.thaw<A>(arr);
        for (v in array.vals()){
            if (f(v, a)) return true;
        };
        return false;
    };

};