#!/bin/bash
sudo apt update -y
sudo apt install apache2 -y

# Start and enable Apache
sudo systemctl start apache2
sudo systemctl enable apache2

# Create the blue site directory
sudo mkdir -p /var/www/html/blue

# Create an HTML file for the Blue Webserver
echo "<html><body style='background-color:blue;'><h1>Blue Webserver</h1><p>Hostname: $(hostname)</p><p>IP Address: $(hostname -I | awk '{print $1}')</p></body></html>" | sudo tee /var/www/html/blue/index.html

# Set proper ownership and permissions
sudo chown -R www-data:www-data /var/www/html/blue
sudo chmod -R 755 /var/www/html/blue
