pragma solidity >=0.5.13 <0.7.3;

contract charitySmartContract{
    address public owner;
    bool public isPause;
    
    constructor() public {
        owner = msg.sender;
    }
    
    function recieveEthers() public payable {
    }
    function withdrawAllEthers() public{
        require(msg.sender == owner, "You Cannot Withdraw All ethers Coz you are not the owner");
        require(!isPause, "Contract is Paused, we cnt withdraw the money");
        address payable to = msg.sender;
        to.transfer(address(this).balance);
    }
    
    function setPause( bool _ispause) public{
        require(msg.sender == owner, "You Dont have access to this function");
        isPause = _ispause;
    }
    
    function setNewOwner( address _newOwner) public{
        require(msg.sender == owner, "You Dont have access to this function");
        require(!isPause, "Contract is Paused, we cnt withdraw the money");
        owner = _newOwner;
    }
    
    function terminateThisSmartContract() public{
        require(msg.sender == owner, "You Dont have access to this function");
        require(!isPause, "Contract is Paused, we cnt withdraw the money");
        address payable to = msg.sender;
        selfdestruct(to);
    }
    
}
