// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity 0.8.16;

abstract contract ERC20 {
    function transferFrom(address _from, address _to, uint256 _value) public virtual returns(bool success);
    function decimals() public virtual returns(uint8);
}

contract TokenSale {

    uint tokenPriceInWie = 1 ether;

    ERC20 public token;
    address public tokenOwner;

    constructor(address _token){
        tokenOwner = msg.sender;
        token = ERC20(_token);
    }

    function purchaseCoffee() public payable {
        require(msg.value >= tokenPriceInWie, "Not enough money send");
        uint tokensToTransfer = msg.value / tokenPriceInWie;
        uint remainder = msg.value - tokensToTransfer * tokenPriceInWie;
        token.transferFrom(tokenOwner, msg.sender, tokensToTransfer * 10 ** token.decimals());
        payable(msg.sender).transfer(remainder); // sending rest of the money back;
    }
}