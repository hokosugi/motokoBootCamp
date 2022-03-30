import Array "mo:base/Array";
import Nat32 "mo:base/Nat32";
import Char "mo:base/Char";
import Nat "mo:base/Nat";
import Iter "mo:base/Iter";
import Int "mo:base/Int";
import List "mo:base/List";


import Favorite_type "custom";
import Animal "animal";
import module_list "list";


actor {
    // Challenge 1
    public type My_favorite = Favorite_type.Favorite_type;
    public func fun() : async My_favorite {
        let my_favorite: My_favorite = {
            body = "slim";
            size = "small";
            spicies = "Japanese"
        };
        return my_favorite;
    };
    // fun()->{body: "slim"; size: "small"; spicies: "Japanese"}

    // Challenge 2
    public type Animal = Animal.Animal;

    // Challenge 3 (see animal.mo)

    // Challenge 4
    public func create_animal_then_takes_a_break(s: Text, e: Nat) : async Animal {
        let animal: Animal = {
            species = s;
            energy = e;
        };
        let animal_sleep = Animal.animal_sleep(animal);
        return animal_sleep;
    };

    // Challenge 5
    public type List<Animal> = ?(Animal, List<Animal>); // list.moで利用
    var list_animals = List.nil<Animal>();
    // さんこうまでに
    public func sample(l : List<Animal>) : async List<Animal> {
        let animal: Animal = {
            species = "cat";
            energy = 10;
        };
        return List.push(animal, l);    
    };

    // Challenge 6
    public func push_animal(a: Animal) : async () {
        list_animals := List.push(a, list_animals);
    };
    public func get_animals() : async [Animal] {
        let array_animals = List.toArray(list_animals);
        return array_animals;
    };

    // Challenge 7 *課題ではないものの実行するのに
    public func challenge7(l: List<Text>) : async Bool {
        return module_list.is_null<Text>(l);
    };

    // Challenge 8 *課題ではないものの実行するのに
    public func challenge8(l: List<Text>) : async ?Text {
        return module_list.last<Text>(l);
    };

    // Challenge 9 *課題ではないものの実行するのに
    public func challenge9(l: List<Text>) : async Nat {
        return module_list.size<Text>(l);
    };

    // Challenge 10 *課題ではないものの実行するのに
    public func challenge10(l: List<Text>, n: Nat) : async ?Text {
        return module_list.get<Text>(l, n);
    };
 
    // Challenge 11 *課題ではないものの実行するのに
    public func challenge11(l: List<Text>) : async List<Text> {
        return module_list.reverse<Text>(l);
    };

};
