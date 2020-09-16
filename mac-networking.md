Taken from https://gist.github.com/jjnilton/add1eeeb3a9616f53e4c, I decided to put it into my own repo for easier to search

### Mac Network Commands Cheat Sheet

- Get an ip address for en0:

```code
ipconfig getifaddr en0
```

- Same thing, but setting and echoing a variable:

```code
ip=`ipconfig getifaddr en0` ; echo $ip
```

- View the subnet mask of en0:

```code
ipconfig getoption en0 subnet_mask
```

- View the dns server for en0:

```code
ipconfig getoption en0 domain_name_server
```

- Get information about how en0 got its dhcp on:

```code
ipconfig getpacket en1
```

- View some network info:

```code
ifconfig en0
```

- Set en0 to have an ip address of 10.10.10.10 and a subnet mask of 255.255.255.0:

```code
ifconfig en0 inet 10.10.10.10 netmask 255.255.255.0
```

- Show a list of locations on the computer:

```code
networksetup -listlocations
```

- Obtain the active location the system is using:

```code
networksetup -getcurrentlocation
```

- Create a network location called Work and populate it with information from the active network connection:

```code
networksetup -createlocation Work populate
```

- Delete a network location called Work:

```code
networksetup -deletelocation Work
```

- Switch the active location to a location called Work:

```code
networksetup -switchlocation Work
```

- Switch the active location to a location called Work, but also show the GUID of that location so we can make scripties with it laters:

```code
scselect Work
```

- List all of the network interfaces on the system:

```code
networksetup -listallnetworkservices
```

- Rename the network service called Ethernet to the word Wired:

```code
networksetup -renamenetworkservice Ethernet Wired
```

- Disable a network interface:

```code
networksetup -setnetworkserviceenabled off
```

- Change the order of your network services:

```code
networksetup -ordernetworkservices “Wi-Fi” “USB Ethernet”
```

- Set the interface called Wi-Fi to obtain it if it isn’t already

```code
networksetup -setdhcp Wi-Fi
```

- Renew dhcp leases:

```code
ipconfig set en1 BOOTP && ipconfig set en1 DHCP
ifconfig en1 down && ifconfig en1 up
```

- Renew a dhcp lease in a script:

```code
echo "add State:/Network/Interface/en0/RefreshConfiguration temporary" | sudo scutil
```

- Configure a manual static ip address:

```code
networksetup -setmanual Wi-Fi 10.0.0.2 255.255.255.0 10.0.0.1
```

- Configure the dns servers for a given network interface:

```code
networksetup -setdnsservers Wi-Fi 10.0.0.2 10.0.0.3
```

- Obtain the dns servers used on the Wi-Fi interface:

```code
networksetup -getdnsservers Wi-Fi
```

- Stop the application layer firewall:

```code
launchctl unload /System/Library/LaunchAgents/com.apple.alf.useragent.plistlaunchctl unload /System/Library/LaunchDaemons/com.apple.alf.agent.plist
```

- Start the application layer firewall:

```code
launchctl load /System/Library/LaunchDaemons/com.apple.alf.agent.plistlaunchctl load /System/Library/LaunchAgents/com.apple.alf.useragent.plist
```

- Allow an app to communicate outside the system through the application layer firewall:

```code
socketfilterfw -t“/Applications/FileMaker Pro/FileMaker Pro.app/Contents/MacOS/FileMaker Pro”
```

- See the routing table of a Mac:

```code
netstat -nr
```

- Add a route so that traffic for 10.0.0.0/32 communicates over the 10.0.9.2 network interface:

```code
route -n add 10.0.0.0/32 10.0.9.2
```

- Log bonjour traffic at the packet level:

```code
sudo killall -USR2 mDNSResponder
```

- Stop Bonjour:

```code
launchctl unload -w /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist
```

- Start Bojour:

```code
launchctl load -w /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist
```

- Put a delay in your pings:

```code
ping -i 5 192.168.210.1
```

- Ping the hostname 5 times and then stop the ping:

```code
ping -c 5 google.com
```

- Flood ping the host:

```code
ping -f localhost
```

- Set the packet size during your ping:

```code
ping -s 100 google.com
```

- Customize the source IP during your ping:

```code
ping -S 10.10.10.11 google.com
```

- View disk performance:

```code
iostat -d disk0
```

- Get information about the airport connection on your system:

```code
/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I
```

- Scan the available Wireless networks:

```code
/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -s
```

- Trace the path packets go through:

```code
traceroute google.com
```

- Trace the routes without looking up names:

```code
traceroute -n google.com
```

- Trace a route in debug mode:

```code
traceroute -d google.com
```

- View information on all sockets:

```code
netstat -at
```

- View network information for ipv6:

```code
netstat -lt
```

- View per protocol network statistics:

```code
netstat -s
```

- View the statistics for a specific network protocol:

```code
netstat -p igmp
```

- Show statistics for network interfaces:

```code
netstat -i
```

- View network information as it happens (requires ntop to be installed):

```code
ntop
```

Scan port 80 of www.google.com

/System/Library/CoreServices/Applications/Network\ Utility.app/Contents/Resources/stroke www.google.com 80 80

- Port scan krypted.com stealthily:

```code
nmap -sS -O krypted.com/24
```

- Establish a network connection with www.apple.com:

```code
nc -v www.apple.com 80
```

- Establish a network connection with gateway.push.apple.com over port 2195

```code
/usr/bin/nc -v -w 15 gateway.push.apple.com 2195
```

- Establish a network connection with feedback.push.apple.com only allowing ipv4

```code
/usr/bin/nc -v -4 feedback.push.apple.com 2196
```

- Setup a network listener on port 2196 for testing:

```code
/usr/bin/nc -l 2196
```

- Capture some packets:

```code
tcpdump -nS
```

- Capture all the packets:

```code
tcpdump -nnvvXS
```

- Capture the packets for a given port:

```code
tcpdump -nnvvXs 548
```

- Capture all the packets for a given port going to a given destination of 10.0.0.48:

```code
tcpdump -nnvvXs 548 dst 10.0.0.48
```

- Capture the packets as above but dump to a pcap file:

```code
tcpdump -nnvvXs 548 dst 10.0.0.48 -w /tmp/myfile.pcap
```

- Read tcpdump (cap) files and try to make them human readable:

```code
tcpdump -qns 0 -A -r /var/tmp/capture.pcap
```

- What binaries have what ports and in what states are those ports:

```code
lsof -n -i4TCP
```

- Make an alias for looking at what has a listener open, called ports:

```code
alias ports='lsof -n -i4TCP | rg LISTEN'
```

- Report back the name of the system:

```code
hostname
```

- Flush the dns cache:

```code
dscacheutil -flushcache
```

- Clear your arp cache:

```code
sudo arp -ad
```

- View how the Server app interprets your network settings:

```code
serveradmin settings network
```

- Whitelist the ip address 10.10.10.2:

```code
/Applications/Server.app/Contents/ServerRoot/usr/libexec/afctl -w 10.10.10.2
```
