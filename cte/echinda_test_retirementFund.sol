// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;
import "./retirementFund.sol";

contract TestFund is RetirementFundChallenge(msg.sender) {
    address echidna_caller = msg.sender;

    constructor() payable {
        beneficiary = echidna_caller;
    }

    // add the property
    function echidna_test_balance() public view returns (bool) {
        
        //uint256 withdrawn = startBalance - address(this).balance;
        //return (withdrawn > 0);
        return address(this).balance == 0;
    }
}
