(defun compute-pay()
"Asks user to enter hourly rate and number of hours worked
  and returns the amount of pounds they will be paid" 
  (format t "Enter your hourly rate in pounds: ")
  (let ((hourly-rate (read)))
    (format t "Enter the number of hours worked: ")
    (let ((hours-num (read)))
      (format t "Your will be paid ~S pounds.~&" (* hourly-rate hours-num)))))
