(defun gt1-lt5 (num)
  "Given a number returns T if 
    1 < num < 5"
  (and (> num 1)
       (< num 5)))

(defun pick-out-numbers (list-of-numbers)
  "Given a list of numbers, selects the one that
    are greater than 1 and less than 5"
  (remove-if-not #'gt1-lt5 list-of-numbers))
