// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity 0.8.16;

contract MyContract {
    uint public myUint = 123;

    function setMyUint(uint _newUint) public {
        myUint = _newUint;
    }
}