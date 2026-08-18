// Algorithm of the Laboratory Exercise on Wednesday / Thursday:

// Enter PIN code. Once successful, go to the next phase. If not, display invalid input and go back to the input phase.
// [1] Enter the deposited amount 
// [2] Display the deposited amount 
// [3] Enter the amount to withdraw 
// [4] Display the remaining balance. If it exceeds the deposit, have an alert.
// [5] Exit

import "dart:io";

void main()
{
    print("===== WELCOME TO BANK =====");
    print("\nEnter PIN code.");

    String correctPin = "1234";
    int attempts = 0;
    bool isAuthenticated = false;

    while (attempts < 3) {
        stdout.write("Enter PIN: ");
        String input = stdin.readLineSync()?.trim() ?? "";

    if (input == correctPin) {
        isAuthenticated = true;
        break;
        } else {
            attempts++;
            print(" Wrong PIN. Attempts remaining: \\${3 - attempts}\n");
        }
    }

    if (!isAuthenticated) {
    print("Too many wrong attempts. Account locked. Goodbye!");
    return; 
    }
    print("[1] Enter the deposited amount");
    print("[2] Display the deposited amount");
    print("[3] Enter the amount to withdraw");
    print("[4] Display the remaining balance. If it exceeds the deposit, have an alert.");
    print("[5] Exit\n");

    String? option;

    while (option != '5'){
        stdout.write("Select an option(1-5): ");
        option = stdin.readLineSync()?.trim();

        if (option == '1'){
            print("You selected option: \$option");
            print("Please enter the amount you want to deposit: ");
            int depositInput = int.tryParse(stdin.readLineSync()?.trim() ?? '') ?? 0;
            print("You have deposited: \$depositInput");
        } else if (option == '2'){
            print("");
        }else if(option == '3'){
            print("");
        }else if(option == '4'){
            print("");
        } else if (option == '5'){
            print("Thank you. Goodbye.");
        }else {
            print("Invalid option.");
        }
    }
}