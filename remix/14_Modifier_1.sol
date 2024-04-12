// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

contract ModifierDemo {
    address owner; //位址型別的變數
    int a = 90;
    /**
     * @notice Modifier to check if the caller is the owner
     */
    modifier modifier1(int b) {
        int c = b;
        _;
        c = a;
        a = 80;
    }
    /**
     * @notice Modifier to check if the caller is the owner
     */
    modifier modifier2() {
        int c = a;
        _;
    }

    /**
     * @notice Modifier to check if the caller is the owner
     */
    modifier modifier3() {
        a = 70;
        return;
        _;
        a = 60;
    }

    /**
     * @notice Modifier to check if the caller is the owner
     */
    modifier modifier4() {
        int c = a;
        _;
    }

    /**
     * @notice Creates a new ModifierDemo contract
     */
    constructor() {
        owner = msg.sender;
    }
    /**
     * @notice Sets the value of a
     */
    function setA() public modifier1(a) modifier2 modifier3 modifier4 {
        // int c = b;
        // int c = a;
        // a = 70;
        // return;
        // ...
        a = 50;
    }

    /**
     * @notice Gets the value of a
     * @return a The value of a
     */
    function getA() public view returns (int) {
        return a;
    }
}
