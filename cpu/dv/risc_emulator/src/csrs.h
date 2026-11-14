

// Name str, address, iswriteable, description
//    "mcycle", 0xB00, ""


#define MHPM

/*

Required API:
    - Reads/Writes to all registers
        - Assert that register that is access is implemnted.
        - What if certain registers dont support R/W ?
    - Cycle-wse updates:
        - mcycle, minstret, interupts


*/