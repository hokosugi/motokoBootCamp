import Array "mo:base/Array";
import Nat32 "mo:base/Nat32";
import Char "mo:base/Char";
import Nat "mo:base/Nat";
import Iter "mo:base/Iter";
import Int "mo:base/Int";
import List "mo:base/List";

import Favorite_type "custom";
import Animal "animal";


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
    public type List<Animal> = ?(Animal, List<Animal>);
    var list_animals = List.nil<Animal>();
    // 参考までに
    public func sample(l : List<Animal>) : async List<Animal> {
        let animal: Animal = {
            species = "cat";
            energy = 10;
        };
        return List.push(animal, l);    
    };


  
};
