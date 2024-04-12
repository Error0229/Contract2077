// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import "hardhat/console.sol";

contract Sample1 {
    int a;

    /**
     * @notice Creates a new Sample1 contract with a payable constructor
     */
    constructor() payable {}

    /**
     * @notice Fallback function to receive Ether
     */
    function set(int value) public payable {
        a = value;
    }

    /**
     * @notice Receive function to receive Ether
     */
    function get() public view returns (int) {
        return a;
    }
}

contract Sample2 {
    Sample1 s1;

    /**
     * @notice Creates a new Sample2 contract with a payable constructor
     */
    constructor() payable {
        s1 = (new Sample1){value: 10}();
    }

    /**
     * @notice Fallback function to receive Ether
     */
    fallback() external payable {
        console.log("fallback");
    }

    /**
     * @notice Receive function to receive Ether
     */
    receive() external payable {
        console.log("receive");
    }

    /**
     * @notice Sets the value of s1
     * @param value The new value to set
     */
    function set(int value) public {
        s1.set{value: 10}(value); //0.6.2
    }

    /**
     * @notice Gets the value of s1
     * @return The value of s1
     */
    function get() public view returns (int) {
        return s1.get();
    }

    /**
     * @notice Gets the contract balance
     * @return The contract balance
     */
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    /**
     * @notice Gets the balance of the contract owner
     * @return The balance of the contract owner
     */
    function getS1Address() public view returns (address) {
        return address(s1);
    }
}
