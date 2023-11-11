// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";
import {DeployFundMe} from "../script/DeployFundMe.s.sol";

contract FundMeTest is Test {
    FundMe FundMe_one;

    function setUp() external {
        // FundMe_one = new FundMe(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        DeployFundMe item = new DeployFundMe();
        FundMe_one = item.run();
    }

    function testMinUsdIsFive() public {
        assertEq(FundMe_one.MINIMUM_USD(), 5e18);
    }

    function testOwnerIsMsgSender() public {
        assertEq(FundMe_one.i_owner(), msg.sender);
    }
    
    function testPriceFeedVersionIsCorrect() public {
        uint256 version = FundMe_one.getVersion();
        console.log(version);
        console.log("hello guys");
        assertEq(version,4);
    }
}
