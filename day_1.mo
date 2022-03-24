// motoko play groundでデプロイしてください
// https://m7sm4-2iaaa-aaaab-qabra-cai.raw.ic0.app/


import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Array "mo:base/Array";
import Iter "mo:base/Iter";


actor {

    // Challenge 1
    public func add ( m : Nat, n : Nat ) : async Nat {
        return Nat.add( m, n );
    };

    // Challenge 2
    public func square ( n : Nat ) : async Nat {
        return Nat.mul( n, n );
    };

    // Challenge 3
    public func days_to_second ( n : Nat ) : async Nat {
        let hours = 24;
        let times = 60;
        let seconds = 60;
        return n * hours * times* seconds;
    };

    // Challenge 4
    var c : Nat = 0;
    public func increment_counter ( n : Nat ) : async Nat {
        if ( c == n ) return c;
        c += 1;
        return c;
        };
    };
    public func clear_counter ( c : Nat ) : async Nat {
        c := 0;
        return c;
    };

    // Challenge 5
    public func divides ( m : Nat, n : Nat) : async Bool {
        if ( m % n == 0 ) {
            return true;
        } else {
            return false;
        };
    };

    // Challenge 6
    public func is_even ( n : Nat ) : async Bool {
        if ( n % 2 == 0 ) {
         return true;
        } else {
            return false;
        };
    };

    // Challenge 7
    public func sum_of_array ( arr : [Nat] ) : async Nat {
        var sum = 0;
        if ( arr.size() == 0 ) return sum;
        for ( v in arr.vals() ) {
            sum += v;
        };
        return sum;
    };

    // Challenge 8
    public func maximum ( arr : [Nat] ) : async Nat {
        var sum = 0;
        if ( arr.size() == 0 ) return sum;
        // Array.sort(arr, Nat.compare);
        for ( v in arr.vals() ) {
            if ( v > sum ) sum := v;
        };
        return sum;
    };

    // Challenge 9
    public func remove_from_array ( array : [Nat], n : Nat) : async [Nat] {
        var new_arr : [Nat] = [];
        for ( v in array.vals() ) {
            if ( v != n ) {
                new_arr := Array.append<Nat>( new_arr, [v] );
            };
        };
        return new_arr;
    };

    // Challenge 10
    public func selection_sort ( arr : [Nat] ) : async [Nat] {
        var new_arr : [var Nat] = Array.thaw<Nat>(arr);
        for (i in Iter.range(0, new_arr.size()-1)) {
            var v_lower : Nat = new_arr[i];
            var j_nat : Nat = i;
            for (j in Iter.range(i, new_arr.size()-1)) {
                let v_j : Nat= new_arr[j];
                if (v_lower > v_j) {
                    v_lower := v_j;
                    j_nat := j;
                    Debug.print(debug_show(v_lower));
                };
            };
            new_arr[j_nat] := new_arr[i];
            new_arr[i] := v_lower;
        };
        let freeze_arr : [Nat] = Array.freeze<Nat>(new_arr);
        return freeze_arr;
    };
};