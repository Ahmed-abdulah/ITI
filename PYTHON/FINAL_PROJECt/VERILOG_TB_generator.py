def validate_name(name, reserved_words, existing_names):
    if name in reserved_words or name in existing_names:
        return False
    if not (name[0].isalpha() or name[0] == '_'):
        return False
    for char in name[1:]:
        if not (char.isalnum() or char == '_'):
            return False
    return True

def get_positive_integer(prompt):
    while True:
        try:
            value = int(prompt())
            if value > 0:
                return value
            else:
                print("Please enter a positive integer.")
        except ValueError:
            print("Please enter a valid integer.")

def get_yes_no(prompt):
    while True:
        response = input(prompt).lower()
        if response in ['yes', 'no']:
            return response
        else:
            print("Please enter 'yes' or 'no'.")

def get_sync_type(prompt):
    while True:
        response = input(prompt).lower()
        if response in ['syn', 'async']:
            return response
        else:
            print("Please enter 'syn' or 'async'.")

def get_fsm_style(prompt):
    while True:
        response = input(prompt).lower()
        if response in ['separate', 'combined']:
            return response
        else:
            print("Please enter 'separate' or 'combined'.")

def generate_verilog_module(module_name, sync_type, is_fsm, fsm_style=None, num_states=None, param_count=None, inputs=None, outputs=None, reset_edge=None, use_enable=False):
    param_declaration = ""
    param_instantiation = ""
    
    if param_count:
        param_declaration = ", ".join([f"parameter PARAM{i} = 0" for i in range(param_count)])
        param_instantiation = f"#({param_declaration})"

    port_declaration = ",\n    ".join([f"input wire [{input['bits']-1}:0] {input['name']}" for input in inputs] + 
                                      [f"output reg [{output['bits']-1}:0] {output['name']}" for output in outputs])

    if use_enable:
        port_declaration += ",\n    input wire enable"

    if is_fsm.lower() == 'yes':
        state_bits = 1
        while (1 << state_bits) < num_states:
            state_bits += 1

        state_decl = f"reg [{state_bits-1}:0] current_state, next_state;"
        state_transition_logic = ""
        output_logic = ""

        if fsm_style == 'separate':
            state_transition_logic = f"""always @(posedge clk or {reset_edge} reset) begin
    if (reset) begin
        current_state <= {state_bits}'b0;
    end else begin
        current_state <= next_state;
    end
end

always @* begin
    next_state = current_state;
    // Add state transition logic here
end
"""

            output_logic = f"""always @* begin
    // Add output logic here
end
"""
        elif fsm_style == 'combined':
            state_transition_logic = f"""always @(posedge clk or {reset_edge} reset) begin
    if (reset) begin
        current_state <= {state_bits}'b0;
    end else begin
        case (current_state)
            // Add state transition and output logic here
        endcase
    end
end
"""

        template = f"""module {module_name} {param_instantiation} (
    {port_declaration}
);

{state_decl}

{state_transition_logic}

{output_logic}

endmodule
"""
    else:
        if sync_type.lower() == 'syn':
            enable_logic = "if (enable) " if use_enable else ""
            template = f"""module {module_name} {param_instantiation} (
    {port_declaration}
);

always @(posedge clk or {reset_edge} reset) begin
    if (reset) begin
        Dataout <= 4'b0;
    end else begin
        {enable_logic}Dataout <= Datain;
    end
end

endmodule
"""
        elif sync_type.lower() == 'async':
            template = f"""module {module_name} {param_instantiation} (
    {port_declaration}
);

always @* begin
    Dataout = Datain;
end

endmodule
"""
    return template

def generate_testbench(module_name, inputs, outputs):
    testbench_name = module_name + "_TB"

    port_connections = ",\n    ".join([f".{input['name']}({input['name']}_TB)" for input in inputs] +
                                      [f".{output['name']}({output['name']}_TB)" for output in outputs])
    reg_decl = "\n".join([f"reg [{input['bits']-1}:0] {input['name']}_TB;" for input in inputs] +
                         [f"wire [{output['bits']-1}:0] {output['name']}_TB;" for output in outputs])

    template = f"""module {testbench_name};

{reg_decl}

// Instantiate the design module
{module_name} uut (
    {port_connections}
);

initial begin
    // Add test cases here
    $stop;
end

// Clock generation
always #5 clk = ~clk;

endmodule
"""
    return template

def save_to_file(filename, content):
    with open(filename, 'w') as file:
        file.write(content)

def main():
    reserved_words = {
        "always", "and", "assign", "automatic", "begin", "case", "casex", "casez", "cell", "config", "deassign", "default", "defparam",
        "design", "disable", "edge", "else", "end", "endcase", "endconfig", "endfunction", "endgenerate", "endmodule", "endprimitive",
        "endspecify", "endtable", "endtask", "event", "for", "force", "forever", "fork", "function", "generate", "genvar", "if", "ifdef",
        "ifndef", "initial", "inout", "input", "instance", "integer", "join", "large", "liblist", "library", "localparam", "macromodule",
        "module", "nand", "negedge", "nmos", "nor", "not", "notif0", "notif1", "or", "output", "parameter", "pmos", "posedge", "primitive",
        "pull0", "pull1", "pulldown", "pullup", "pulsestyle_onevent", "pulsestyle_ondetect", "rcmos", "reg", "release", "repeat", "rnmos",
        "rpmos", "rtran", "rtranif0", "rtranif1", "scalared", "small", "specify", "specparam", "strong0", "strong1", "table", "task",
        "time", "tran", "tranif0", "tranif1", "tri", "tri0", "tri1", "triand", "trior", "trireg", "use", "vectored", "wait", "wand", "weak0",
        "weak1", "while", "wire", "wor", "xnor", "xor"
    }

    while True:
        module_name = input("Enter the design module name: ")
        if validate_name(module_name, reserved_words, []):
            break
        print(f"Invalid module name '{module_name}'. Please use a valid Verilog identifier that is not a reserved keyword or already in use.")

    is_fsm = get_yes_no("Is the design an FSM? (yes/no) ")
    param_choice = get_yes_no("Is the design parameterized? (yes/no) ")
    param_count = 0
    if param_choice == 'yes':
        param_count = get_positive_integer(lambda: input("Enter the number of parameters: "))
    
    num_inputs = get_positive_integer(lambda: input("Enter the number of input ports: "))
    inputs = []
    existing_names = set()
    for _ in range(num_inputs):
        while True:
            name = input("Enter the input port name: ")
            if validate_name(name, reserved_words, existing_names):
                break
            print(f"Invalid input port name '{name}'. Please use a valid Verilog identifier that is not a reserved keyword or already in use.")
        bits = get_positive_integer(lambda: input(f"Enter the number of bits for {name}: "))
        inputs.append({"name": name, "bits": bits})
        existing_names.add(name)

    num_outputs = get_positive_integer(lambda: input("Enter the number of output ports: "))
    outputs = []
    for _ in range(num_outputs):
        while True:
            name = input("Enter the output port name: ")
            if validate_name(name, reserved_words, existing_names):
                break
            print(f"Invalid output port name '{name}'. Please use a valid Verilog identifier that is not a reserved keyword or already in use.")
        bits = get_positive_integer(lambda: input(f"Enter the number of bits for {name}: "))
        outputs.append({"name": name, "bits": bits})
        existing_names.add(name)

    reset_edge = 'posedge' if get_yes_no("Is the reset positive edge? (yes/no) ") == 'yes' else 'negedge'
    use_enable = get_yes_no("Is enable signal used? (yes/no) ") == 'yes'

    if is_fsm == 'yes':
        fsm_style = get_fsm_style("Which FSM coding style do you prefer? (separate/combined) ")
        num_states = get_positive_integer(lambda: input("Enter the number of states: "))
        design_content = generate_verilog_module(module_name, None, is_fsm, fsm_style, num_states, param_count, inputs, outputs, reset_edge, use_enable)
    else:
        sync_type = get_sync_type("Is the design synchronous or asynchronous? (syn/async) ")
        design_content = generate_verilog_module(module_name, sync_type, is_fsm, None, None, param_count, inputs, outputs, reset_edge, use_enable)

    save_to_file(f"{module_name}.v", design_content)

    testbench_content = generate_testbench(module_name, inputs, outputs)
    save_to_file(f"{module_name}_TB.v", testbench_content)

    print(f"Generated {module_name}.v and {module_name}_TB.v")

main()
