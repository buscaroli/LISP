(defun roughly-equal (k x)
  "Given a list of numbers x and a value k, returns the first 
    number that in the range k-10 to k+10"
  (find-if #'(lambda (n)
               (and (< n (+ k 10)) (> n (- k 10))))
           x))
