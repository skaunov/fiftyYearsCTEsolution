// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";

contract ContractScript is Script {
    function setUp() public {}

    function run() public {
        /* returns value that could be set as `timestamp` so it would overflow `require` check 
        on the next `upsert` call */
        console.log(
            type(uint).max
            - 1 days
        );
    }
}