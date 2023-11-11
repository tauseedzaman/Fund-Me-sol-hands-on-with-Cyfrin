// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";

import {FundMe} from "../src/FundMe.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployFundMe is Script {
    function run() external returns (FundMe) {

        HelperConfig helper_config = new HelperConfig(); 
        address ethUsdPriceFeed = helper_config.ActiveNetworkConfig();

        vm.startBroadcast();
        FundMe FundMe_script = new FundMe(ethUsdPriceFeed);
        vm.stopBroadcast();
        return FundMe_script;
    }
}
