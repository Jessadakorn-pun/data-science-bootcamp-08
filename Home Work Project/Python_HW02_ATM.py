import datetime
system_id = []

class Atm:
    ## Creating Account
    def __init__(self, user_id = "", pass_word = "", avalible_balace = 0):
        while True:
            u_id = input("INSERT YOUR ID : ")
            if u_id not in system_id:
                self.id = u_id
                break
            else:
                print("YOURE ID ALREADY USE")
            

        self.password = input("INSERT YOUR PASSWORD : ")
        first_avalible_balace = int(input("INSERT YOUR FRIST DEPOSIT : "))
        self.record = []

        if type(first_avalible_balace) == int:
            if first_avalible_balace >= 0:
                self.avalible_balace = first_avalible_balace
                if self.avalible_balace == 0:
                    dt = datetime.datetime.now()
                    r = [f"Date Time : {dt}", self.id, "Action : Create id", "from : ", "To : ", "Value : "]
                    self.record.append(r)
                else:
                    dt = datetime.datetime.now()
                    r_1 = [f"Date Time : {dt}", self.id, "Action : from : ", "To : ", "Value : "]
                    r_2 = [f"Date Time : {dt}", self.id, "Action : Deposit", f"from : {self.id}", f"To : {self.id} ", f"Value : {self.avalible_balace}" ]
                    self.record.append(r_1)
                    self.record.append(r_2)
            else:
                print("PLEASE INSERT PROPER VALUE")
        else:
            print("PLEASE INSERT PROPER VALUE")
        #self.record = record
        system_id.append(self.id)
    
    ## Deposit
    def deposit(self, cash):
        if input("INSERT YOUR PASSWORD : ") == self.password:
            if type(cash) == int:
                if cash > 0:
                    self.avalible_balace += cash
                    dt = datetime.datetime.now() 
                    r = [f"Date Time : {dt}", self.id, "Action : Deposit", f"from : {self.id}", f"To : {self.id} ", f"Value : {cash}" ]
                    self.record.append(r)
                    print("COMPLETE")
                else:
                    print("YOUR VALUE LESS THAN OR EQUAL ZERO")
            else:
                print("PLEASE INSERT PROPER VALUE")
        else:
            print("INCORRECT PASSWORD")

    ## Withdraw
    def withdraw(self, withdraw_value):
        if input("INSERT YOUR PASSWORD : ") == self.password:
            if type(withdraw_value) == int:
                if withdraw_value > 0:
                    if withdraw_value <= self.avalible_balace:
                        self.avalible_balace -= withdraw_value
                        dt = datetime.datetime.now() 
                        r = [f"Date Time : {dt}", self.id, "Action : Withdraw", f"from : {self.id}", f"To : {self.id} ", f"Value : {withdraw_value}" ]
                        self.record.append(r)
                        print("COMPLETE")
                    else:
                        print("YOUR CASH BALANCE IS NOT ENOUGH")
                else:
                    print("YOUR VALUE LESS THAN OR EQUAL ZERO")
            else:
                print("PLEASE INSERT PROPER VALUE")
        else:
            print("INCORRECT PASSWORD")

    ## Tranfer Cash
    def Tranfer(self, tranfer_value, tranfer_to_id):
        if input("INSERT YOUR PASSWORD : ") == self.password: 
            if tranfer_to_id.id in system_id:
                if type(tranfer_value) == int:
                    if tranfer_value > 0:
                        if tranfer_value <= self.avalible_balace:
                            self.avalible_balace -= tranfer_value
                            dt = datetime.datetime.now() 
                            r_f = [f"Date Time : {dt}", self.id, "Action : Tranfer", f"from : {self.id}", f"To : {tranfer_to_id.id}", f"Value : {tranfer_value}" ]
                            self.record.append(r_f)

                            tranfer_to_id.avalible_balace += tranfer_value
                            r_t = [f"Date Time : {dt}", tranfer_to_id.id, "Action : Tranfered", f"from : {self.id}", f"To : {tranfer_to_id.id}", f"Value : {tranfer_value}" ]
                            tranfer_to_id.record.append(r_t)

                            print("COMPLETE")
                        else:
                            print("YOUR CASH BALANCE IS NOT ENOUGH")
                    else:
                        print("YOUR VALUE LESS THAN OR EQUAL ZERO")
                else:
                    print("PLEASE INSERT PROPER VALUE")
            else:
                print("ํYOUR TRANFER DESINATION IS UNKNOW")
        else:
            print("INCORRECT PASSWORD")        
    
    ## Showing a record of account
    def log_record(self):
        if input("INSERT YOUR PASSWORD : ") == self.password: 
            for e in self.record:
                print(e)
        else:
            print("INCORRECT PASSWORD")   
            
    ## changing password
    def change_pass(self):
        if input("INSERT YOUR OLD PASSWORD :") == self.password:
            self.password = input("INSERT YOUR NEW PASSWORD : ")
            dt = datetime.datetime.now()
            r = [f"Date Time : {dt}", self.id, "Action : Change Password", f"from : {self.id}", f"To :", f"Value :" ]
            self.record.append(r)
            print("COMPLETE")
        else:
            print("INCORRECT PASSWORD")
    
    ## changing id
    def change_id(self):
        o_id = input("INSERT YOUR OLD ID :")
        if o_id == self.id:
            n_id = input("INSERT YOUR NEW ID: ")
            self.id = n_id
            idx = system_id.index(o_id)
            system_id[idx] = n_id

            dt = datetime.datetime.now()
            r = [f"Date Time : {dt}", self.id, "Action : Change ID", f"from : {self.id}", f"To :", f"Value :" ]
            self.record.append(r)
            print("COMPLETE")

        else:
            print("INCORRECT ID")
