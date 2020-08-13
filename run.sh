#!/bin/bash

ERR_ = ""

function timedError() {
    echo $1
    sleep 1
    clear
}

function dbMenu() {
    clear
    echo -e "Now you are working with '$1' DB\n"
    select option in "Create new Table" "Delete Table" "Insert into Table" "Modify a Table" "Display a Table" "List Existing Tables" "Back to main menu"
    do
        case $option in
            "Create new Table")
                ;;
            "Delete Table")
                ;;
            "Insert into Table")
                ;;
            "Modify a Table")
                ;;
            "Display a Table")
                ;;
            "List Existing Tables")
                ;;
            "Back to main menu")
                return
                ;;
        esac
        break
    done
    dbMenu $1
}

function mainMenu()  {
    clear
    echo -e "Main Menu :\n"
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
                #list dbs
                #select db
                dbMenu "temp DB"
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