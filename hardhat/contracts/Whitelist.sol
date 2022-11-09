//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Whitelist {

    uint8 public maxWhitelistedAddresses; // max users
    mapping(address => bool) public whitelistedAddresses; // e.g "adress -> true" if whitelisted
    uint8 public numAddressesWhitelisted; // number of address with true in the map

    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses =  _maxWhitelistedAddresses;
    }

    /**
        addAddressToWhitelist - This function adds the address of the sender to the whitelist
     */
    function addAddressToWhitelist() public {
        require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted");
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "Limit of whitelisted adresses reached.");
    
        whitelistedAddresses[msg.sender] = true;
        numAddressesWhitelisted += 1;
    }

}