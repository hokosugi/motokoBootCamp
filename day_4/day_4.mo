import Array "mo:base/Array";
import Nat "mo:base/Nat";
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
            enegy = e + 10;
        };
        return animal;
    };

    // Challenge 5
    public type List<Animal> = ?(Animal, List<Animal>);
    // さんこうまでに
    public func sample(l : List<Animal>) : async List<Animal> {
        let animal: Animal = {
            species = "cat";
            enegy = 10;
        };
        return List.push(animal, l);    
    };


  
};