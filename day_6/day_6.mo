import HashMap "mo:base/HashMap";
import Principal "mo:base/Principal";
import Nat "mo:base/Nat";
import Hash "mo:base/Hash";
import Result "mo:base/Result";
import List "mo:base/List";
import HTTP "http";
import Text "mo:base/Text";
import Iter "mo:base/Iter";

actor {
    // Challenge 1
    public type TokenIndex = Nat;
    public type Error = {
        #notFound;
        #alreadyExists;
        #notValid;
        #anonymous;
    };
    private stable var registry_state : [(TokenIndex, Principal)] = [];

    // Challenge 2
    var registry: HashMap.HashMap<TokenIndex , Principal> = HashMap.HashMap(0, Nat.equal, Hash.hash);

    // Challenge 3
    stable var nextTokenIndex: Nat = 0;
    public type Result<T, E> = Result.Result<T, E>;
    public shared({caller}) func mint() : async Result<(), Text> {
        if (Principal.isAnonymous(caller)) return #err("This caller is anonymous");
        registry.put(nextTokenIndex, caller);
        nextTokenIndex += 1;
        return #ok;
    };

    // Challenge 4
    public shared({caller}) func transfer(to: Principal, t: TokenIndex): async Result<Text, Text>{
        switch(registry.get(t)){
            case(null) return #err("not found second argument's principal");
            case(?p) {
                if (p!=caller){
                    let replaced = registry.replace(t, to);
                    if (replaced == null) return #err("something wrong");
                };
                return #ok("replaced");
            };
        };
    };

    // Challenge 5
    var list: List.List<TokenIndex> = List.nil();
    public shared({caller}) func balance(): async List.List<TokenIndex> {
        for ((k, v) in registry.entries()) {
            if (Principal.toText(caller)==Principal.toText(v)){
                list := List.push(k, list);
            };
        };
        return list;
    };

    // Challenge 6 see http.mo
    public query func http_request(request : HTTP.Request) : async HTTP.Response {
        let last_principal = switch(registry.get(nextTokenIndex)){
            case(?p) Principal.toText(p);
            case(null) "nothing";
        };

        let response = {
            body = Text.encodeUtf8("{\"token_count\" : \"" # Nat.toText(registry.size()) # "\", \"last_principal\" : \"" # last_principal # " }");
            headers = [("Content-Type", "text/html; charset=UTF-8")];
            status_code = 200 : Nat16;
            streaming_strategy = null
        };
      return response;
    };

    // Challenge 7
    system func preupgrade() {
        registry_state := Iter.toArray(registry.entries());
    };

    system func postupgrade() {
        registry := HashMap.fromIter<TokenIndex, Principal>(registry_state.vals(), registry_state.size(), Nat.equal, Hash.hash);
    };

    // Challenge 8
    // from other canister
    let other_canister : actor {hello : () -> async Text;} = actor("this canister");

    // should do test on other_canister

    // public func test() : async Text {
    //     return(await other_canister.mint())
    // };

    // Challenge 9 see challenge_9.mo




  
};
