# Docker IPSEC L2TP VPN client
Docker earley-stage image to run an IPsec VPN client, with IPsec/L2TP, based on : https://github.com/hwdsl2/setup-ipsec-vpn/blob/master/docs/clients.md

## HOW TO
After cloning the repo build docker image with the command

``sudo docker build --tag xl2tpd_client .``

In order to run the container the following environment variables need to be passed:

* `VPN_IPSEC_PSK`, `VPN_USER`, `VPN_PASSWORD` provided from your VPN provider
* the provider's IP is passed as `VPN_PUBLIC_IP` 
* and the local host ip should be passed as well, named `VPN_LOCAL_IP`

Then container launch would look like:

``docker run -it --name=xl2tpd -e "VPN_IPSEC_PSK=[your_key]" -e "VPN_USER=[your)user]" -e "VPN_PASSWORD=[your_pass]" -e "VPN_PUBLIC_IP=[vpn_ip]" -e "VPN_LOCAL_IP=[host_ip]" -v /lib/modules:/lib/modules:ro -d --privileged    xl2tpd_client``
