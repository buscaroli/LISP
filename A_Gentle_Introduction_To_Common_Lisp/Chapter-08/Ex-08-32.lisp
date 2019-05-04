;; takes a list of mixed elements and returns a list
;; of numbers only
;; e.g. (sum-numeric-elements '(3 bear 4 horse 5) => (3 4 5)
(defun filter-numeric-elements (mixed-list)
    (cond ((null mixed-list) NIL)
          ((numberp (car mixed-list)) (cons (car mixed-list) (filter-numeric-elements (cdr mixed-list))))
          (t (filter-numeric-elements (cdr mixed-list)))))       

;; sum the values of all numerical elements in a given
;; mixed list
(defun sum-numeric-elements (mixed-list)
  (cond ((null mixed-list) 0)
        ((numberp (car mixed-list)) (+ (car mixed-list)(sum-numeric-elements (cdr mixed-list))))
        (t  (sum-numeric-elements (cdr mixed-list)))))
