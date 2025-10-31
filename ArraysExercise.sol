// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract ArraysExercise {
    // Starter array
    uint[] public numbers = [1,2,3,4,5,6,7,8,9,10];

    // New arrays for timestamps and senders
    address[] public senders;
    uint[] public timestamps;

    // Return the entire numbers array
    function getNumbers() public view returns (uint[] memory) {
        return numbers;
    }

    // Reset the numbers array to its initial state (without using .push())
    function resetNumbers() public {
        numbers = [1,2,3,4,5,6,7,8,9,10];
    }

    // Append another array to the numbers array
    function appendToNumbers(uint[] calldata _toAppend) public {
        uint len = _toAppend.length;
        for (uint i = 0; i < len; i++) {
            numbers.push(_toAppend[i]);
        }
    }

    // Save caller address and timestamp
    function saveTimestamp(uint _unixTimestamp) public {
        senders.push(msg.sender);
        timestamps.push(_unixTimestamp);
    }

    // Return timestamps and senders after Y2K
    function afterY2K() public view returns (uint[] memory, address[] memory) {
        uint count = 0;
        uint y2k = 946702800;

        // Count how many timestamps are after Y2K
        for (uint i = 0; i < timestamps.length; i++) {
            if (timestamps[i] > y2k) {
                count++;
            }
        }

        // Create arrays of the correct size
        uint[] memory recentTimestamps = new uint[](count);
        address[] memory recentSenders = new address[](count);
        uint j = 0;

        for (uint i = 0; i < timestamps.length; i++) {
            if (timestamps[i] > y2k) {
                recentTimestamps[j] = timestamps[i];
                recentSenders[j] = senders[i];
                j++;
            }
        }

        return (recentTimestamps, recentSenders);
    }

    // Reset functions
    function resetSenders() public {
        delete senders;
    }

    function resetTimestamps() public {
        delete timestamps;
    }
}
