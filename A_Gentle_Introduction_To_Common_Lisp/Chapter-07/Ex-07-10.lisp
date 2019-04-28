;;; Exercise 7.10 - A Gentle Introduction to Common Lisp
(defvar note-table)
;; note-table is a table that links
;; notes to numbers
(setf note-table
  '((c         1)
    (c-sharp   2)
    (d         3)
    (d-sharp   4)
    (e         5)
    (f         6)
    (f-sharp   7)
    (g         8)
    (g-sharp   9)
    (a        10)
    (a-sharp  11)
    (b        12)))

(defun numbers (notes-list)
  "Takes a list made of notes and returns the
    corresponding numbers found in note-table.
    CADR is the first element in the second level
    of nesting ((1 x x) (1 x x)).
    ASSOC returns the corresponding number using
    note-table as the association table."
  (mapcar #'(lambda (note)
               (cadr (assoc note note-table)))
          notes-list))

(defun num-to-note (num)
"Utility function that converts a number into
  a note, to be used in the function 'notes'"
  (car (find-if #'(lambda (n)
                    (equal num (second n)))
                note-table)))

(defun notes (num-list)
  "Takes a list of numbers and converts it to
    a list of notes"
  (mapcar #'(lambda (n)
              (num-to-note n))
          num-list))

(defun raise (amount num-list)
"Utility function that raises each number in a given
  list of a set amount"
  (mapcar #'(lambda (n)
              (+ amount n))
          num-list))

(defun normalize (num-list)
  "Normalizes a list of numbers representing
    notes in order for every number to be in 
    the range 1 to 12"
  (mapcar #'(lambda (n)
              (cond ((< n 1) (setf n (+ n 12)))
                    ((> n 12) (setf n (- n 12)))
                    (t n))
              ) num-list))

(defun transpose (amount song)
"Transposes a song by increasing its notes by 
  a given 'amount'"
  (notes (normalize (raise amount (numbers song)))))
