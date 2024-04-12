// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import "hardhat/console.sol";

contract Sample1 {
    uint256 public s1 = 0;

    /**
     * @notice Creates a new Sample1 contract with a payable constructor
     */
    constructor() payable {
        require(msg.value == 2 ether, "Need to pay 1 ETH"); // the message should send with 1 ETH
        console.log("constructor");
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
    function set(uint256 value) public payable {
        require(msg.value == 0.01 ether, "Need to pay 0.01 ETH");
        s1 = value;
    }

    /**
     * @notice Gets the contract balance
     * @return The contract balance
     */
    function getContractBalance() public view returns (uint256) {
        return address(this).balance;
    }

    /**
     * @notice Gets the balance of the contract owner
     * @return The balance of the contract owner
     */
    function getEOAAddress() public view returns (uint256) {
        return msg.sender.balance;
    }

    /**
     * @notice Self-destructs the contract and sends remaining funds to the specified recipient
     * @param recipt The address to send the remaining funds to
     */
    function destructor(address recipt) external {
        selfdestruct(payable(recipt));
    }
}
