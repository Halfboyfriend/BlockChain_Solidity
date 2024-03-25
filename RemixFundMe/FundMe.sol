// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import {PriceConverter} from "./PriceConverter.sol";

contract FundMe {
    using PriceConverter for uint256;
    uint256 public constant MIN_USD = 5e18;
    address public owner;
    bool public setWithdrawal;

    struct Users {
        uint256 amount;
        uint256 dob;
    }
    address[] public funders;

    mapping(address => Users) public user;

    constructor() {
        owner = msg.sender;
    }

    function fund() public payable returns (bool) {
        // require(
        //     msg.value.getConversionRate() >= MIN_USD,
        //     "Your value must be greater than 5$"
        // );

        Users storage currentUser = user[msg.sender];
        currentUser.amount += msg.value;
        currentUser.dob = block.timestamp;
        funders.push(msg.sender);
        return true;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Onlyowner can call");
        _;
    }

    function setWithdrawalFunc() public onlyOwner {
        setWithdrawal = true;
    }

    function Userwithdraw() public {
        require(setWithdrawal, "Withdrawal not available");
        require(
            user[msg.sender].amount > 0,
            "User has no withdrawable balance"
        );

        (bool callSuccess, ) = payable(msg.sender).call{
            value: user[msg.sender].amount
        }("");

        user[msg.sender].amount = 0;

        require(callSuccess, "Failed transaction");
    }
}
