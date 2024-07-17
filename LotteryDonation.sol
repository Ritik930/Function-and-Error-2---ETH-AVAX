// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract LotteryDonation {
    address public chairperson; // Address of the chairperson who manages the contract
    mapping(address => uint256) public donations; // Mapping to track donations per donor
    address[] public donors; // Array to store addresses of donors

    // Events to log important contract actions
    event Donated(address indexed donor, uint256 amount);
    event WinnerSelected(address indexed winner, uint256 amountWon);

    // Constructor to set the chairperson's address
    constructor() {
        chairperson = msg.sender;
    }

    // Function to donate to the lottery
    function donate() public payable {
        require(msg.value > 0, "Donation amount must be greater than 0");

        donations[msg.sender] += msg.value; // Track donation amount for the sender
        if (!isDonor(msg.sender)) {
            donors.push(msg.sender); // Add new donor to the list if not already added
        }

        emit Donated(msg.sender, msg.value); // Emit donation event
    }

    // Function for the chairperson to select a winner and distribute funds
    function selectWinner() public {
        require(msg.sender == chairperson, "Only chairperson can select winner");
        require(donors.length > 0, "No donors to select from");

        uint256 totalBalance = address(this).balance;
        uint256 winnerIndex = random() % donors.length;
        address winner = donors[winnerIndex];
        uint256 amountWon = totalBalance / 2; // Winner receives half of the total balance
        payable(winner).transfer(amountWon);

        emit WinnerSelected(winner, amountWon); // Emit winner selection event
    }

    // Function to check if an address has donated
    function isDonor(address _address) internal view returns (bool) {
        for (uint256 i = 0; i < donors.length; i++) {
            if (donors[i] == _address) {
                return true;
            }
        }
        return false;
    }

    // Function to generate a random number (not secure for production use)
    function random() internal view returns (uint256) {
        return uint256(keccak256(abi.encodePacked(block.timestamp, block.prevrandao))) % uint256(donors.length + 1);
    }

    // Function to check contract balance
    function contractBalance() public view returns (uint256) {
        return address(this).balance;
    }

    // Fallback function to receive Ether
    receive() external payable {
        donate();
    }
}
