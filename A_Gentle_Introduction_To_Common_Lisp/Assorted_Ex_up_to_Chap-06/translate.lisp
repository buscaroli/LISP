;; Exercises up to and including Chapter 6
;; Some of the exercises are not in the Book, and have
;; been developed/solved with knowledge gained in
;; chapters after the one specified.
;; e.g. function reverse-translate is an extra exercises
;; based on the function translate of paragraph 6.8.1 and
;; it has been implemented with applicative programming
;; which is taught in Chapter 7

(defvar words)
(setf words
      '((one un)
        (two deux)
        (three trois)
        (four quatre)
        (five cinq)))

(defun translate (word)
  "Translates the English word from the dictionary words
    into French"
  (second (assoc word words)))


(defun reverse-translate (word)
  "Translates the  French words from the dictionary words
    into English"
  (first (find-if #'(lambda (x) (equal word (second x)))
                  words)

         ))
