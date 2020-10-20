pragma solidity >=0.5.13 <0.7.3;

contract charitySmartContract{
    address public owner;
    bool public isPause;
    
    constructor() public {
        owner = msg.sender;
    }
    
    mapping(address=> uint) public check_transactions;
//  To check the transactions by address that how much who has donated
    
    modifier check_owner{
 //     modifier will help to give as many functions the property of underlying task no need to repeat the task again and again  
        require(msg.sender == owner, "You Cannot Withdraw All ethers Coz you are not the owner");
        _;
    }
    
    modifier check_pause{
 //     modifier will help to give as many functions the property of underlying task no need to repeat the task again and again  
        require(!isPause, "Contract is Paused, we cnt withdraw the money");
        _;
    }

    function recieveEthers() public payable {
         check_transactions[msg.sender] = msg.value ;
        
    }
    function withdrawAllEthers() public check_pause check_owner{
//       require(msg.sender == owner, "You Cannot Withdraw All ethers Coz you are not the owner");
//       require(!isPause, "Contract is Paused, we cnt withdraw the money");
        address payable to = msg.sender;
        to.transfer(address(this).balance);
    }
    
    function setPause( bool _ispause) public check_owner{
//        require(msg.sender == owner, "You Dont have access to this function");
        isPause = _ispause;
    }
    
    function setNewOwner( address _newOwner) public check_pause check_owner{
//        require(msg.sender == owner, "You Dont have access to this function");
//        require(!isPause, "Contract is Paused, we cnt withdraw the money");
        owner = _newOwner;
    }
    
    function terminateThisSmartContract() public check_pause check_owner{
//        require(msg.sender == owner, "You Dont have access to this function");
//        require(!isPause, "Contract is Paused, we cnt withdraw the money");
        address payable to = msg.sender;
        selfdestruct(to);
    }
    
    
}
