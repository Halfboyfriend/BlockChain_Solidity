// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract PriceConsumer{

    AggregatorV3Interface internal priceFeed;

    constructor () {
        priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);

    }

    function getLatestPrice() public view returns(uint256){
        (, int price, , , ) = priceFeed.latestRoundData();
        return uint256(price * 1e10);
    }

}

//3352.51843523