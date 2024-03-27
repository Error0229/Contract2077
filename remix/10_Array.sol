// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

contract Array {
    int[] myArray1; //宣告狀態變數myArray1是動態長度的有號整數陣列，儲存在storage中

    constructor() {}
    /**
     * @notice Sets the value of an element in the array
     * @param index The index of the element to set
     * @param value The value to set
     */
    function setValue(uint index, int value) public {
        require(index < myArray1.length, "index error");
        myArray1[index] = value; //設定myArray1陣列索引index內的值為value

        int[] memory myArray2 = myArray1; //myArray2指向myArray同一個參考位址

        //uint24[3] memory myArray3 = [1,2,3];	//宣告區域變數myArray3是固定長度的無號整數陣列，儲存在memory中，並以指定陣列常量為初值，因為不能隱式轉換，因此編譯時會產生錯誤
        uint24[3] memory myArray3 = [uint24(1), 2, 3]; //同上，透過第一個元素宣告陣列的元素型別，可正確編譯

        //uint8[2] myArray5 = [1,2];  //宣告區域變數myArray5是固定長度的無號整數陣列，儲存在storage中，不能將陣列常量指定給複雜型別
        uint8[2] memory myArray5;
        myArray5[0] = 1;
        myArray5[1] = 2;
        //myArray5[2] = 3;	//不能設定超出陣列長度的值
    }
    /**
     * @notice Gets the value of an element in the array
     * @param index The index of the element to get
     * @return value The value of the element
     */
    function getValue(uint index) public view returns (int value) {
        require(index < myArray1.length, "index error");
        value = myArray1[index];
    }
    /**
     * @notice Gets the length of the array
     * @return The length of the array
     */
    function getLength() public view returns (uint256) {
        return myArray1.length;
    }
    /**
     * @notice Adds a value to the array
     * @param value The value to add
     */
    function addValue(int value) public {
        myArray1.push(value);
    }
}
