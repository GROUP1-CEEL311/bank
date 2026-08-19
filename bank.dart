import "dart:io";

void main() {
    print("===== WELCOME TO BANK =====");
    String correctPin = "1234";
    int attempts = 0;
    bool isAuthenticated = false;
    
    // PIN Authentication
    while (attempts < 3) {
        stdout.write("Enter your 4-digit PIN code: ");
        String input = stdin.readLineSync()?.trim() ?? "";
        
        if (input == correctPin) {
            isAuthenticated = true;
            break;
        } else {
            attempts++;
            print("Wrong PIN. Attempts remaining: ${3 - attempts}\n");
        }
    }
    
    if (!isAuthenticated) {
        print("Too many wrong attempts. Account locked. Goodbye!");
        return;
    }
    
    // Variables to track deposit and balance
    double depositedAmount = 0.0;
    double remainingBalance = 0.0;
    
    String? option;
    while (option != '5') {
        print("\n===== BANKING MENU =====");
        print("[1] Enter the deposited amount");
        print("[2] Display the deposited amount");
        print("[3] Enter the amount to withdraw");
        print("[4] Display the remaining balance");
        print("[5] Exit");
        stdout.write("\nSelect an option(1-5): ");
        option = stdin.readLineSync()?.trim();
        
        if (option == '1') {
            // Enter deposited amount
            print("\n--- DEPOSIT AMOUNT ---");
            bool depositDone = false;
            while (!depositDone) {
                stdout.write("Enter the amount you want to deposit (or 0 to cancel): ₱");
                double depositInput = double.tryParse(stdin.readLineSync()?.trim() ?? '') ?? -1;
                
                if (depositInput == 0) {
                    print("Deposit cancelled.\n");
                    depositDone = true;
                } else if (depositInput < 0) {
                    print("Invalid amount. Please enter a valid positive number.\n");
                } else {
                    while (true) {
                        stdout.write("You are about to deposit ₱${depositInput.toStringAsFixed(2)}. Confirm? (Y/N): ");
                        String confirm = stdin.readLineSync()?.trim().toUpperCase() ?? '';
                        
                        if (confirm == 'Y') {
                            depositedAmount = depositInput;
                            remainingBalance = depositedAmount;
                            print("You have deposited: ₱${depositedAmount.toStringAsFixed(2)}");
                            print("Current Balance: ₱${remainingBalance.toStringAsFixed(2)}\n");
                            depositDone = true;
                            break;
                        } else if (confirm == 'N') {
                            print("Deposit cancelled.\n");
                            depositDone = true;
                            break;
                        } else {
                            print("Invalid input. Please enter Y or N.");
                        }
                    }
                }
            }
            
        } else if (option == '2') {
            // Display deposited amount
            print("\n--- DEPOSITED AMOUNT ---");
            if (depositedAmount > 0) {
                print("Amount deposited: ₱${depositedAmount.toStringAsFixed(2)}\n");
            } else {
                print("No deposit has been made yet.\n");
            }
            
        } else if (option == '3') {
            // Enter withdrawal amount
            print("\n--- WITHDRAW AMOUNT ---");
            
            if (depositedAmount <= 0) {
                print("No deposit available. Please deposit money first.\n");
            } else {
                bool withdrawDone = false;
                while (!withdrawDone) {
                    stdout.write("Enter the amount you want to withdraw (or 0 to cancel): ₱");
                    double withdrawInput = double.tryParse(stdin.readLineSync()?.trim() ?? '') ?? -1;
                    
                    if (withdrawInput == 0) {
                        print("Withdrawal cancelled.\n");
                        withdrawDone = true;
                    } else if (withdrawInput < 0) {
                        print("Invalid amount. Please enter a positive number.\n");
                    } else if (withdrawInput > remainingBalance) {
                        print("ALERT: Withdrawal amount (₱${withdrawInput.toStringAsFixed(2)}) exceeds available balance (₱${remainingBalance.toStringAsFixed(2)})!");
                        print("Please enter a smaller amount.\n");
                    } else {
                        while (true) {
                            stdout.write("You are about to withdraw ₱${withdrawInput.toStringAsFixed(2)}. Confirm? (Y/N): ");
                            String confirm = stdin.readLineSync()?.trim().toUpperCase() ?? '';
                            
                            if (confirm == 'Y') {
                                remainingBalance -= withdrawInput;
                                print("You have withdrawn: ₱${withdrawInput.toStringAsFixed(2)}");
                                print("Remaining balance: ₱${remainingBalance.toStringAsFixed(2)}\n");
                                withdrawDone = true;
                                break;
                            } else if (confirm == 'N') {
                                print("Withdrawal cancelled.\n");
                                withdrawDone = true;
                                break;
                            } else {
                                print("Invalid input. Please enter Y or N.");
                            }
                        }
                    }
                }
            }
            
        } else if (option == '4') {
            // Display remaining balance
            print("\n--- ACCOUNT BALANCE ---");
            if (depositedAmount <= 0) {
                print("No account information available yet.\n");
            } else {
                print("Deposited Amount: ₱${depositedAmount.toStringAsFixed(2)}");
                print("Remaining balance: ₱${remainingBalance.toStringAsFixed(2)}\n");
                
                if (remainingBalance < 0) {
                    print("ALERT: Your balance is NEGATIVE!\n");
                } else if (remainingBalance == 0) {
                    print("Your account balance is empty.\n");
                }
            }
            
        } else if (option == '5') {
            stdout.write("\nAre you sure you want to exit? (Y/N): ");
            String confirm = stdin.readLineSync()?.trim().toUpperCase() ?? '';
            
            if (confirm == 'Y') {
                print("\n===== THANK YOU =====");
                print("Thank you for using our banking system. Goodbye!");
                break;
            } else {
                print("Exit cancelled. Returning to menu.\n");
                option = null;
            }
            
        } else {
            print("Invalid option. Please select between 1 to 5.\n");
        }
    }
}
