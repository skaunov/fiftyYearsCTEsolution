// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";

contract ContractScript is Script {
    function setUp() public {}

    function run() public {
        /* returns minimal value that would 
        be accepted by `upsert` to manipulate 
        `head` variable in storage */
        console.log(3233754840 + 1 days);
    }
}
