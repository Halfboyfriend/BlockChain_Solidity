// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

contract SimpleStorage{

    uint256 myFavNum;

    struct Person{
        uint256 favNum;
        string name;
    }

    Person[] public ListOfPeople;

    mapping(string => uint256) public nameToFavNum;

    function store(uint256 _favNum) public virtual {
        myFavNum = _favNum;
    }

    function retrieve() public view returns(uint256){
        return myFavNum;
    }

    function addPerson(string memory _name, uint256 _age) public{
        ListOfPeople.push(Person(_age, _name));
        nameToFavNum[_name] = _age;
    }


}