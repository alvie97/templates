#!/bin/bash
echo "enter scene name"
read name
echo "creating scene $name"
mkdir $name
cd $name

echo "creating reducer"
mkdir reducer
cd reducer
touch reducer${name^}.js
cd ..

echo "creating actions"
mkdir actions
cd actions
touch actions${name^}.js
cd ..

echo "creating services"
mkdir services
echo "creating components"
mkdir components

echo "finished creating scene $name"
