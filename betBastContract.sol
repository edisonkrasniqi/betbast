pragma solidity ^0.4.22;
contract BetBastFun{
    
    //inicimi i variablave te nevojshme
    address private  owneri1 = msg.sender;
    address private AdressaCoinit = 0x161c60891a6eeab02a686bdc8633acda00d44ac7;
    
    struct GameBetInfo{
        string P1;
        string P2;
        string Arena;
        uint G1;
        uint G2;
        uint perqindjaSaktesis;
    }
    
    mapping(uint => GameBetInfo) lojrat;
    
    function MbushInfo(uint _GID,string _P1,string _P2,string _Arena,uint _G1,uint _G2,uint _perqindja)
    public {
        require(owneri1 == msg.sender);
        
       /** 
        lojrat[_GID].P1 = _P1;
        lojrat[_GID].P2 = _P2;
        lojrat[_GID].Arena = _Arena;
        lojrat[_GID].G1 = _G1;
        lojrat[_GID].G2 = _G2;
        lojrat[_GID].perqindjaSaktesis = _perqindja;
        */
        
        lojrat[_GID] = GameBetInfo({
            P1 : _P1,
            P2 : _P2,
            Arena : _Arena,
            G1 : _G1,
            G2 : _G2,
            perqindjaSaktesis : _perqindja
            
        });
        
    }
    
    function BuyInfo(uint _GID,uint shuma) public payable  returns(string,string,string,uint,uint,uint){
        AdressaCoinit.delegatecall(bytes4(sha3("transferFrom(address,address,uint256)")),msg.sender,owneri1,shuma);
        
        
        //return (lojrat[_GID].P1,lojrat[_GID].P2,lojrat[_GID].Arena,lojrat[_GID].G1,lojrat[_GID].G2,lojrat[_GID].perqindjaSaktesis);
    }
    /**
    function delegatecallSetN(address _e, uint _n) {
    _e.delegatecall(bytes4(sha3("setN(uint256)")), _n); // D's storage is set, E is not modified 
  }
}*/
      
    
}
