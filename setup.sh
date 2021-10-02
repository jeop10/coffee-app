#!/bin/sh

echo "Cloning the frontend"
git clone https://github.com/jeop10/coffee-frontend.git
if [ $? -eq 0 ]; then
   echo "Frontend cloned"
else
   echo "error trying to clone frontend"
fi

git clone https://github.com/jeop10/coffee-backend.git
if [ $? -eq 0 ]; then
   echo "Backend cloned"
else
   echo "error trying to clone backend"
fi

echo "Closing script. bye"