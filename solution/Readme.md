Part-1 task
I ran the image by usinf the below command
docker run -d \
    --name csvserver \
    -p 9393:9393 \
    -e CSVSERVER_BORDER=Orange \
    -v /home/ubuntu/getting-started-app/inputFile:/csvserver/inputdata \
    infracloudio/csvserver:latest
----> Note after running i was unabel to open the application PORT so i did few steps below i mentioned
docker logs csvserver
sudo ufw allow 9393/tcp
sudo netstat -tuln | grep 9393
step3 : Write a bash script gencsv.sh to generate a file named inputFile whose content looks like
I used this gencsv.sh file script to generte the inputFile i will attach the script here
--------------------------------------------------------------------------------------------------------
#!/bin/bash

# Check if exactly two arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <start_index> <end_index>"
    exit 1
fi

# Assign command-line arguments to variables
START_INDEX=$1
END_INDEX=$2

# Validate if arguments are integers
if ! [[ "$START_INDEX" =~ ^[0-9]+$ ]] || ! [[ "$END_INDEX" =~ ^[0-9]+$ ]]; then
    echo "Both arguments must be integers."
    exit 1
fi

# Validate if start_index is less than or equal to end_index
if [ "$START_INDEX" -gt "$END_INDEX" ]; then
    echo "Start index must be less than or equal to end index."
    exit 1
fi

# Define the filename
FILENAME="inputFile"

# Create or clear the file
: > "$FILENAME"

# Generate entries
for (( i=START_INDEX; i<=END_INDEX; i++ )); do
    RANDOM_NUMBER=$((RANDOM % 100))  # Generate a random number between 0 and 99
    echo "$i, $RANDOM_NUMBER" >> "$FILENAME"
done

echo "File '$FILENAME' has been created with the specified content."
--------------------------------------------------------------------------------------------------------
this script will generate inputFile like below
ubuntu@ip-172-31-47-55:~/getting-started-app$ cat inputFile
2, 91
3, 74
4, 64
5, 34
6, 3
7, 61
8, 4
-------------------------------------------------------------------------------------------

docker exec -it csvserver /bin/sh
printenv CSVSERVER_BORDER ------------> adding environmental variables
 








