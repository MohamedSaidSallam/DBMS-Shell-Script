#!/bin/bash

DIR_DB_STORAGE="./DBStorage/"
TIMED_MSG_TIME=2

function timedError() {
    echo $1
    sleep $TIMED_MSG_TIME
    clear
}

function timedSuccess() {
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

function checkIfDBsExist() {
    if test -z $(ls $DIR_DB_STORAGE)
    then
        timedError "You don't have any DBs yet!"
        return -1
    fi
    return 0
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
    mkdir $DIR_DB_STORAGE
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
                    mkdir $DIR_DB_STORAGE$dbName
                    timedSuccess "DB: \"$dbName\" was created successfully."
                else
                    timedError "Invalid name.(DB name should start with a letter and contain only letters and numbers!!)"
                fi
                ;;
            "Delete DB")
                checkIfDBsExist
                if [ $? -eq 0 ]
                then
                    listDBs
                    echo "Kindly enter DB name to be DELETED"
                    read dbName
                    while [ ! -d $DIR_DB_STORAGE$dbName ]
                    do
                        echo "'$dbName' DB doesn't exist!"
                        echo "Try Again"
                        read dbName
                    done
                    clear
                    echo "Do you want to Delete '$dbName' DB?"
                    select choice in "Confirm" "Cancel"
                    do
                        case $choice in
                            "Confirm")
                                rm -r $DIR_DB_STORAGE$dbName
                                timedSuccess "\"dbName\" DB was deleted"
                                ;;
                            "Cancel")
                                ;;
                        esac
                        break
                    done
                fi
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