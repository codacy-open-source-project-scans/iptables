:INPUT,FORWARD,OUTPUT
-p ARP --arp-op Request;=;OK
-p ARP ! --arp-op Request;=;OK
-p ARP --arp-htype Ethernet;-p ARP --arp-htype 1;OK
-p ARP --arp-htype 1;=;OK
-p ARP ! --arp-htype 1;=;OK
-p ARP --arp-ptype 0x2;=;OK
-p ARP ! --arp-ptype 0x2;=;OK
-p ARP --arp-ip-src 1.2.3.4;=;OK
-p ARP --arp-ip-dst ! 1.2.3.4;-p ARP ! --arp-ip-dst 1.2.3.4 -j CONTINUE;OK
-p ARP ! --arp-ip-src 0.0.0.0;=;OK
-p ARP ! --arp-ip-dst 0.0.0.0/8;=;OK
-p ARP ! --arp-ip-src 1.2.3.4/32;-p ARP ! --arp-ip-src 1.2.3.4;OK
-p ARP ! --arp-ip-src 1.2.3.4/255.255.255.0;-p ARP ! --arp-ip-src 1.2.3.0/24;OK
-p ARP ! --arp-ip-src 1.2.3.4/255.0.255.255;-p ARP ! --arp-ip-src 1.0.3.4/255.0.255.255;OK
-p ARP --arp-mac-src 00:de:ad:be:ef:00;=;OK
-p ARP ! --arp-mac-src 00:de:ad:be:ef:00;=;OK
-p ARP --arp-mac-dst de:ad:be:ef:00:00/ff:ff:ff:ff:00:00;=;OK
-p ARP ! --arp-mac-dst de:ad:be:ef:00:00/ff:ff:ff:ff:00:00;=;OK
-p ARP --arp-gratuitous;=;OK
-p ARP ! --arp-gratuitous;=;OK
--arp-htype 1;=;FAIL
