// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

contract Convert {
    /**
     * @notice Converts an 8-bit unsigned integer to a 128-bit unsigned integer
     */

    function test1() public pure {
        uint8 len8 = 10;
        uint128 len128 = len8;
    }
    /**
     * @notice Converts an 8-bit signed integer to a 128-bit unsigned integer, this will throw an error
     */
    function test2() public pure returns (uint128) {
        int8 len8 = -10;
        uint128 len128 = len8;
        // uint128 len128 = uint128(len8);
    }
}
