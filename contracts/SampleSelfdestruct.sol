// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity 0.8.16;

contract SelfdestructSample {

    receive() external payable {}

    function selfDestruct() public {
        selfdestruct(payable(msg.sender));
    }
}