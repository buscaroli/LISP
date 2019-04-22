;;; A Gentle Introduction to Common Lisp
;;; Chapter 7 - Ex 7.15

(defvar my-hand)
(setf my-hand
      '((3 hearts)
       (5 clubs)
       (2 diamonds)
       (4 diamonds)
       (ace spades)))

(defun rank (card)
  ( first card))

(defun suit (card)
  (second card))

(defun count-suit ( wanted-suit hand)
  "Counts the amount of cards with a required suit 
   in the given hand of cards"
  (length (remove-if-not #'(lambda (n)
                             (equal (suit n) wanted-suit))
                         hand)))
