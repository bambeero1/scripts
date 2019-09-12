# ------------------- CHECK ARGUMENTS
if [[ $# -ne 1 ]] ; then
    echo "Usage: $0 <sourcefile>"
    exit 1
fi
OUT_DIR="./results/"
SOURCEFILE=$1

# ------------------- CREATE OUTPUT FOLDER
echo "[+] Creating output directory: $OUT_DIR"
mkdir -p $OUT_DIR

# ------------------- PARSE SOURCE FILE
while IFS='' read -r line || [[ -n "$line" ]]; do
    ip_path=${line/ /_}                              # Replace space with underscore
    output="${OUT_DIR}${ip_path}"

    # ------------------- PERFORM TCP SCAN
    printf "[+] Scan: $ip_path \t-->\t $output\n"
    nmap -v -Pn -n --script ssh-hassh -p2222 ${line} -oN $output
done < $SOURCEFILEt\n"
 
