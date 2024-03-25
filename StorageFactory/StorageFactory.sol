// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "./SimpleStorage.sol";

contract StorageFactory{

    SimpleStorage[] public listOfSimpleStorage;

    function createSimpleStorage() public {
       SimpleStorage simpleStorage = new SimpleStorage();
       listOfSimpleStorage.push(simpleStorage);
    }

    
}