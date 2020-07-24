URL=http://localhost:8080
sleep 60 
if curl -s --head --request GET $URL | grep "200" > /dev/null; then 
   echo "Spring is UP"
else
   echo "Spring is DOWN"
fi
