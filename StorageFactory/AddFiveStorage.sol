// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

//INHERITANCE

import {SimpleStorage} from "./SimpleStorage.sol";

contract AddFiveStorage is SimpleStorage {
    //virtual: to be added in the function you want to change in the parent contract
    //override: to be added in the function you want to change in your inheritance contract

    function store(uint256 _newNumber) public override {
        myFavNum = _newNumber + 5;
    }
}
