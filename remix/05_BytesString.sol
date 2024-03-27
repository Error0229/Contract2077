// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

contract BytesString {
    bytes myBytes; // Dynamic byte array
    string myString1 = ""; // String variable
    string myString2 = ""; // String variable
    /**
     * @notice Creates a new BytesString contract
     * @param initBytes The initial bytes to be stored in the contract
     * @param initString The initial string to be stored in the contract
     */
    constructor(bytes memory initBytes, string memory initString) {
        myBytes = initBytes; // Assign the initial bytes to myBytes
        //myBytes.length++;

        myString1 = initString; // Assign the initial string to myString1
        myString2 = myString1; // Assign the value of myString1 to myString2

        string memory myString3 = myString1; // Assign the value of myString1 to myString3

        string memory myString4 = "ABC"; // Assign the string "ABC" to myString4
        myString4 = "CDEFG"; // Assign the string "CDEFG" to myString4

        string memory myString5 = "ABC"; // Assign the string "ABC" to myString5

        string memory myString6 = initString; // Assign the initial string to myString6
    }
}
