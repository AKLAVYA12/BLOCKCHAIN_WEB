//const Web3 = require('web3'); // Import the Web3 library

// Replace with the HTTP provider URL of your Ganache instance
const ganacheUrl = 'http://localhost:7545'; 

// Replace with your contract's ABI
const contractAbi = [
    {
        "inputs": [
            {
                "internalType": "string",
                "name": "_username",
                "type": "string"
            }
        ],
        "name": "registerUsername",
        "outputs": [],
        "stateMutability": "nonpayable",
        "type": "function"
    },
    {
        "inputs": [
            {
                "internalType": "address",
                "name": "",
                "type": "address"
            }
        ],
        "name": "usernames",
        "outputs": [
            {
                "internalType": "string",
                "name": "",
                "type": "string"
            }
        ],
        "stateMutability": "view",
        "type": "function"
    }
];

// Connect to your local Ganache instance
const web3 = new Web3(ganacheUrl);

// Replace with the address of your deployed contract on Ganache
const contractAddress = "0x7853B5A77e43fA49DcEA3E577C3060E3ae124585";

// Replace with your Ethereum account address (sender address)
const yourAccount = "0x31D84eEf421924Eb2E3C08E80788aAB9927be8Ea";

// Create a contract instance
const contract = new web3.eth.Contract(contractAbi, contractAddress);

// Function to register a username
async function registerUsername() {
    const username = document.getElementById('username').value;
    
    if (!username) {
        document.getElementById('message').innerText = "Please enter a username.";
        return;
    }

    try {
        // Send a transaction to the smart contract to register the username
        const result = await contract.methods.registerUsername(username).send({ from: yourAccount });
        
        if (result.status === true) {
            document.getElementById('message').innerText = `Username "${username}" registered successfully!`;
        } else {
            document.getElementById('message').innerText = "Username registration failed.";
        }
    } catch (error) {
        console.error("Error registering username:", error);
        document.getElementById('message').innerText = "An error occurred during registration.";
    }
}

// Add an event listener to the Register button
document.getElementById("registerButton").addEventListener("click", function() {
    registerUsername();
});
