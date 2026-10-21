#!/bin/bash

case "$1" in
    system)
        echo "Hostname: $(hostname)"
        echo "User: $(whoami)"
        echo "OS: $(lsb_release -d | cut -f2)"
        echo "Kernel: $(uname -r)"
        echo "Uptime: $(uptime -p)" 
        echo "Memory: $(free -h | grep Mem)"
             ;;   
    disk)    
        echo "Disk: $(df -h /)"
            ;; 
    network)
       if [[ -z "$2" ]]; then
        echo "Error: hostname is required"
          exit 2
    else
        echo "Checking network connection to $2"
        ping -c 4 "$2"
        status=$?
        
        if [[ "$status" -ne 0 ]]; then
        echo "network check failed"
        exit 1
        
        else
        echo "Network test completed"
        exit "$status"
        fi

    fi
        ;;
    help)
        echo "Diagnostic CLI Tool

            Usage: diagnostic <command> [argument] 

            Available commands:
            system          Display system information
            disk            Display disk usage
            network <host>  Test connectivity to a host
            help            Show this help message"
        ;;
    *)
    echo "Usage: system|disk|network|help"
     exit 2
    ;;
esac