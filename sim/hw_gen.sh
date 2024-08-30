#!/bin/bash

# Define the directory to work with
BASE_DIR="./artifacts/"  # Change this to the directory you want to work with
CLK="500e6"

# Print usage information
usage() {
    echo "Usage: $0 --cnns | --c <name>"
    exit 1
}

# List directories in the base directory
list_directories() {
    echo "Available CNNS (Try ./hw_gen.sh --c <cnn_name>):"
    for dir in "$BASE_DIR"/*; do
        if [ -d "$dir" ]; then
            basename "$dir"
        fi
    done
}

# Check if the name exists and perform operations
process_name() {
    local name="$1"
    local target_dir="$BASE_DIR/$name"
    local build_dir="./build/$name"
    local tflite_file="$target_dir/$name.tflite"

    # Check if the directory exists
    if [ ! -d "$target_dir" ]; then
        echo "Error: Directory '$name' does not exist in $BASE_DIR"
        exit 1
    fi

    # Create build directory if it doesn't exist
    mkdir -p "$build_dir"

    # Check if the .tflite file exists
    if [ ! -f "$tflite_file" ]; then
        echo "Error: File '$name.tflite' does not exist in $target_dir"
        exit 1
    fi

    # Copy the .tflite file to the build directory
    cp "$tflite_file" "$build_dir/"
    echo "Copied '$tflite_file' to '$build_dir/'."
    cd "$build_dir/"
    pwd
    python3 ../../../bin/andromeda.py --tflite $name.tflite --top $name --clk $CLK --rowtime 20000e-9 --regz 64 --regb 8 --dtype 16 |& tee log.andromeda

}

# Main script logic
if [ "$#" -eq 0 ]; then
    usage
fi

while [[ "$#" -gt 0 ]]; do
    case $1 in
        --cnns)
            list_directories
            shift
            ;;
        --c)
            if [ -z "$2" ]; then
                echo "Error: Missing argument for --c."
                usage
            fi
            process_name "$2"
            shift 2
            ;;
        *)
            echo "Unknown option: $1"
            usage
            ;;
    esac
done
