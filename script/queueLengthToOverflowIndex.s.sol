// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";

contract ContractScript is Script {
    function setUp() public {}

    function run() public {
        // returns number of `queue` storage variable elements to reach storage slot #0
        /* it could be manipulated via `value` of `upsert` call, but amount is too high even for
        a testnet */
        console.log(
            (
                type(uint).max
                - 0x290decd9548b62a8d60345a988386fc84ba6bc95484008f6362f93160ef3e563
            ) / 2
        );
    }
}