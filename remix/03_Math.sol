// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

library Math {
    function add(int a, int b) public pure returns (int c) {
        return a + b;
    }

    function add(uint a, uint b) public pure returns (uint c) {
        return a + b;
    }
}
