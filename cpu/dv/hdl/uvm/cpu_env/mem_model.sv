



class mem_model extends uvm_object;
    `uvm_object_utils(mem_model)

    bit [31:0] mem [bit [29:0]];   // word addressed

    // All access are assumed to be aligned ... 

    function new(string name = "mem_model");
        super.new(name);
    endfunction

    function void load(string file, bit [31:0] base, int unsigned n_words);
        logic [31:0] tmp[];
        tmp = new[n_words];
        $readmemh(file, tmp);
        foreach (tmp[i]) if (!$isunknown(tmp[i])) mem[(base >> 2) + i] = tmp[i];
    endfunction

    function void save(string file, bit [31:0] base, int unsigned n_words);
        logic [31:0] tmp[];
        tmp = new[n_words];
        foreach (tmp[i]) tmp[i] = read(base + 4*i);
        $writememh(file, tmp);
    endfunction


    function bit [31:0] read(bit [31:0] addr);
        bit [29:0] idx = addr[31:2];
        if (addr[1:0] != 0) `uvm_error("MEM", $sformatf("Unaligned read @%08h", addr))
        return mem.exists(idx) ? mem[idx] : 32'h0;
    endfunction

    function void write(bit [31:0] addr, bit [31:0] data, bit [3:0] be);
        bit [29:0] idx = addr[31:2];
        bit [31:0] w   = mem.exists(idx) ? mem[idx] : 32'h0;
        if (addr[1:0] != 0) `uvm_error("MEM", $sformatf("Unaligned write @%08h", addr))
        for (int i = 0; i < 4; i++) if (be[i]) w[i*8 +: 8] = data[i*8 +: 8];
        mem[idx] = w;
    endfunction
endclass