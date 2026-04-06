use dep::keccak256::keccak256;

fn main(privateElement: [u8; 32], siblingHashes: [[u8; 32]; 10], publicRoot: pub [u8; 32]) {
    let computed_root = compute_merkle_root(privateElement, siblingHashes);
    // assert that computed root is equal to the public root
    for i in 0..32 {
        assert(computed_root[i] == publicRoot[i])
    }
}

fn compute_merkle_root(privateElement: [u8; 32], siblingHashes: [[u8; 32]; 10]) -> [u8; 32] {
    let mut running_hash = privateElement;

    // iterate over the merkle siblingHashes, compute the roots
    for i in 0..10 {
        let keccak_input = running_hash.concat(siblingHashes[i]);
        running_hash = keccak256(keccak_input, keccak_input.len());
    };
    running_hash
}