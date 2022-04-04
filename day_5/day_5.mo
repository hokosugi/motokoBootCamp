import Principal "mo:base/Principal";
import HashMap "mo:base/HashMap";
import Cycle "mo:base/ExperimentalCycles";

actor {
    // Challenge 1
    public shared({caller}) func is_anonymous() : async Bool {
        let anonymous_principal: Text = "2vxsx-fae";
        if (Principal.toText(caller) == anonymous_principal) return true;
        return false;
    };

    // Challenge 2
    var favoriteNumber = HashMap.HashMap<Principal, Nat>(0, Principal.equal, Principal.hash);

    // Challenge 3
    public shared({caller}) func add_favorite_number1(n: Nat) : async () {
        favoriteNumber.put(caller, n); 
    };
    public shared({caller}) func show_favorite_number() : async ?Nat {
        let num = favoriteNumber.get(caller);
        switch(num){
            case(null) return null;
            case(_) return num;
        };
    };

    // Challenge 4
    public shared({caller}) func add_favorite_number2(n: Nat) : async Text {
        let num = await show_favorite_number();
        switch(?num){
            case(?null){
                favoriteNumber.put(caller, n);
                return "You've successfully registered your number";
            };
            case(_){
                return "You've already registered your number";
            };
        };    
    };

    // Challenge 5
    public shared({caller}) func update_favorite_number(n: Nat) : async Text {
        let val = await show_favorite_number();
        switch (?val){
            case(?null) return "there is no this key's value";
            case(_) {
                let before_update = favoriteNumber.replace(caller, n);
                let after_update = favoriteNumber.get(caller);
                return "update done";
            };
        };
    };
    public shared({caller}) func delete_favorite_number() : async Text {
        favoriteNumber.delete(caller);
        return "delete!";
    };

    // Challenge 6
    public shared({caller}) func deposit_cycles() : async Nat {
        let available = Cycle.available();
        return Cycle.accept(available);
    };

    // Challenge 7
    private func withdraw_cycles(n: Nat) : async Nat {
        Cycle.add(n);
        await deposit_cycles(); //from deposit_cycles canister ex.FromCanister.deposit_cycles();
    };
    
    // Challenge 8
    private stable var version_number : Nat = 0;
    system func preupgrade() {
        version_number += 1;
    };
    public func get_version() : async Nat {
        return version_number;
    };

    // Challenge 10 see challenge_10.mo
    
  
};