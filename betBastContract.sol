pragma solidity ^0.4.22;


contract BetBastFun{
    
    //inicimi i variablave te nevojshme
    address private  owneri1 = 0x2d13027baa4d36e8f62931cebe63fe7064bffc34;
    address private AdressaCoinit = 0x161c60891a6eeab02a686bdc8633acda00d44ac7;
    
    struct GameBetInfo{
        string P1;
        string P2;
        string Arena;
        uint G1;
        uint G2;
        uint perqindjaSaktesis;
        uint shuma;
    }
    
    mapping(uint => GameBetInfo) lojrat;
    
    function MbushInfo(uint _GID,string _P1,string _P2,string _Arena,uint _G1,uint _G2,uint _perqindja,uint _shuma)
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
            perqindjaSaktesis : _perqindja,
            shuma : _shuma 
            
        });
        
    }
    
    function BuyInfo(uint _GID,uint256 shuma) public view  returns(string,string,string,uint256,uint256,uint256){
        require(AdressaCoinit.call("transferFrom",msg.sender,owneri1,shuma));
        
        return (lojrat[_GID].P1,lojrat[_GID].P2,lojrat[_GID].Arena,lojrat[_GID].G1,lojrat[_GID].G2,lojrat[_GID].perqindjaSaktesis);
    }
    
    function LexoShumen(uint _GID) public view returns(uint256){
        return lojrat[_GID].shuma;
    }


    
}
