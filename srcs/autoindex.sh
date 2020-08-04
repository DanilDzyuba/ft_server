if [ -n "$1" ]
then
    if [ $1 = "on" ] || [ $1 = "ON" ]
    then
        sed -i "s/autoindex off/autoindex on/g" /etc/nginx/sites-available/wp
        service nginx restart
        echo "autoindex set to ON"
        
    elif [ $1 = "off" ] || [ $1 = "OFF" ]
    then
        sed -i "s/autoindex on/autoindex off/g" /etc/nginx/sites-available/wp
        service nginx restart
        sed -i "s/autoindex off/autoindex on/g" /etc/nginx/sites-available/wp
        echo "autoindex set to OFF"
    fi
else
echo "Use ./autoindex ON or OFF"
fi