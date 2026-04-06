## To test verification:

0. When copying verifier SCs, rename HonkVerifier to HonkVerifierSquare or smth, otherwise deployment script won't work for two different verifier types.
1. optimizations in foundry.toml set to 100, if not enough you can still lower it. The compiled bytecode will be smaller.
2. Run anvil
3. Deploy smart contracts: `forge script script/DeployVerifier.s.sol --rpc-url http://127.0.0.1:8545 --broadcast --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80`
4. Cast call verification:
```
cast send 0xCf7Ed3AccA5a467e9e704C703E8D87F634fB0Fc9 \
  "verify(bytes,bytes32[])" \
  0x00 \
  "[]" \
  --rpc-url http://127.0.0.1:8545 \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
```