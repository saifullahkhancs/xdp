#!/bin/bash
sudo ip link set eno1 xdpgeneric off
sudo ./xdp_loader --dev eno1 -A --progsec dropper_main
sudo ./xdp_stats --dev eno1
sudo ip link set eno1 xdpgeneric off

