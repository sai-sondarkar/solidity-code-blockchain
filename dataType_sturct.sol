pragma solidity >=0.5.13 <0.7.3;

contract charitySmartContract{
    address public owner;
    
    struct paymentDetails {
        uint256 amount;
        string name;
    }
    
    mapping(address => paymentDetails) public addressToEtherMap;
    
    constructor() public {
        owner = msg.sender;
    }
    
    function recieveEthers(string memory _name) public payable {
        paymentDetails memory pay = paymentDetails(msg.value,_name);
        addressToEtherMap[msg.sender] = pay;
    }
    
    function withdrawAllEthersOfSpecificAccount(address payable _to) public{
        _to.transfer(addressToEtherMap[_to].amount);
    }

}
