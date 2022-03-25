// motoko play groundでデプロイしてください
// https://m7sm4-2iaaa-aaaab-qabra-cai.raw.ic0.app/


import Nat "mo:base/Nat";
import Nat8 "mo:base/Nat8";
import Array "mo:base/Array";
import Char "mo:base/Char";
import Iter "mo:base/Iter";
import Int "mo:base/Int";
import Text "mo:base/Text";
import Blob "mo:base/Blob";


actor {
    // Challenge 1
    public func nat_to_nat8(n: Nat) : async ?Nat8 {
        if (n > 2**8) return null;
        return ?Nat8.fromNat(n);
    };
    // nat_to_nat8(10)->10 (Nat), nat_to_nat8(2**9)->null 

    // Challenge 2
    public func max_number_with_n_bits(n: Nat) : async Nat {
        return Nat.pow(2, n)-1;
    };
    // max_number_with_n_bits(4)->15

    // Challenge 3
    public func decimal_to_bits(n: Nat) : async Text {
        var bits_arr: [Nat] = [];
        var reverse_bits_Text = "";
        var m = n;
        while (m >= 1) {
            if (m == 1) {
                bits_arr := Array.append<Nat>(bits_arr, [1]);
                m := 0;
            } else if (n % 2 == 0){
                bits_arr := Array.append<Nat>(bits_arr, [0]);
                m := m / 2;
            } else {
                bits_arr := Array.append<Nat>(bits_arr, [1]);
                m := (m-1) / 2;
            };
        };
        for (i in Iter.revRange(bits_arr.size()-1, 0)){
            reverse_bits_Text := Text.concat(reverse_bits_Text, Nat.toText(bits_arr[Int.abs(i)]));
        };
        return reverse_bits_Text;
    };
    // decimal_to_bits(15)->"1111"

    // Challenge 4
    public func capitalize_character(c: Char) : async Text {
        let nat32 = Char.toNat32(c);
        let char: Char = Char.fromNat32(nat32-32);
        return return Char.toText(char);
    };
    // capitalize_character(97)->"A"

    // Challenge 5
    public func capitalize_text(t: Text) : async Text {
        var text: Text = "";
        for (char in t.chars()){
            let nat32 = Char.toNat32(char);
            if (97 <= nat32 and nat32 <= 122){
                let back_to_char = nat32 - 32;
                text := Text.concat(text, Char.toText(Char.fromNat32(back_to_char)));
            } else {
                text := Text.concat(text, Char.toText(char));
            };
        };
        return text;
    };
    // capitalize_text("test")->"TEST"

    // Challenge 6
    public func is_inside(t: Text, c: Char) : async Bool {
        for (char in t.chars()){
            if (char == c) return true;
        };
        return false;
    };
    // is_inside("test", 116)->true, is_inside("test", 117)->false

    // Challenge 7
    public func  trim_whitespace(t: Text) : async Text {
        var text = t;
        let n : Nat32 = 32;
        let c_from_n : Char = Char.fromNat32(n);
        let c : Text.Pattern = #char c_from_n;
        text := Text.replace(text, c, "");   //cを""で置き換え
        text := Text.trim(text, c);          //文字列前後をtrim
        return text;
    };
    // trim_whitespace(" t e s t ")->"test"

    // Challenge 8
    public func duplicated_character(t: Text) : async Text {
        var i: Nat = 0;
        let n: Nat32 = 0;
        var one_before: Char = Char.fromNat32(n);
        for (char in t.chars()){
            switch(i){
                case(0){
                    one_before := char;
                };
                case(_){
                    if (char == one_before){
                        return Char.toText(char);
                    };
                    one_before := char;
                };
            };
        };
        return t;
    };
    // duplicated_character("challenge")->"l"

    // Challenge 9
    public func size_in_bytes(t: Text) : async Nat {
        let b: Blob = Text.encodeUtf8(t);
        return b.size();
    };
    // size_in_bytes("test")->4

    // challenge 10
    public func bubble_sort(arr: [Nat]) : async [Nat] {
        var sorted_arr:[var Nat] = Array.thaw<Nat>(arr);
        for (i0 in Iter.range(0, sorted_arr.size()-1)){
            for (i1 in Iter.range(i0+1, sorted_arr.size()-1)){
                if (sorted_arr[i0] >= sorted_arr[i1]) {
                    let n = sorted_arr[i0];
                    sorted_arr[i0] := sorted_arr[i1];
                    sorted_arr[i1] := n;
                };
            };
        };
        return Array.freeze(sorted_arr);
    };
    // bubble_sort([4, 2, 7])->[2, 4, 7]
  
};