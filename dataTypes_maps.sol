pragma solidity >=0.5.13 <0.7.3;

contract charitySmartContract{
    address public owner;
    
    mapping(address => uint) public addressToEtherMap;
    
    constructor() public {
        owner = msg.sender;
    }
    
    function recieveEthers() public payable {
        addressToEtherMap[msg.sender] = msg.value;
    }
    
    function withdrawAllEthersOfSpecificAccount(address payable _to) public{
        _to.transfer(addressToEtherMap[_to]);
    }

}
