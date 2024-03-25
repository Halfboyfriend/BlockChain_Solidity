// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

contract RollyDb{

//0x8D17608b2b995BBdE509776c17de7C4936237bd0
//0x19d8E67EB29eF9eE18033fA9D2b874Cf41caD3b5
    address account;
    string owner;

    struct Person {
        string fname;
        string lname;
        uint256 age;

    }
    mapping(address => Person) public Users;

    Person[] public listOfRegisteredUsers;

    // Person public sam = Person({favNumber: 30,name: "Joseph"});

    constructor(string memory _account){
        owner = _account;
        
    }

    function RegisterUser(address _address, string memory _user, string memory _name, uint _age) public  {
        Person memory newPerson;
        newPerson.age = _age;
        newPerson.fname = _user;
        newPerson.lname = _name;
        listOfRegisteredUsers.push(newPerson);
        Users[_address] = newPerson;
    }

    

}