// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity 0.8.16;

import "./Ownable.sol";

contract InheritanceModifierExample is Owner{

    mapping(address => uint) public tokenBalance;

    uint tokenPrice = 1 ether;

    constructor() {
        tokenBalance[msg.sender] = 100;
    }

    
    function createNewToken() public onlyOwner{
        tokenBalance[owner]++;
    }

    function burnToken() public {
        tokenBalance[owner]--;
    }

    function purchaseToken() public payable{
        require((tokenBalance[owner] * tokenPrice)/msg.value > 0, "Not enough tokens");
        tokenBalance[owner] -= msg.value/tokenPrice;
        tokenBalance[msg.sender] += msg.value/tokenPrice;
    }

    function sendToken(address _to, uint _amount) public {
        require(tokenBalance[msg.sender] >= _amount, "Not enough tokens");
        tokenBalance[msg.sender] -= _amount;
        tokenBalance[_to] += _amount;
    }
}
