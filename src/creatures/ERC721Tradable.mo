import ERC721 "./ERC721.mo";
import Principal "mo:base/Principal";
import Text "mo:base/Text";
import Nat "mo:base/Nat";

actor ERC721Tradable{
    // initralized principal proxyRegistryAddress
    
    //current token id
    private var _currentTokenId : Nat = 0;

    //constructer



    /**
     * @dev Mints a token to an address with a tokenURI.
     * @param _to address of the future owner of the token
    */
    public shared(msg) func mintTo(to : Principal) {
        //assert(msg.caller == owner);
        var newTokenId : Nat = _getNextTokenId();
        ERC721._mint(to, newTokenId);
        _incrementTokenId();
    };


    /**
     * @dev calculates the next token ID based on value of _currentTokenId
     * @return uint256 for the next token ID
     */
    private func _getNextTokenId() : Nat {
        _currentTokenId+1
    };


    /**
     * @dev increments the value of _currentTokenId
    */    
    private func _incrementTokenId(){
        _currentTokenId++;
    };


    //function baseTokenURI() virtual public pure returns (string memory);
    public func baseTokenURI() : Text{
        ""
    };

    public func tokenURI(_tokenId : Nat) : Text{
        Nat.toText(_tokenId)
    };
    

};