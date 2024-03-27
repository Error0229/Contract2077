// SPDX-License-Identifier: MIT

pragma solidity ^0.4.26;
// define a contract named Var
contract Var {
    /**
     * @notice Converts an 8-bit signed integer to a 128-bit signed integer
     * @return len128 The 128-bit signed integer
     */
    function test1() public pure returns (int8 value) {
        int8 number = 10;
        var auto = number; // auto is int8
        return auto;
    }
    /**
     * @notice Converts an 8-bit unsigned integer to a 128-bit unsigned integer
     * @return value The 128-bit unsigned integer
     */
    function test2() public pure returns (uint value) {
        uint8 x = 10;
        var y = x; // y is uint8
        for (y = 0; y < 100; y++) {
            //do something
        }
        return y;
    }
}
