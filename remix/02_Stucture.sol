// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
import "./03_Math.sol";
contract Structure {
    address owner;
    uint data;

    event LogData(uint dataToLog);
    modifier onlyOwner() {
        require(msg.sender == owner, "not owner");
        _;
    }
    constructor(address initOwner, uint initData) {
        owner = initOwner;
        data = initData;
    }
    function getData() public view returns (uint returnData) {
        return data;
    }
    function setData(uint newData) public onlyOwner {
        data = newData;
        emit LogData(data);
    }
    function increaseData(uint increaseBy) public onlyOwner {
        data = Math.add(data, increaseBy);
        emit LogData(data);
    }
}
