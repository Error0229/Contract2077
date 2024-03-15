// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// Import the Math contract from the file "03_Math.sol"
import "./03_Math.sol";

/**
 * @title Structure
 * @dev Implements basic contract structure with owner restrictions and data manipulation
 */
contract Structure {
    address owner; // Owner's address of the contract
    uint data; // Data stored in the contract

    // Event declaration for logging data changes
    event LogData(uint dataToLog);

    /**
     * @dev Modifier to restrict function access to the contract's owner
     * Reverts if the caller is not the owner.
     */
    modifier onlyOwner() {
        require(msg.sender == owner, "not owner");
        _;
    }

    /**
     * @notice Creates a new Structure contract
     * @param initOwner The initial owner of the contract
     * @param initData The initial data to be stored in the contract
     */
    constructor(address initOwner, uint initData) {
        owner = initOwner;
        data = initData;
    }

    /**
     * @notice Returns the data stored in the contract
     * @return returnData The current data stored in the contract
     */
    function getData() public view returns (uint returnData) {
        return data;
    }

    /**
     * @notice Sets new data in the contract, restricted to the contract's owner
     * @param newData The new data to set in the contract
     */
    function setData(uint newData) public onlyOwner {
        data = newData;
        emit LogData(data); // Log the new data
    }

    /**
     * @notice Increases the data stored in the contract by a specified amount, restricted to the contract's owner
     * @param increaseBy The amount by which to increase the data
     */
    function increaseData(uint increaseBy) public onlyOwner {
        data = Math.add(data, increaseBy); // Use the Math contract's add function
        emit LogData(data); // Log the new data
    }
}
