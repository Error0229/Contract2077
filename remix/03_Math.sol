// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

library Math {
    /**
     * @notice Adds two integers and returns the result
     * @param a The first integer
     * @param b The second integer
     * @return c The result of the addition
     */
    function add(int a, int b) public pure returns (int c) {
        return a + b;
    }
    /**
     * @notice Adds two unsigned integers and returns the result
     * @param a The first unsigned integer
     * @param b The second unsigned integer
     * @return c The result of the addition
     */
    function add(uint a, uint b) public pure returns (uint c) {
        return a + b;
    }
}
