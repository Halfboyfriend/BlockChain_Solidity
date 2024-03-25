// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

contract Start {
    uint256 public value;
    struct Users{
        uint256 id;
        string name;
        uint256 age;
    }
    mapping(address => Users) public valueMap;

    function setValueMap(uint256 _id, string memory _name, uint256 _age) public {
        valueMap[msg.sender] = Users(_id, _name, _age);
    }

    function getValueMap() public view returns (uint256, string memory, uint256) {
        return (valueMap[msg.sender].id, valueMap[msg.sender].name, valueMap[msg.sender].age);
    }
    function setValue(uint256 _value) public {
        value = _value;
    }
}