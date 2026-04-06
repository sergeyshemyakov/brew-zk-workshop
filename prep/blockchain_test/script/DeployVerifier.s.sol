// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

import "forge-std/Script.sol";
import {HonkVerifierSquare} from "../src/Verifier_square.sol";
import {HonkVerifierMerkle} from "../src/Verifier_merkle.sol";

contract DeployVerifier is Script {
    function run() external {
        vm.startBroadcast();
        HonkVerifierSquare verifier1 = new HonkVerifierSquare();
        HonkVerifierMerkle verifier2 = new HonkVerifierMerkle();
        vm.stopBroadcast();

        console.log("HonkVerifierSquare deployed at:", address(verifier1));
        console.log("HonkVerifierMerkle deployed at:", address(verifier2));
    }
}
