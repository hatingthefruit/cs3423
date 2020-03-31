/*/Author:               Andrew DiCarlo
//Assignment Number:    Lab 2
//File Name:            AndrewDiCarloLab2.zip
//Course/Section:       CS 2123 Section 003
//Date:                 7 OCT 2019
//Instructor:           Bernard Ku

//Program that performs calculations on strings that are either postfix or infix
//User selects whether to work on infix or postfix strings from a menu
//Then user enters the name of a file, which should contain one infix or postfix expression on each line
//The program then calculates the result of each line and prints the original line and the output to the user

//stackCalc.h and stackCalc.c contain the headers and library that drive this program
//processPostfix returns the result of a postfix expression, as well as setting a flag to indicate success
//processPostfix assumes the input is a valid postfix expression. Checking can be done with the function checkPostfix
//There is a separate function that does conversion from infix to postfix, infixToPostfix
//It performs the conversion using the same stack library, typecasting char to int

//Makefile builds by default to lab2
//Can be build directly with the command "gcc -Wall -o lab2 AndrewDiCarloLab2.c stackCalc.c stackar.c"
*/
#include <stdlib.h>
#include <stdio.h>
#include "stackCalc.h"


int  main(  void ){    
    //Holds each line of text in either
    char *stringBuffer = malloc(101  );       
//Holds a line until it can be converted to the correct format
    char    *inputPostfixString= malloc(101); 
//Postfix string
    char *inputInfixString = malloc(101); 
//Infix that will be converted to postfix
    
    //Pointer to the original input string, used to be able to print both infix and postfix
    char *printableString =  NULL;    
  
    //Holds the file name for input
    char *inputFileName = malloc    (100 );

    //Some flags and option variables
    int resultInt = 0;
    int validOptionFlag = 1;


    //Loop until the proper input is entered
    do{
        //Print an error message if the user entered a bad option on the last menu
        if (validOptionFlag != 1 && validOptionFlag != 2){
            printf("%d is not a valid option.\n", validOptionFlag);
        }

        //print a menu and get an option from the user
        printf("Specify input file expression type:\n");
        printf("  1.) Postfix expressions\n  2.) Infix expressions\n");
        printf("Please select an option: "   );
        scanf("%d", &validOptionFlag);       

    } while (validOptionFlag != 1 && validOptionFlag != 2);
    
    //Print a message then get filename from the user
    if (validOptionFlag == 1){
        printf("Please enter a filename with POSTFIX expressions: ");
    }
    else if (validOptionFlag == 2){
        printf("Please enter a filename with INFIX expressions: ");
    }
    scanf("%s", inputFileName);

    //Try opening the file, print an error and exit if it does not exist
    FILE *inputFile = fopen(inputFileName, "r");
    if (inputFile == NULL){
        printf("Error opening %s as a file, please check the file name and try again\n", inputFileName);
        exit(1);
    }

    //Loop until getting a line fails
    while (fgets(stringBuffer, 101, inputFile) != NULL){

        //Remove end of line characters from the input string to make printing prettier
        strtok(stringBuffer, "\r");
        strtok   (    stringBuffer, "\n");

        //Things to do if working on an infix string
        if(validOptionFlag==    2){
            //Copy string from file into infix string, then change to postfix
            strcpy(inputInfixString, stringBuffer);
            infixToPostfix(inputInfixString, inputPostfixString);

            //Set string that gets printed to be original infix string
            printableString = inputInfixString;
        }
        //Things to do if working on a postfix string
        else{
            //Copy string from file into the postfix string
            strcpy(inputPostfixString, stringBuffer);

            //Set string that gets printed to be original postfix string
            printableString = inputPostfixString;
        }

        //Check if the postfix string is valid
        if (checkPostfix(inputPostfixString))
        {
            //If it is, perform the calculation, then print the result and original string
            resultInt =  processPostfix(inputPostfixString);
            printf("The result of \"%s\" is: %d\n", printableString, resultInt);
        }

        //Clear the strings for the next round of processing
        memcpy(stringBuffer, "\0", strlen(stringBuffer));
        memcpy(inputInfixString, "\0", strlen(inputInfixString));
        memcpy(inputPostfixString, "\0", strlen(inputPostfixString));
    }

    //Free all dynamically allocated memory
    free(stringBuffer);
    free(inputPostfixString);
    free(inputInfixString);
    free(inputFileName);

    //Close the input file
    fclose(inputFile);
    return 0;
}
