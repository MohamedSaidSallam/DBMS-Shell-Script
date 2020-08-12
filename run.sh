#!/bin/bash

ERR_ = ""

function timedError() {
    echo $1
    sleep 1
    clear
}

function mainMenu()  {
    clear
    echo "Main Menu :"
    echo
    select option in "Create new DB" "Delete DB" "Open DB" "List existing DBs" "Exit"
    do
        case $option in
            "Create new DB")
                echo started
                timedError "Test"
                ;;
            "Delete DB")
                ;;
            "Open DB")
                ;;
            "List existing DBs")
                ;;
            "Exit")
                exit
                ;;
            *)
                echo Try Again
        esac
        break
    done
    mainMenu
}

mainMenu