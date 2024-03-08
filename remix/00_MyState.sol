// SPDX-License-Identifier: MIT
pragma solidity >=0.7.4;
contract A {
    uint myState;
    function set (uint val) public {
        myState = val;
    }
    function get () public view returns (uint v){
        return myState;
    }
}
contract B {

}
contract C is A, B{

}
