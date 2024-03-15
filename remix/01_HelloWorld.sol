// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

contract HelloWorld {
    address owner;
    string greetStr = "Hello World";

    constructor() {
        owner = msg.sender;
    }

    function greet() public view returns (string memory) {
        if (msg.sender == owner) {
            return strContact(greetStr, " ", "-Boss");
        } else {
            return strContact(greetStr, " ", "-Guest");
        }
    }

    function strContact(
        string memory _a,
        string memory _b,
        string memory _c
    ) private pure returns (string memory) {
        bytes memory _ba = bytes(_a);
        bytes memory _bb = bytes(_b);
        bytes memory _bc = bytes(_c);

        string memory len = new string(_ba.length + _bb.length + _bc.length);
        bytes memory abc = bytes(len);

        uint k = 0;
        uint i = 0;
        for (i = 0; i < _ba.length; i++) abc[k++] = _ba[i];
        for (i = 0; i < _bb.length; i++) abc[k++] = _bb[i];
        for (i = 0; i < _bc.length; i++) abc[k++] = _bc[i];
        return string(abc);
    }
}
