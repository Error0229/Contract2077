// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

// Define the contract
contract DataLocation {
    uint[] storageData; //storageData儲存在storage
    /**
     * @notice Test the data location of an array
     * @param memoryArray The array to test
     */
    function test1(uint[] memory memoryArray) public pure {
        //memoryArray儲存在memory
    }
    /**
     * @notice Test the data location of an array
     * @param memoryArray The array to test
     */
    function test2(uint[] memory memoryArray) public {
        storageData = memoryArray; //將memory變數內容複製一份給storage變數

        //var varData = storageData;	//付予變數的參照值，varData會儲存在storage
        //varData.length = 2;	//varData與storageData是參照關係，改變varData的長度，也就是改變storageData的長度

        delete storageData; //清空storageData的內容，也就是清空varData的內容

        //varData = memoryArray;	//不能執行，會造成在storage中建立一個暫時但未命名的陣列，但storage是靜態配置，所以會發生衝突

        //delete varData;	//不能執行

        test3(storageData); //以傳值方式呼叫test3函數

        test4(storageData); //在memory中建立一個暫時性的複製，呼叫test4函數
    }
    /**
     * @notice Test the data location of an array
     * @param storageArray The array as a storage reference
     */
    function test3(uint[] storage storageArray) internal pure {}
    /**
     * @notice Test the data location of an array
     * @param memoryArray The array as a memory reference
     */
    function test4(uint[] memory memoryArray) public pure {}
}
