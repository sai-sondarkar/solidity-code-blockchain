pragma solidity >=0.5.13 < 0.7.3;

contract dataTypes{
    
    address public myAddr;
    uint256 public totalBal;
    
    constructor() public{
        myAddr = msg.sender; // This is storing the value of the deploying account 
    }
    function reciveEthers()  public payable {
        totalBal += msg.value;
    }
    function withdrawEthers() public{
        address payable to = msg.sender;
        to.transfer(address(this).balance);
    }
    function withdrawEthersToThisEOA(address payable _EOAAddr ) public{
        _EOAAddr.transfer(address(this).balance);
    }
    
    function currentEtherInContrat() public view returns(uint256){
        return address(this).balance;
    }
}
