apt install deluged deluge-web
mkdir -p /content/delugeconf
cp -fr ~/drive/forvmimage/delugeconf/* /content/delugeconf
deluged -c /content/delugeconf/ &
deluge-web -c /content/delugeconf/ &
