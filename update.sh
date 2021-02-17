#!/bin/bash
echo "======================================================"
echo "=============== Updating repositories ================"
echo "======================================================"
echo ""
sudo apt-get update
echo ""
echo "======================================================"
echo "================ Downloading updates ================="
echo "======================================================"
echo ""
sudo apt-get upgrade -y
echo ""
echo "======================================================"
echo "============= Autoremoving Old Packages =============="
echo "======================================================"
echo ""
sudo apt-get autoremove -y
echo ""
echo "======================================================"
echo "======================== Done ========================"
echo "======================================================"