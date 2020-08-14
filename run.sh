#!/bin/bash

DIR_DB_STORAGE="./DBStorage/"
TIMED_MSG_TIME=2

function timedError() {
    echo $1
    sleep $TIMED_MSG_TIME
    clear
}

function timedsSccess() {
    clear
    echo -e "\n\t$1\n"
    sleep $TIMED_MSG_TIME
    clear
}

function listDBs() {
    echo "+====================+"
    echo "|Existing Tables are:|"
    echo "+====================+"
    ls $DIR_DB_STORAGE
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
                echo "Kindly Enter your new DB name:"
                read dbName
                if test -d $DIR_DB_STORAGE$dbName
                then
                    timedError "A DB named \"$dbName\" already exists."
                elif [[ $dbName =~ ^[a-zA-Z][a-zA-Z0-9]* ]]
                then
                    mkdir -p $DIR_DB_STORAGE$dbName
                    timedsSccess "DB: \"$dbName\" was created successfully."
                else
                    timedError "Invalid name.(DB name should start with a letter and contain only letters and numbers!!)"
                fi
                ;;
            "Delete DB")
                ;;
            "Open DB")
                #list dbs
                #select db
                dbMenu "temp DB"
                ;;
            "List existing DBs")
                listDBs
                echo "+=======================+"
                echo "|Press enter to continue|"
                echo "+=======================+"
                read
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