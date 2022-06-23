//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Whitelist{
    uint public maxWhitelistedAddresses;
    uint public numAddressesWhitelisted;
    mapping(address => bool) public whitelistedAddresses;

    constructor(uint _maxWhitelistedAddresses){
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    function addAddressToWhitelist() public {

        require(!whitelistedAddresses[msg.sender], "Sender already whitelisted");
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "We reached our maximum capacity");

        whitelistedAddresses[msg.sender] = true;
        numAddressesWhitelisted +=1;
    }
}
