// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

contract Enum {
    // Define the enum type
    enum Month {
        JAN,
        FEB,
        MAR,
        APR,
        MAY,
        JUN,
        JUL,
        AUG,
        SEP,
        OCT,
        NOV,
        DEC
    }
    Month choice; // Declare a variable of type Month
    /**
     * @notice Sets the value of the Month variable
     * @param value The value to set the Month variable to
     */
    function setMonth(Month value) public {
        choice = value;
    }
    /**
     * @notice Gets the value of the Month variable
     * @return choice The value of the Month variable
     */
    function getMonth() public view returns (Month) {
        return choice;
    }
}
