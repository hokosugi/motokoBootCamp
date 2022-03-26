import Array "mo:base/Array";
import Nat32 "mo:base/Nat32";
import Char "mo:base/Char";
import Nat "mo:base/Nat";
import Iter "mo:base/Iter";
import Int "mo:base/Int";

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

    // Challenge 3 Char.isDigitをつかった方が良いかも
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
    public func nat_opt_to_nat(n: ?Nat, m: Nat) : async ?Nat {
        switch (n) {
            case(?Nat){
                return n;
            };
            case(null){
                return ?m;
            };
        };
    };

    // Challenge 5
    public func day_of_the_week(n: Nat) : async ?Text {
        let arr = ["Monday", "Tuesday", "Wednesdday", "Thursday", "Friday", "Sturday", "Sunday"];
        if (n <= arr.size()){
            return ?arr[n-1];
        };
        return null;
    };


};