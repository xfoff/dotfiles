# Get the directory of the current script
SCRIPT_DIR=$(dirname "$(realpath "$0")")

# Define the files for storing variables and current values
VARIABLE_FILE="$SCRIPT_DIR/variables_default"
CURRENT_VALUES_FILE="$SCRIPT_DIR/variables_buffer"

# Function to get a variable's default value from the variables file
get_default_value() {
    local var_name=$1
    grep "^$var_name=" "$VARIABLE_FILE" 2>/dev/null | cut -d '=' -f 2-
}

# Function to get a variable's current value
get_current_value() {
    local var_name=$1
    grep "^$var_name=" "$CURRENT_VALUES_FILE" 2>/dev/null | cut -d '=' -f 2-
}

# Function to set a variable's current value
set_variable() {
    local var_name=$1
    local value=$2

    if [[ -z $var_name || -z $value ]]; then
        echo "Error: Variable name and value are required."
        usage
    fi

    # Ensure the variable exists in the variables file
    if ! grep -q "^$var_name=" "$VARIABLE_FILE"; then
        echo "Error: Variable '$var_name' is not defined in the variables file."
        exit 1
    fi

    # Update the current value in the buffer file
    grep -v "^$var_name=" "$CURRENT_VALUES_FILE" > "$CURRENT_VALUES_FILE.tmp" 2>/dev/null || true
    echo "$var_name=$value" >> "$CURRENT_VALUES_FILE.tmp"
    mv "$CURRENT_VALUES_FILE.tmp" "$CURRENT_VALUES_FILE"
}

# Function to get a variable's value
get_variable() {
    local var_name=$1

    if [[ -z $var_name ]]; then
        echo "Error: Variable name is required."
        usage
    fi

    # Retrieve the current or default value
    local current_value=$(get_current_value "$var_name")
    if [[ -n $current_value ]]; then
        echo "$current_value"
    else
        local default_value=$(get_default_value "$var_name")
        if [[ -n $default_value ]]; then
            echo "$default_value"
        else
            echo "Error: Variable '$var_name' is not defined in the variables file."
        fi
    fi
}

# Function to reset a variable to its default value
reset_variable() {
    local var_name=$1

    if [[ -z $var_name ]]; then
        echo "Error: Variable name is required."
        usage
    fi

    # Ensure the variable exists in the variables file
    if ! grep -q "^$var_name=" "$VARIABLE_FILE"; then
        echo "Error: Variable '$var_name' is not defined in the variables file."
        exit 1
    fi

    # Remove the variable from the current values buffer
    grep -v "^$var_name=" "$CURRENT_VALUES_FILE" > "$CURRENT_VALUES_FILE.tmp" 2>/dev/null || true
    mv "$CURRENT_VALUES_FILE.tmp" "$CURRENT_VALUES_FILE"
}

# Function to reset all variables to their default values
reset_all_variables() {
    > "$CURRENT_VALUES_FILE" # Clear the current values buffer
}

# Main script logic
if [[ $# -lt 1 ]]; then
    echo "Error: Insufficient arguments provided."
    usage
fi

command=$1
shift

case $command in
    set)
        set_variable $1 $2
        ;;
    get)
        get_variable $1
        ;;
    reset)
        reset_variable $1
        ;;
    reset_all)
        reset_all_variables
        ;;
    *)
        echo "Error: Unknown command '$command'."
        usage
        ;;
esac
