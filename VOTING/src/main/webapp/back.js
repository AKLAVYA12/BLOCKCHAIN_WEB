// Import the Web3 library
//const Web3 = require('web3');

// Replace with the HTTP provider URL of your Ganache instance
const ganacheUrl = 'http://localhost:7545';

// Replace with your contract's ABI
const contractAbi = [
    {
        "inputs": [
            {
                "internalType": "string",
                "name": "_name",
                "type": "string"
            },
            {
                "internalType": "uint256",
                "name": "_aadhar",
                "type": "uint256"
            },
            {
                "internalType": "uint256",
                "name": "_phoneNumber",
                "type": "uint256"
            },
            {
                "internalType": "string",
                "name": "_password",
                "type": "string"
            }
        ],
        "name": "addVoter",
        "outputs": [],
        "stateMutability": "nonpayable",
        "type": "function"
    },
    {
        "inputs": [
            {
                "internalType": "uint256",
                "name": "_aadhar",
                "type": "uint256"
            }
        ],
        "name": "getVoter",
        "outputs": [
            {
                "internalType": "string",
                "name": "",
                "type": "string"
            },
            {
                "internalType": "uint256",
                "name": "",
                "type": "uint256"
            },
            {
                "internalType": "uint256",
                "name": "",
                "type": "uint256"
            },
            {
                "internalType": "string",
                "name": "",
                "type": "string"
            }
        ],
        "stateMutability": "view",
        "type": "function"
    },
    {
        "inputs": [
            {
                "internalType": "uint256",
                "name": "",
                "type": "uint256"
            }
        ],
        "name": "voters",
        "outputs": [
            {
                "internalType": "string",
                "name": "name",
                "type": "string"
            },
            {
                "internalType": "uint256",
                "name": "aadhar",
                "type": "uint256"
            },
            {
                "internalType": "uint256",
                "name": "phoneNumber",
                "type": "uint256"
            },
            {
                "internalType": "string",
                "name": "password",
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
const contractAddress = '0xfEcB46a1778F588e306854984F9e9BAb06daa5E4';

// Replace with your Ethereum account address (sender address)
const yourAccount = '0xa97e6F012AE4eb5436611cc618C0B60e0C2fB68D';

// Create a contract instance
const contract = new web3.eth.Contract(contractAbi, contractAddress);

// Function to add a voter
async function addVoter(name, aadhar, phone, password) {
    try {
        // Send a transaction to the smart contract to add a voter
        const result = await contract.methods.addVoter(name, aadhar, phone, password).send({ from: yourAccount });

        if (result.status === true) {
            console.log(`Voter "${name}" added successfully!`);
        } else {
            console.log('Voter registration failed.');
        }
    } catch (error) {
        console.error('Error adding voter:', error);
    }
}

// Function to get voter details
async function getVoter(aadhar) {
    try {
        // Call the smart contract to get voter details
        const result = await contract.methods.getVoter(aadhar).call();
        console.log('Voter Details:', result);
    } catch (error) {
        console.error('Error getting voter details:', error);
    }
}

// Example usage of the functions
addVoter("John Doe", 123456789, 987654321, "password123");
//getVoter(123456789);
